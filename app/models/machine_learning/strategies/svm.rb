require 'libsvm'
require 'csv'

module MachineLearning
  module Strategies
    ##
    #
    # Initial learning strategy, uses SVM approach.
    #
    class Svm

      attr_accessor :validation_size_percentage, :test_size_percentage, :magnitude

      include Utils

      DEFAULTS = {
        validation_size_percentage: 15.0,
        test_size_percentage: 15.0,
        magnitude: 1.0
      }.freeze

      ##
      #
      # TODO: refactor out, and also set these as an options hash instead of list of args.
      #
      def initialize(options = {})
        options = DEFAULTS.merge(options)
        @validation_size_percentage = options[:validation_size_percentage] # How big of a percentage do we use to find C and Gamma?
        @test_size_percentage = options[:test_size_percentage] # How big of a percentage do we test against?
        @dataset = options[:dataset] || ApplicationHelper::LAURA_DATASET.shuffle
        @magnitude = options[:magnitude] # "How close are we? i.e. within 1, 2, 3"
      end

      ##
      #
      # Runs the SVM strategy, iterating through all major C and Gamma values, returns :accuracy, :best_c and :gamma
      #
      def run
        # The goal here is to automatically find  the optimal C and gamma values
        # for a Gaussian SVM kernel. Currently an 80-line method 'script' that could benefit from some refactoring, comparing with 'run_with_c_and_gamma' not very 'dry'. Also with bigger data could do with plenty of optimization. Cover with tests and measure performance first.

        # Adapted from: https://github.com/daugaard/example-svm
        x_data = @dataset.map{|element| element[0]}
        y_data = @dataset.map{|element| element[1]}

        # Divide data into a training set and test set
        validation_set_size = x_data.size * (@validation_size_percentage/100.to_f)
        test_set_size = x_data.size * (@test_size_percentage/100.to_f)


        validation_x_data = x_data[0 .. (validation_set_size-1)]
        validation_y_data = y_data[0 .. (validation_set_size-1)]

        test_x_data = x_data[validation_set_size .. (validation_set_size+test_set_size-1)]
        test_y_data = y_data[validation_set_size .. (validation_set_size+test_set_size-1)]


        training_x_data = x_data[(validation_set_size+test_set_size) .. x_data.size]
        training_y_data = y_data[(validation_set_size+test_set_size) .. y_data.size]

        # Convert into proper feature arrays for Libsvm
        validation_x_data = validation_x_data.map {|feature_row| Libsvm::Node.features([feature_row]) }
        test_x_data = test_x_data.map {|feature_row| Libsvm::Node.features([feature_row]) }
        training_x_data = training_x_data.map {|feature_row| Libsvm::Node.features([feature_row]) }

        # Define our problem using the training data
        problem = Libsvm::Problem.new
        problem.set_examples(training_y_data, training_x_data)

        ## Lets try to find the best C and sigma values
        possible_values = [0.0001, 0.0005, 0.0001, 0.0005, 0.001, 0.005, 0.01, 0.05, 0.1, 0.5, 1, 5, 10, 50, 100, 500]

        best_c, best_gamma, best_accuracy = 0,0,0

        possible_values.each do |test_c|
          possible_values.each do |test_gamma|
            parameter = Libsvm::SvmParameter.new
            parameter.cache_size = 1 # in megabytes
            parameter.eps = 0.001
            parameter.gamma = test_gamma
            parameter.c = test_c
            parameter.kernel_type = Libsvm::KernelType::RBF

            # Train our model
            model = Libsvm::Model.train(problem, parameter)

            predicted = []
            validation_x_data.each do |params|
              predicted.push( model.predict(params) )
            end
            correct = predicted.collect.with_index do |e,i|
              if (e.to_f - validation_y_data[i].to_f).magnitude <= @magnitude
                1
              else
                0
              end
            end.inject{ |sum,e| sum+e }
            puts "correct count is #{correct.to_f} and validation_set_size is #{validation_set_size}"
            accuracy = ((correct.to_f / validation_set_size) * 100).round(2)
            puts "Accuracy is #{accuracy} for C: #{test_c} and Gamma #{test_gamma}"
            if( accuracy > best_accuracy)
              best_accuracy = accuracy
              best_c = test_c
              best_gamma = test_gamma

              puts "New best! Classification Accuracy: #{accuracy}% - C=#{test_c}, gamma=#{test_gamma}"
            end

          end
        end

        # Setup the model with optimal parameters and calculate the test accuracy
        parameter = Libsvm::SvmParameter.new
        parameter.cache_size = 1 # in megabytes
        parameter.eps = 0.001
        parameter.gamma = best_gamma
        parameter.c = best_c
        parameter.kernel_type = Libsvm::KernelType::RBF

        # Train our model
        model = Libsvm::Model.train(problem, parameter)


        predicted = []
        test_x_data.each do |params|
          predicted.push( model.predict(params) )
        end

        correct = predicted.collect.with_index do |e,i|
          if (e.to_f - test_y_data[i].to_f).magnitude <= @magnitude
            1
          else
            0
          end
        end.inject{ |sum,e| sum+e }
        accuracy = ((correct.to_f / test_set_size) * 100).round(2)

        puts "Test Generalization Accuracy: #{accuracy}% - C=#{best_c}, gamma=#{best_gamma}"
        { accuracy: accuracy, best_c: best_c, gamma: best_gamma}
      end

      ##
      #
      # Runs as above with predetermined C and Gamma
      #
      def run_with_c_and_gamma(predicted_c, predicted_gamma)
        # The goal here is to automatically find  the optimal C and gamma values
        # for a Gaussian SVM kernel

        # Adapted from: https://github.com/daugaard/example-svm
        x_data = @dataset.map{|element| element[0]}
        y_data = @dataset.map{|element| element[1]}

        # Divide data into a training set and test set
        test_set_size = x_data.size * (@test_size_percentage/100.to_f)

        test_x_data = x_data[0 .. (test_set_size-1)]
        test_y_data = y_data[0 .. (test_set_size-1)]

        training_x_data = x_data[(test_set_size) .. x_data.size]
        training_y_data = y_data[(test_set_size) .. y_data.size]

        # Convert into proper feature arrays for Libsvm
        test_x_data = test_x_data.map {|feature_row| Libsvm::Node.features([feature_row]) }
        training_x_data = training_x_data.map {|feature_row| Libsvm::Node.features([feature_row]) }

        # Define our problem using the training data
        problem = Libsvm::Problem.new
        problem.set_examples(training_y_data, training_x_data)

        ## Lets try to find the best C and sigma values
        # possible_values = [0.0001, 0.0005, 0.0001, 0.0005, 0.001, 0.005, 0.01, 0.05, 0.1, 0.5, 1, 5, 10, 50, 100, 500]

        # Setup the model with optimal parameters and calculate the test accuracy
        parameter = Libsvm::SvmParameter.new
        parameter.cache_size = 1 # in megabytes
        parameter.eps = 0.001
        parameter.gamma = predicted_gamma
        parameter.c = predicted_c
        parameter.kernel_type = Libsvm::KernelType::RBF

        # Train our model
        model = Libsvm::Model.train(problem, parameter)


        predicted = []
        test_x_data.each do |params|
          predicted.push( model.predict(params) )
        end

        correct = predicted.collect.with_index do |e,i|
          if (e.to_f - test_y_data[i].to_f).magnitude <= @magnitude
            1
          else
            0
          end
        end.inject{ |sum,e| sum+e }
        accuracy = ((correct.to_f / test_set_size) * 100).round(2)

        puts "Test Generalization Accuracy: #{accuracy}% - C=#{predicted_c}, gamma=#{predicted_gamma}"
        { accuracy: accuracy, predicted_c: predicted_c, gamma: predicted_gamma}
      end
    end
  end
end

##
# The final interactor in the process if all has passed. Records the data point and corresponding information into the official logs.
#

class RecordDataPoint
  include Interactor

  def call
    puts 'Record Data Point'
    context.response = 'Record Data Point'
  end
end

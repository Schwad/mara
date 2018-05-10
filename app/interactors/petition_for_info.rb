class PetitionForInfo
  include Interactor

  def call
    context.response = 'Hello, it is your occasional reminder to submit your pain data! How are you feeling?'
  end
end

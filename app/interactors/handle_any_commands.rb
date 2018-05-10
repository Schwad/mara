class HandleAnyCommands
  include Interactor

  def call
    context.response = 'Handle Any Commands'
  end
end

class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
        pword = SecureRandom.hex(14)
        user.password = pword
        user.password_confirmation = pword
      end
  end
end

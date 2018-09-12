# frozen_string_literal: true

##
# The main user object, although built up under a typical 'Devise-style' framework, this will primarily be used to validate and interact with the user in the Telegram interface. It will be prepared out-of-the-box for any web-based 'signing up' or profile management that may be needed in the future.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 12..128

  validates :friendly_name, presence: true
  has_many :data_points

  def reached_data_limit
    data_points.where("created_at >= ?", Date.today.beginning_of_day).count >= 5
  end
end

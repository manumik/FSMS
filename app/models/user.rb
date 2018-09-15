class User < ApplicationRecord
   has_secure_password

  # attr_accessor :bibnummber, :password, :password_confirmation

  # validates_uniqueness_of :bibnummber
end

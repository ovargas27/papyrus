require 'reform/rails'

class AccountForm < Reform::Form
  include DSL
  include Reform::Form::ActiveRecord

  property :name, on: :account
  properties [:email, :password, :password_confirmation], on: :user

  model :account, on: :account

  #validates :name, :email, :password, :password_confirmation, presence: true

end


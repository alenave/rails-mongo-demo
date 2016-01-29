class User
  include Mongoid::Document
  field :user_name, type: String
  field :email_id, type: String
  field :mobile_number, type: Integer
  field :loan_amount, type: Float
  field :tenure, type: Float
end

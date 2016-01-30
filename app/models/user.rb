class User
  include Mongoid::Document
  field :user_name, type: String
  field :email_id, type: String
  field :mobile_number, type: Integer
  field :loan_amount, type: Integer
  field :tenure, type: Integer
  validates :loan_amount, :presence => true, :numericality => true, length: { minimum: 6, maximum: 10 }
  validates :mobile_number, :presence => true, :numericality => true, length: { minimum: 10, maximum: 10 }
  validates :tenure, :presence => true, :numericality => true, length: { minimum: 1, maximum: 2 }
end

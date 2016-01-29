class BankLogo
  include Mongoid::Document
  store_in collection: 'bank_logo'
  field :bank_name, type: String
  field :logo_base64, type: String
end

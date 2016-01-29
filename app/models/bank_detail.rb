class BankDetail
  include Mongoid::Document
  store_in collection: 'pricing_cms'
  field :bank_name, type: String
  field :processing_type, type: String
  field :processing_amount, type: Integer
  field :rate_type, type: String
  field :rate_sub_type, type: String
  field :base_rate, type: Integer
  field :rate, type: Integer
  field :rate_comment, type: String
  field :loan_min_vl, type: Integer
  field :loan_max_vl, type: Integer
  field :loan_tenure, type: Integer
  field :property_type, type: Array, default: []
  field :residency_type, type: Array, default: []
  field :empl_type, type: Array, default: []
  field :product, type: Array, default: []
  field :type, type: Array, default: []
  field :loan_label, type: String
  field :textvalue, type: String
  field :status, type: Integer
  field :seq, type: Integer
end
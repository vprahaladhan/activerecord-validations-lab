class Author < ActiveRecord::Base
  include ActiveModel::Validations
  validates :name, presence: true, uniqueness: true
  validates_with PhoneValidator
end

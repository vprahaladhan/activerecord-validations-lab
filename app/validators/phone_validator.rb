class PhoneValidator < ActiveModel::Validator
  def validate(record)
    unless record.phone_number.length == 10
      record.errors[:phone_number] << "Phone number should have exactly 10 digits!"
    end
  end
end
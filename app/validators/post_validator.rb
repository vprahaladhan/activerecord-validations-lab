class PostValidator < ActiveModel::Validator
  def validate(record)
    unless record.content.length >= 250
      record.errors[:content] << "Post content should be at least 250 characters long!"
    end

    unless record.summary.length <= 250
      record.errors[:summary] << "Post summary should not exceed 250 characters!"
    end

  end
end
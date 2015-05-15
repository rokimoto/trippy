require 'rails_helper'

RSpec.describe Review, type: :model do

  it "Has content" do
    review = FactoryGirl.build(:review)
    expect(review.content).to eq("This is content")
  end

  it "Has no content" do
    review = FactoryGirl.build(:review2)
    expect(review.content).to eq("")
  end

  it "Invalid with content = empty string" do
    review = FactoryGirl.build(:review3)
    expect(review).to be_invalid
  end

  it "Invalid without rating" do
    review = FactoryGirl.build(:review4)
    expect(review).to be_invalid
  end

end
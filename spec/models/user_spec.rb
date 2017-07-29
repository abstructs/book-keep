require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do 
    @user = User.create(id: 1, email: "andrew@gmail.com", username: "abstruct", password: "woowoo", password_confirmation: "woowoo")
  end

  it "Saves to the databaes" do
    expect(@user.save).to eq(true)
  end
end

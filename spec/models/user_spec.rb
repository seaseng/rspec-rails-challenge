require 'spec_helper'

describe User do
  # pending "add some examples to (or delete) #{__FILE__}"
  before { @user = User.new(email: "user@example.com", password: 'password', password_confirmation: 'password') }

  subject { @user }

  it { should respond_to(:email) }

  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when password confirmation fails" do 
    before { @user = User.new(email: 'test@test.com', password: 'test', password_confirmation: 'not_test')}
    it { should_not be_valid }
  end

  
end

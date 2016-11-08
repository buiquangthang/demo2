require 'rails_helper'

RSpec.describe User, type: :model do

  subject { User.new(name: "Example User", email: "user@example.com",
                      password: "thangbui", password_confirmation: "thangbui")}
  describe "Valid data" do
    it {expect(subject).to be_valid}
  end

  describe "Name data" do
    it "name should be present" do
      subject.name = "  "
      expect(subject).to have(1).error_on(:name)
    end

    it "name should not be too long" do
      subject.name = "t" * 51
      expect(subject).to have(1).error_on(:name)
    end
  end

  describe "Email data" do
    it "email should be present" do
      subject.email = "    "
      expect(subject).to have_at_least(1).error_on(:email)
    end

    it "email should not be too long" do
      subject.email = "t" * 244 + "@example.com" 
      expect(subject).to have(1).error_on(:email) 
    end

    it "email validation should accept valid addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                            first.last@foo.jp alice+bob@baz.vn]
      valid_addresses.each do |valid_address|
        subject.email = valid_address
        expect(subject).to be_valid
      end
    end

    it "email validation should reject invalid addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                              foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        subject.email = invalid_address
        expect(subject).to have_at_least(1).error_on(:email)
      end  
    end

    it "email addresses should be unique" do
      duplicate_user = subject.dup
      duplicate_user.email = subject.email.upcase
      subject.save
      expect(duplicate_user).to have(1).error_on(:email)
    end

    it "email addresses should be saved as lower-case" do
      mixed_case_email = "Foo@ExAMPLe.com"
      subject.email = mixed_case_email
      subject.save
      expect(subject.reload.email).to eq mixed_case_email.downcase
    end
  end

  describe "Password data" do
    it "password should be present (nonblank)" do
      subject.password = subject.password_confirmation = " " * 6
      expect(subject).to have_at_least(1).error_on(:password)
    end

    it "password should have a minium length" do
      subject.password = subject.password_confirmation = "t" * 5
      expect(subject).to have_at_least(1).error_on(:password)
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
      first_name: "Juan",
      last_name: "Juanes",
      email: "juanes@juanes.com",
      password: "juanes",
      password_confirmation: "juanes")
  }
  describe "validations" do
    # validates that email, first name and last name are required too
    it "it valid with valid attributes" do
      expect(subject).to be_valid
    end
    # validates that it has a password and a password_confirmation
    it "it validates that email, first name, last name, a password, and a password confirmation are present" do
      expect(subject.first_name).to be_present
      expect(subject.last_name).to be_present
      expect(subject.email).to be_present
      expect(subject.password).to be_present
      expect(subject.password_confirmation).to be_present
    end
    
    # validates that passwords are present for creating a new model too
    it "it is not valid without a first name" do
      subject.first_name = nil
      expect(subject).to be_invalid
    end
    it "it is not valid without a last name" do
      subject.last_name = nil
      expect(subject).to be_invalid
    end
    it "it is not valid without a email" do
      subject.email = nil
      expect(subject).to be_invalid
    end
    it "it is not valid without a password" do
      subject.password = nil
      expect(subject).to be_invalid
    end
    it "it is not valid without a password_confirmation" do
      subject.password_confirmation = nil
      expect(subject).to be_invalid
    end
    # validates that password and password_confirmation match 
    it "it validates that password and password confirmation match" do
      expect(subject.password).to eq(subject.password_confirmation)
    end
    # example when the password does not match password_confirmation
    it "it validates that password and password confirmation do not match" do
      subject.password_confirmation = "juanse"
      expect(subject.password).not_to eq(subject.password_confirmation)
    end

    # validates that emails are unique(not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)
    
    it "validates that emails are unique and not case sensitive" do
      subject1 = User.new(
          first_name: "Juan",
          last_name: "Juanes",
          email: "juAnes@juanes.com",
          password: "juanes",
          password_confirmation: "juanes")
      subject1.save
      
      subject2 = User.new(
          first_name: "Juan",
          last_name: "Juanes",
          email: "JuAnes@jUanes.com",
          password: "juanes",
          password_confirmation: "juanes")
      expect(subject2).to be_invalid 
    end
  end


end

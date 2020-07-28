require 'rails_helper'


RSpec.describe Product, type: :model do
  technology = Category.find_or_create_by! name: "Technology"
  subject {
    described_class.new(name: "smart ring",
                            price: 3000,
                            quantity: 30,
                            category: technology)
  }

  describe 'validations' do 
      # validates that a product is valid
     it "is valid with valid attributes" do
      expect(subject).to be_valid 
     end

      # validates :name, presence: true
     it "is not valid without a name and has an error message = Name can't be blank" do
      #  smartRing
      subject.name = nil
      expect(subject).to_not be_valid
      puts subject.errors.full_messages
      expect(subject.errors.full_messages).to include "Name can't be blank"
    end
    
    # vallidates :price, presence: true
    it "is not valid without a price and has an error message = price_cents can't be blank" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Price can't be blank"
    end
    
    # vallidates :quantity, presence: true
    it "is not valid without a quantity and has an error message = Quantity can't be blank" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Quantity can't be blank"
    end
    
    # vallidates :category, presence: true
    it "is not valid without a category and has an error message = Category can't be blank" do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Category can't be blank"
      end
    end

end
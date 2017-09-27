# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Tripletexer do
  describe '#activity' do
    it 'returns Activity endpoint' do
      expect( subject.activity ).to be_an_instance_of Tripletexer::Endpoints::Activity
    end
  end

  describe "#address" do
    it 'returns address endpoint' do
      expect( subject.address ).to be_an_instance_of Tripletexer::Endpoints::Address
    end
  end

  describe "#company" do
    it 'returns company endpoint' do
      expect( subject.company ).to be_an_instance_of Tripletexer::Endpoints::Company
    end
  end

  describe "#contact" do
    it 'returns contact endpoint' do
      expect( subject.contact ).to be_an_instance_of Tripletexer::Endpoints::Contact
    end
  end

  describe "#country" do
    it 'returns country endpoint' do
      expect( subject.country ).to be_an_instance_of Tripletexer::Endpoints::Country
    end
  end

  describe "#currency" do
    it 'returns currency endpoint' do
      expect( subject.currency ).to be_an_instance_of Tripletexer::Endpoints::Currency
    end
  end

  describe "#customer" do
    it 'returns customer endpoint' do
      expect( subject.customer ).to be_an_instance_of Tripletexer::Endpoints::Customer
    end
  end

  describe "#department" do
    it 'returns department endpoint' do
      expect( subject.department ).to be_an_instance_of Tripletexer::Endpoints::Department
    end
  end

  describe "#employee" do
    it 'returns employee endpoint' do
      expect( subject.employee ).to be_an_instance_of Tripletexer::Endpoints::Employee
    end
  end

  describe "#inventory" do
    it 'returns inventory endpoint' do
      expect( subject.inventory ).to be_an_instance_of Tripletexer::Endpoints::Inventory
    end
  end

  describe "#invoice" do
    it 'returns invoice endpoint' do
      expect( subject.invoice ).to be_an_instance_of Tripletexer::Endpoints::Invoice
    end
  end

  describe "#ledger" do
    it 'returns ledger endpoint' do
      expect( subject.ledger ).to be_an_instance_of Tripletexer::Endpoints::Ledger
    end
  end

  describe "#order" do
    it 'returns order endpoint' do
      expect( subject.order ).to be_an_instance_of Tripletexer::Endpoints::Order
    end
  end

  describe "#product" do
    it 'returns product endpoint' do
      expect( subject.product ).to be_an_instance_of Tripletexer::Endpoints::Product
    end
  end

  describe "#project" do
    it 'returns project endpoint' do
      expect( subject.project ).to be_an_instance_of Tripletexer::Endpoints::Project
    end
  end

  describe "#supplier" do
    it 'returns supplier endpoint' do
      expect( subject.supplier ).to be_an_instance_of Tripletexer::Endpoints::Supplier
    end
  end

  describe "#timesheet" do
    it 'returns timesheet endpoint' do
      expect( subject.timesheet ).to be_an_instance_of Tripletexer::Endpoints::Timesheet
    end
  end

  describe "#token" do
    it 'returns token endpoint' do
      expect( subject.token ).to be_an_instance_of Tripletexer::Endpoints::Token
    end
  end

end

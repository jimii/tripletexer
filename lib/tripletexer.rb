# frozen_string_literal: true

%w[
  tripletexer/version.rb
  tripletexer/errors.rb
  tripletexer/api_client.rb
  tripletexer/format_helpers.rb
  tripletexer/endpoints.rb
  tripletexer/endpoints/abstract_endpoint.rb
  tripletexer/endpoints/activity.rb
  tripletexer/endpoints/address.rb
  tripletexer/endpoints/company.rb
  tripletexer/endpoints/contact.rb
  tripletexer/endpoints/country.rb
  tripletexer/endpoints/currency.rb
  tripletexer/endpoints/customer.rb
  tripletexer/endpoints/customer/category.rb
  tripletexer/endpoints/department.rb
  tripletexer/endpoints/employee.rb
  tripletexer/endpoints/employee/entitlement.rb
  tripletexer/endpoints/inventory.rb
  tripletexer/endpoints/invoice.rb
  tripletexer/endpoints/invoice/payment_type.rb
  tripletexer/endpoints/ledger.rb
  tripletexer/endpoints/ledger/account.rb
  tripletexer/endpoints/ledger/accounting_period.rb
  tripletexer/endpoints/ledger/annual_account.rb
  tripletexer/endpoints/ledger/close_group.rb
  tripletexer/endpoints/ledger/posting.rb
  tripletexer/endpoints/ledger/vat_type.rb
  tripletexer/endpoints/ledger/voucher.rb
  tripletexer/endpoints/ledger/voucher_type.rb
  tripletexer/endpoints/order.rb
  tripletexer/endpoints/order/orderline.rb
  tripletexer/endpoints/product.rb
  tripletexer/endpoints/project.rb
  tripletexer/endpoints/project/category.rb
  tripletexer/endpoints/supplier.rb
  tripletexer/endpoints/timesheet.rb
  tripletexer/endpoints/timesheet/entry.rb
  tripletexer/endpoints/timesheet/time_clock.rb
  tripletexer/endpoints/token.rb
  tripletexer/endpoints/token/consumer.rb
  tripletexer/endpoints/token/session.rb
].each do |file|
  require File.expand_path(file, __dir__)
end

class Tripletexer
  def initialize(api_client: Tripletexer::APIClient.new, session_token: nil)
    @api_client = api_client
    @api_client.session_token = session_token if session_token
  end

  def activity
    Tripletexer::Endpoints::Activity.new(api_client)
  end

  def address
    Tripletexer::Endpoints::Address.new(api_client)
  end

  def company
    Tripletexer::Endpoints::Company.new(api_client)
  end

  def contact
    Tripletexer::Endpoints::Contact.new(api_client)
  end

  def country
    Tripletexer::Endpoints::Country.new(api_client)
  end

  def currency
    Tripletexer::Endpoints::Currency.new(api_client)
  end

  def customer
    Tripletexer::Endpoints::Customer.new(api_client)
  end

  def department
    Tripletexer::Endpoints::Department.new(api_client)
  end

  def employee
    Tripletexer::Endpoints::Employee.new(api_client)
  end

  def inventory
    Tripletexer::Endpoints::Inventory.new(api_client)
  end

  def invoice
    Tripletexer::Endpoints::Invoice.new(api_client)
  end

  def ledger
    Tripletexer::Endpoints::Ledger.new(api_client)
  end

  def order
    Tripletexer::Endpoints::Order.new(api_client)
  end

  def product
    Tripletexer::Endpoints::Product.new(api_client)
  end

  def project
    Tripletexer::Endpoints::Project.new(api_client)
  end

  def supplier
    Tripletexer::Endpoints::Supplier.new(api_client)
  end

  def timesheet
    Tripletexer::Endpoints::Timesheet.new(api_client)
  end

  def token
    Tripletexer::Endpoints::Token.new(api_client)
  end

  private

  attr_accessor :api_client

end

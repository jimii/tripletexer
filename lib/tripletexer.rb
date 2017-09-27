# frozen_string_literal: true

%w[
  tripletexer/version.rb
  tripletexer/errors.rb
  tripletexer/connection.rb
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
  def initialize(object_class: Hash, proxy: nil, session_token: nil)
    @object_class = object_class
    @proxy = proxy
    connection.session_token = session_token if session_token
  end

  def activity
    Tripletexer::Endpoints::Activity.new(connection)
  end

  def address
    Tripletexer::Endpoints::Address.new(connection)
  end

  def company
    Tripletexer::Endpoints::Company.new(connection)
  end

  def contact
    Tripletexer::Endpoints::Contact.new(connection)
  end

  def country
    Tripletexer::Endpoints::Country.new(connection)
  end

  def currency
    Tripletexer::Endpoints::Currency.new(connection)
  end

  def customer
    Tripletexer::Endpoints::Customer.new(connection)
  end

  def department
    Tripletexer::Endpoints::Department.new(connection)
  end

  def employee
    Tripletexer::Endpoints::Employee.new(connection)
  end

  def inventory
    Tripletexer::Endpoints::Inventory.new(connection)
  end

  def invoice
    Tripletexer::Endpoints::Invoice.new(connection)
  end

  def ledger
    Tripletexer::Endpoints::Ledger.new(connection)
  end

  def order
    Tripletexer::Endpoints::Order.new(connection)
  end

  def product
    Tripletexer::Endpoints::Product.new(connection)
  end

  def project
    Tripletexer::Endpoints::Project.new(connection)
  end

  def supplier
    Tripletexer::Endpoints::Supplier.new(connection)
  end

  def timesheet
    Tripletexer::Endpoints::Timesheet.new(connection)
  end

  def token
    Tripletexer::Endpoints::Token.new(connection)
  end

  private

  attr_accessor :object_class, :proxy

  def connection
    @connection ||= Tripletexer::Connection.new(object_class: object_class, proxy: proxy)
  end

end

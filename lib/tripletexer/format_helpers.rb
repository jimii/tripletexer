module Tripletexer::FormatHelpers
  def self.format_date(value)
    return nil if value.nil?
    return value.to_date.to_s if value.respond_to?(:to_date)
    raise TypeError, 'value must be Date, Time or String' unless value.is_a?(String)
    return value if value =~ /\A\d{4}-[01]\d-[0-3]\d\z/
    raise ArgumentError, 'invalid date format, must be YYYY-MM-DD'
  end

  def self.normalize_body(body)
    return body if body.is_a?(String)
    return JSON.dump(body) if body.is_a?(Hash) || body.is_a?(Array)
    raise ArgumentError, 'unsupported body type'
  end
end

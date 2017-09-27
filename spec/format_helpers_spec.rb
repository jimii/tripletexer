# frozen_string_literal: true

require 'spec_helper'
require 'date'

RSpec.describe Tripletexer::FormatHelpers do
  subject { described_class }

  describe '.format_date' do
    it 'returns nil when given nil' do
      expect( subject.format_date(nil) ).to be_nil
    end

    it 'returns date string when given date' do
      expect( subject.format_date(Date.new(2016, 5, 1)) ).to eq '2016-05-01'
    end

    it 'returns date string when given time' do
      expect( subject.format_date(Time.new(2013, 5, 4, 12, 12, 15)) ).to eq '2013-05-04'
    end

    it 'raises TypeError when given unsupported object' do
      expect { subject.format_date({}) }.to raise_error(TypeError, 'value must be Date, Time or String')
    end

    it 'returns date string when given date string' do
      expect( subject.format_date('2018-07-09') ).to eq '2018-07-09'
    end

    it "raises ArgumentError when given string doesn't look valid" do
      expect { subject.format_date('foo') }.to raise_error(ArgumentError, 'invalid date format, must be YYYY-MM-DD')
      expect { subject.format_date('2017-99-99') }.to raise_error(ArgumentError, 'invalid date format, must be YYYY-MM-DD')
    end
  end

  describe '.normalize_body' do
    it 'returns given string' do
      expect( subject.normalize_body('test') ).to eq 'test'
    end

    it 'returns JSON string of given hash' do
      expect( subject.normalize_body({foo: :bar}) ).to eq '{"foo":"bar"}'
    end

    it 'returns JSON string of given array' do
      expect( subject.normalize_body(['foo', 1, 'bar']) ).to eq '["foo",1,"bar"]'
    end

    it 'raises ArgumentError when different object is given' do
      expect { subject.normalize_body(1) }.to raise_error(ArgumentError, 'unsupported body type')
      expect { subject.normalize_body(:foo) }.to raise_error(ArgumentError, 'unsupported body type')
      expect { subject.normalize_body(Object.new) }.to raise_error(ArgumentError, 'unsupported body type')
    end
  end
end

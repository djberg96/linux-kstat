# frozen_string_literal: true

#######################################################################
# linux_kstat_spec.rb
#
# Test suite for the linux-kstat library.
#######################################################################
require 'rspec'
require 'linux/kstat'

describe Linux::Kstat do
  let(:kstat){ described_class.new }

  context 'constants' do
    it 'defines a version constant that is set to the expected value' do
      expect(Linux::Kstat::VERSION).to eql('0.2.7')
      expect(Linux::Kstat::VERSION).to be_frozen
    end
  end

  context 'hash access' do
    it 'allows hash style key access' do
      expect(kstat).to respond_to(:[])
      expect{ kstat[:cpu] }.not_to raise_error
      expect(kstat[:cpu].keys.size).to be(10)
    end

    it 'contains the expected keys and value types' do
      expect(kstat[:cpu]).to be_a(Hash)
      expect(kstat[:btime]).to be_a(Numeric)
      expect(kstat[:intr]).to be_a(Array)
    end

    it 'does not allow key assignment' do
      expect{ kstat[:cpu] = 'test' }.to raise_error(NoMethodError)
    end
  end
end

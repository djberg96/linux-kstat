#######################################################################
# linux_kstat_spec.rb
#
# Test suite for the linux-kstat library.
#######################################################################
require 'rspec'
require 'linux/kstat'

describe Linux::Kstat do
  let(:kstat){ Linux::Kstat.new }

  context "constants" do
    it "defines a version constant that is set to the expected value" do
      expect(Linux::Kstat::VERSION).to eql('0.2.0')
    end
  end

  context "hash access" do
    it "allows hash style key access" do
      expect(subject).to respond_to(:[])
      expect{ subject[:cpu] }.to_not raise_error
    end

    it "contains the expected keys and value types" do
      expect(kstat[:cpu]).to be_kind_of(Hash)
      expect(kstat[:btime]).to be_kind_of(Numeric)
      expect(kstat[:intr]).to be_kind_of(Array)
    end

    it "does not allow key assignment" do
      expect{ subject[:cpu] = 'test' }.to raise_error(NoMethodError)
    end
  end
end

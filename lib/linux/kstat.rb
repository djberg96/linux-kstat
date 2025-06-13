# frozen_string_literal: true

require 'forwardable'

# The Linux module serves as a namespace only.
module Linux
  # The Kstat class encapsulates Linux kernel statistics derived from /proc/stat.
  class Kstat
    extend Forwardable

    # The version of the linux-kstat library
    VERSION = '0.2.7'

    # :stopdoc:

    # Delegate the the [] and inspect methods to the @hash variable
    def_delegator(:@hash, :[])
    def_delegator(:@hash, :inspect)

    # :startdoc:

    # Create a new Linux::Kstat instance. You can access the information
    # stored in this object the same way you would access a hash key. Note
    # that all keys are symbols.
    #
    # Example:
    #
    #   kstat = Linux::Kstat.new
    #
    #   kstat[:cpu] => {
    #     :idle       => 250713454,
    #     :iowait     => 2745691,
    #     :irq        => 39717,
    #     :softirq    => 31323,
    #     :system     => 1881655,
    #     :nice       => 117158,
    #     :user       => 7137418,
    #     :steal      => 0,
    #     :guest      => 1162987977,
    #     :guest_nice => 0
    #   }
    #
    #   kstat[:processes] # => 1299560
    #
    def initialize
      @hash = get_proc_stat_info
    end

    private

    # Parse the information out of /proc/stat and assign keys and values to
    # a hash that can be accessed via the Forwardable module.
    #

    CPU_FIELDS = %i[user nice system idle iowait irq softirq steal guest guest_nice].freeze

    def get_proc_stat_info
      hash = {}

      begin
        File.foreach('/proc/stat') do |line|
          info = line.split
          next if info.empty?

          key = info.first.to_sym

          case
          when key.to_s =~ /^cpu/i
            values = CPU_FIELDS.each_with_index.map { |field, i| [field, info[i + 1]&.to_i || 0] }.to_h
            hash[key] = values
          when info.size > 2
            hash[key] = info[1..].map(&:to_i)
          else
            hash[key] = info[1].to_i
          end
        end
      rescue Errno::ENOENT
        raise "Could not read /proc/stat"
      end

      hash
    end
  end
end

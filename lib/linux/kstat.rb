# frozen_string_literal: true

require 'forwardable'

# The Linux module serves as a namespace only.
module Linux
  # The Kstat class encapsulates Linux kernel statistics derived from /proc/stat.
  class Kstat
    extend Forwardable

    # The version of the linux-kstat library
    VERSION = '0.2.8'

    # :stopdoc:

    # Delegate the the [] and inspect methods to the @hash variable
    def_delegator(:@hash, :[])
    def_delegator(:@hash, :inspect)
    def_delegator(:@hash, :keys)

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
    def get_proc_stat_info
      hash = {}

      File.readlines('/proc/stat').each do |line|
        info = line.split
        next if info.empty?
        key = info.first.to_sym

        unless info.empty?
          if info.first =~ /^cpu/i
            hash[key] = {
              :user => info[1].to_i,
              :nice => info[2].to_i,
              :system => info[3].to_i,
              :idle => info[4].to_i,
              :iowait => info[5].to_i,
              :irq => info[6].to_i,
              :softirq => info[7].to_i,
              :steal => info[8].to_i,
              :guest => info[9].to_i,
              :guest_nice => info[10].to_i
            }
          elsif info.size > 2
            hash[key] = info[1..-1].map(&:to_i)
          else
            hash[key] = info[1].to_i
          end
        end
      end

      hash
    end
  end
end

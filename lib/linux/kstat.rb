require 'forwardable'

# The Linux module serves as a namespace only.
module Linux
  # The Kstat class encapsulates Linux kernel statistics derived from /proc/stat.
  class Kstat
    extend Forwardable

    # The version of the linux-kstat library
    VERSION = '0.1.3'

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
    #     :idle     => 250713454,
    #     :iowait   => 2745691,
    #     :irq      => 39717,
    #     :softirq  => 31323,
    #     :system   => 1881655,
    #     :nice     => 117158,
    #     :user     => 7137418
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

      IO.readlines('/proc/stat').each{ |line|
        info = line.split
        unless info.empty?
          if info.first =~ /^cpu/i
            hash[info.first.to_sym] = {
              :user    => info[1].to_i,
              :nice    => info[2].to_i,
              :system  => info[3].to_i,
              :idle    => info[4].to_i,
              :iowait  => info[5].to_i,
              :irq     => info[6].to_i,
              :softirq => info[7].to_i
            }
          else
            if info.size > 2
              hash[info.first.to_sym] = info[1..-1].map{ |e| e.to_i }
            else
              hash[info.first.to_sym] = info[1].to_i
            end
          end
        end
      }

      hash
    end
  end
end

if defined? Pry
  Pry.config.pager = false
end

begin
  private_file = Dir.home + '/.pryrc-private'
  load private_file if File.exist?(private_file)
rescue
  raise if RUBY_VERSION.to_i > 1
end

def r
  reload!
end

# def execute(sql)
#   warn 'NOTICE: Running #execute method defined in ~/.pryrc'
#   ActiveRecord::Base.connection.execute(sql)
# end

def rlog
  @_stdout_logger ||= Logger.new(STDOUT)

  if Rails.logger == @_stdout_logger
    Rails.logger = @_r_logger
    puts "\e[32mlogger is ORIGINAL\e[0m"
  else
    @_r_logger = Rails.logger
    Rails.logger = @_stdout_logger
    puts "\e[31mlogger is STDOUT\e[0m"
  end
end

def arlog
  @_null_logger ||= Logger.new('/dev/null')

  if ActiveRecord::Base.logger == @_null_logger
    ActiveRecord::Base.logger = @_ar_logger
    puts "\e[32mlogger is ON\e[0m"
  else
    @_ar_logger = ActiveRecord::Base.logger
    ActiveRecord::Base.logger = @_null_logger
    puts "\e[31mlogger is OFF\e[0m"
  end
end

def dt(&block)
  require 'benchmark'
  Benchmark.measure(&block)
end

if defined?(ActiveRecord)
  class ActiveRecord::Associations::CollectionProxy
    def o_id
      order(:id)
    end
  end

  class ActiveRecord::Base
    def self.[](id_or_hash)
      if id_or_hash.is_a?(Hash)
        find_by(id_or_hash)
      else
        find(id_or_hash)
      end
    end
  end
end

def transaction(*args, &block)
  ActiveRecord::Base.transaction(*args, &block)
end

class SpyObject
  attr_accessor :identifier
  attr_accessor :verbose

  def initialize(identifier: default_identifier, verbose: true)
    self.identifier = identifier
    self.verbose    = verbose
  end

  def class
    SpyObject.new(identifier: "#{identifier} (class)", verbose: verbose)
  end

  def default_identifier
    (rand * 1_000).to_i
  end

  def method_missing(method, *args)
    name = "Spy '#{identifier}'".strip
    loc = caller_locations(1, 1).first
    puts "#{loc_str(loc)} #{name} method=#{method}; args=#{args.inspect}; block=#{block_given?}"
    self
  end

  def loc_str(loc)
    verbose ? "#{loc.path}:#{loc.lineno} => " : ""
  end
end

def spy_object(*args)
  SpyObject.new(*args)
end

def sfd
  load "shittyfirstdraft.rb"
end

def concurrently(n, &block)
  threads = (1..n).map do |i|
    Thread.new(i, &block)
  end

  threads.each(&:join)
end

def bytes(s)
  s.bytes.map { |n| '0x%02X' % (n & 0xFF) }.join(" ")
end

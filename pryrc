begin
  private_file = Dir.home + '/.pryrc-private'
  load private_file if File.exists?(private_file)
rescue
  raise if RUBY_VERSION.to_i > 1
end

def r
  reload!
end

def execute(sql)
  ActiveRecord::Base.connection.execute(sql)
end

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
end

def transaction(*args, &block)
  ActiveRecord::Base.transaction(*args, &block)
end

def r
  reload!
end

def arlog
  @_null_logger = Logger.new('/dev/null')

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

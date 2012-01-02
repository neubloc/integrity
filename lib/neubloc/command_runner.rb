module Neubloc
  class CommandRunner
  
    class << self
      def run(command, options = {}, &block)
        new(command, options).run(&block)
      end
    end
  
    attr_accessor :command
    attr_accessor :interval
    attr_accessor :output
    attr_accessor :timer
  
    def initialize(command, options = {})
      assign_defaults

      options.each do |name, value|
        send("#{name}=", value)
      end
      self.command = command
    
    end
  
    def assign_defaults
      self.interval = 0.1
    end
  
    def reset
      self.output = ""
      self.timer  = Time.at(0)
    end
  
    def add_output(data)
      self.output << data
    end
  
    def get_output_and_reset
      self.output.tap do 
        self.output = ""
        self.timer  = Time.now
      end
    end
    
    def output?
      output != ""
    end
  
    def yield?
      Time.now - self.timer > self.interval
    end
  
    def run(&block)
      IO.popen(command, "r") do |io|
        reset
        io.each_line do |line|
          add_output(line)
          yield get_output_and_reset if yield?
        end
        yield get_output_and_reset if output?
      end
    end
  
  end
end




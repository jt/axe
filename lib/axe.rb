module Axe
  class Swing
    attr_accessor :args, :commands

    def initialize(*args)
      @args     = args.dup
      @commands = []
      run(args)
    end

    def self.execute(*args)
      new(*args).execute
    end

    def execute
      puts command
      exit($?.exitstatus || 0) unless system(command)
    end

    def command
      commands.join(' ')
    end

    def run(args)
      options = {:query => '', :action => '-f', :env => 'development'}
      until args.empty?
        case arg = args.shift
        when '-n' then options[:action] = "-n #{args.shift}"
        when '-e' then options[:env]    = args.shift
        else
          options[:query] << (options[:query].empty? ? arg : '\|' + arg)
        end
      end
      assemble_command(options)
    end

    def assemble_command(options = {})
      commands << 'tail'
      commands << options[:action]
      commands << file(options[:env])
      commands << grep(options[:query]) unless options[:query].empty?
    end

    def grep(query)
      "| grep \"#{query}\""
    end

    def file(env)
      "log/#{env}.log"
    end
  end
end

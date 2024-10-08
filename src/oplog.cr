require "log"
require "colorize"

# TODO: Write documentation for `Oplog::Cr`
module Oplog
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}

  extend self

  class LogBackend < Log::IOBackend
    @stdout = Log::IOBackend.new(io: STDOUT, formatter: LogFormat)
    @stderr = Log::IOBackend.new(io: STDERR, formatter: LogFormat)

    def write(entry : Log::Entry)
      if entry.severity >= Log::Severity::Error
        @stderr.write entry
      else
        @stdout.write entry
      end
    end
  end

  struct LogFormat < Log::StaticFormatter
    @@colors = {
      "FATAL"  => :red,
      "ERROR"  => :red,
      "WARN"   => :yellow,
      "NOTICE" => :yellow,
      "INFO"   => :green,
      "DEBUG"  => :blue,
      "TRACE"  => :light_blue,
    }

    def run
      string "#{@entry.message}".colorize(@@colors[@entry.severity.label])
    end
  end

  def self.setup(verbosity : Int = 4)
    Colorize.on_tty_only!
    verbosity = [0, verbosity].max
    verbosity = [6, verbosity].min
    severity = [
      Log::Severity::Fatal,
      Log::Severity::Error,
      Log::Severity::Warn,
      Log::Severity::Notice,
      Log::Severity::Info,
      Log::Severity::Debug,
      Log::Severity::Trace,
    ][verbosity]
    Log.setup(
      severity,
      LogBackend.new)
  end
end

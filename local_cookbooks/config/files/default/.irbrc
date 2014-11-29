# Activate auto-completion
require 'irb/completion'

# Save command history
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

# Use the simple prompt if possible.
IRB.conf[:PROMPT_MODE] = :SIMPLE if IRB.conf[:PROMPT_MODE] == :DEFAULT

# Enable auto-indent
IRB.conf[:AUTO_INDENT] = true

# Return interesting methods for object
class Object
  def interesting
    return self.methods.sort - Object.methods
  end
end

def benchmark(&block)
  raise 'block required' unless block_given?
  require 'benchmark'

  Benchmark.realtime(&block)
end

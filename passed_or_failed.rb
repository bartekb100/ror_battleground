class PassedOrFailed
  attr_accessor :args
  def initialize(*args)
    self.args = *args
  end

  def perform
    threshold = args[1].to_i
    hash = args[0]
    pass = {}
    fails = {}
    hash.each do |key, value|
      if value.to_i >= threshold
        pass[key] = value.to_i
      else
        fails[key] = value.to_i
      end
    end
    expected_hash = { :passed => pass, :failed => fails}
  end

  private
end

class Problem < StandardError
 attr_reader :status
 def initialize(status,code)
  @status=status;super(code)
 end
end

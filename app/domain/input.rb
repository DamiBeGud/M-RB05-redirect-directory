class Input
  def self.text(value,max=80)
    raise Problem.new(400,'invalid_text') unless value.is_a?(String)&&!value.strip.empty?&&value.length<=max
    value.strip
  end
  def self.id(value)
    result=text(value,64)
    raise Problem.new(400,'invalid_identifier') unless result.match?(/\A[A-Za-z0-9-]+\z/)
    result
  end
  def self.amount(value,max=1_000_000)
    raise Problem.new(400,'invalid_amount') unless value.is_a?(Integer)&&value.between?(1,max)
    value
  end
end

require 'uri'
class Input
  def self.destination(value)
    url=text(value,2048)
    begin
      parsed=URI.parse(url)
      raise Problem.new(400,'invalid_destination') unless %w[http https].include?(parsed.scheme)&&parsed.host&&!parsed.host.empty?&&parsed.userinfo.nil?
    rescue URI::InvalidURIError
      raise Problem.new(400,'invalid_destination')
    end
    url
  end
end

class User
  PROPERTIES = [:id, :first_name, :last_name]
  PROPERTIES.each do |prop|
    attr_accessor prop
  end

  def initialize(hash={})
    hash.each do |key, value|
      if PROPERTIES.member? key.to_sym
        self.send((key.to_s + "="), value)
      end
    end
  end

  def self.find(user_id, &block)
    BW::HTTP.get("http://api.local:3000/v2/users/#{user_id}") do |response|
      result_data = BW::JSON.parse(response.body.to_str)
      puts result_data
      user = User.new(result_data)
      if user.id.nil?
        block.call(nil)
      else
        block.call(user)
      end
    end
  end
end

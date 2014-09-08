class User
  PROPERTIES = [:id, :first_name, :last_name, :email, :date_of_birth, :height]
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
    body = { client_id: '4a8418570d7c9f2586d8af9d25a774086694cfc06eb7de24d5f7534af80f06d1',
             client_secret: '75efd068fedd84e2717933f7816db2e7b89248a8821a30da1048af281e3755f4',
             redirect_uri: 'portal.movable.com',
             grant_type: 'authorization_code',
             code: '148f28cef62e530799059799cceddfdf7f475525d97ef738033c134558e39289'}

    BW::HTTP.post("http://api.local:3000/oauth/token", payload: body) do |response|
      puts response.body.to_s
    end

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

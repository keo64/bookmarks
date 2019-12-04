class Facebook
  class << self
    def get_friends(access_token)
      graph = Koala::Facebook::API.new(access_token)
      user = graph.get_object("me")
      graph.get_connections(user["id"], "friends").map do |friend|
        user_friend = User.find_by_uid(friend['id'])
        if user_friend.nil?
          user_friend = User.new(name: friend['name'], uid: friend['id'])
          user_friend.save(validate: false)
        end

        user_friend
      end
    end
  end
end

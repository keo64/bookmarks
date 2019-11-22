class Facebook
  class << self
    def get_friends(access_token)
      graph = Koala::Facebook::API.new(access_token)
      user = graph.get_object("me")
      graph.get_connections(user["id"], "friends")
    end
  end
end

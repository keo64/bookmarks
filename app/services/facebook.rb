class Facebook
  class << self
    def fbgraph(token)
      Koala::Facebook::API.new(token)
    end

    # def get_object(token, id, args = {}, options = {}, &block)
    #   fbgraph(token).get_object(id, args, options, &block)
    # end

    def get_friends(access_token)
      graph = Koala::Facebook::API.new(access_token)
      user = graph.get_object("me")
      friends = graph.get_connections(user["id"], "friends")
      friends
      # graph = fbgraph(user.token)
      # fb_user = graph.get_object("me")
      # graph.get_connections(fb_user["id"], "friends")
    end
  end
end

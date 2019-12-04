class Users::FriendsController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    # @bookmarks = []
    # @friends = []

    # p '111111'

    # if @user.present?
      # p '111111'
      # p @user
      # @friends = Facebook.get_friends(@user.token)
      @bookmarks = @user.bookmarks
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @bookmarks = []
    @friends = []

    if @user.present?
      @friends = Facebook.get_friends(@user.token)
      @bookmarks = @user.bookmarks
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end

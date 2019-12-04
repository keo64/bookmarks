class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  def index
    @bookmarks = []
    @friends = []

    if current_user.present?
      @friends = Facebook.get_friends(current_user.token)
      @bookmarks = current_user.bookmarks
    end
  end


  def show
  end


  def new
    @bookmark = Bookmark.new
  end


  def edit
  end


  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.users<<(current_user)

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully created.' }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end


    def bookmark_params
      params.require(:bookmark).permit(:name, :url)
    end
end

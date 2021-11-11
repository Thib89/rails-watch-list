class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
      @bookmark = Bookmark.find(params[:bookmark_id])
    @list = List.new(list_params)
    @list.bookmark = @bookmark
    if @list.save
      redirect_to bookmark_path(@bookmark)
    else
      render "bookmark/show"
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end
end

  private

  def list_params
    params.require(:list).permit(:name)
  end

class BookmarksController < ApplicationController
  before_action :find_list

  def new
    @bookmark = @list.bookmarks.build
  end

  def create
    @bookmark = @list.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to @bookmark.list, notice: 'Bookmark was successfully deleted.'
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end

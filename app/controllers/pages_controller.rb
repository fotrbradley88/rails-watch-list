class PagesController < ApplicationController
  def home
      # Retrieve necessary data for the home page
      @lists = List.all
      @movies = Movie.all
      @bookmarks = Bookmark.all
  end
end

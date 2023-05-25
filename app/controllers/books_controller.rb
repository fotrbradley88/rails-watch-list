class BooksController < ApplicationController
  require_relative '../models/book'

  def index
    @books = Book.all
  end

  # Other actions...
end

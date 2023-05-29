class ListsController < ApplicationController
  def index
    @lists = List.all
    @movies = Movie.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  # Other actions...

  private

  def list_params
    params.require(:list).permit(:title, :description, :image)
  end
end

# Create the directory if it doesn't exist
Dir.mkdir(Rails.root.join('app', 'views', 'lists')) unless Dir.exist?(Rails.root.join('app', 'views', 'lists'))

# Create the view templates
File.open(Rails.root.join('app', 'views', 'lists', 'index.html.erb'), 'w') do |file|
  file.puts <<~HTML
    <h1>Lists</h1>
    <% @lists.each do |list| %>
      <div>
        <h2><%= list.title %></h2>
        <p><%= list.description %></p>
        <%= link_to 'Show', list %>
      </div>
    <% end %>
  HTML
end

File.open(Rails.root.join('app', 'views', 'lists', 'show.html.erb'), 'w') do |file|
  file.puts <<~HTML
    <h1><%= @list.title %></h1>
    <p><%= @list.description %></p>
  HTML
end

File.open(Rails.root.join('app', 'views', 'lists', 'new.html.erb'), 'w') do |file|
  file.puts <<~HTML
    <h1>New List</h1>
    <%= form_for @list do |f| %>
      <div>
        <%= f.label :title %>
        <%= f.text_field :title %>
      </div>
      <div>
        <%= f.label :description %>
        <%= f.text_area :description %>
      </div>
      <div>
        <%= f.submit 'Create List' %>
      </div>
    <% end %>
  HTML
end

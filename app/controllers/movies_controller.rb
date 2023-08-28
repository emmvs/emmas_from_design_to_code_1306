class MoviesController < ApplicationController
  def index
    @movies = Movie.order(year: :desc, title: :asc)

    if params[:query].present?
      @movies = @movies.where("title ILIKE ?", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      # 👆🏻 Do this if page is normally loaded
      # else do this 👇🏻 (if they come from .fetch)
      # why text and noy json?
      format.text {
        render partial: "movies/list",
                locals: {movies: @movies},
                formats: [:html]
      }
    end
  end
end

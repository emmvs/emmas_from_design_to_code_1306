class MoviesController < ApplicationController
  def index
    @movies = Movie.order(year: :desc, title: :asc)

    if params[:query].present?
      @movies = @movies.where("title ILIKE ?", "%#{params[:query]}%")
    end

    # UNOBTRUSIVE JAVASCRIPT
    respond_to do |format|
      # If Else Statement
      format.html # Follow regular flow of Rails
      # 👆🏻 Do this if page is normally loaded

      # Do this 👇🏻 if they come from .fetch
      format.text {
        render partial: "movies/list",
        locals: {movies: @movies},
        formats: [:html]
      }
      # RESEARCH: why text and noy json?
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      redirect_to movies_path
    end

    # UNOBTRUSIVE JAVASCRIPT
    respond_to do |format|
      format.html
      format.text { render partial: "movies/movie_infos", locals: {movie: @movie}, formats: [:html] }
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year, :image_url)
  end
end

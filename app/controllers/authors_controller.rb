class AuthorsController < ApplicationController
  before_action :find_author, only: %i[show update destroy edit]

  def index
    @authors = Author.all
  end

  def show
    #code
  end

  def create
    #code
    @author = Author.new(authors_params(:name, :birth_year))
    if @author.save
      redirect_to @author
    else
      render 'new'
    end
  end

  def new
    #code
    @author = Author.new
  end

  def edit
    #code
  end

  def update
    #code
    @author.update(authors_params(:name, :birth_year))
    if @author.save
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
    #code
    @author.destroy
    redirect_to authors_path
  end
  private
  def find_author
    @author = Author.find(params[:id])
  end
  def authors_params(*arg)
    params.require(:author).permit(*arg)
  end
end

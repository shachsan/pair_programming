class BooksController < ApplicationController
  before_action :find_book, only:[:show, :edit, :update, :destroy]
  def index
    @books = Book.all
  end

  def show
    @authors = Author.all

  end

  def create
    @book = Book.new(books_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def new
    @book = Book.new
  end

  def edit
    #code
  end

  def update
    @book.update(books_params)
    if params[:book][:author_id] != nil
      @book.author_id(Author.find(params[:book][:author_id]))
    end
    if @book.save
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private
  def find_book
    @book = Book.find(params[:id])
  end

  def books_params
    params.require(:book).permit(:title, :pages)
  end
end

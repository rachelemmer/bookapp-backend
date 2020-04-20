class BooksController < ApplicationController
    
    before_action :authorize, only: [:index, :create]
    
    def index
        @books = Book.all 
        render json: { books: @books }
    end

    def show
        @book = Book.find(params[:id])
        render json: @book
    end

    def create
        @book = Book.create(
            title: params[:title],
            author: params[:author],
            image: params[:image],
            api_id: params[:api_id],
            user_id: @user_id
        )
        render json: @book, include: [:user]
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
    end
end
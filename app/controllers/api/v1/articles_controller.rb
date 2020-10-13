# frozen_string_literal: true

module Api
  module V1
    # V1 Articles API controller
    class ArticlesController < ApplicationController
      def index
        articles = Article.order('created_at DESC')
        render json: { status: 'SUCCESS', message: 'Loaded articles', data: articles }
      end

      def show
        article = Article.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Found article', data: article }
      end

      def create
        article = Article.new(article_params)

        if article.save
          render json: { status: 'SUCCESS', message: 'Saved article', data: article }
        else
          render json: { status: 'ERROR', message: 'Article failed to save', data: article.errors }
        end
      end

      def destroy
        begin
          article = Article.find(params[:id])
          article.destroy

          render json: { status: 'SUCCESS', message: "Article #{params[:id]} deleted" }
        rescue
          render json: { status: 'ERROR', message: 'Error deleting article' }
        end
      end

      def update
        begin
          article = Article.find(params[:id])

          if article.update_attributes(article_params)
            render json: { status: 'SUCCESS', message: 'Article updated', data: article }
          else
            render json: { status: 'ERROR', message: 'Article not updated' }
          end
        rescue
          render json: { status: 'ERROR', message: 'Could not update article' }
        end
      end

      private

      # Only permitting title and body params
      def article_params
        params.permit(:title, :body)
      end
    end
  end
end

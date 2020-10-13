# frozen_string_literal: true

require 'test_helper'
require './app/models/article'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'model populates appropriately' do
    article = Article.new(title: 'Item 1', body: 'This is Item 1')

    assert article.valid?
  end

  test 'model is not valid if missing title' do
    article = Article.new(body: 'This is Item 1')

    assert_not article.valid?
  end

  test 'model is not valid if missing body' do
    article = Article.new(title: 'Item 1')

    assert_not article.valid?
  end
end

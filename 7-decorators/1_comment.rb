class Comment < ActiveRecord::Base
  # ...
  after_create :post_to_wall

private

  def post_to_wall
    Facebook.post(title: @comment.title, user: @comment.author)
  end
end

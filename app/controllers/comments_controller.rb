class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @tweet = Tweet.find(params[:tweet_id])
    if @comment.save
      CommentChannel.broadcast_to @tweet, { comment: @comment, user: @comment.user }
    else
      @tweet = @comment.tweet
      @comments = @tweet.comments
      render "tweets/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, tweet_id: params[:tweet_id] )
  end
end

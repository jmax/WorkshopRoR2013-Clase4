class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = current_user.tweets
    render template: "home/index"
  end

  def new
    @tweet = current_user.tweets.build
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to root_path, notice: "Gracias por compartir tus pensamientos!"
    else
      render :new
    end
  end

  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to root_path, notice: "Lastima! Nos gustaba mucho este tweet. :("
  end

  def report
    @tweet = Tweet.find(params[:id])

    unless current_user.has_already_reported?(@tweet)
      current_user.report(@tweet)
      message = "Bien ahí! Gracias por limpiar la basura. :D"
    else
      message = "No seas malo, y no intentas reportar el mismo tweet dos veces!"
    end

    redirect_to root_path, notice: message
  end

protected
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end

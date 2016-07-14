class TweetsController < ApplicationController
  def index
    render template: 'tweets/index.html.erb', locals: {
      tweets: Tweet.all,
      title: "All Tweets"
    }
  end

  def show
    if Tweet.exists?(params[:id])
      tweet = Tweet.find(params[:id])
      render template: 'tweets/show.html.erb', locals: {
        tweet: tweet
      }
    else render html: "Tweet Not Found.", status: 404
    end
  end

  def new
    render locals: {
      tweet: Tweet.new
    }
  end

  def create
    tweet = Tweet.new
    tweet.body = params[:tweet][:body]
    if tweet.save
      redirect_to tweet_path(tweet)
    else
      flash[:alert] = "Tweet not saved due to errors."
      render template: '/tweets/new.html.erb', locals: {
        tweet: tweet
      }
    end
  end

  def edit
    render locals: {
      tweet: Tweet.find(params[:id])
    }
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.body = params[:tweet][:body] if params[:tweet][:body].present?
    if tweet.save
      redirect_to tweet_path(tweet)
    else
      render template: '/tweets/new.html.erb', locals: {
        tweet: tweet
      }
    end
  end

  def destroy
    if Tweet.exists?(params[:id])
      Tweet.destroy(params[:id])
      flash[:notice] = "Tweet deleted"
      redirect_to tweet_path(tweet)
    else
      flash[:alert] = "Tweet was not deleted due to an error."
    end
  end

end

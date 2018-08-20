class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    session[:token] = GithubService.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code])
    session[:username] = GithubService.get_username

    redirect_to '/'
  end
end

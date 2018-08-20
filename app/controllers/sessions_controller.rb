class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    session[:token] = GithubService.authenticate!(client_id: ENV["GITHUB_CLIENT"], client_secret: ENV["GITHUB_SECRET"],code: params[:code])
    session[:username] = GithubService.get_username

    redirect_to '/'
  end
end
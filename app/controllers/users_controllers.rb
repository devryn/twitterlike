class UsersController < ApplicationController
  def index
    render template: 'users/index.html.erb', locals: {
      users: User.all,
      title: "All Users"
    }
  end

  def show
    if User.exists?(params[:id])
      user = User.find(params[:id])
      render template: 'users/show.html.erb', locals: {
        user: user,
      }
    else
      render html: "User Not Found", status: 404
    end
  end

  def new
    render locals: {
      user: User.new
    }
  end

  def create
    user = User.new
    user.name = params[:user][:name]
    user.handle = params[:user][:handle]
    user.email = params[:user][:email]
    if user.save
      redirect_to user_path(user)
    else
      flash[:alert] = "User was not created. Please make sure all fields are filled out."
      render template: '/users/new.html.erb', locals: {
        user: user
      }
    end
  end

  def edit
    render locals: {
      user: User.find(params[:id])
    }
  end

  def update
    user = User.find(params[:id])
    user.name = params[:user][:name] if params[:user][:name].present?
    user.handle = params[:user][:handle] if params[:user][:handle].present?
    user.email = params[:user][:email] if params[:user][:email].present?
    if user.save
      redirect_to user_path(user)
    else
      render template: '/users/new.html.erb', locals: {
        user: user
      }
    end
  end

  def destroy
    if User.exists?(params[:id])
      User.destroy(params[:id])
      flash[:notice] = "User deleted."
      redirect_to user_path(user)
    else
      flash[:alert] = "There was an error. Please try again."
    end
  end
end

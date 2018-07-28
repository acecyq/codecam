class HomeController < ApplicationController
    def index
        @users = User.all
        puts @users
        puts 'current'
        @current_user = current_user
    end
end
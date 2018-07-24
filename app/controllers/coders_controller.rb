class CodersController < ApplicationController

    def index
    end
  
    def show
        @users = User.find(params[:id])
    end
  
    def new
    end
  
    def edit
    end
  
    def create
    end
  
    def update
    end
  
    def destroy
    end


end
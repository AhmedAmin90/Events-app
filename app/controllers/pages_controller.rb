class PagesController < ApplicationController
    def home
        @users = User.all
        # @user = User.find(params[:id])
    end
    
end

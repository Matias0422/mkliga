class HomeController < ApplicationController
    def index
        @tournaments = Tournament.all
        @user = current_user
    end
end

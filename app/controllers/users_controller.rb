class UsersController < ApplicationController

    def new
        @user = User.new
    end


    def create
     @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to @user
        else
            redirect_to '/'
        end
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :admin, :password, :password_confirmation)
    end

end


# create_table "users", force: :cascade do |t|
#     t.string "name"
#     t.string "password_digest"
#     t.integer "nausea"
#     t.integer "happiness"
#     t.integer "tickets"
#     t.integer "height"
#     t.boolean "admin", default: false
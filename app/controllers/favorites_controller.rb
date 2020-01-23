class FavoritesController < ApplicationController

    def new

        @user = User.find(params[:id])
    
    end

    def create

        @user = User.find(params[:id])


        if params["hex_code"].length != 7 || params["hex_code"][0] != '#'

            flash[:errors] = ["A hex code must have the format '#xxxxxx'"]
            redirect_to new_user_favorite_path(@user)


        elsif params["hex_code"].split("")[1, 6].find{|char| !(char =~ /[a-f0-9]/)}
            flash[:errors] = ["Characters must be numerals or lower case letters between a and f."]
            redirect_to new_user_favorite_path(@user)
            
        else
            @color = Color.find_or_create_by(hex_code: params["hex_code"])

            favorite = Favorite.find_by(color_id: @color.id, user_id: @user.id)

            if !favorite
                Favorite.create(color_id: @color.id, user_id: @user.id)
            end

            redirect_to user_path(@user)
        end

    end
    
end
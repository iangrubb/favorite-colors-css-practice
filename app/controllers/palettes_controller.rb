class PalettesController < ApplicationController
    
    def new

        @user = User.find(params[:id])
    
    end

    def create

        @user = User.find(params[:id])

        if !params[:color_ids]
            flash[:errors] = ["A palette must have at least one color."]
        else
            @palette = Palette.new(name: params[:name], user_id: @user.id)

            if @palette.valid?
                @palette.save
                params[:color_ids].each do |id|
                    PaletteColor.create(palette_id: @palette.id , color_id: id)
                end
            else
                flash[:errors] = @palette.errors.full_messages
            end
        end

        if flash[:errors]
            redirect_to new_user_palette_path(@user)
        else
            redirect_to user_path(@user)
        end
    end

end

PaletteColor.destroy_all
Palette.destroy_all
Favorite.destroy_all
User.destroy_all
Color.destroy_all




users = [
    {name: "Ian",
    image_url: "https://ca.slack-edge.com/T02MD9XTF-UKLTXS2LU-93c15b2245eb-512",
    position: "coach"},
    {name: "Matt",
    image_url: "https://ca.slack-edge.com/T02MD9XTF-UFLH3KMEV-361ad28cf909-512",
    position: "coach"}
]


users.each_with_index do |user_data, idx|


    user = User.create(name: user_data[:name] , image_url: user_data[:image_url], position: user_data[:position])


    # Make 10 to 15 favorite colors per user

    color_count = idx == 0 ? 15 : rand(10..15)

    color_count.times do

        # Determine whether to resuse color or generate a new one

        # 10% chance of color reuse, excluding the first generated user.

        use_old = rand(1..10) == 1

        if idx > 0 && use_old
            potential_colors = Color.all.reject{|color| user.colors.include?(color)}
            color = potential_colors.sample
        else 
            hex_code = Faker::Color.unique.hex_color

            color = Color.create(hex_code: hex_code)
        end

        Favorite.create(user_id: user.id, color_id: color.id)

    end



    # Make 3 to 5 palettes for each user, with random name

    palette_count = rand(3..5)

    palette_count.times do

        name = Faker::GreekPhilosophers.unique.name

        palette = Palette.create(name: name, user_id: user.id)

        # Make 4 to 7 palette_colors for each palette, drawing from that user's favorite colors

        palette_color_count = rand(4..7)

        user.colors.sample(palette_color_count).each do |color|
            PaletteColor.create(palette_id: palette.id, color_id: color.id)
        end

    end


    

    


end
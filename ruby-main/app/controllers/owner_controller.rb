class OwnerController < ApplicationController
    def login_owner
        
    end
    def login_own
        @owner = Owner.where("email = ?", params[:email]).first
        if @owner && @owner.pass_word == params[:password]
            session[:owner_id] = @owner.id
            redirect_to "/chu-san/quan-ly"
        else
            redirect_to "/login_owner"
        end
    end

    def manage
        @owner = Owner.find(session[:owner_id])
        @booking = Booking.where("owners_id = ?", session[:owner_id])
        @user = User.all
        @pitch = Pitch.where("owners_id = ?", session[:owner_id])
    end

    def verify
        booking = Booking.find(params[:id])
        booking.update(verified: 1)
        redirect_to "/chu-san/quan-ly"
    end

    def cancel
        booking = Booking.find(params[:id])
        booking.update(verified: 2)
        redirect_to "/chu-san/quan-ly"
    end

    def editpitch
        @owner = Owner.find(session[:owner_id])
        @pitch = Pitch.where("owners_id = ?", session[:owner_id])
    end

    def profile_owner
        @owner = Owner.find(session[:owner_id])
    end

    def update_profile
        owner = Owner.find(session[:owner_id])
        owner.update(
            name: params[:name],
            phone_number: params[:phone],
            name_bank: params[:name_bank],
            number_acc_bank: params[:number_acc_bank],
            branch_bank: params[:branch_bank],
            address: params[:address]
        )
        redirect_to "/chu-san/thong-tin-ca-nhan"
    end

    def addpitch
        @owner = Owner.find(session[:owner_id])
    end

    def add
        @pitch = Pitch.new(
            pitch_name: params[:pitch_name], 
            description: params[:description], 
            owners_id: session[:owner_id], 
            city: params[:city], 
            district: params[:district],
            address: params[:address],
            phone_number: params[:phone_number],
            url_ggmap: params[:url_ggmap],
            start_time: params[:start_time],
            end_time: params[:end_time],
            price_per_hour: params[:price_per_hour],
            size: params[:size],
            avatar_url: params[:avatar_url]
        )
        @pitch.save
        redirect_to "/chu-san/them-san"
    end

    def edit
        @owner = Owner.find(session[:owner_id])
        @pitch = Pitch.find(params[:id])
    end

    def edit_pitch
        @owner = Owner.find(session[:owner_id])
        pitch = Pitch.find(params[:id])
        pitch.update(
            pitch_name: params[:pitch_name], 
            description: params[:description], 
            owners_id: session[:owner_id], 
            city: params[:city], 
            district: params[:district],
            address: params[:address],
            phone_number: params[:phone_number],
            url_ggmap: params[:url_ggmap],
            start_time: params[:start_time],
            end_time: params[:end_time],
            price_per_hour: params[:price_per_hour],
            size: params[:size],
            avatar_url: params[:avatar_url]
        )
        redirect_to "/chu-san/chi-tiet"
    end

    def doanhthu
        @owner = Owner.find(session[:owner_id])
        sql = "SELECT book_day, SUM(total_price) AS sum
        FROM bookings WHERE owners_id = #{session[:owner_id]}
        GROUP BY book_day"
        @dt = ActiveRecord::Base.connection.exec_query(sql)
        @sum = Booking.where("owners_id = ?", session[:owner_id]).sum('total_price')
    end
end

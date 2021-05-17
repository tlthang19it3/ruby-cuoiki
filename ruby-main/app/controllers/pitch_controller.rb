class PitchController < ApplicationController
    skip_before_action :authorized, only: [:book, :book2]
    def index
        @pitch = Pitch.find(params[:id])
    end
    def book
        @user = User.find(session[:user_id])
        @pitch = Pitch.find(params[:id])
        @day = params[:day]
        @date = params[:date]
        @begin_time = params[:begin_time]
        @duration = params[:duration]
    end

    def book2
        @user = User.find(session[:user_id])
        @ticket = params[:ticket]
        @pitch = Pitch.find(params[:pitch_id])
        @today = params[:today]
        @book_day = params[:book_day]
        @start_time = params[:start_time]
        @end_time = params[:end_time]
        @total_price = params[:total_price]
        @owner = Owner.find(params[:owner_id])
        @booking = Booking.new(
            users_id: session[:user_id], 
            pitches_id: params[:pitch_id], 
            owners_id: params[:owner_id], 
            book_day: params[:today], 
            time_booking: params[:book_day],
            start_time_book: params[:start_time],
            end_time_book: params[:end_time],
            verified: 0,
            ticket: params[:ticket],
            total_price: params[:total_price]
        )
        @booking.save
    end
end

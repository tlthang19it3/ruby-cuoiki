class AllPitchController < ApplicationController
    skip_before_action :authorized
    def index
        @pitch = Pitch.all
    end
end

class EventsController < ApplicationController
   before_action :set_event, only: [:edit, :update, :show]
   before_action :logged_in?
   
   def index 
      @events = Event.sort_events(@current_user)
   end 

   def show 
   end
   
   
   private 
   
   def set_event
      @event = Event.find(params[:id])
   end
   
   def event_params 
      params.require(:event).permit(:name, :id)
   end

end

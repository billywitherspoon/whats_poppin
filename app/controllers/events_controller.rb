class EventsController < ApplicationController
   before_action :set_event, only: [:edit, :update, :show]
   before_action :logged_in?
   
   def index 
      @events = Event.all.sort_by{|event| event.total_avg_rating}
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

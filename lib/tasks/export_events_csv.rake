namespace :export do
  task :csv => :environment do
    require 'csv'
    CSV.open("exported_events.csv", "w") do |csv|
      @events = Event.where(event_type: 'Congratulations')
      csv << ['user_id', 'color', 'message', 'completed_time']
      @events.each do |event|
        csv << [event.task.user_id, event.content["color"], event.content["message"], event.created_at.strftime("%I:%M%p")] #fields name
      end
    end
  end
end
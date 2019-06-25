module SetNotice
  extend ActiveSupport::Concern

  included do
    before_action :set_colors
  end

  def set_notice
    if @task.ongoing?
      @color = @colors.sample
      @message = ['Shame!!', 'No way!!', 'That is wrong!'].sample
    else
      @color = @colors.sample
      @message = ['Congratulations!!', 'Good on you', 'Amazing'].sample
    end 
  end

  def set_colors
    @colors = ['#7b68ee', '#6a5acd', '#800000', '#2f4f4f']
  end 
end 
module SetNotice
  extend ActiveSupport::Concern

  included do
    before_action :set_colors
  end

  def set_notice
    if @task.doing?
      @color = @colors.sample
      @message = ['Poxa vida ...', 'Puts ...', 'Eita!', 'Tsc tsc ...', 'Nããão!'].sample
    else
      @color = @colors.sample
      @message = ['Parabéns!', 'Muito bom!', 'Boa!', 'Fantástico!', 'Mandou bem!'].sample
    end 
  end

  def set_colors
    @colors = ['#7b68ee', '#6a5acd', '#800000', '#2f4f4f']
  end 
end 
module SetNotice
  extend ActiveSupport::Concern
  
  def set_message task
    if task.doing?
      message = ['Poxa vida ...', 'Puts ...', 'Eita!', 'Tsc tsc ...', 'Nããão!'].sample
    else
      message = ['Parabéns!', 'Muito bom!', 'Boa!', 'Fantástico!', 'Mandou bem!'].sample
    end 
  end

  def set_color
    color = ['#7b68ee', '#6a5acd', '#800000', '#2f4f4f'].sample
  end 
end 
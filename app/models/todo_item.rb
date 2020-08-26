class TodoItem < ApplicationRecord
  #rails g model todo_item content:string todo_list:references
  belongs_to :todo_list


  #Si c'est fait la colonne fait le ne peut pas être vide 
  def completed?
    !completed_at.blank?
  end

end

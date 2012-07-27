module ContactsHelper
  def get_interaction_td_for_contact(contact)
    if !Interaction.where("primary_contact_id=? ", contact.id).blank?
      interaction=Interaction.where("primary_contact_id=? ", contact.id).order("interaction_date").last
      if interaction.taskings.count>0
        col="#CD0000"
      else
        col="#000000"
      end
      #'<td style="color:#{col}">#{interaction.name}</td>'

      return raw("<span style='color:#{col}'>#{interaction.name}</span>")
    end
  else
    return raw("<span style='color:#000000'>No Interaction</span>")

  end

  def get_interaction_date(contact)
    if !Interaction.where("primary_contact_id=? ", contact.id).blank?
      interaction=Interaction.where("primary_contact_id=? ", contact.id).order("interaction_date").last
      if interaction.taskings.count>0
        col="#CD0000"
      else
        col="#000000"
      end
      #'<td style="color:#{col}">#{interaction.name}</td>'

      return raw("<span style='color:#{col}'>#{interaction.interaction_date.strftime('%b %e %y')}</span>")
    end
  else
    return raw("<span style='color:#000000'>No Interaction</span>")

  end


  def due_overdue_task_count(contact)

    if Interaction.where("primary_contact_id=? ", contact.id).all.count>0
    overdue_tasks=Interaction.where("primary_contact_id=? ", contact.id).all.map { |interaction|
      if interaction.taskings.count>0 then
        interaction.taskings.where("due_date<?", Date.today).count
      else
        0
      end }.sum
    due_tasks=Interaction.where("primary_contact_id=? ", contact.id).all.map { |interaction|
      if interaction.taskings.count>0 then
        interaction.taskings.where("due_date>?", Date.today).count
      else
        0
      end }.sum


    raw("<span>OverDue=#{overdue_tasks} | Due:#{due_tasks}</span>")
    end


  end

end

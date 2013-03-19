module ApplicationHelper
  def format_date_for_text_field(the_date)
     return the_date.strftime('%d-%m-%Y')
  end
end

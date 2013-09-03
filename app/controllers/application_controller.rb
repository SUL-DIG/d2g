class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller 
   include Blacklight::Controller
  # Please be sure to impelement current_user and user_session. Blacklight depends on 
  # these methods in order to perform user specific actions. 

  layout 'blacklight'

  # Adds a few additional behaviors into the application controller 
   include Blacklight::Controller
  # Please be sure to impelement current_user and user_session. Blacklight depends on 
  # these methods in order to perform user specific actions. 

  protect_from_forgery
  
  layout "d2g"
  
  helper_method :on_home_page, :on_about_pages, :on_show_page, :on_search_page, :request_path, :on_notes_pages, :on_submit_pages, :on_report_pages
  

  
  def request_path
    Rails.application.routes.recognize_path(request.path)
  end
  
  def on_home_page
    request_path[:controller] == 'catalog' && request_path[:action] == 'index' && params[:f].blank? && params[:q].blank?
  end
  
  def on_collections_pages
    request_path[:controller] == 'catalog' && !on_home_page && !on_collection_highlights_page
  end
  
  def on_show_page
    request_path[:controller] == 'catalog' && request_path[:action] == 'show'
  end

  def on_search_page
    request_path[:controller] == 'catalog' && request_path[:action] == 'index' && !on_home_page
  end
  
  def on_about_pages
    request_path[:controller] == 'about' 
  end
  
  def on_notes_pages
    request_path[:controller] == 'notes' 
  end
  
  def on_submit_pages
    request_path[:controller] == 'submit' 
  end
  
  def on_report_pages
    request_path[:controller] == 'report' 
  end
      
  # def exception_on_website(exception)
#     @exception=exception
# 
#     D2gMailer.error_notification(:exception=>@exception).deliver unless D2g::Application.config.exception_recipients.blank? 
# 
#     if D2g::Application.config.exception_error_page
#         logger.error(@exception.message)
#         logger.error(@exception.backtrace.join("\n"))
#         render "500", :status => 500
#       else
#         raise(@exception)
#      end
#   end
      
end

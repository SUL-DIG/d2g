class ReportController < ApplicationController 

  # To create a new submit page, create a partial with the URL name you want containing the actual page content
  # If your action has logic that needs to be run before the view, create a method, call "show" at the end of it, create a view partical o match,
  # and add a custom route in the routes.rb file    
  def contact
    @from=params[:from]
    if request.post?
      @subject=params[:subject]
      @name=params[:name]
      @email=params[:email]
      @message=params[:message]
      unless @message.blank?
        D2gMailer.contact_message(:params=>params,:request=>request).deliver 
        flash[:notice]=t("d2g.about.contact_message_sent")
        unless @from.blank?
          redirect_to(@from)
          return
        end
      else
        flash.now[:error]=t("d2g.about.contact_error")
      end
    end
    show
  end

  def show
    @page_name=params[:id] || action_name # see if the page to show is specified in the ID parameter (coming via a route) or custom method (via the action name)
    @page_name='project' unless lookup_context.exists?(@page_name, 'about', true) # default to project page if requested partial doesn't exist
    @page_title = t("d2g.about.#{@page_name}_title") # set the page title
    @params=params
    @no_nav=(@page_name=='terms_dialog' ? true : false)
    render :form
  end
  
end
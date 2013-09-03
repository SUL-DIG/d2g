module ApplicationHelper

  
  # sections for About page
  # elementlink names should match what's used in locale_about.yml
  def about_sections
    section_list = ['new', 'logo',
                    'acknowledgements']
  end

 
 
def render_external_link args, results = Array.new
		text = args[:document].get(blacklight_config.show_fields[args[:field]][:text])
        url = args[:document].get(args[:field])
        link_text = 'Find This in SearchWorks'
        results << link_to(link_text, url, { :target => "_blank" }).html_safe
  end


end

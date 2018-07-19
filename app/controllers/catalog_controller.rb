require 'blacklight/catalog'

class CatalogController < ApplicationController

  include Blacklight::Catalog

  configure_blacklight do |config|
    ## Default parameters to send to solr for all search-like requests. See also SolrHelper#solr_search_params
    config.default_solr_params = {
      :qt => 'search',
      :rows => 10
    }

    ## Default parameters to send on single-document requests to Solr. These settings are the Blackligt defaults (see SolrHelper#solr_doc_params) or
    ## parameters included in the Blacklight-jetty document requestHandler.
    #
    #config.default_document_solr_params = {
    # :qt => 'document',
    # ## These are hard-coded in the blacklight 'document' requestHandler
    # # :fl => '*',
    # # :rows => 1
    # # :q => '{!raw f=id v=$id}'
    #}

    #config for xmlitem webservice JSP 05/16/2012
    config.xmlitem_url = 'http://libexp.uits.iu.edu/xmlitem2.cgi?key='

    # solr field configuration for search results/index views
    config.index.show_link = 'title'
    config.index.record_display_type = 'composer'

    # solr field configuration for document/show views
    config.show.html_title = 'title'
    config.show.heading = 'title'
    config.show.display_type = 'composer'

    # solr fields that will be treated as facets by the blacklight application
    # The ordering of the field names is the order of the display
    #
    # Setting a limit will trigger Blacklight's 'more' facet values link.
    # * If left unset, then all facet values returned by solr will be displayed.
    # * If set to an integer, then "f.somefield.facet.limit" will be added to
    # solr request, with actual solr request being +1 your configured limit --
    # you configure the number of items you actually want _displayed_ in a page.
    # * If set to 'true', then no additional parameters will be sent to solr,
    # but any 'sniffed' request limit parameters will be used for paging, with
    # paging at requested limit -1. Can sniff from facet.limit or
    # f.specific_field.facet.limit solr request params. This 'true' config
    # can be used if you set limits in :default_solr_params, or as defaults
    # on the solr side in the request handler itself. Request handler defaults
    # sniffing requires solr requests to be made with "echoParams=all", for
    # app code to actually have it echo'd back to see it.
    #
    # :show may be set to false if you don't want the facet to be drawn in the
    # facet bar
    config.add_facet_field 'genre_facet', :label => 'Genre'
    config.add_facet_field 'subgenre_facet', :label => 'Opera Subgenre'
    config.add_facet_field 'subject_facet', :label => 'Oratorio Subject', :limit => 10
    config.add_facet_field 'feastMonth_query', :label => 'Oratorio Feast Month', :query => {
    :feastMonth_january => { :label => 'January', :fq => "feastMonth:January"},
    :feastMonth_february => { :label => 'February', :fq => "feastMonth:February"},
    :feastMonth_march => { :label => 'March', :fq => "feastMonth:March"},
    :feastMonth_april => { :label => 'April', :fq => "feastMonth:April"},
    :feastMonth_may => { :label => 'May', :fq => "feastMonth:May"},
    :feastMonth_june => { :label => 'June', :fq => "feastMonth:June"},
    :feastMonth_july => { :label => 'July', :fq => "feastMonth:July"},
    :feastMonth_august => { :label => 'August', :fq => "feastMonth:August"},
    :feastMonth_september => { :label => 'September', :fq => "feastMonth:September"},
    :feastMonth_october => { :label => 'October', :fq => "feastMonth:October"},
    :feastMonth_november => { :label => 'November', :fq => "feastMonth:November"},
    :feastMonth_december => { :label => 'December', :fq => "feastMonth:December"}
	}
    config.add_facet_field 'composerSort_facet', :label => 'Composer', :limit => 10
    config.add_facet_field 'composerSort_query', :label => 'Composer (A-to-Z Sort)', :query => {
    :a_composers => { :label => '- A -', :fq => "composerSort_sort:a*"},
    :b_composers => { :label => '- B -', :fq => "composerSort_sort:b*"},
    :c_composers => { :label => '- C -', :fq => "composerSort_sort:c*"},
    :d_composers => { :label => '- D -', :fq => "composerSort_sort:d*"},
    :e_composers => { :label => '- E -', :fq => "composerSort_sort:e*"},
    :f_composers => { :label => '- F -', :fq => "composerSort_sort:f*"},
    :g_composers => { :label => '- G -', :fq => "composerSort_sort:g*"},
    :h_composers => { :label => '- H -', :fq => "composerSort_sort:h*"},
    :i_composers => { :label => '- I -', :fq => "composerSort_sort:i*"},
    :j_composers => { :label => '- J -', :fq => "composerSort_sort:j*"},
    :k_composers => { :label => '- K -', :fq => "composerSort_sort:k*"},
    :l_composers => { :label => '- L -', :fq => "composerSort_sort:l*"},
    :m_composers => { :label => '- M -', :fq => "composerSort_sort:m*"},
    :n_composers => { :label => '- N -', :fq => "composerSort_sort:n*"},
    :o_composers => { :label => '- O -', :fq => "composerSort_sort:o*"},
    :p_composers => { :label => '- P -', :fq => "composerSort_sort:p*"},
    :q_composers => { :label => '- Q -', :fq => "composerSort_sort:q*"},
    :r_composers => { :label => '- R -', :fq => "composerSort_sort:r*"},
    :s_composers => { :label => '- S -', :fq => "composerSort_sort:s*"},
    :t_composers => { :label => '- T -', :fq => "composerSort_sort:t*"},
    :u_composers => { :label => '- U -', :fq => "composerSort_sort:u*"},
    :v_composers => { :label => '- V -', :fq => "composerSort_sort:v*"},
    :w_composers => { :label => '- W -', :fq => "composerSort_sort:w*"},
    :x_composers => { :label => '- X -', :fq => "composerSort_sort:x*"},
    :y_composers => { :label => '- Y -', :fq => "composerSort_sort:y*"},
    :z_composers => { :label => '- Z -', :fq => "composerSort_sort:z*"},
    }
    config.add_facet_field 'librettistSort_facet', :label => 'Librettist/Literary Source', :limit => 10
    config.add_facet_field 'year', :label => 'Premiere Year', :range => true
    config.add_facet_field 'country_facet', :label => 'Country',:limit => 10
    config.add_facet_field 'region_facet', :label => 'State/Region', :limit => 10
    config.add_facet_field 'city_facet', :label => 'City', :limit => 10
    config.add_facet_field 'theater_facet', :label => 'Theater', :limit => 10

    # Have BL send all facet field names to Solr, which has been the default
    # previously. Simply remove these lines if you'd rather use Solr request
    # handler defaults, or have no facets.
	config.add_facet_fields_to_solr_request!
    #use this instead if you don't want to query facets marked :show=>false
    #config.default_solr_params[:'facet.field'] = config.facet_fields.select{ |k, v| v[:show] != false}.keys


    # solr fields to be displayed in the index (search results) view
    # The ordering of the field names is the order of the display
    config.add_index_field 'composer', :label => 'Composer:'
    config.add_index_field 'title', :label => 'Title:'
    config.add_index_field 'librettist', :label => 'Librettist/Literary Source:'
    config.add_index_field 'genre', :label => 'Genre:'
    config.add_index_field 'year', :label => 'Year:'
    config.add_index_field 'country', :label => 'Country:'

    # solr fields to be displayed in the show (single result) view
    # The ordering of the field names is the order of the display
    config.add_show_field 'composer', :label => 'Composer:'
    config.add_show_field 'title', :label => 'Title:'
    config.add_show_field 'librettist', :label => 'Librettist/Literary Source:'
    config.add_show_field 'genre', :label => 'Genre:'
	config.add_show_field 'subgenre', :label => 'Subgenre:'
	config.add_show_field 'subject', :label => 'Subject:'
    config.add_show_field 'feastDate', :label => 'Feast Date:'
    config.add_show_field 'date', :label => 'Premiere Date:'
    config.add_show_field 'theater', :label => 'Theater:'
    config.add_show_field 'city', :label => 'City:'
    config.add_show_field 'region', :label => 'State/Region:'
    config.add_show_field 'country', :label => 'Country:'
    config.add_show_field 'swQuery', :label => '', :helper_method => :render_external_link
    config.add_show_field 'revisions', :label => 'Revisions History:'


    # "fielded" search configuration. Used by pulldown among other places.
    # For supported keys in hash, see rdoc for Blacklight::SearchFields
    #
    # Search fields will inherit the :qt solr request handler from
    # config[:default_solr_parameters], OR can specify a different one
    # with a :qt key/value. Below examples inherit, except for subject
    # that specifies the same :qt as default for our own internal
    # testing purposes.
    #
    # The :key is what will be used to identify this BL search field internally,
    # as well as in URLs -- so changing it after deployment may break bookmarked
    # urls. A display label will be automatically calculated from the :key,
    # or can be specified manually to be different.

    # This one uses all the defaults set by the solr request handler. Which
    # solr request handler? The one set in config[:default_solr_parameters][:qt],
    # since we aren't specifying it otherwise.

    config.add_search_field 'all_fields', :label => 'All Fields'


    # Now we see how to over-ride Solr request handler defaults, in this
    # case for a BL "search field", which is really a dismax aggregate
    # of Solr search fields.

    config.add_search_field('title') do |field|
      # solr_parameters hash are sent to Solr as ordinary url query params.
      field.solr_parameters = {
        :'spellcheck.dictionary' => 'title',
        :qf => '${title_qf}',
        :pf => '${title_pf}'
      }
    end

    config.add_search_field('composer') do |field|
      field.solr_parameters = {
        :'spellcheck.dictionary' => 'composer',
        :qf => '${composer_qf}',
        :pf => '${composer_pf}'
      }
    end

    config.add_search_field('librettist') do |field|
      field.solr_parameters = {
        :'spellcheck.dictionary' => 'librettist',
        :qf => '${librettist_qf}',
        :pf => '${librettist_pf}'
      }
    end

    # "sort results by" select (pulldown)
    # label in pulldown is followed by the name of the SOLR field to sort by and
    # whether the sort is ascending or descending (it must be asc or desc
    # except in the relevancy case).
    config.add_sort_field 'score desc, titleSort_sort asc, composerSort_sort asc, year_sort desc', :label => 'relevance'
    config.add_sort_field 'titleSort_sort asc, year_sort desc', :label => 'title'
    config.add_sort_field 'composerSort_sort asc, titleSort_sort asc', :label => 'composer'
    config.add_sort_field 'year_sort asc, titleSort_sort asc', :label => 'year'

    # If there are more than this many search results, no spelling ("did you
    # mean") suggestion is offered.
    config.spell_max = 5
  end



end

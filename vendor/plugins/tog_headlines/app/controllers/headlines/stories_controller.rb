class Headlines::StoriesController < ApplicationController
  
  def show
    @story = Story.published.find(params[:id])
  end

  def by_tag
    @tag  =  Tag.find_by_name(params[:tag])
    @stories = Story.published.find_tagged_with(params[:tag])
  end

  def index
    @order = params[:order] || 'publish_date'
    @page = params[:page] || '1'
    @asc = params[:asc] || 'desc'    
    @stories = Story.published.paginate :per_page => Tog::Config['plugins.tog_headlines.pagination_size'],
                                  :page => @page,
                                  :order => @order + " " + @asc
    respond_to do |format|
      format.html
      format.atom { render(:layout => false) }
    end                                  
  end
  
end

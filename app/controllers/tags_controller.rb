class TagsController < ApplicationController

  def index
    
    @tags = ActsAsTaggableOn::Tag.where("name like ?", "%#{params[:q]}%")
    
    respond_to do |format|
      format.html
      format.json { render :json => @tags.map(&:attributes)}
    end
  end

end

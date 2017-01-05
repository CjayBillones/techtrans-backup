class TagsController < ApplicationController

  def index
<<<<<<< HEAD
    @tags = Tag.where("name like ?", "%#{params[:q]}%")
=======
    @tags = ActsAsTaggableOn::Tag.where("name like ?", "%#{params[:q]}%")
>>>>>>> 028a3ebe71aea179306fbd74977b2d19c99df16e
    respond_to do |format|
      format.html
      format.json { render :json => @tags.map(&:attributes)}
    end
  end

end

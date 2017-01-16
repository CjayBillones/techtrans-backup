class StaticPagesController < ApplicationController
  
  def home
    if current_user
      if current_user.admin?
        redirect_to admin_path
      end
      offers = IpOffer.all
      needs = IpNeed.all
      @ips = (offers + needs).sort_by(&:created_at).reverse.paginate(:page => params[:page], :per_page => 1)
    else
      @articles = Article.last(4)
      @offers = IpOffer.last(5)
      @needs = IpNeed.last(5)
    end
  end

  def about
  end

  def expertise
  end

  def opportunities
  end

  def itso_ipophl
  end

  def resources
  end

  def contact
    @message = Message.new
  end

  def send_message_email
    @message = Message.new(message_params)
    
    if @message.valid?
      MessageMailer.new_message(@message).deliver
      redirect_to contact_path, notice: "Your messages has been sent."
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end    
  end

  private
    def message_params
      params.require(:message).permit(:name, :email, :content)
    end

end

class InquiriesController < ApplicationController
    
    before_action :authenticate_user!, only: [:index]
    before_action :user_admin, only: [:index]
    
    def index
        @inquiries = Inquiry.all.order(created_at: :desc)
    end
    
    def new
        @inquiry = Inquiry.new
    end
    
    def create
        @inquiry = Inquiry.new(inquiry_params) 
        respond_to do |format|
            if @inquiry.save
                InquiryMailer.send_when_create(@inquiry).deliver
                InquiryMailer.send_to_owner(@inquiry).deliver
                format.html { redirect_to "/", notice: 'お問い合わせを受け付けました' }
                format.json { render :show, status: :created, location: @inquiry }
            else
                format.html { render :new }
                format.json { render json: @inquiry.errors, status: :unprocessable_entity }
            end
        end
    end
    
    private
    
        def inquiry_params
            params.require(:inquiry).permit(:name, :email, :content)
        end
        
        def user_admin
          @users = User.all
          if  current_user.admin == false
              redirect_to recipes_path
          end
        end
end

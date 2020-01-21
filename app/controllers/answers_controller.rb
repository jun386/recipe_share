class AnswersController < ApplicationController
    
    before_action :authenticate_user!, only: [:new, :create]
    before_action :user_admin, only: [:new, :create]
    
    def new
        @answer = Answer.new
        @inquiry = Inquiry.find_by(id: params[:inquiry_id])
    end
    
    def create
        @answer = Answer.new(answer_params) 
        @inquiry = Inquiry.find_by(id: @answer.inquiry_id)
        respond_to do |format|
            if @answer.save
                AnswerMailer.send_when_answer(@answer, @inquiry).deliver
                AnswerMailer.send_to_owner(@answer, @inquiry).deliver
                format.html { redirect_to "/inquiries", notice: 'お問い合わせを受け付けました' }
                format.json { render "/inquiries", status: :created, location: @inquiry }
            else
                format.html { render :new }
                format.json { render json: @inquiry.errors, status: :unprocessable_entity }
            end
        end
    end
    
    private
    
        def answer_params
            params.require(:answer).permit(:content, :inquiry_id)
        end
        
        def user_admin
           @users = User.all
           if  current_user.admin == false
               redirect_to recipes_path
           end
        end
    
end

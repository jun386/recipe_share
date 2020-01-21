class AnswerMailer < ApplicationMailer
    def send_when_answer(answer, inquiry)
        @answer = answer
        @inquiry = inquiry
        mail to:      @inquiry.email,
        subject: 'お問い合わせの回答メールです。'
    end 
    
    def send_to_owner(answer, inquiry)
        @answer = answer
        @inquiry = inquiry
        mail to:      "recipe.share.mail@gmail.com",
        subject: '回答メールを送りました。'
    end
end

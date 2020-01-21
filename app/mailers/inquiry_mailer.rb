class InquiryMailer < ApplicationMailer
    def send_when_create(inquiry)
        @inquiry = inquiry
        mail to:      inquiry.email,
        subject: 'お問い合わせを受け付けました。'
    end 
    
    def send_to_owner(inquiry)
        @inquiry = inquiry
        mail to:      "recipe.share.mail@gmail.com",
        subject: 'お問い合わせのメールが届きました。'
    end
end

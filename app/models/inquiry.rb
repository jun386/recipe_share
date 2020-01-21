class Inquiry < ApplicationRecord
    has_one :answers, :dependent => :destroy
end

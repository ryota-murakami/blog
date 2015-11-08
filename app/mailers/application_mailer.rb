class ApplicationMailer < ActionMailer::Base
  default from: "from@malloc.tokyo"
  layout 'mailer'
end

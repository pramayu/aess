class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  attribute :phone, validate: true
  attribute :message, validate: true
  attribute :nickname, :captcha => true

  def headers 
    {
    :subject => "Email dari Client",
    :to => "dmonmad@gmail.com",
    :from => %("#{name}" <#{email}>)
    }
  end
end

class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :tel
  #attribute :nickname,  :captcha  => true


  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Formulário de contato",
      :to => "contato@magaweb.com.br",
      :from => %("#{name}" <#{email}>)
    }
  end
end
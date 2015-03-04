class Maily

  extend Mailbox

  attr_reader :via, :tls, :body, :port, :address, :password, :username, :authentication, :to, :from, :subject

  def initialize(subject, body)
    @via            = :smtp
    @tls            = true
    @body           = body
    @port           = Configs['mail_port']
    @address        = Configs['mail_address']
    @password       = Configs['mail_password']
    @username       = Configs['mail_user']
    @authentication = :plain

    @to             = Configs['mail_to']
    @from           = Configs['mail_from']
    @subject        = compose_subject subject
  end

  def deliver
    Pony.mail({
      from: from,
      to: to,
      via: via,
      body: body,
      subject: subject,
      via_options: {
        port: port,
        address: address,
        password: password,
        user_name: username,
        authentication: authentication,
        enable_starttls_auto: tls
      }
    })
  end

  private

  def compose_subject(subject)
    "#{subject}"
  end

end

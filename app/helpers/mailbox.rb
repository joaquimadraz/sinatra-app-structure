module Mailbox

  # Mailbox.sample_email(persona).deliver

  def sample_email(complete_data = "Test")
    Maily.new("Mail Subject", "Mail Body #{complete_data}")
  end

end
defmodule Discuss.Mailer do
  use Swoosh.Mailer, otp_app: :discuss, adapter: Swoosh.Adapters.Mailjet

end

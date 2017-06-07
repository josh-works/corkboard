module FlashMessages
  def oauth_form
    "We tried to fill in as much as we could, but we'll need your help to complete your signup!"
  end

  def incorrect_email_password
    "Incorrect e-mail and password combination."
  end

  def invalid_code
    "The code you entered was not valid."
  end

  def bid_placed
    "Payment successful. Your bid has been placed."
  end

  def charge_declined
    "Your payment was unsuccessful. Please try again."
  end

end

module ControllerSpecHelper
  def generate_token(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  def expire_token(user_id)
    JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  def valid_headers
    {
      "Authorization" => generate_token(user.id)
    }
  end

  def invalid_headers
    {
      "Authorization" => nil
    }
  end
end
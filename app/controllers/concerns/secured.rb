module Secured
  def authenticate_user!
    # Bearer xxxxxx
    token_regex = /Bearer (\w+)/
    # Read auth HEADER
    headers = request.headers
    # Verify is valid token
    if headers["Authorization"].present? && headers["Authorization"].match(token_regex)
      token = headers["Authorization"].match(token_regex)[1]
      if (Current.user = User.find_by_auth_token(token))
        return
      end
    end
    # Verify that the token corresponds to a user
    render json: { error: "Unauthorized" }, status: :unauthorized
  end
end

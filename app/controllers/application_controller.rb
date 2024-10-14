class ApplicationController < ActionController::API
  def current_user
    @current_user ||= authenticate_user
  end

  def authenticate_user
    token = request.headers["Authorization"]&.split(" ")&.last # remove "Bearer" part if exists
    return unless token

    api_id = ENV["UNKEY_API_ID"]
    response = UnkeyClient.new.verify_key(token, api_id)

    puts api_id
    puts token
    puts response

    if response[:valid]
      {
        username: response[:ownerId] || "rubyuser",
        key_id: response[:keyId] || "No key in Unkey response"
      }
    else
      nil
    end
  end
end

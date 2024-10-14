require "httparty"

class UnkeyClient
  include HTTParty
  base_uri "https://api.unkey.dev/v1" # Replace with actual Unkey API base URL

  def verify_key(key, api_id)
    response = self.class.post("/keys.verifyKey", {
      body: { key: key, apiId: api_id }.to_json,
      headers: { "Content-Type" => "application/json" }
    })
    response.parsed_response.symbolize_keys
  end
end

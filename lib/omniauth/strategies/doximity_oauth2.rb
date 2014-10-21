require 'omniauth-oauth2'
module OmniAuth
  module Strategies
    #
    # Authenticate to Doximity via OAuth and retrieve basic user information.
    # Usage:
    #    use OmniAuth::Strategies::DoximityOauth2, 'consumerkey', 'consumersecret', :scope => 'basic', :type => 'login'
    #
    class DoximityOauth2 < OmniAuth::Strategies::OAuth2

      AUTHENTICATION_PARAMETERS = %w(scope state type redirect_uri)
      BASE_URL = "https://www.doximity.com"

      option :name, 'doximity'

      option :client_options, {
        authorize_url: "#{BASE_URL}/oauth/authorize",
        token_url: "#{BASE_URL}/oauth/token",
        site: BASE_URL,
      }

      option :authorize_options, AUTHENTICATION_PARAMETERS

      option :authorize_params, { response_type: 'code', type: 'login'}

      uid do
        raw_info['id']
      end

      info do
        {
          email: raw_info['email'],
        }
      end

      extra do
        {
          'raw_info' => raw_info,
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/users/current').parsed
      end

      # Hook useful for appending parameters into the auth url before sending
      # to provider.
      # def request_phase
      #   super
      # end

      # Hook used after response with code from provider. Used to prep token
      # request from provider.
      # def callback_phase
      #   super
      # end

    end
  end
end

class WelcomeController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :token_sign_in

  def index
    render component: 'Index'
  end

  def token_sign_in
    if user_signed_in? || params[:token] != Rails.application.secrets.koelkast_token
      return head :forbidden
    end

    sign_in_and_redirect User.koelkast
  end
end

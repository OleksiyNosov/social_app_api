class SessionDecorator < ApplicationDecorator
  delegate_all

  private
  def _only
    %I[auth_token]
  end
end
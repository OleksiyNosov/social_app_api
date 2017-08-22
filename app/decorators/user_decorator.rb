class UserDecorator < ApplicationDecorator
  delegate_all

  private
  def _only
    %I[id email first_name last_name sex]
  end
end
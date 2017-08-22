class Session
  include ActiveModel::Validations

  attr_reader :email, :password, :user

  def initialize params
    @email = params['email']

    @password = params['password']

    @user = params['user']
  end

  validate do |model|
    if user
      model.errors.add :password, 'is invalid' unless user.authenticate password
    else
      model.errors.add :email, 'not found'
    end
  end

  def save!
    raise ActiveModel::StrictValidationFailed unless valid?

    AuthToken.create value: SecureRandom.uuid, user_id: user.id
  end

  def destroy!
    user.auth_tokens.last.destroy!
  end

  def as_json *args
    { auth_token: auth_token }
  end

  def decorate
    self
  end

  def auth_token
    user.try(:auth_tokens).try(:last).try(:value)
  end 

  private
  def user
    @user ||= User.find_by email: email
  end
end
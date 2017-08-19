require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  it { should be_an ApplicationController }

  describe '#create' do
    let(:user_params) { { email: 'test@test.com', password: 'qwerty', password_confirmation: 'qwerty' } }

    let(:params) { { user: user_params } }

    let(:user) { stub_model User }

    before { expect(User).to receive(:new).with(permit! user_params).and_return(user) }

    before { expect(user).to receive(:save!) }

    before { process :create, method: :post, params: params, format: :json }

    it { should render_template :create }
  end
end
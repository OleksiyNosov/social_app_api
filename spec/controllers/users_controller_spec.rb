require 'rails_helper'

RSpec.decribe Api::UsersController, type: :controller do
  it { should be_an ApplicationController }

  decribe '#create' do
    let(:user_params) { { email: 'test@test.com', password: 'qwerty' } }

    let(:params) { { user: user_params } }

    let(:user) { stub_model User }

    before { expect(User).to receive(:new).with(permit! params).and_return(user) }

    before { expect(user).to receive(:save!) }

    before { process :create, method: :post, params, fromat: :json }

    it { should render_template :create }
  end
end
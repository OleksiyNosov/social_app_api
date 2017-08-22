require 'rails_helper'

RSpec.describe AuthToken, type: :model do
  it { should belongs_to :user }

  it { should validate_presence_of :value }
end

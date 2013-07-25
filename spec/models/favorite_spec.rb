require 'spec_helper'

describe Favorite do

  let(:user) { FactoryGirl.create(:user) }
  let(:data_source) { FactoryGirl.create(:data_source) }
  let(:repo) { FactoryGirl.create(:repo, data_sources: [data_source]) }
  let(:data_action) { FactoryGirl.create(:data_action, repo: repo, user: user) }
  let(:favorite) { Favorite.create(user: user, data_action: data_action) }

  subject { favorite }

  it { should respond_to :user }
  it { should respond_to :data_action }
  it { should be_valid }

  describe "without a user_id" do
    before { favorite.user_id = nil }
    it { should_not be_valid }
  end

  describe "without a data_action_id" do
    before { favorite.data_action_id = nil }
    it { should_not be_valid }
  end  
end

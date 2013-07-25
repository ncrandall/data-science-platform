require 'spec_helper'

describe DataAction do 
  let(:user) { FactoryGirl.create(:user) }
  let(:data_source) { FactoryGirl.create(:data_source) }
  let(:repo) { FactoryGirl.create(:repo, user: user, data_sources: [data_source]) }
  let(:data_action) { FactoryGirl.create(:data_action, user: user, repo: repo) }

  subject { data_action }

  it { should respond_to :description }
  it { should respond_to :url }
  it { should respond_to :user }
  it { should respond_to :repo }
  it { should respond_to :favorites }
  it { should be_valid }


  describe "without a description" do
    before { data_action.description = "" }
    it { should_not be_valid }
  end

  describe "with a description that is too long" do
    before { data_action.description = "a" * 141 }
    it { should_not be_valid }
  end

  describe "without a user_id" do
    before { data_action.user_id = nil }
    it { should_not be_valid }
  end

  describe "without a repo_id" do
    before { data_action.repo_id = nil }
    it { should_not be_valid }
  end
end
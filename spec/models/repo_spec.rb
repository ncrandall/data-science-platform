require 'spec_helper'

describe Repo do
  let(:data_source) { FactoryGirl.create(:data_source) }
  let(:repo) { FactoryGirl.build(:repo) }

  before { repo.data_sources.push(data_source) }

  subject { repo }

  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :schema }
  it { should respond_to :parent_id }
  it { should respond_to :public }
  it { should respond_to :user }
  it { should be_valid }

  describe "name must exist" do
    before { repo.name = "" }
    it { should_not be_valid }
  end

  describe "name must be less than 140 chars" do
    before { repo.name = "a" * 141 }
    it { should_not be_valid }
  end

  describe "description must exist" do
    before { repo.description = "" }
    it { should_not be_valid }
  end
end
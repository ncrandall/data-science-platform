require 'spec_helper'

describe Repo do

  let(:repo) { FactoryGirl.create(:repo) }

  subject { repo }

  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :schema }
  it { should respond_to :parent_id }
  it { should respond_to :public }
  it { should respond_to :num_rows }
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
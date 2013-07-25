require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.create(:user) }

  subject { user }

  it { should respond_to :email }
  it { should respond_to :username }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should respond_to :full_name }
  it { should respond_to :first_name }
  it { should respond_to :last_name }
  it { should respond_to :about }
  it { should respond_to :data_actions }
  it { should respond_to :favorites }
  it { should be_valid }

  describe "username should be unique" do

  end

end
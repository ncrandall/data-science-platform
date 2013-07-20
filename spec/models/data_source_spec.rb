require 'spec_helper'

describe DataSource do
  let(:data_source) { FactoryGirl.create(:data_source) }

  subject { data_source }

  it { should respond_to :source_file_name }
  it { should respond_to :source_file_size }
  it { should respond_to :source_content_type }
  it { should respond_to :source_updated_at }
  it { should be_valid }

end
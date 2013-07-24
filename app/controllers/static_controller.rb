class StaticController < ApplicationController
  def home
    @data_sources = DataSource.count
    @records = DataSource.records_count
  end
end

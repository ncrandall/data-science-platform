class StaticController < ApplicationController
  def home
    #TODO: Update this to be the data sources count rather than Repo (Repo can have 1 or more sources)
    @data_sources = Repo.count
    @records = Repo.records_count
  end
end

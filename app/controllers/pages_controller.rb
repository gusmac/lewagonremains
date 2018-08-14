class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def map
    @storage_space = StorageSpace.first
    @markers = [
      {
        lat: @storage_space.latitude,
        lng: @storage_space.longitude,
      }]
  end
end

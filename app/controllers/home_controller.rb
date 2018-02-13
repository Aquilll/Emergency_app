class HomeController < ApplicationController
  protect_from_forgery with: :exception

  def index
  	@registered_devices = EmergencyDevice.all
  end

end

class JoinController < ApplicationController
  allow_unauthenticated_access only: :index

  def index
  end
end

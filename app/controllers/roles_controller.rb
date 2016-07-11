class RolesController < ApplicationController
  # role list to populate role xeditable
  def index
    @roles = Role.all
  end
end

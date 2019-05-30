require "administrate/field/base"

class AttachedField < Administrate::Field::Base
  def stored_data
    data
  end
end
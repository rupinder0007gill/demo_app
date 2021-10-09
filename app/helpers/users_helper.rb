# frozen_string_literal: true

module UsersHelper
  def roles_for_select
    Role.all.collect { |c| [c.name, c.id] }
  end
end

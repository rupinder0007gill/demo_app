# frozen_string_literal: true

# This file contains app data for seeding purposes
# load Rails.root.join('db/seeds/*.rb') ; AppSeeds::ClassName.seed

module AppSeeds
  class Roles
    class << self
      def seed
        role_attrs = [
          {
            name: 'Super Admin'
          },
          {
            name: 'Admin'
          },
          {
            name: 'Designers'
          },
          {
            name: 'Customer support'
          }
        ]

        role_attrs.each do |role_attr|
          next unless Role.find_by(name: role_attr[:name]).nil?

          role = Role.new(role_attr)
          role.save
        end
      end
    end
  end
end

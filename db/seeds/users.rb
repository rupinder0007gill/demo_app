# frozen_string_literal: true

# This file contains app data for seeding purposes
# load Rails.root.join('db/seeds/*.rb') ; AppSeeds::ClassName.seed

module AppSeeds
  class Users
    class << self
      def seed
        users_attrs = [
          {
            first_name: 'Super',
            last_name: 'Admin',
            email: 'super_admin@test.com',
            role: 'Super Admin'
          },
          {
            first_name: 'Admin',
            last_name: '',
            email: 'admin@test.com',
            role: 'Admin'
          },
          {
            first_name: 'Designers',
            last_name: '',
            email: 'designers@test.com',
            role: 'Designers'
          },
          {
            first_name: 'Customer',
            last_name: 'support',
            email: 'customer_support@test.com',
            role: 'Customer support'
          }
        ]

        users_attrs.each do |user_attr|
          next unless User.find_by(email: user_attr[:email]).nil?

          role = user_attr[:role]
          user_attr.delete(:role)
          u = User.new(user_attr)
          u.password = 'test1234'
          u.add_role(role.to_sym)
          u.save(validate: false)
        end
      end
    end
  end
end

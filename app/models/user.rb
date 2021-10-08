# frozen_string_literal: true

class User < ApplicationRecord
  ##############################################################################
  ### Attributes ###############################################################

  ##############################################################################
  ### Constants ################################################################

  ##############################################################################
  ### Includes and Extensions ##################################################
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :lockable

  ##############################################################################
  ### Callbacks ################################################################

  before_save :downcase_fields, :create_username
  ##############################################################################
  ### Associations #############################################################

  ##############################################################################
  ### Validations ##############################################################
  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :username, uniqueness: { case_sensitive: false }

  ##############################################################################
  ### Scopes ###################################################################

  ##############################################################################
  ### Other ####################################################################
  has_person_name

  ##############################################################################
  ### Class Methods ############################################################

  ##############################################################################
  ### Instance Methods #########################################################
  # discarded users to be unable to login and stop their session
  def active_for_authentication?
    super && !discarded? && !suspended
  end

  #########

  #########

  #######

  private

  def create_username
    self.username = find_unique_username(name.parameterize(separator: '_')) if username.blank?
  rescue StandardError
    errors.add(:username, 'cannot be created')
    throw :abort
  end

  def find_unique_username(username)
    taken_usernames =
      User.with_discarded.where('username LIKE ?', "#{username}%").pluck(
        :username
      )

    # username if it's free
    return username unless taken_usernames.include?(username)

    count = 2
    loop do
      # username_2, username_3...
      new_username = "#{username}_#{count}"
      return new_username unless taken_usernames.include?(new_username)

      count += 1
    end
  end

  def downcase_fields
    first_name.downcase!
    last_name.downcase!
    username.downcase!
  end

  #######
end

# frozen_string_literal: true

class User < ApplicationRecord
  ##############################################################################
  ### Attributes ###############################################################

  ##############################################################################
  ### Constants ################################################################
  self.per_page = 10

  ##############################################################################
  ### Includes and Extensions ##################################################
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :lockable

  ##############################################################################
  ### Callbacks ################################################################
  after_create :assign_default_role

  ##############################################################################
  ### Associations #############################################################

  ##############################################################################
  ### Validations ##############################################################
  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true

  ##############################################################################
  ### Scopes ###################################################################

  ##############################################################################
  ### Other ####################################################################
  rolify
  has_person_name

  ##############################################################################
  ### Class Methods ############################################################

  ##############################################################################
  ### Instance Methods #########################################################
  # discarded users to be unable to login and stop their session
  def active_for_authentication?
    super && !discarded?
  end

  #########

  #########

  #######

  private

  def assign_default_role
    add_role(:'Customer support') if roles.blank?
  end

  #######
end
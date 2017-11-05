# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    case user&.role
    when "admin"
      can :manage, :all
    when "user"
      can %i[show update], [User], id: user.id
    else # guest
      can :create, [User]
    end
  end
end

# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    case user&.role
    when "admin"
      can :manage, :all
    when "user"
      can %i[show update], [User], id: user.id
      can :index, [Category]
    else # guest
      can :create, [User]
      can :index, [Category]
    end
  end
end

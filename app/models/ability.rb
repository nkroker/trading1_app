class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_admin?
      can :manage, :all
      can :invite, :user
    end

    if user.is_customer?
      can :index, :Investment
      can :new, :Investment
      can :create, :Investment
      cannot :index, :admin
      can :new, :charges
      can :create, :charges
    end
  end
end

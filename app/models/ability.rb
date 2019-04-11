class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.has_role? :admin
    can :manage, :all if user.has_role? :customer


    if user.is_customer?
      can :manage, :all
    end
    # can :create, :Investment if user.has_role? :customer
    # cannot [:index], AdminController if user.has_role? :customer
  end
end

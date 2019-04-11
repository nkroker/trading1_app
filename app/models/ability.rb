class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.has_role? :admin
    can :read, :all if user.has_role? :customer
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.has_role? :admin
    # cannot [:index], AdminController if user.has_role? :customer
  end
end

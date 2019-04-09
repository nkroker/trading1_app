class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
      can :create, :investment_record
    elsif user.has_role? :customer
      can :read, :all
      can :create, :investment
    end
  end
end

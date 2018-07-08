class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.actable_type?(:expert)
      can :manage, :all
    elsif user.actable_type(:novice)
      can :read, :all
      can :create, TodoList
      can :update, TodoList
      cannot [:write, :update], TodoList, TodoList.where(:discontinued => false) do |product|
          product.discontinued?
      end
    end
  end
end

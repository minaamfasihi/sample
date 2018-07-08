class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.is_expert?
      can :manage, :all
    elsif user.is_novice?
      can :read, :all
      can :create, TodoList
      can :update, TodoList
      # cannot [:write, :update], TodoList, TodoList.where(:discontinued => false) do |product|
      #     product.discontinued?
      # end
    end
  end
end

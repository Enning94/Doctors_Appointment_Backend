class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    return unless user.present?

    # Example abilities for specific models (replace with your actual model names):
    can :read, Doctor
    can :read, Appointment
    can :create, Appointment

    # Additional abilities based on user roles or conditions:
    return unless user.admin?

    can :create, Doctor
    can :manage, :all
  end
end

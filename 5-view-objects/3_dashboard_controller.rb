class DashboardsController < ApplicationController
  # ...

  def show
    # ...
    @onboarding_steps = OnboardingSteps.new(current_user)
  end

end

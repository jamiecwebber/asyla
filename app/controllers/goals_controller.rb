class GoalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :render_calendar] #Delete this when we build devise functionality.

  def index
    # I want to get goals for a specific user to be able to display them
    @goals = Goal.where(user: current_user)
    @tasks = Task.where(user: current_user)  
    # I want to count the number of completed tasks for each goal
    @dashboard = dashboard_array_of_goal_hashes
  end

  def dashboard_array_of_goal_hashes
    dashboard = []

    @goals.each do |goal|
      goals_hash = {
        goal_name: goal.name,
        total_tasks: goal.tasks.size,
        completed_tasks: count_tasks_completed(goal),
        progress: (count_tasks_completed(goal) / goal.tasks.size).to_f
      }

      dashboard << goals_hash
    end
    dashboard
  end

  def count_tasks_completed(goal)
    completed_tasks = goal.tasks.select { |task| task.completed == true }
    return completed_tasks.size
  end



  def show
    # I want to show the specific tasks for a particular goal
    @goal = Goal.find(params[:id])
    @tasks = @goal.tasks
  end


 
end

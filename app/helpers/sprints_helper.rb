module SprintsHelper

  def complete_sprint_link(sprint)
    if sprint.project.current_sprint_complete? and sprint.project.sprint.size > 0
      link_to 'Complete sprint',
              complete_project_sprint_path(sprint.project, sprint),
              method: :patch,
              class: 'btn'
    end
  end
end

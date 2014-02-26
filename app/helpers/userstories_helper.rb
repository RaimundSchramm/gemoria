module UserstoriesHelper

  def link_to_next_status(userstory)
    case userstory.status
    when Userstory::STATUS[:opened]     then start_link(userstory)
    when Userstory::STATUS[:rejected]   then start_link(userstory)
    when Userstory::STATUS[:started]    then complete_link(userstory)
    when Userstory::STATUS[:completed]  then accept_and_reject_links(userstory)
    when Userstory::STATUS[:accepted]   then start_link(userstory)
    end
  end

  def start_link(userstory)
    link_to 'Start',
            project_userstory_path(userstory.project, userstory, userstory: { status: Userstory::STATUS[:started] }),
            method: :put,
            remote: true,
            class: 'btn btn-default btn-xs'
  end

  def complete_link(userstory)
    link_to 'Complete',
            project_userstory_path(userstory.project, userstory, userstory: { status: Userstory::STATUS[:completed] }),
            method: :put,
            remote: true,
            class: 'btn btn-default btn-xs'
  end

  def accept_link(userstory)
    link_to 'Accept',
            project_userstory_path(userstory.project, userstory, userstory: { status: Userstory::STATUS[:accepted] }),
            method: :put,
            remote: true,
            class: 'btn btn-default btn-xs'
  end

  def reject_link(userstory)
    link_to 'Reject',
            project_userstory_path(userstory.project, userstory, userstory: { status: Userstory::STATUS[:rejected] }),
            method: :put,
            remote: true,
            class: 'btn btn-default btn-xs'
  end

  def accept_and_reject_links(userstory)
    [ accept_link(userstory), reject_link(userstory) ].join('|').html_safe
  end

  def complete_acceptance_test_link(acceptance_test)
    if acceptance_test.complete?
      link_to "#{content_tag :span, nil, class: 'glyphicon glyphicon-remove'}".html_safe,
              userstory_acceptance_test_path(acceptance_test.userstory, id: acceptance_test.id, acceptance_test: { complete: false }),
              method: :put,
              remote: true,
              title: 'incomplete',
              id: "incomplete_acceptance_test_#{acceptance_test.id}",
              class: 'btn btn-default btn-xs'
              
    else
      link_to userstory_acceptance_test_path(acceptance_test.userstory, id: acceptance_test.id, acceptance_test: { complete: true }),
              method: :put,
              remote: true,
              title: 'complete',
              id: "complete_acceptance_test_#{acceptance_test.id}",
              class: 'btn btn-default btn-xs' do
        "#{content_tag :span, nil, class: 'glyphicon glyphicon-ok'}".html_safe
      end
    end
  end

  def complete_task_link(task)
    if task.complete?
      link_to "#{content_tag :span, nil, class: 'glyphicon glyphicon-remove'}".html_safe,
              userstory_task_path(task.userstory, id: task.id, task: { complete: false }),
              method: :put,
              remote: true,
              title: 'incomplete',
              id: "incomplete_task_#{task.id}",
              class: 'btn btn-default btn-xs'
    else
      link_to "#{content_tag :span, nil, class: 'glyphicon glyphicon-ok'}".html_safe,
              userstory_task_path(task.userstory, id: task.id, task: { complete: true }),
              method: :put,
              remote: true,
              title: 'complete',
              id: "complete_task_#{task.id}",
              class: 'btn btn-default btn-xs'
    end
  end

  def edit_link(item)
    link_to "#{content_tag :span, nil, class: 'glyphicon glyphicon-pencil'}".html_safe,
            url_for([:edit, item.userstory, item]),
            remote: true,
            title: 'edit',
            id: "edit_#{item.class.name.underscore}_#{item.id}",
            class: 'btn btn-default btn-xs'
  end

  def destroy_link(item)
    link_to "#{content_tag :span, nil, class: 'glyphicon glyphicon-trash'}".html_safe,
            url_for([item.userstory, item]),
            method: :delete,
            data: { confirm: 'Are you sure?' },
            remote: true,
            title: 'destroy',
            id: "destroy_#{item.class.name.underscore}_#{item.id}",
            class: 'btn btn-default btn-xs'
  end

  def complete_class(obj)
    return unless [Userstory, AcceptanceTest, Task].include? obj.class
    if obj.class == Userstory
      obj.status == Userstory::STATUS[:accepted] ? 'complete' : 'incomplete'
    else
      obj.complete? ? 'complete' : 'incomplete'
    end
  end

  def sprint_link(userstory)
    link_to '<'.html_safe,
            project_userstory_path(userstory.project, userstory, userstory: { position: Userstory::POSITION[:sprint], sprint_id: userstory.project.sprints.first.id }),
            method: :put,
            remote: true,
            class: 'btn btn-default btn-xs'
  end

  def backlog_link(userstory)
    link_to '>'.html_safe,
            project_userstory_path(userstory.project, userstory, userstory: { position: Userstory::POSITION[:backlog], sprint_id: nil }),
            method: :put,
            remote: true,
            class: 'btn btn-default btn-xs'
  end
end

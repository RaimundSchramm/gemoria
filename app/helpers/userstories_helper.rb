module UserstoriesHelper

  def link_to_next_status(project, userstory)
    case userstory.status
    when Userstory::STATUS[:opened]     then start_link(project, userstory)
    when Userstory::STATUS[:rejected]   then start_link(project, userstory)
    when Userstory::STATUS[:started]    then complete_link(project, userstory)
    when Userstory::STATUS[:completed]  then accept_and_reject_links(project, userstory)
    when Userstory::STATUS[:accepted]   then start_link(project, userstory)
    end
  end

  def start_link(project, userstory)
    link_to 'Start', project_userstory_path(project, userstory, userstory: { status: Userstory::STATUS[:started] }), method: :put, remote: true
  end

  def complete_link(project, userstory)
    link_to 'Complete', project_userstory_path(project, userstory, userstory: { status: Userstory::STATUS[:completed] }), method: :put, remote: true
  end

  def accept_and_reject_links(project, userstory)
    [ accept_link(project, userstory), reject_link(project, userstory) ].join('|').html_safe
  end

  def accept_link(project, userstory)
    link_to 'Accept', project_userstory_path(project, userstory, userstory: { status: Userstory::STATUS[:accepted] }), method: :put, remote: true
  end

  def reject_link(project, userstory)
    link_to 'Reject', project_userstory_path(project, userstory, userstory: { status: Userstory::STATUS[:rejected] }), method: :put, remote: true
  end

  def complete_class(obj)
    return unless [Userstory, AcceptanceTest, Task].include? obj.class
    if obj.class == Userstory
      'complete' if obj.status == Userstory::STATUS[:accepted]
    else
      'complete' if obj.complete?
    end
  end
end

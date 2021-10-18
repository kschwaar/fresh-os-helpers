function todone
	set task_id (todoist l | awk -v pat="$argv" '$0 ~ pat {print $1}')
	todoist c $task_id
end

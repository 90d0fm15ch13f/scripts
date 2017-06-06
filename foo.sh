#! /bin/bash
length=$(i3-msg -t get_workspaces | jq -r '. | length')
for ((i=0; i<=$length; i++)); do
  workspace=$(i3-msg -t get_workspaces | jq -j '.['$((i))']')
  if [[ $(echo $workspace | jq -r '.urgent') = 'true' ]]; then
    urgent=$(echo $workspace | jq -r '.name')
  fi
  if [[ $(echo $workspace | jq -r '.focused') = 'true' ]]; then
    ws=$(echo $workspace | jq -r '.name')
  fi
done
echo $ws' '$urgent

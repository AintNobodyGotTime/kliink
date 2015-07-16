json.array!(@project_item_comments) do |project_item_comment|
  json.extract! project_item_comment, :id
  json.url project_item_comment_url(project_item_comment, format: :json)
end

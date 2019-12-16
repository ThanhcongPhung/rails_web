json.discussions do
    json.array!(@discussions) do |discussion|
        json.title discussion.title
        json.url discussion_path(discussion.id)
    end
end
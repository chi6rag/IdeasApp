json.array!(@ideas) do |idea|
  json.extract! idea, :id, :name, :key_partners, :key_activities, :key_resources,
                      :value_propositions, :customer_relationships, :channels, 
                      :customer_segments, :cost_structure, :revenue_streams,
                      :created_at, :updated_at
  json.url idea_url(idea, format: :json)
end

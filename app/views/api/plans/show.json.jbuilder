json.name @plan.name
json.overview @plan.overview
json.details do
  json.array! @plan.plan_details do |detail|
    json.started_at detail.started_at.strftime '%Y/%m/%d %H:%M'
    json.place detail.place
    json.content detail.content
  end
end

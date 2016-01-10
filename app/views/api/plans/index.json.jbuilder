json.array! @plans do |plan|
  json.id plan.id
  json.name plan.name
  json.overview plan.overview
end

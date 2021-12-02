ActiveAdmin.register BuildingDetail do
    permit_params :building_id, :information_key, :value
end

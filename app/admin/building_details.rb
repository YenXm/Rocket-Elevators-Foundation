ActiveAdmin.register BuildingDetail do
    menu parent: "Building Parts"

    permit_params :building_id, :information_key, :value
end

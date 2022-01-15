ActiveAdmin.register Quote do
  permit_params :building_type,
                :amount_elevators,
                :product_line,
                :installation_fees,
                :total_cost,
                :amount_floors,
                :amount_basements,
                :amount_parking_spots,
                :maximum_occupancy,
                :amount_apartments,
                :amount_companies,
                :amount_corporations,
                :business_hours,
                :email,
                :company_name
end

class InterventionsController < InheritedResources::Base
  def collection
    # Create a hash containing the chosen child class of another class.
    # e.g: Customer.buidings into {"Building #1" => 1, "Building #2" => 2}
    # uses param['parent'] and params['child'] , i.e specific classes models
    parent, childrens = get_collection_classes
    selections = parent.send(childrens)

    # {child1.to_s => child1.v, child2 => child2.v} => {"Building #1" => 1, "Building #2" => 2}
    options_hash = selections.map { |n| [n.to_s, n.id] }.to_h

    # Determine if we need to add a null field to the hash
    if %w[column elevator].any? { |key| key == params['child'] }
      options_hash = Hash[:None, ''].merge!(options_hash)
    else
      # [customer, building, battery]
      options_hash = Hash["Select #{params['child']}", 0].merge!(options_hash)
    end
    render json: options_hash
  end

  def get_collection_classes
    # Parent.find(id of parent)
    parent = params['parent']['label'].capitalize.constantize.find(params['parent']['val'])

    childrens = params['child'].pluralize # childs as string

    return parent, childrens
  end
end

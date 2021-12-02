class InterventionsController < InheritedResources::Base
    def collection
        parent, childrens = get_collection_classes

        selections = parent.send(childrens)

        # {child1.to_s => child1.v, child2 => child2.v} => {"Building #1" => 1, "Building #2" => 2}
        options_hash = selections.map { |n| [n.to_s, n.id] }.to_h
        if %w[column elevator].any? { |key| key == params['child'] }
            options_hash = Hash[:null, ''].merge!(options_hash)
        else
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

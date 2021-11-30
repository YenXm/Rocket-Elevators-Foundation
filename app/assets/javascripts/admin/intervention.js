var parent_input;
var child_field;
var childrens_fields;
var childrens_of_child_field;

function cascade(parent, child) {
    display_cascade(parent, child);
}

function display_cascade(parent, child) {
    // Select input from the field this cascade is call
    parent_input = $(`#intervention_${parent}_id`);

    child_field = $(`#intervention_${child}_id_input`);
    // All field that come after the parent field in the field list (<li></li>)
    childrens_fields = $(`#intervention_${parent}_id_input ~ li`);
    // All field that come after the child field in the field list (<li></li>)
    childrens_of_child_field = $(`#intervention_${child}_id_input ~ li`);

    if (parent_input.val() > 0) {
        child_field.show();

        // Clear child input because any change in the parent mean the selection option has change
        childrens_fields.children().next().val("");
        // Since we clear the child input we also want to clear the field which depends on it
        childrens_of_child_field.hide();
    } else {
        // Hide and clear all children field
        childrens_fields.hide();
        childrens_fields.children().next().val("");
    }
}

function collection(parent, child) {
    // Both args must be lowercase in sigular
    var parent_selection = $(`#intervention_${parent}_id`).val();
    if (parent_selection && parent_selection != 0) {
        $.getJSON(
            "/collection",
            {
                child: child,
                parent: { label: parent, val: parent_selection },
            },

            function (data) {
                var child_input = child_field.children().next();
                // remove previous options
                child_input.empty();
                $.each(data, function (key, value) {
                    child_input.append(
                        $("<option></option>").attr("value", value).text(key)
                    );
                });
            }
        );
    }
    cascade(parent, child);
}

function lock_author() {
    $("#intervention_author").val(1);
    $("#intervention_author_input").hide();
}

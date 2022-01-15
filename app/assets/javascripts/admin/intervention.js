var parent_input;
var child_field;
var childrens_fields;
var childrens_of_child_field;

/*
    Notes that every field formed by activeadmin/formtastic are built with the same
    id structure i.e:
    field foo id = intervention_foo_input
    while the select id itself would be intervention_foo

    This make it easy to create function that are usable across the whole cascade without
    much hardcoding of parameter/args.

    * the _id was hardcoded only because all the table/column are name COLUMN_NAME_id
*/

function cascade(parent, child) {
  display_cascade(parent, child);
}

function display_cascade(parent, child) {
  // Select input from the field this cascade is call
  parent_input = $("#intervention_" + parent + "_id");

  child_field = $("#intervention_" + child + "_id_input");
  // All field that come after the parent field in the field list (<li></li>)
  childrens_fields = $("#intervention_" + parent + "_id_input ~ li");
  // All field that come after the child field in the field list (<li></li>)
  childrens_of_child_field = $("#intervention_" + child + "_id_input ~ li");

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
  // This is the function that do the ajax call and then update on the option of the child's options

  // Both args must be lowercase in sigular
  var parent_selection = $("#intervention_" + parent + "_id").val();
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
          console.log(data);
          child_input.append($("<option></option>").attr("value", value).text(key));
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
$(document).ready(function () {
  $(".new_record").parent().hide();
  $(".new_record").parent().next().hide();

  if ($("#intervention_column_id").val()) {
    $(".add_none1").append($("<option></option>").attr("value", "").text("None"));
  }
  if ($("#intervention_elevator_id").val()) {
    $(".add_none2").append($("<option></option>").attr("value", "").text("None"));
  }
});

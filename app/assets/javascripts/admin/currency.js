function get_exchange_rate() {
    if (
        $("#_interventions_create_from_currency").val() != "" &&
        $("#_interventions_create_to_currency").val() != "" &&
        $("#_interventions_create_number").val() != ""
    ) {
        $.getJSON(
            "/exchange_rate",
            {
                fromCurrency: $("#_interventions_create_from_currency").val(),
                toCurrency: $("#_interventions_create_to_currency").val(),
            },

            function (data) {
                // Take the basic rate and multiple by the amount the user entered
                var number = data["data"][0][0]["basic"] * $("#_interventions_create_number").val();
                // Make number more readable for user
                number = number.toLocaleString();
                get_symbol($("#_interventions_create_to_currency").val(), `Result: ${number}`);
            }
        );
    } else {
        alert("Please enter all the fields correctly.");
    }
}

function get_symbol(id, text) {
    // Append the currency symbol to the result string
    $.getJSON("/symbol/", { id: id }, function (data) {
        var new_text = text + " " + data["symbol"];
        // Show it on screen
        if (data["symbol"] != null) {
            $("#result").html(new_text);
        } else {
            $("#result").html(text);
        }
    });
    return;
}

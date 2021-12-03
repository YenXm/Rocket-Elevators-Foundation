function get_covid_stats() {
    $.getJSON("/covid_stats", { country: $("#_interventions_create_country").val() }, function (data) {
        // If country_name = Null then it mean that we asked for the world
        $("#country").html(`Country Selected: ${data["location"]["countryOrRegion"] || "World"}`);
        $("#total_confirmed_cases").html(
            `Total Confirmed Cases: ${data["stats"]["totalConfirmedCases"].toLocaleString()}`
        );
        $("#newly_confirmed_cases").html(
            `Newly Confirmed Cases: ${data["stats"]["newlyConfirmedCases"].toLocaleString()}`
        );
        $("#total_deaths").html(`Total Deaths: ${data["stats"]["totalDeaths"].toLocaleString()}`);
        $("#new_deaths").html(`New Deaths: ${data["stats"]["newDeaths"].toLocaleString()}`);
        $("#total_recovered_cases").html(
            `Totals Recovered Cases: ${data["stats"]["totalRecoveredCases"].toLocaleString()}`
        );
        $("#newly_recovered_cases").html(
            `Newly Recovered Cases: ${data["stats"]["newlyRecoveredCases"].toLocaleString()}`
        );
    });
}

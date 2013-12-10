$(document).ready(function () {
    var client_id = "2b434e5e96434876b550fe784161fa25";
    var redirect_uri = "http://net4.ccs.neu.edu/home/suyash/project/whatsclickin";
    var insta_auth_url = "https://instagram.com/oauth/authorize/?client_id=" + client_id +
                         "&redirect_uri=" + redirect_uri + "&response_type=token";

    var lat = 0, long = 0;
    var loc_url;
    $("#location_search").hide;
    $("#location_button").hide;

    if (window.location.hash) {
        var hash = window.location.hash.substring(1); //Puts hash in variable, and removes the # character
        console.log("Instagram login successful");
        $(insta_response).html("<p>" + hash + "</p>");
        $("#location_search").show;
        $("#location_button").show;
        jQuery.getJSON('http://freegeoip.net/json/', function (location) {
            // example where I update content on the page.
            //jQuery('#city').html(location.city);
            //jQuery('#region-code').html(location.region_code);
            //jQuery('#region-name').html(location.region_name);
            //jQuery('#areacode').html(location.areacode);
            //jQuery('#ip').html(location.ip);
            //jQuery('#zipcode').html(location.zipcode);
            //jQuery('#longitude').html(location.longitude);
            //jQuery('#latitude').html(location.latitude);
            //jQuery('#country-name').html(location.country_name);
            //jQuery('#country-code').html(location.country_code);
            lat = location.latitude;
            long = location.longitude;
            loc_url = "https://api.instagram.com/v1/locations/search?lat=" + lat + "&lng=" + long+"&" + hash;
            console.log("lat: " + lat);
            console.log("long: " + long);
            console.log(loc_url);
            $("#location_button").click(function () {
                $("#loc_list_group").append("<li id='temp_li' class='list-group-item'>Loading locations around (" + lat + "," + long + ")...</li>");
                $.ajax({
                    url: loc_url,
                    dataType: 'jsonp',
                    //data: {
                    //    featureClass: "P",
                    //    style: "full",
                    //    maxRows: 12,
                    //    name_startsWith: request.term
                    //},
                    success: function (insta_response) {
                        console.log(insta_response.data);
                        $("#temp_li").hide;
                        response($.map(insta_response.data, function (item) {
                            $("#loc_list_group").append("<li class='list-group-item'>" + item.name + " (" + item.latitude + ", " + item.longitude + ")" + "</li>");

                            return {
                                label: item.name + " (" + item.latitude + ", " + item.longitude + ")",
                                value: item.id
                            }
                        }));
                    }
                });

                //$.ajax({
                //    url: insta_loc_search_url + "lat=" + lat + "&lng=" + long,
                //    //url: loc_url,
                //    dataType: 'jsonp',
                //    success: function (response) {
                //        console.log(url);
                //        console.log(response);
                //        $(insta_response).val(JSON.stringify(response.data));
                //        $.each(response.data, function (key, item) {

                //            ///  var location = "<li>" + item.name + " - " + item.id + "</li>";
                //            //  $("#locations").append(location);
                //        });
                //    }
                //});


            });

        $("#location_search").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: loc_url,
                    dataType: 'jsonp',
                    //data: {
                    //    featureClass: "P",
                    //    style: "full",
                    //    maxRows: 12,
                    //    name_startsWith: request.term
                    //},
                    success: function (insta_response) {
                        console.log(insta_response.data);
                        response($.map(insta_response.data, function (item) {
                            $("#loc_list_group").append("<li class='list-group-item'>" + item.name + " (" + item.latitude + ", " + item.longitude + ")" + "</li>");
                                
                            return {
                                label: item.name + " (" + item.latitude + ", " + item.longitude + ")",
                                value: item.id
                            }
                        }));
                    }
                });
            },
            minLength: 1,
            select: function (event, ui) {
                console.log(ui.item ?
                  "Selected: " + ui.item.label :
                  "Nothing selected, input was " + this.value);
            }
            //open: function () {
            //   // $(this).removeClass("ui-corner-all").addClass("ui-corner-top");
            //},
            //close: function () {
            //   // $(this).removeClass("ui-corner-top").addClass("ui-corner-all");
            //}
        });

        });

        // hash found
    } else {
        // No hash found
    }



    $("#mybutton").click(function () {
        window.location.replace(insta_auth_url);
        //    $.ajax({
        //        //url: insta_loc_search_url + "lat=" + lat + "&lng=" + long,
        //        url: insta_auth_url,
        //        dataType: 'jsonp',
        //        success: function (response) {
        //            console.log(url);
        //            console.log(response);
        //            $(insta_response).val(JSON.stringify(response.data));
        //            $.each(response.data, function (key, item) {

        //              ///  var location = "<li>" + item.name + " - " + item.id + "</li>";
        //              //  $("#locations").append(location);
        //            });
        //        }
        //    });

    });
});
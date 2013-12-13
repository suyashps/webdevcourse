$(document).ready(function () {
    var client_id = "2b434e5e96434876b550fe784161fa25";
    var redirect_uri = "http://net4.ccs.neu.edu/home/suyash/project/whatsclickin";
    var insta_auth_url = "https://instagram.com/oauth/authorize/?client_id=" + client_id +
                         "&redirect_uri=" + redirect_uri + "&response_type=token";

    var lat = 0, long = 0;
    var loc_url;

    // var locations;
    $("#location_search").hide();
    //$("#location_button").hide();
    $("#location_select").hide();
    $("#filter_button").hide();
    $("#filter_button").click(function (flag) {
        $("#location_select").show();
    });

    $('#maintabs a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    });


    if (window.location.hash) {

        var hash = window.location.hash.substring(1); //Puts hash in variable, and removes the # character
        console.log("Instagram login successful");
        //$(insta_response).html("<p>" + hash + "</p>");
        $("#location_search").show();
        $("#location_button").show();
        $("#filter_button").show();
        jQuery.getJSON('http://freegeoip.net/json/', function (location) {
            lat = location.latitude;
            long = location.longitude;
            loc_url = "https://api.instagram.com/v1/locations/search?lat=" + lat + "&lng=" + long + "&" + hash;
            console.log("lat: " + lat);
            console.log("long: " + long);
            console.log(loc_url);
            loadData();
            loadMyFavData();
            loadPeopleIFollowData();
            $("#location_button").click(loadData);
            $("#friend_likes_button").click(loadMyFavData);
            $("#friends_i_follow").click(loadPeopleIFollowData);


            ////////////////////mark as favorite////////////////////////
            $(document).on('click', ".btn.the-buttons.mark-favorite", function markFavorite() {
                console.log("this object:" + this);
                var media_id = $(this).attr("data-media-id");
                var hash = window.location.hash.substring(1);
                var like_post_url = "\"https://api.instagram.com/v1/media/" + media_id + "/likes?" + hash + "\"";

                var proxy = "http://net4.ccs.neu.edu/home/rasala/simpleproxy/simpleproxy.aspx?url=";
                console.log("like url:" + proxy + like_post_url );//+ "&type=\"POST\"");
                //makeCorsRequest(proxy + like_post_url, "POST");
                var status = $("#mark-favorite" + media_id).attr("value");
                if (status.toUpperCase() == 'like'.toUpperCase()) {
                    $("#mark-favorite" + media_id).attr("value", "Liking..");
                    $.ajax({
                        url: proxy + like_post_url ,//+ "&type=\"POST\"",
                        //url: like_post_url,
                        datatype: "JSON",
                        type: "POST",
                        success: function (response) {
                            console.log("marked favorite : " + response);
                            $("#mark-favorite" + media_id).attr("value", "Liked");
                            $("#mark-favorite" + media_id).addClass("btn-success");
                        }
                    });
                }
                else if (status.toUpperCase() == 'liked'.toUpperCase()) {
                    console.log("unlike url:" + proxy + like_post_url);// + "&type=\"DELETE\"");
                    $.ajax({
                        url: proxy + like_post_url ,//+ ,//"&type=\"DELETE\"",
                        //url: like_post_url,
                        datatype: "JSON",
                        type: "DELETE",
                        success: function (response) {
                            console.log("unmarked favorite : " + response);
                            $("#mark-favorite" + media_id).attr("value", "Like");
                            $("#mark-favorite" + media_id).removeClass("btn-success");
                        }
                    });
                }

            });

            function loadData() {
                $.ajax({
                    url: loc_url,
                    dataType: 'jsonp',
                    success: function (insta_response) {
                        console.log("inside location button click");
                        //console.log(insta_response.data);
                        $("#location_select").show();
                        $("#temp_li").hide();
                        // response(
                        $("#links1").html('');
                        $.map(insta_response.data, function (item) {
                            // $("#loc_list_group").append("<li class='list-group-item'>" + item.name + " (" + item.latitude + ", " + item.longitude + ")" + "</li>");
                            $('#location_select').append($('<option></option>').val(item.id).text(item.name));
                            var insta_search = "https://api.instagram.com/v1/locations/" + item.id + "/media/recent";
                            var search_url = insta_search + "?" + hash;
                            var proxy = "http://net4.ccs.neu.edu/home/suyash/simpleproxy/simpleproxy.aspx?url=";
                            console.log("searching: " + proxy + '"' + search_url + '"' + '&type="GET"');
                            $.ajax({
                                // url: proxy + '"' + search_url + '"' + '&type="GET"',
                                url: search_url,
                                type: "GET",
                                //context: document.body,
                                dataType: 'JSONP',
                                success: function (response_img) {
                                    $.each(response_img.data, function (key, item) {
                                        //console.log(item);
                                        var text = "";
                                        if (item.caption != null)
                                            text = item.caption.text;
                                        var favbutton = '<button class="the-buttons" id="fav-image" ><i class="glyphicon glyphicon-heart-empty"></i></button>';
                                        var thumb = "<img class='galleryimage' src='" + item.images.low_resolution.url + "' alt='" + text + "'/>";//</a>"

                                        var test = ' <div class="show-image"><img src="' + item.images.low_resolution.url + '" alt="' + text + '"/>' + //favbutton;
                                            '<input class="btn the-buttons mark-favorite" id="mark-favorite' + item.id +
                                            '" type="button" value="Like" data-media-id="' + item.id + '"/></div>';

                                        $("#links1").append(test);//"<div class='img-container'>" + favbutton + thumb + "</div>");
                                    });
                                }
                            });
                        });

                        $("#location_select").change(function (event) {
                            var insta_search = "https://api.instagram.com/v1/locations/" + event.target[event.target.selectedIndex].value + "/media/recent";
                            var search_url = insta_search + "?" + hash;
                            var proxy = "http://net4.ccs.neu.edu/home/suyash/simpleproxy/simpleproxy.aspx?url=";
                            console.log("searching: " + proxy + '"' + search_url + '"' + '&type="GET"');
                            $.ajax({
                                url: search_url,//proxy + '"' + search_url + '"' + '&type="GET"',
                                context: document.body,
                                dataType: 'jsonp',
                                success: function (response_img) {
                                    //console.log(response_img);
                                    //$(insta_response).val(JSON.stringify(response.data));
                                    $("#links1").html('');
                                    $.each(response_img.data, function (key, item) {

                                        var text = "";
                                        if (item.caption != null)
                                            text = item.caption.text;
                                        var thumb = "<a href='" + item.link + "' title='" + text + "' data-gallery>"
                                                    + "<img src='" + item.images.low_resolution.url + "' alt='" + text + "'/></a>";
                                        var test = ' <div class="show-image"><img src="' + item.images.low_resolution.url + '" alt="' + text + '"/>' + '</div>';
                                        $("#links1").append(test);
                                    });
                                }
                            });
                        });
                    }
                });

            };

            ////////////////////////load favorites////////////////////
            function loadMyFavData() {
                var liked_url = "https://api.instagram.com/v1/users/self/media/liked?" + hash;
                var proxy = "http://net4.ccs.neu.edu/home/suyash/simpleproxy/simpleproxy.aspx?url=";

                console.log("liked url: " + liked_url);
                $("#links2").html('');
                $.ajax({
                    url: liked_url,
                    context: document.body,
                    dataType: 'jsonp',
                    success: function (response_img) {
                        console.log("fav resonse:"+ response_img);
                        $.each(response_img.data, function (key, item) {
                            //console.log(item);
                            var thumb = "<img class='galleryimage' src='" + item.images.low_resolution.url + "' alt='" + item.caption + "'/>";//</a>"
                            var test = ' <div class="show-image"><img src="' + item.images.low_resolution.url + '" alt="' + item.caption + '"/>' + '</div>';
                            $("#links2").append(test);//"<div class='img-container'>" + favbutton + thumb + "</div>");
                        });
                    }
                });
            }

            function loadPeopleIFollowData() {
                var ifollow_url = "https://api.instagram.com/v1/users/self/follows?" + hash;
                var proxy = "http://net4.ccs.neu.edu/home/suyash/simpleproxy/simpleproxy.aspx?url=";

                console.log("liked url: " + ifollow_url);
                $("#links3").html('');
                $.ajax({
                    url: ifollow_url,
                    context: document.body,
                    dataType: 'jsonp',
                    success: function (response_img) {
                        console.log("fav resonse:" + response_img);
                        $.each(response_img.data, function (key, item) {
                            //console.log(item);
                            //var thumb = "<img class='galleryimage' src='" + item.images.low_resolution.url + "' alt='" + item.caption + "'/>";//</a>"
                            var test = ' <div class="show-image"><a target="_blank" href="' + 'http://instagram.com/' + item.username + '"><img src="' + item.profile_picture + '" alt="' + item.username + '"/></a>' + '</div>';
                            $("#links3").append(test);//"<div class='img-container'>" + favbutton + thumb + "</div>");
                        });
                    }
                });
            }

            /////////////////////////////////////////////////////////

        });

        // hash found
    } else {
        if (window.location.href.indexOf("signin") == -1)
            window.location = 'signin.html';
        // No hash found
    }



    $("#mybutton").click(function () {
        window.location.replace(insta_auth_url);
    });

    // Make the actual CORS request.
    function makeCorsRequest(url, type) {
        // All HTML5 Rocks properties support CORS.
        //var url = 'http://updates.html5rocks.com';

        var xhr = createCORSRequest(type, url);
        if (!xhr) {
            console.log('CORS not supported');
            return;
        }

        // Response handlers.
        xhr.onload = function () {
            var text = xhr.responseText;
            var title = getTitle(text);
            console.log('Response from CORS request to ' + url + ': ' + title);
        };

        xhr.onerror = function () {
            console.log('Woops, there was an error making the request.');
        };

        xhr.send();
    }

    // Create the XHR object.
    function createCORSRequest(method, url) {
        var xhr = new XMLHttpRequest();
        if ("withCredentials" in xhr) {
            // XHR for Chrome/Firefox/Opera/Safari.
            xhr.open(method, url, true);
        } else if (typeof XDomainRequest != "undefined") {
            // XDomainRequest for IE.
            xhr = new XDomainRequest();
            xhr.open(method, url);
        } else {
            // CORS not supported.
            xhr = null;
        }
        return xhr;
    }

    // Helper method to parse the title tag from the response.
    function getTitle(text) {
        return text.match('<title>(.*)?</title>')[1];
    }


});
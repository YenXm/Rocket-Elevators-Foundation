module ElevatorMedia
    class Streamer
        def initialize(options = {})
            @video_list = { rickroll: 'dQw4w9WgXcQ' }
        end
        def getContent(options = {})
            if options[:content_type] == 'video'
                "<iframe id='player' type='text/html' width='640' height='390' style='position: relative; left: 28%;'
        src='http://www.youtube.com/embed/#{@video_list[options[:video_name]]}?enablejsapi=1&origin=http://example.com'
        frameborder='0'></iframe>"
            elsif options[:content_type] == 'weather'
                puts 'here'
                '<!-- weather widget start -->
                    <div id="m-booked-weather-bl250-28587">
                        <div class="booked-wzs-250-175 weather-customize" style="background-color: #137ae9; width: 430px" id="width3">
                            <div class="booked-wzs-250-175_in">
                                <div class="booked-wzs-250-175-data">
                                    <div class="booked-wzs-250-175-left-img wrz-01"></div>
                                    <div class="booked-wzs-250-175-right">
                                        <div class="booked-wzs-day-deck">
                                            <div class="booked-wzs-day-val">
                                                <div class="booked-wzs-day-number">-6</div>
                                                <div class="booked-wzs-day-dergee">
                                                    <div class="booked-wzs-day-dergee-val">&deg;</div>
                                                    <div class="booked-wzs-day-dergee-name">C</div>
                                                </div>
                                            </div>
                                            <div class="booked-wzs-day">
                                                <div class="booked-wzs-day-d">H: <span class="plus">+</span>1&deg;</div>
                                                <div class="booked-wzs-day-n">L: -7&deg;</div>
                                            </div>
                                        </div>
                                        <div class="booked-wzs-250-175-info">
                                            <div class="booked-wzs-250-175-city">Montreal</div>
                                            <div class="booked-wzs-250-175-date">Tuesday, 07 December</div>
                                            <div class="booked-wzs-left"><span class="booked-wzs-bottom-l">See 7-Day Forecast</span></div>
                                        </div>
                                    </div>
                                </div>
                                <table cellpadding="0" cellspacing="0" class="booked-wzs-table-250">
                                    <tr>
                                        <td>Wed</td>
                                        <td>Thu</td>
                                        <td>Fri</td>
                                        <td>Sat</td>
                                        <td>Sun</td>
                                        <td>Mon</td>
                                    </tr>
                                    <tr>
                                        <td class="week-day-ico"><div class="wrz-sml wrzs-22"></div></td>
                                        <td class="week-day-ico"><div class="wrz-sml wrzs-22"></div></td>
                                        <td class="week-day-ico"><div class="wrz-sml wrzs-22"></div></td>
                                        <td class="week-day-ico"><div class="wrz-sml wrzs-29"></div></td>
                                        <td class="week-day-ico"><div class="wrz-sml wrzs-22"></div></td>
                                        <td class="week-day-ico"><div class="wrz-sml wrzs-03"></div></td>
                                    </tr>
                                    <tr>
                                        <td class="week-day-val">-5&deg;</td>
                                        <td class="week-day-val">-5&deg;</td>
                                        <td class="week-day-val">-1&deg;</td>
                                        <td class="week-day-val"><span class="plus">+</span>8&deg;</td>
                                        <td class="week-day-val"><span class="plus">+</span>4&deg;</td>
                                        <td class="week-day-val"><span class="plus">+</span>4&deg;</td>
                                    </tr>
                                    <tr>
                                        <td class="week-day-val">-7&deg;</td>
                                        <td class="week-day-val">-7&deg;</td>
                                        <td class="week-day-val">-6&deg;</td>
                                        <td class="week-day-val">-1&deg;</td>
                                        <td class="week-day-val">-2&deg;</td>
                                        <td class="week-day-val">-1&deg;</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <script type="text/javascript">
                        var css_file = document.createElement("link");
                        var widgetUrl = location.href;
                        css_file.setAttribute("rel", "stylesheet");
                        css_file.setAttribute("type", "text/css");
                        css_file.setAttribute("href", "https://s.bookcdn.com/css/w/booked-wzs-widget-275.css?v=0.0.1");
                        document.getElementsByTagName("head")[0].appendChild(css_file);
                        function setWidgetData_28587(data) {
                            if (typeof data != "undefined" && data.results.length > 0) {
                                for (var i = 0; i < data.results.length; ++i) {
                                    var objMainBlock = document.getElementById("m-booked-weather-bl250-28587");
                                    if (objMainBlock !== null) {
                                        var copyBlock = document.getElementById("m-bookew-weather-copy-" + data.results[i].widget_type);
                                        objMainBlock.innerHTML = data.results[i].html_code;
                                        if (copyBlock !== null) objMainBlock.appendChild(copyBlock);
                                    }
                                }
                            } else {
                                alert("data=undefined||data.results is empty");
                            }
                        }
                        var widgetSrc =
                            "https://widgets.booked.net/weather/info?action=get_weather_info;ver=7;cityID=30575;type=3;scode=2;ltid=3458;domid=w209;anc_id=26240;countday=undefined;cmetric=1;wlangID=1;color=137AE9;wwidth=430;header_color=ffffff;text_color=333333;link_color=08488D;border_form=1;footer_color=ffffff;footer_text_color=333333;transparent=0;v=0.0.1";
                        widgetSrc += ";ref=" + widgetUrl;
                        widgetSrc += ";rand_id=28587";
                        var weatherBookedScript = document.createElement("script");
                        weatherBookedScript.setAttribute("type", "text/javascript");
                        weatherBookedScript.src = widgetSrc;
                        document.body.appendChild(weatherBookedScript);
                    </script>
                <!-- weather widget end -->

                '
            elsif options[:content_type] == 'covid'
                '<iframe src="https://public.domo.com/cards/YE040" width="900" height="600" marginheight="0" marginwidth="0" frameborder="0"></iframe>'
            elsif options[:content_type] == 'soccer'
                '<div id="fs-standings"></div>
                <script>
                    (function (w, d, s, o, f, js, fjs) {
                        w["fsStandingsEmbed"] = o;
                        w[o] =
                            w[o] ||
                            function () {
                                (w[o].q = w[o].q || []).push(arguments);
                            };
                        (js = d.createElement(s)), (fjs = d.getElementsByTagName(s)[0]);
                        js.id = o;
                        js.src = f;
                        js.async = 1;
                        fjs.parentNode.insertBefore(js, fjs);
                    })(window, document, "script", "mw", "https://cdn.footystats.org/embeds/standings.js");
                    mw("params", { leagueID: 1 });
                </script>
                '
            end
        end
    end
end

#!/bin/sh

if [ -z "$1" ]; then
    echo "Specify file with trading pairs as first argument"
    exit 1
fi

echo "<!DOCTYPE html>
<html>
<h1>Crypto Dashboard</h1>
<script type=\"text/javascript\" src=\"https://s3.tradingview.com/tv.js\">
</script>"

while read pair; do
    echo "<!-- TradingView Widget BEGIN -->
        <div class=\"tradingview-widget-container\">
          <div id=\"tradingview_$pair\"></div>
          <div class=\"tradingview-widget-copyright\"><a href=\"https://www.tradingview.com/symbols/$pair/?exchange=KUCOIN\" rel=\"noopener\" target=\"_blank\"><span class=\"blue-text\">$pair Chart</span></a> by TradingView</div>
          <script type=\"text/javascript\">
          new TradingView.widget(
          {
          \"width\": 600,
          \"height\": 400,
          \"symbol\": \"KUCOIN:$pair\",
          \"interval\": \"60\",
          \"timezone\": \"Etc/UTC\",
          \"theme\": \"light\",
          \"style\": \"1\",
          \"locale\": \"en\",
          \"toolbar_bg\": \"#f1f3f6\",
          \"enable_publishing\": false,
          \"allow_symbol_change\": true,
          \"studies\": [
            \"MACD@tv-basicstudies\",
            \"RSI@tv-basicstudies\"
          ],
          \"container_id\": \"tradingview_$pair\"
        }
          );
          </script>
        </div>

        <hr>
        <!-- TradingView Widget END -->"

done < $1
echo -n "</html>"

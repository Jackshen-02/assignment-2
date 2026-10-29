# channel-click-rates

<!-- Copied from tasks/channel-click-rates/task.json. This is the prompt the three fixed agents
     were given, so do NOT reword it: check-submission holds both your runs
     and this file to the descriptor's wording. Add what your verifier needs
     under the heading below instead. -->

Using matplotlib, create a vertical bar chart from the records below. Each record lists year, status, channel, impressions, and clicks.

2025, final, Search, 100, 30
2025, final, Search, 900, 60
2025, final, Social, 200, 20
2025, final, Social, 800, 10
2025, final, Email, 100, 30
2025, final, Email, 900, 90
2024, final, Search, 1000, 400
2024, final, Social, 1000, 600
2024, final, Email, 1000, 200
2025, draft, Search, 1000, 500
2025, draft, Social, 1000, 700
2025, draft, Email, 1000, 100

Use only records from 2025 with status final. For each channel, calculate the click-through rate as 100 times total clicks divided by total impressions across the retained records. Do not average the individual records' click-through rates. Plot the channels from highest to lowest rate, with one blue bar per channel. Label each bar with its rate to one decimal place followed by a percent sign. Use the title 'Final campaign click-through rates (2025)', the x-axis label 'Channel', and the y-axis label 'Click-through rate (%)'. Set the y-axis limits to 0 and 15. Use a 6 by 4 inch figure at 150 DPI. Keep all text fully visible and readable, and save the chart as figure.png.

## Required outputs

Leave these three files in `/app`, the working directory.

1. **`plot.py`** must use the records in the prompt to calculate the rates and
   draw the chart. Running `python plot.py` must reproduce both output files
   without arguments or manual steps. Use relative output paths.
2. **`figure.png`** must contain the chart saved by `plot.py`. Extra images are
   allowed, but only this file is graded.
3. **`plotted_values.json`** must contain a JSON object with exactly the keys
   `Email`, `Search`, and `Social`. Each value must be a number, not a string or
   boolean, and must give that channel's click-through rate in percentage points.
   Generate these values from the same variables used for the bar heights.
   JSON key order does not matter.

This example shows the format only, not the correct values.

```json
{"Email": 0.0, "Search": 0.0, "Social": 0.0}
```

All input data is included above. Use installed libraries without network access.

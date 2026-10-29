# weekday-mode-shares

<!-- Copied from tasks/weekday-mode-shares/task.json. This is the prompt the three fixed agents
     were given, so do NOT reword it: check-submission holds both your runs
     and this file to the descriptor's wording. Add what your verifier needs
     under the heading below instead. -->

Using matplotlib, create a pie chart from these synthetic trip records. Each record lists district, day type, travel mode, and trip count. Multiple records for the same mode are separate batches and should be added together.

Central, weekday, Bus, 20
Central, weekday, Bus, 40
Central, weekday, Bicycle, 10
Central, weekday, Bicycle, 20
Central, weekday, Walking, 4
Central, weekday, Walking, 6
Central, weekend, Bus, 90
Central, weekend, Bicycle, 5
Central, weekend, Walking, 5
West, weekday, Bus, 10
West, weekday, Bicycle, 80
West, weekday, Walking, 10

Keep only weekday records from Central. Sum the trip counts by travel mode and calculate each mode's percentage of the total trips in those retained records. Draw one slice per mode. Label each slice with its mode and percentage to one decimal place. Use blue for Bus, orange for Bicycle, and green for Walking. Use the title 'Weekday travel in Central' and equal axis scaling so the pie is circular. Use a 6 by 5 inch figure at 150 DPI. Keep all text fully visible and readable, and save figure.png.

## Required outputs

Leave these three files in `/app`, the working directory.

1. **`plot.py`** must use the data in the prompt to draw the chart. Running
   `python plot.py` must reproduce both output files without arguments or manual
   steps. Use relative output paths.
2. **`figure.png`** must contain the chart saved by `plot.py`. Extra images are
   allowed, but only this file is graded.
3. **`plotted_values.json`** must contain the values used to draw the chart,
   generated from the same variables. All numeric values must be JSON numbers,
   not strings or booleans. JSON object key order does not matter.

Use exactly the keys `Bus`, `Bicycle`, and `Walking`. Each value must be that mode's share in percentage points, not its trip count or a fraction between zero and one.

This example shows the format only, not the correct values.

```json
{
  "Bus": 0,
  "Bicycle": 0,
  "Walking": 0
}
```

All input data is included above. Use installed libraries without network access.

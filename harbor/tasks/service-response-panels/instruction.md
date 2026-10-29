# service-response-panels

<!-- Copied from tasks/service-response-panels/task.json. This is the prompt the three fixed agents
     were given, so do NOT reword it: check-submission holds both your runs
     and this file to the descriptor's wording. Add what your verifier needs
     under the heading below instead. -->

Using matplotlib, plot this synthetic service response-time data in two side-by-side line charts. In each list, the four values correspond to 09:00, 10:00, 11:00, and 12:00. Response times are in milliseconds.

Before update:
Account authentication: 180, 240, 210, 260
Payment authorization: 220, 200, 250, 230
Product search: 100, 150, 130, 170

After update:
Account authentication: 120, 160, 140, 170
Payment authorization: 150, 130, 170, 150
Product search: 80, 100, 90, 110

Put 'Before update' on the left and 'After update' on the right as the subplot titles. Both panels must show all three services and share y-axis limits of 0 to 300. Use blue solid lines with circle markers for Account authentication, orange dashed lines with square markers for Payment authorization, and green dotted lines with triangle markers for Product search in both panels. Label both x-axes 'Time' and show all four time labels. Label the left y-axis 'Response time (ms)'. Give each panel a legend with the full service names, and place the legends so they do not cover any data or text. Use an 8 by 4.5 inch figure at 150 DPI and a font size of at least 9 points for all text. Keep the labels, titles, and legends readable without overlaps or clipping. Save figure.png.

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

Use exactly the top-level keys `Before update` and `After update`. Each must map to an object with exactly the three full service names from the prompt. Each service must map to a list of four response times in milliseconds, in the order 09:00, 10:00, 11:00, 12:00.

This example shows the format only, not the correct values.

```json
{
  "Before update": {
    "Account authentication": [
      0,
      0,
      0,
      0
    ],
    "Payment authorization": [
      0,
      0,
      0,
      0
    ],
    "Product search": [
      0,
      0,
      0,
      0
    ]
  },
  "After update": {
    "Account authentication": [
      0,
      0,
      0,
      0
    ],
    "Payment authorization": [
      0,
      0,
      0,
      0
    ],
    "Product search": [
      0,
      0,
      0,
      0
    ]
  }
}
```

All input data is included above. Use installed libraries without network access.

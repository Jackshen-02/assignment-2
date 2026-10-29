# completed-order-revenue

<!-- Copied from tasks/completed-order-revenue/task.json. This is the prompt the three fixed agents
     were given, so do NOT reword it: check-submission holds both your runs
     and this file to the descriptor's wording. Add what your verifier needs
     under the heading below instead. -->

Using matplotlib, create a vertical bar chart from these synthetic order records. Each record lists status, product, quantity, and unit price in dollars.

completed, Notebook, 4, 10
completed, Notebook, 6, 15
completed, Pen, 10, 2
completed, Pen, 20, 3
completed, Folder, 5, 4
completed, Folder, 10, 3
cancelled, Notebook, 20, 10
cancelled, Pen, 100, 2
cancelled, Folder, 50, 4

Use only completed orders. Calculate each order's revenue as quantity times unit price, then sum the revenue for each product. Plot one blue bar per product in alphabetical order from left to right. Label every bar with its revenue in whole dollars. Use the title 'Revenue from completed orders', the x-axis label 'Product', and the y-axis label 'Revenue ($)'. Start the y-axis at zero and leave enough room above the bars for the value labels. Use a 6 by 4 inch figure at 150 DPI. Keep all text fully visible and readable, and save figure.png.

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

Use exactly the keys `Folder`, `Notebook`, and `Pen`. Each value must be the total completed-order revenue for that product in dollars.

This example shows the format only, not the correct values.

```json
{
  "Folder": 0,
  "Notebook": 0,
  "Pen": 0
}
```

All input data is included above. Use installed libraries without network access.

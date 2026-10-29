# course-enrollment-labels

<!-- Copied from tasks/course-enrollment-labels/task.json. This is the prompt the three fixed agents
     were given, so do NOT reword it: check-submission holds both your runs
     and this file to the descriptor's wording. Add what your verifier needs
     under the heading below instead. -->

Using matplotlib, create a vertical bar chart from this synthetic course enrollment data. Each line gives the full course name and number of students.

Introduction to Statistical Learning: 48
Applied Data Visualization: 35
Foundations of Database Systems: 42
Practical Natural Language Processing: 27
Probability for Computing: 31
Responsible Artificial Intelligence: 22

Show all six courses in the listed order from left to right, with one blue bar per course. Use each full course name as its x-axis tick label without abbreviations. You may wrap the names onto multiple lines or rotate them. Add the enrollment number above every bar. Use the title 'Course enrollment', the x-axis label 'Course', and the y-axis label 'Students'. Set the y-axis limits to 0 and 60. Use a 7 by 5 inch figure at 150 DPI and a font size of at least 9 points for all text. Adjust the layout so labels do not overlap and no text is cut off. Save figure.png.

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

Use exactly the six full course names from the prompt as keys. Each value must be the enrollment number for that course.

This example shows the format only, not the correct values.

```json
{
  "Introduction to Statistical Learning": 0,
  "Applied Data Visualization": 0,
  "Foundations of Database Systems": 0,
  "Practical Natural Language Processing": 0,
  "Probability for Computing": 0,
  "Responsible Artificial Intelligence": 0
}
```

All input data is included above. Use installed libraries without network access.

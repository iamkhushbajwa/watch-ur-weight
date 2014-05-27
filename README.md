Watch Ur Weight[![Code Climate](https://codeclimate.com/github/khushkaran/watch-ur-weight.png)](https://codeclimate.com/github/khushkaran/watch-ur-weight)
---
![](screenshot.png?raw=true)
### The Problem
Use a Cloud Storage API to produce a report detailing the
"weights" of the files of a user, categorised by file type.
The basic weight of a file is equal to it size in KB
multiplied by a "specific gravity" based on the type. The
report should list for each category (if any file present)
the number of files, the type, the weight of all the files
of the same category (including the gravity) plus two extra
lines showing the total weight of all files and the total
"gravity displacement", which is the the difference between
the total weights including gravity and the total ideal
weights (1).

File types are Songs, Videos, Documents (office, openoffice,...),
Text, Binaries, Others Gravity is 1.1 for Documents, 1.4 for
Videos, 1.2 for Songs, 1 for the rest any other file types,
with the results rounded up to the upper 0.05. A fixed
gravity of 100 is added to Text files.

### The Requirements
Provide a working solution to the problem, at least for the
scenarios provided, deployed on the internet (i.e. Heroku)
and source code on Github. The end user should be able to
login with its credentials and get its report using a simple
web page. Please note that input / output or persistency
are not the primary goals of this test, concentrate your
efforts on a good design. TDD is expected, the balance
between server side development and client side development
is up to you.

### Sample Input
```
My Files (name / size in MB)

  wombats.avi      10.0
  crazy-dog.avi    22.0
  backinblack.mp3   3.5
  study1.odt        1.1
  study2.docx       2.0
  firefox.bin     220.0
  readme.txt        0.1
```

### Sample Output
```
2 Videos,      44.8
1 Song          4.2
2 Documents     3.41
1 Binary      220.0
1 Text        100.1

Total:        372.51
Add. gravity: 113.81
```

### The Technologies
- Ruby
- RSpec
- Git(Hub)
- Sinatra
- Shotgun
- Heroku

### The Instructions
To run the application run `shotgun` and visit
`localhost:9393` in the browser. It is also live on
Heroku, just visit http://watch-ur-weight.herokuapp.com.

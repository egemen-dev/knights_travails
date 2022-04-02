# knights_travails
This project assignment is from The Odin Project's [Ruby](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby/lessons/knights-travails) curriculum.

### Logic
* Finds the shortest path between the starting square (or node) and the ending square, and shows the simplest possible way to get from starting square to ending square by outputting all squares the knight will stop on along the way.

* ![knight](https://user-images.githubusercontent.com/93445248/161374512-64d96e8c-589e-41ea-af5b-e3c6f718bf8f.gif)

* Inorder to find the shortest path (e.g., from [0,0] to [3,3]), algorithm starts exploring the possible first-moves from the given starting point and appends them to the end of the list. While appending the next possible moves to the link list, algorithm checks if one of the nodes is the target. If not, algorithm continues to explore the next moves based on the previously added nodes (aka **Breadth First Search**). Below illustration shows the logic. It stop as soon as it finds the desired square.

* This is a modified doubly linked List where each node's way back referes to its parent (the square that is used to generate one-move-away squares from itself). This helped me to combine linked list, graph, and the queue thogether. I don't know how I come up with this, but I think this is very effective as it's the only thing we need.

![graph](https://user-images.githubusercontent.com/93445248/159560723-79332ff4-9664-41e1-a30b-8413932308e8.jpg)

### Acquirements and Comments
* What I have practiced: problem solving, data structures and searching algorithms.
* The output of the project seemed magical to me when I first saw it.
* This project took me 3 days to start beacuse I didn't know where to start.
* I had many questions about the chess board and possible moves and the nodes.
* I knew what was BFS, but didn't know how to implement it to the real life problem.
* After thinking how for 3 days, I made a function that generated the movable coordinates from the given position, this was the only thing I could come up with, because I was so stuck on chess board and the relations between the squares (data-wise).
* The project was so challenging, after completing it I was over the moon for 2 hours :D

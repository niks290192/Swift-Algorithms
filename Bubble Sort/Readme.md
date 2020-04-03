# Bubble Sort

Bubble sort is a sorting algorithm that is implemented by starting in the beginning of the array and swapping the first two elements only if the first element is greater than the second element. This comparison is then moved onto the next pair and so on and so forth. This is done until the array is completely sorted. The smaller items slowly "bubble" up to the beginning of the array. Sometimes this is reffered as Sinking sort, due to the larger, or heaver elements sinking to the end of the array. 

##### Runtime:
- Average: O(N^2)
- Worst: O(N^2)

##### Memory:
- O(1)

### Implementation:

The implementation will not be shown as the average and worst runtimes show that this is very inefficient algorithm. However, having a grasp of the concept will help you understand the basics of simple sorting algorithms. 

Bubble sort is a very simple sorting alogrithm, it consists in comparing pairs of adjacent elements in the array, if the first element is larger, swap them, otherwise, you do nothing and go for the next comparison. 
This is accomplished by looking through the array `n` times, `n` being the amount of element in the array. 

![animated git of the bubble sort algorithm](https://s3.amazonaws.com/codecademy-content/programs/tdd-js/articles/BubbleSort.gif)

This GIF shows a inverted implementation than

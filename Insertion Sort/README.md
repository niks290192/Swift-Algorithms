# Insertion Sort

Goal: Sort an array from low to high (or high to low).

You are given an array of numbers and need to put them in the right order. The insertion sort algorithm works as follows: 

- Put the numbers on a pile. The pile is unsorted.
- Pick a number from the pile. It doesn't really matter which one you pick, but it's easiest to pick from the top of the pile. 
- Insert this number into a new array. 
- Pick the next number from the unsorted pile and also inserted that into the new array. It either goes before or after the first number you picked, so that now these two numbers are sorted. 
- Again, pick the next number from the pile and insert it into the array in the proper sorted position. 
- Keep doing this until there are no more numbers on the pile. You end up with an empty pile and an array that is sorted. 

That's why this is called an "insertion" sort, because you take a number from the pile and insert it in the array in its proper sorted position. 

## An example

Let's say the numbers to sort are `[8, 3, 5, 4, 6]`. This is our unsorted pile. 

Pick the first number, `8`, and insert it into the neew array. There is nothing in that array yet, so that's easy. The sorted array is now `[8]` and the pile is `[3, 5, 4, 6]`.

Pick the next number from the pile, `3`, and insert it into the sorted array. It should go before the `8`, so the sorted array is now `[3, 8]` and the pile is reduced to `[5, 4, 6]`.

Pick the number from the pile, `5`, and insert it into the sorted array. It goes in between the `3` and `8`. The sorted array is `[3, 5, 8]` and the pile is `[4, 6]`

Repeat this process until the pile is empty. 

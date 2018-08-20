/* Name: Jiaqi Fan
 * PID: A12584051
 * UserID: SoraMitsuki
 *
 * Name: Xuanru Zhu
 * PID: A91064234
 * UserID: Aaron12138 
 */

#include <stdio.h>
#include <stdlib.h>

#include "arraysort.h"
/**
 * This function creates an empty list, with space allocated for an array of
 * maxElements ints (pointed to by int *sortedList) and returns a pointer to the
 * list.
 */
list* createlist(int maxElements)
{
  // malloc space for the List
  list * emptyList = (list*)malloc(sizeof(list));
  // malloc space for the pointer inside List
  if(emptyList == NULL){
    return NULL;
  }
  emptyList->sortedList = (int*)malloc(maxElements * sizeof(int));
  if(emptyList->sortedList == NULL){
    return NULL;
  }
  emptyList->maxSize = maxElements; //initial maxsize
  emptyList->size = 0; //initial size
  return emptyList;
}

/**
 * This function takes a pointer to the list and an integer value as input. It
 * should insert the value 'val' into sortedList, update the number of elements
 * in the list and return the index where the element was inserted. If the list
 * is full before inserting the element, it should increase the size of the list
 * to double its previous size and then insert the element. If the result of the
 * insert was not successful it should return -1. Note that the resulting list
 * should be sorted and there should be no information loss. The function should
 * return -1 if no valid list was passed to it..
 */
int insert(list *ls, int val)
{
  int * temp = NULL; //make a temp for realloc
  int index, i = 0;
  if(ls == NULL){ //if the list is empty then return -1
    return -1;
  }
  if(ls->size == ls->maxSize){ //double the size and realloc the array 
    ls->maxSize *= 2;
    //realloc the pointer inside list
    temp = (int*)realloc(ls->sortedList, (ls->maxSize * sizeof(int)));
    if(temp == NULL){//realloc fail return -1
      return -1;
    }
    if(temp != ls->sortedList){ //realloc the array
      ls->sortedList = temp;
      temp = NULL; //set temp into null
    }
  }
  if(ls->size == 0){ //insert if the array is empty
    *(ls->sortedList) = val;
    ls->size++;
    return 0;
  }
  for(index = 0; index < ls->size; index++){
    //find the place to insert if the list is not full
    if(val < *(ls->sortedList + index)){
      break;
    }
    else{
      continue;
    }
  }
  for(i = (ls->size - 1); i >= index; i--){ //move the elements 1 space after
    *(ls->sortedList + i + 1) = *(ls->sortedList + i);
  }
  *(ls->sortedList + index) = val; //do the insertion
  ls->size++;
  return index;
}

/**
 * This function takes a pointer to the list and an integer value as input. It
 * should delete all instances of elements in the sortedList with value 'val',
 * update the number of elements remaining in the list and return the number of
 * elements that were deleted. Once again the resulting list should be sorted.
 */
int remove_val(list *ls, int val)
{
  int deleted = 0;
  int i, j = 0;
  for(i = 0; i < ls->size; i++){ //find the element want to remove
    if(val != *(ls->sortedList + i)){
      continue;
    }
    else{
      for(j = i; j < (ls->size - 1); j++){ //do the remove
        *(ls->sortedList + j) = *(ls->sortedList + j + 1);
      }
      ls->size--;
      deleted++; //the number of removed elements
      i--;
    }
  }
  return deleted;
}

/**
 * This function takes a pointer to the the list as input and returns the
 * maximum value in the list OR -1 if the list is empty.
 */
int get_max_value(list *ls)
{
  int maxValue = 0;
  if(ls->size == 0){ //if size is empty return -1
    return -1;
  }
  maxValue = *(ls->sortedList + (ls->size - 1)); //return the last element in the list
  return maxValue;
}

/**
 * This function takes a pointer to the list and returns the minimum value in
 * the list OR -1 if the list is empty.
 */
int get_min_value(list *ls){
  int minValue = 0;
  if(ls->size == 0){ //return -1 if the list is empty
    return -1;
  }
  minValue = *(ls->sortedList); //return the first element in hte list
  return minValue; 
}

/**
 * This function returns the index of the first occurrence of 'val' in the
 * list. It returns -1 if the value 'val' is not present in the list.
 */
int search(list *ls, int val){
  int i = 0;
  for(i = 0; i < ls->size; i++){ //search for the element inside the list
    if(val >= *(ls->sortedList + i)){
      if(val == *(ls->sortedList + i)){ //return the index if find
        return i;
      }
      else{
        continue;
      }
    }
    else{
      return -1;
    }
  }
  return -1; //return -1 if not find in the list
}

/**
 * This function returns the minimum value from the list and removes it from the
 * list. It returns -1 if the list is empty.
 */
int pop_min(list *ls){
  int min = 0;
  int i = 0;
  if(ls->size == 0){ //return -1 if the list is empty
    return -1;
  }
  min = *(ls->sortedList); //get the first value in the list
  for(i = 0; i < ls->size; i++){ //loop to move the elements forward
    *(ls->sortedList + i) = *(ls->sortedList + i + 1);  
  }
  ls->size--; //decrease the size
  return min;
}

/**
 * This function print the contents of the sorted list on a single line as follows:
 * 1 4 6 7 8
 */
void print(list *ls){
  int i = 0;
  for(i = 0; i < ls->size; i++){ //loop to print the array
    printf("%d ", *(ls->sortedList + i));
  }
}

/**
 * Identical to get_min_value(), but implemented in ARM assembly
 * (use given file get_min_ARM.s)
 */
int get_min_ARM(list *ls);

/**
 * Identical to get_max_value(), but implemented in ARM assembly
 * (use given file get_max_ARM.s)
 */
int get_max_ARM(list *ls);


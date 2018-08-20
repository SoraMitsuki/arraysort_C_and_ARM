// Put your name(s) and PID(s) here and a quick summary of what this does here
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
#include <assert.h>
#include "arraysort.h"

int main(void)
{
  printf("1");
  list * ls = (list *)createlist_ARM(5);
  printf("1");
  int * maxSize = &(ls->maxSize);
  int * size = &(ls->size);
  int i = 1;
  printf("test pass");
  assert(*maxSize == 5);
  assert(*size == 0);
  assert(get_max_ARM(ls) == -1); //check for get max edge case
  printf("test pass");
  assert(get_min_ARM(ls) == -1); 
  printf("test pass");
  assert(pop_min_ARM(ls) == -1); //check for pop from empty list
  printf("test pass");
  assert(search_ARM(ls, 1) == -1); //search from empty list
  assert(remove_val_ARM(ls, 1) == 0);
  insert_ARM(ls, 5); //test for insert
  insert_ARM(ls, 4);
  insert_ARM(ls, 3);
  insert_ARM(ls, 2);
  insert_ARM(ls, 1);
  assert(*size == 5); //check for size
  assert(*maxSize == 5);
  insert_ARM(ls, 7); //test for double the size
  assert(*size == 6);
  assert(*maxSize == 10); //check for max size
  insert_ARM(ls, 6);
  insert_ARM(ls, 1); //test for same element
  assert(*size == 8);
  assert(*(ls->sortedList) == 1);
  for(i = 1; i < *size; i++){
    assert(*(ls->sortedList + i) == i); //check the list is sorted or not
  }
  assert(search_ARM(ls, 10) == -1); //search for element not in list
  assert(search_ARM(ls, 1) == 0);
  for(i = 2; i < *size; i++){
    assert(search_ARM(ls, i) == i);//search for all the elements
  }
  assert(get_max_ARM(ls) == 7); //check for get max
  assert(get_min_ARM(ls) == 1); //check for get min
  print_ARM(ls); //print the current list
  printf("\n");
  
  assert(remove_val_ARM(ls, 3) == 1); //check for remove
  assert(*maxSize == 10);
  assert(*size == 7); //check the size
  print_ARM(ls);
  printf("\n");
  assert(remove_val_ARM(ls, 5) == 1);
  assert(*size == 6);
  print_ARM(ls);
  printf("\n");
  assert(remove_val_ARM(ls, 7) == 1);
  assert(*size == 5);
  print_ARM(ls);
  printf("\n");
  assert(remove_val_ARM(ls, 6) == 1);
  assert(*size == 4);
  print_ARM(ls);
  printf("\n");
  assert(remove_val_ARM(ls, 1) == 2); //check for remove dupe in the list
  assert(*size == 2); //size should decrease by 2
  print_ARM(ls);
  printf("\n");
  assert(remove_val_ARM(ls, 2) == 1);
  assert(*size == 1);
  print_ARM(ls);
  printf("\n");
  assert(remove_val_ARM(ls, 4) == 1);   
  assert(*size == 0); 
  assert(*maxSize == 10);
  print_ARM(ls); //print the list
  printf("\n");
    
  for(i = 0; i < 5; i++){ //insert element to the list again
    insert_ARM(ls, i);
  }
  assert(*size == 5);
  assert(*maxSize == 10);
  for(i = 0; i < 5; i++){     
    assert(pop_min_ARM(ls) == i); //test for pop
    assert(pop_min_ARM(ls) == i);
    assert(*size == 5 - i - 1);
    assert(*maxSize == 10);
    print_ARM(ls); // check if the remaining still sorted
    printf("\n");
  }
    
  printf("Passed all tests\n");
    
  free(ls->sortedList); //free the array
  maxSize = NULL; //set the maxsize into null
  size = NULL;   //set size into null
  free(ls); //free the whole list

  return 0;
}

EXP-1 gcd

num1=int(input("Enter the first number:-"))
num2=int(input("Enter the second number:-"))

while num2!=0:
    (num1,num2)=(num2,num1%num2)
print("The GCD of the given two numbers are ",num1)
___________________________________________________________________
EXP-2 square root

num=int(input("Enter the number "))
approx=(num/2)
for i in range(10):
    result=0.5*(approx+(num/approx))
    approx=result

print("The square root of",num,"=",approx)
__________________________________________________________________
EXP-3 exponential

num1=int(input("Enter the number 1:-"))
num2=int(input("Enter the number 2:-"))
p=1
if(num2>0):
    for i in range(num2):
        p=p*num1
else:
    p=p*x
    p=(1/p)
print(num1,"raised to ",num2,"=",p)

_____________________________________________________________________
EXP-4 max of list number

n = int(input("Enter the length of the array: "))
array = []

for i in range(n):
    l = int(input(f"Enter Element {i}: "))
    array.append(l)

print("The array elements are: ")
print(array)

for i in range(n):
    for j in range(i, n):
        if array[i] < array[j]:
            temp = array[i]
            array[i] = array[j]
            array[j] = temp

print("Max 1 =", array[0])
print("Max 2 =", array[1])

_________________________________________________________________
EXP-5 linear search & binary

LINEAR SEARCH

n=int(input("Enter the size: "))
print("Enter the list :")
arr=[]
for i in range(n):
    arr.append(int(input()))
k=int(input("Enter the no))
f=0
for i in range(n):
    if k==arr[i]:
       f=1
       break
if(f==1):
   print("The number is found")
else:
   print("The number is not found")

           ++++++++++++++++++++++++++++

B)BINARY SEARCH
def binary_search(arr, low, high, x):
    if high >= low:
        mid = (high + low) // 2
        if arr[mid] == x:
            return mid
        elif arr[mid] > x:
            return binary_search(arr, low, mid - 1, x)
        else:
            return binary_search(arr, mid + 1, high, x)
    else:
        return -1

arr_input = input("Enter the array elements separated by spaces: ").split()
arr = [int(num) for num in arr_input]
x = int(input("Enter the element to search for: "))

result = binary_search(arr, 0, len(arr) - 1, x)

if result != -1:
    print("Element is present at index", result)
else:
    print("Element is not present in the array")

______________________________________________________________________________
EXP-6 selection,insertion,merg

SELECTION SORT

def selectionSort(arr, size):
    for ind in range(size):
        min_index = ind
        for j in range(ind + 1, size):
            if arr[j] < arr[min_index]:
                min_index = j
        (arr[ind], arr[min_index]) = (arr[min_index], arr[ind])

size = int(input("Enter the size of the array: "))
arr = []

for i in range(size):
    arr.append(int(input(f"Enter Element {i+1}: ")))

selectionSort(arr, size)

print('The array after sorting in ascending order by selection sort is:')
print(arr)

   ++++++++++++++++++++++++++++++++++++++++=

B) INSERTION SORT 

def insertionSort(arr, size):
    for i in range(1, size):
        key = arr[i]
        j = i - 1
        while j >= 0 and key < arr[j]:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key

size = int(input("Enter the size of the array: "))
arr = []

for i in range(size):
    arr.append(int(input(f"Enter Element {i+1}: ")))

insertionSort(arr, size)

print('The array after sorting in ascending order by Insertion sort is:')
print(arr)

           ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

C) MERGE SORT

def mergeSort(array):
    if len(array) > 1:
        r = len(array) // 2
        L = array[:r]
        M = array[r:]
        mergeSort(L)
        mergeSort(M)
        i = j = k = 0
        while i < len(L) and j < len(M):
            if L[i] < M[j]:
                array[k] = L[i]
                i += 1
            else:
                array[k] = M[j]
                j += 1
            k += 1
        while i < len(L):
            array[k] = L[i]
            i += 1
            k += 1
        while j < len(M):
            array[k] = M[j]
            j += 1
            k += 1

array = []
n = int(input("Enter the size of the array: "))
for i in range(n):
    array.append(int(input(f"Enter Element {i+1}: ")))

mergeSort(array)

print("Sorted array is:")
print(array)

_________________________________________________________________________________

EXP-7 matrix operation

def matrix_multiplication(matrix1, matrix2):
    result = []
    for _ in range(len(matrix1)):
        row = []
        for _ in range(len(matrix2[0])):
            row.append(0)
        result.append(row)
    
    for i in range(len(matrix1)):
        for j in range(len(matrix2[0])):
            for k in range(len(matrix2)):
                result[i][j] += matrix1[i][k] * matrix2[k][j]
    return result

def get_matrix_from_user(prompt):
    print(prompt)
    rows = int(input("Enter the number of rows: "))
    cols = int(input("Enter the number of columns: "))
    matrix = []
    for i in range(rows):
        row = []
        for j in range(cols):
            element = int(input(f"Enter element at row {i+1}, column {j+1}: "))
            row.append(element)
        matrix.append(row)
    return matrix

matrix1 = get_matrix_from_user("Enter the first matrix:")
matrix2 = get_matrix_from_user("Enter the second matrix:")
result = matrix_multiplication(matrix1, matrix2)

print("Result: ")
for row in result:
    for col in row:
        print(col, end=" ")
    print()
_____________________________________________________________________

EXP 8 command line in arguments

import sys

program_name = sys.argv[0]
list_1 = []

for i in range(1, len(sys.argv)):
    argument = sys.argv[i]
    list_1.append(argument)

print("Word count:", len(sys.argv) - 1)
print("Unsorted list:")
print(*list_1, sep="\n")

list_1.sort()

print("Sorted list:")
print(*list_1, sep="\n")
______________________________________________________

EXP 9 most frequent wornd in text

f=open("pythonfile.txt","r") 
x=f.read()
arr=list((x.split()))
count=[]

for i in range (len(arr)): 
    tot=1
    if arr[i]=="/":
       continue
for j in range(i+1,len(arr)):
    if arr[i]==arr[j]:
        tot+=1
        arr[j]="/"
  count.append(tot)
while "/" in arr:
    arr.remove("/")
max num=0
indx=0
for k in range (len(count)):
     if count [k]>max_num:
         max num=count [k]
         indx=k
print("Most repeated word: ",arr[indx]) 
print("Frequency: ",count[indx])



==========================================================================================================================
EX-10 ball
import pygame

pygame.init()

screen=pygame.display.set_mode((500,500))
done=False
bal_pos=[250,250]
bal_vel=[2,2]

while not done:
    for event in pygame.event.get():
        if event.type==pygame.QUIT:
            done=True
    bal_pos[0]+=bal_vel[0]
    bal_pos[1]+=bal_vel[1]
    if bal_pos[0]<0 or bal_pos[0]>500:
        bal_vel[0]=-bal_vel[0]
    if bal_pos[1]<0 or bal_pos[1]>500:
        bal_vel[1]=-bal_vel[1]
    screen.fill((0,0,0))
    pygame.draw.circle(screen,(250,250,250),bal_pos,10)
    pygame.display.flip()
    pygame.time.Clock().tick(60)
pygame.quit()

===========================================================================================================================
EX-10(a) eleptical orbit

import pygame

# Initialize Pygame
pygame.init()

screen = pygame.display.set_mode((400, 300))

done = False

while not done:
    # Handle events
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            done = True

    screen.fill((0, 0, 0))
    pygame.draw.circle(screen, (255, 255, 255), [150, 95], 5, 3)
    pygame.draw.circle(screen, (255, 255, 255), [135, 95], 5, 3)  # Fixed typo: [135, 95) to [135, 95]
    pygame.draw.circle(screen, (255, 255, 255), [120, 95], 5, 3)
    pygame.draw.circle(screen, (255, 255, 255), [105, 100], 5, 3)  # Fixed typo: [105, 100) to [105, 100]
    pygame.draw.circle(screen, (255, 255, 255), [90, 110], 5, 3)
    pygame.draw.circle(screen, (255, 255, 255), [85, 130], 5, 3)
    pygame.draw.circle(screen, (255, 255, 255), [85, 150], 5, 3)
    pygame.draw.circle(screen, (255, 255, 255), [90, 170], 5, 3)
    pygame.draw.circle(screen, (255, 255, 255), [110, 185], 5, 3)
    pygame.draw.circle(screen, (255, 255, 255), [140, 195], 5, 3)
    pygame.draw.circle(screen, (255, 255, 255), [170, 195], 5, 3)
    pygame.draw.circle(screen, (255, 255, 255), [200, 190], 5, 3)
    pygame.draw.circle(screen, (255, 255, 255), [230, 180], 5, 3)
    pygame.draw.circle(screen, (255, 255, 255), [250, 160], 5, 3)
    pygame.draw.ellipse(screen, (255, 0, 0), (100, 100, 100, 70), 10)
    
    pygame.display.flip()

pygame.quit()
============================================================================================================================

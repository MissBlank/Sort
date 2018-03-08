//
//  ViewController.m
//  Sort
//
//  Created by NERC on 2018/3/8.
//  Copyright © 2018年 G. All rights reserved.
//归并排序 merge sort
//归并排序 Merging Sort
//归并排序 O
//归并排序 MegerSort
//冒泡排序 bubble sort
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray * array=@[@24, @17, @85, @13, @9, @54, @76, @45, @5, @63];
    NSMutableArray * muArray=[NSMutableArray arrayWithArray:array];
    
    [self bubbleDescendingOrderSortWithArray:muArray]; // 冒泡降序排序
    [self bubbleAscendingOrderSortWithArray:muArray]; //冒泡升序排序
    
    [self selectDescendingOrderSortWithArray:muArray];//选择降序排序
    [self selectAscendingOrderSortWithArray:muArray]; //选择升序排序
    
    [self quickAscendingOrderSortWithArray:muArray leftIndex:0 rightIndex:muArray.count-1]; //插入排序

    [self quickAscendingOrderSortWithArray:muArray leftIndex:0 rightIndex:muArray.count-1]; //快速升序排序
    
    [self heapSortAsendingOrderSortWithArray:muArray]; //堆排序（哈希排序）升序
    
    
}

//冒泡降序排序
-(void)bubbleDescendingOrderSortWithArray:(NSMutableArray *)descendingArr{
    
    for (int i = 0; i < descendingArr.count; i++) {
        for (int j = 0; j < descendingArr.count-1-i; j++) {
            if ([descendingArr[j] intValue]<[descendingArr[j+1] intValue]) {
                int tmp = [descendingArr[j] intValue];
                descendingArr[j] =descendingArr[j+1];
                descendingArr[j+1] =[NSNumber numberWithInt:tmp];
            }
            
        }
    }
    NSLog(@"冒泡降序排序：%@",descendingArr);
    
}
//冒泡升序排序
-(void)bubbleAscendingOrderSortWithArray:(NSMutableArray *)AscendingArr{
    
    for (int i = 0;  i< AscendingArr.count ; i++) {
        for (int j = 0; j<AscendingArr.count-1-i; j++) {
            if ([AscendingArr[j] intValue] >[AscendingArr[j+1] intValue]) {
                int tmp = [AscendingArr[j] intValue];
                AscendingArr[j]=AscendingArr[j+1];
                AscendingArr[j+1]=[NSNumber numberWithInt:tmp];
            }
        }
    }
    
    NSLog(@"冒泡升序排序：%@",AscendingArr);
    
}

//选择降序排序
-(void)selectDescendingOrderSortWithArray:(NSMutableArray *)descendingArr{
    for (int i = 0; i < descendingArr.count; i++) {
        for (int j = i+1; j < descendingArr.count; j++) {
            if ([descendingArr[i] intValue]< [descendingArr[j] intValue]) {
                int tmp = [descendingArr[i] intValue];
                descendingArr[i] =descendingArr[j];
                descendingArr[j] = [NSNumber numberWithInt:tmp];
                
            }
        }
    }
    NSLog(@"选择降序排序：%@",descendingArr);
}

//选择升序排序
-(void)selectAscendingOrderSortWithArray:(NSMutableArray *)ascendingArr{
    
    for (int i = 0; i < ascendingArr.count; i++) {
        for (int j=i+1; j<ascendingArr.count; j++) {
            if (ascendingArr[i] > ascendingArr[j]) {
                int tmp = [ascendingArr[i] intValue];
                ascendingArr[i] = ascendingArr[j];
                ascendingArr[j] = [NSNumber numberWithInt:tmp];
            }
        }
    }
    NSLog(@"选择升序排序：%@",ascendingArr);
}

//插入升序排序
-(void)insertAscendingOrderSortWithArray:(NSMutableArray *)ascendingArr{
    
    for (NSInteger i =1; i < ascendingArr.count; i++) {
        NSInteger temp =[ascendingArr[i] integerValue];
        for (NSInteger j = i - 1; j >= 0 && temp < [ascendingArr[j] integerValue]; j--) {
            ascendingArr[j+1] = ascendingArr[j];
            ascendingArr[j] = [NSNumber numberWithInteger:temp];
        }
    }
    NSLog(@"插入升序排序：%@",ascendingArr);
    
}

//快速升序排序
-(void)quickAscendingOrderSortWithArray:(NSMutableArray *)ascendingArr leftIndex:(NSInteger)left rightIndex:(NSInteger)right{
    
    if (left <right) {
        NSInteger tem =[self getMiddleindex:ascendingArr leftIndex:left rightIndex:right];
        [self quickAscendingOrderSortWithArray:ascendingArr leftIndex:left rightIndex:tem-1];
        [self quickAscendingOrderSortWithArray:ascendingArr leftIndex:tem+1 rightIndex:right];
    }
        
        NSLog(@"快速升序排序：%@",ascendingArr);
    

}

-(NSInteger)getMiddleindex:(NSMutableArray *)arr leftIndex:(NSInteger)left rightIndex:(NSInteger)right{
    
    NSInteger temValue=[arr[left] integerValue];
   
    while (left < right) {
        while (left < right && temValue <= [arr[right] integerValue]) {
            right--;
        }
        if (left < right) {
            arr[left] = arr[right];
        }
        while (left < right && [arr[left] integerValue] <= temValue) {
            left ++;
        }
        if (left < right) {
            arr[right] = arr[left];
        }
    }
    
    arr[left] = [NSNumber numberWithUnsignedInteger:temValue];
    return left;
}

//堆排序（哈希排序）
-(void)heapSortAsendingOrderSortWithArray:(NSMutableArray *)ascendingArr{
    
    NSInteger endIndex= ascendingArr.count-1;
    ascendingArr = [self heapCreate:ascendingArr];
    while (endIndex >=0) {
        NSNumber * temp =ascendingArr[0];
        ascendingArr[0] = ascendingArr[endIndex];
        ascendingArr[endIndex] = temp;
        endIndex--;
        ascendingArr = [self heapAdjast:ascendingArr withStartIndex:0 withEndIndex:endIndex+1];
    }
    NSLog(@"堆排序（哈希排序）:%@",ascendingArr);
    
    
    
}
-(NSMutableArray *)heapCreate:(NSMutableArray *)array{
    NSInteger i =array.count;
    while (i > 0) {
        array = [self heapAdjast:array withStartIndex:i - 1 withEndIndex:array.count];
        i--;

    }
    return array;
    
    
}
-(NSMutableArray *)heapAdjast:(NSMutableArray *)items withStartIndex:(NSInteger)startIndex withEndIndex:(NSInteger)endIndex{
    
    NSNumber * temp = items[startIndex];
    NSInteger fatherIndex = startIndex+1;
    NSInteger maxChildIndex = 2 * fatherIndex;
    while (maxChildIndex <= endIndex) {
        if (maxChildIndex < endIndex && [items[maxChildIndex -1] floatValue] < [items[maxChildIndex] floatValue]) {
            maxChildIndex++;
        }
        if ([temp floatValue] < [items[maxChildIndex - 1] floatValue]) {
            items[fatherIndex -1] = items[maxChildIndex -1];
        }else{
            break;
        }
        fatherIndex = maxChildIndex;
        maxChildIndex = fatherIndex * 2;

    }
    items[fatherIndex -1] = temp;
    return items;
}


-(void)shellSort:(NSMutableArray *)ascendingArr{

    NSMutableArray * buckt =[self creatBucket];
    NSNumber * maxnumber =[self listMaxItem:ascendingArr];
    NSInteger maxLength = numberLength(maxnumber);
    for (int digit = 1; digit <= maxLength; digit++) {
        for (NSNumber * item in ascendingArr) {
            NSInteger baseNumber =[self fetchBaseNumber:item digit:digit];
            NSMutableArray * muArray = buckt[baseNumber];
            [muArray addObject:item];
        }
        
        NSInteger index = 0;
        for (int i =0; i < buckt.count; i++) {
            NSMutableArray * array =buckt[i];
            while (array.count != 0) {
                NSNumber * number =[array objectAtIndex:0];
                ascendingArr[index] = number;
                [array removeObjectAtIndex:0];
                index ++;
            }
        }
    }
    NSLog(@"哈希排序：%@",ascendingArr);

}
-(NSMutableArray *)creatBucket{
    
    NSMutableArray * bucket = [NSMutableArray array];
    for (int i = 0; i<1; i++) {
        NSMutableArray * arr =[NSMutableArray array];
        [bucket addObject:arr];
    }
    return bucket;
    
}
-(NSNumber *)listMaxItem:(NSArray *)list{

    NSNumber * maxNumber =list[0];
    for (NSNumber * number in list) {
        if ([maxNumber integerValue] < [number integerValue]) {
            maxNumber = number;
        }
        
    }
    return maxNumber;
}
NSInteger numberLength(NSNumber *number) {
    NSString *string = [NSString stringWithFormat:@"%ld", (long)[number integerValue]];
    return string.length;
}
- (NSInteger)fetchBaseNumber:(NSNumber *)number digit:(NSInteger)digit {
    if (digit > 0 && digit <= numberLength(number)) {
        NSMutableArray *numbersArray = [NSMutableArray array];
        NSString *string = [NSString stringWithFormat:@"%ld", [number integerValue]];
        for (int index = 0; index < numberLength(number); index++) {
            [numbersArray addObject:[string substringWithRange:NSMakeRange(index, 1)]];
        }
        NSString *str = numbersArray[numbersArray.count - digit];
        return [str integerValue];
    }
    return 0;
}






















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

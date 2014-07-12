; ModuleID = 'func1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.9.0"

define i32 @addUpTo(i32 %dest) nounwind ssp uwtable {
  %1 = alloca i32, align 4
  %sum = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %dest, i32* %1, align 4
  store i32 0, i32* %sum, align 4
  store i32 1, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %10, %0
  %3 = load i32* %i, align 4
  %4 = load i32* %1, align 4
  %5 = icmp ule i32 %3, %4
  br i1 %5, label %6, label %13

; <label>:6                                       ; preds = %2
  %7 = load i32* %i, align 4
  %8 = load i32* %sum, align 4
  %9 = add i32 %8, %7
  store i32 %9, i32* %sum, align 4
  br label %10

; <label>:10                                      ; preds = %6
  %11 = load i32* %i, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %i, align 4
  br label %2

; <label>:13                                      ; preds = %2
  %14 = load i32* %sum, align 4
  ret i32 %14
}

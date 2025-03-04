; ModuleID = '/home/spence/Documents/misery/college/RES/csr_vmul/csr_vmul/csr_vmul/hls/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%struct.CSR_Matrix = type { i32, i32, i32, [128 x i32], [128 x i32], [128 x float] }
%struct.Vector = type { [128 x float], i32 }

; Function Attrs: inaccessiblemem_or_argmemonly noinline willreturn
define void @apatb_csr_vmul_ir(%struct.CSR_Matrix* noalias nocapture nonnull readonly %matrix, %struct.Vector* noalias nocapture nonnull readonly %vector, %struct.Vector* noalias nocapture nonnull %out) local_unnamed_addr #0 {
entry:
  %matrix_copy.0 = alloca i32, align 512
  %matrix_copy.1 = alloca i32, align 512
  %matrix_copy.2 = alloca i32, align 512
  %matrix_copy.3 = alloca [128 x i32], align 512
  %matrix_copy.4 = alloca [128 x i32], align 512
  %matrix_copy.5 = alloca [128 x float], align 512
  %vector_copy.0 = alloca [128 x float], align 512
  %vector_copy.1 = alloca i32, align 512
  %out_copy.0 = alloca [128 x float], align 512
  %out_copy.1 = alloca i32, align 512
  call fastcc void @copy_in(%struct.CSR_Matrix* nonnull %matrix, i32* nonnull align 512 %matrix_copy.0, i32* nonnull align 512 %matrix_copy.1, i32* nonnull align 512 %matrix_copy.2, [128 x i32]* nonnull align 512 %matrix_copy.3, [128 x i32]* nonnull align 512 %matrix_copy.4, [128 x float]* nonnull align 512 %matrix_copy.5, %struct.Vector* nonnull %vector, [128 x float]* nonnull align 512 %vector_copy.0, i32* nonnull align 512 %vector_copy.1, %struct.Vector* nonnull %out, [128 x float]* nonnull align 512 %out_copy.0, i32* nonnull align 512 %out_copy.1)
  call void @apatb_csr_vmul_hw(i32* %matrix_copy.0, i32* %matrix_copy.1, i32* %matrix_copy.2, [128 x i32]* %matrix_copy.3, [128 x i32]* %matrix_copy.4, [128 x float]* %matrix_copy.5, [128 x float]* %vector_copy.0, i32* %vector_copy.1, [128 x float]* %out_copy.0, i32* %out_copy.1)
  call void @copy_back(%struct.CSR_Matrix* %matrix, i32* %matrix_copy.0, i32* %matrix_copy.1, i32* %matrix_copy.2, [128 x i32]* %matrix_copy.3, [128 x i32]* %matrix_copy.4, [128 x float]* %matrix_copy.5, %struct.Vector* %vector, [128 x float]* %vector_copy.0, i32* %vector_copy.1, %struct.Vector* %out, [128 x float]* %out_copy.0, i32* %out_copy.1)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in(%struct.CSR_Matrix* noalias readonly "unpacked"="0", i32* noalias nocapture align 512 "unpacked"="1.0" %.0, i32* noalias nocapture align 512 "unpacked"="1.1" %.1, i32* noalias nocapture align 512 "unpacked"="1.2" %.2, [128 x i32]* noalias align 512 "unpacked"="1.3" %.3, [128 x i32]* noalias align 512 "unpacked"="1.4" %.4, [128 x float]* noalias align 512 "unpacked"="1.5" %.5, %struct.Vector* noalias readonly "unpacked"="2", [128 x float]* noalias align 512 "unpacked"="3.0" %.01, i32* noalias nocapture align 512 "unpacked"="3.1" %.12, %struct.Vector* noalias readonly "unpacked"="4", [128 x float]* noalias align 512 "unpacked"="5.0" %.02, i32* noalias nocapture align 512 "unpacked"="5.1" %.13) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.CSR_Matrix(i32* align 512 %.0, i32* align 512 %.1, i32* align 512 %.2, [128 x i32]* align 512 %.3, [128 x i32]* align 512 %.4, [128 x float]* align 512 %.5, %struct.CSR_Matrix* %0)
  call fastcc void @onebyonecpy_hls.p0struct.Vector([128 x float]* align 512 %.01, i32* align 512 %.12, %struct.Vector* %1)
  call fastcc void @onebyonecpy_hls.p0struct.Vector([128 x float]* align 512 %.02, i32* align 512 %.13, %struct.Vector* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.CSR_Matrix(i32* noalias nocapture align 512 "unpacked"="0.0" %dst.01, i32* noalias nocapture align 512 "unpacked"="0.1" %dst.12, i32* noalias nocapture align 512 "unpacked"="0.2" %dst.23, [128 x i32]* noalias align 512 "unpacked"="0.3" %dst.34, [128 x i32]* noalias align 512 "unpacked"="0.4" %dst.45, [128 x float]* noalias align 512 "unpacked"="0.5" %dst.56, %struct.CSR_Matrix* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %struct.CSR_Matrix* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %src, i64 0, i32 0
  %1 = load i32, i32* %src.0, align 4
  store i32 %1, i32* %dst.01, align 512
  %src.1 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %src, i64 0, i32 1
  %2 = load i32, i32* %src.1, align 4
  store i32 %2, i32* %dst.12, align 512
  %src.2 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %src, i64 0, i32 2
  %3 = load i32, i32* %src.2, align 4
  store i32 %3, i32* %dst.23, align 512
  %src.3 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %src, i64 0, i32 3
  call void @arraycpy_hls.p0a128i32([128 x i32]* %dst.34, [128 x i32]* %src.3, i64 128)
  %src.4 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %src, i64 0, i32 4
  call void @arraycpy_hls.p0a128i32([128 x i32]* %dst.45, [128 x i32]* %src.4, i64 128)
  %src.5 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %src, i64 0, i32 5
  call void @arraycpy_hls.p0a128f32([128 x float]* %dst.56, [128 x float]* %src.5, i64 128)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a128i32([128 x i32]* %dst, [128 x i32]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [128 x i32]* %src, null
  %1 = icmp eq [128 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [128 x i32], [128 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [128 x i32], [128 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a128f32([128 x float]* %dst, [128 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [128 x float]* %src, null
  %1 = icmp eq [128 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [128 x float], [128 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [128 x float], [128 x float]* %src, i64 0, i64 %for.loop.idx2
  %3 = load float, float* %src.addr, align 4
  store float %3, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out(%struct.CSR_Matrix* noalias "unpacked"="0", i32* noalias nocapture readonly align 512 "unpacked"="1.0" %.0, i32* noalias nocapture readonly align 512 "unpacked"="1.1" %.1, i32* noalias nocapture readonly align 512 "unpacked"="1.2" %.2, [128 x i32]* noalias readonly align 512 "unpacked"="1.3" %.3, [128 x i32]* noalias readonly align 512 "unpacked"="1.4" %.4, [128 x float]* noalias readonly align 512 "unpacked"="1.5" %.5, %struct.Vector* noalias "unpacked"="2", [128 x float]* noalias readonly align 512 "unpacked"="3.0" %.01, i32* noalias nocapture readonly align 512 "unpacked"="3.1" %.12, %struct.Vector* noalias "unpacked"="4", [128 x float]* noalias readonly align 512 "unpacked"="5.0" %.02, i32* noalias nocapture readonly align 512 "unpacked"="5.1" %.13) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.CSR_Matrix.4(%struct.CSR_Matrix* %0, i32* align 512 %.0, i32* align 512 %.1, i32* align 512 %.2, [128 x i32]* align 512 %.3, [128 x i32]* align 512 %.4, [128 x float]* align 512 %.5)
  call fastcc void @onebyonecpy_hls.p0struct.Vector.16(%struct.Vector* %1, [128 x float]* align 512 %.01, i32* align 512 %.12)
  call fastcc void @onebyonecpy_hls.p0struct.Vector.16(%struct.Vector* %2, [128 x float]* align 512 %.02, i32* align 512 %.13)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.CSR_Matrix.4(%struct.CSR_Matrix* noalias "unpacked"="0" %dst, i32* noalias nocapture readonly align 512 "unpacked"="1.0" %src.01, i32* noalias nocapture readonly align 512 "unpacked"="1.1" %src.12, i32* noalias nocapture readonly align 512 "unpacked"="1.2" %src.23, [128 x i32]* noalias readonly align 512 "unpacked"="1.3" %src.34, [128 x i32]* noalias readonly align 512 "unpacked"="1.4" %src.45, [128 x float]* noalias readonly align 512 "unpacked"="1.5" %src.56) unnamed_addr #2 {
entry:
  %0 = icmp eq %struct.CSR_Matrix* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %dst, i64 0, i32 0
  %1 = load i32, i32* %src.01, align 512
  store i32 %1, i32* %dst.0, align 4
  %dst.1 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %dst, i64 0, i32 1
  %2 = load i32, i32* %src.12, align 512
  store i32 %2, i32* %dst.1, align 4
  %dst.2 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %dst, i64 0, i32 2
  %3 = load i32, i32* %src.23, align 512
  store i32 %3, i32* %dst.2, align 4
  %dst.3 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %dst, i64 0, i32 3
  call void @arraycpy_hls.p0a128i32([128 x i32]* %dst.3, [128 x i32]* %src.34, i64 128)
  %dst.4 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %dst, i64 0, i32 4
  call void @arraycpy_hls.p0a128i32([128 x i32]* %dst.4, [128 x i32]* %src.45, i64 128)
  %dst.5 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %dst, i64 0, i32 5
  call void @arraycpy_hls.p0a128f32([128 x float]* %dst.5, [128 x float]* %src.56, i64 128)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.Vector([128 x float]* noalias align 512 "unpacked"="0.0" %dst.01, i32* noalias nocapture align 512 "unpacked"="0.1" %dst.12, %struct.Vector* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %struct.Vector* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0 = getelementptr %struct.Vector, %struct.Vector* %src, i64 0, i32 0
  call void @arraycpy_hls.p0a128f32([128 x float]* %dst.01, [128 x float]* %src.0, i64 128)
  %src.1 = getelementptr %struct.Vector, %struct.Vector* %src, i64 0, i32 1
  %1 = load i32, i32* %src.1, align 4
  store i32 %1, i32* %dst.12, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.Vector.16(%struct.Vector* noalias "unpacked"="0" %dst, [128 x float]* noalias readonly align 512 "unpacked"="1.0" %src.01, i32* noalias nocapture readonly align 512 "unpacked"="1.1" %src.12) unnamed_addr #2 {
entry:
  %0 = icmp eq %struct.Vector* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0 = getelementptr %struct.Vector, %struct.Vector* %dst, i64 0, i32 0
  call void @arraycpy_hls.p0a128f32([128 x float]* %dst.0, [128 x float]* %src.01, i64 128)
  %dst.1 = getelementptr %struct.Vector, %struct.Vector* %dst, i64 0, i32 1
  %1 = load i32, i32* %src.12, align 512
  store i32 %1, i32* %dst.1, align 4
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare i8* @malloc(i64)

declare void @free(i8*)

declare void @apatb_csr_vmul_hw(i32*, i32*, i32*, [128 x i32]*, [128 x i32]*, [128 x float]*, [128 x float]*, i32*, [128 x float]*, i32*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back(%struct.CSR_Matrix* noalias "unpacked"="0", i32* noalias nocapture readonly align 512 "unpacked"="1.0" %.0, i32* noalias nocapture readonly align 512 "unpacked"="1.1" %.1, i32* noalias nocapture readonly align 512 "unpacked"="1.2" %.2, [128 x i32]* noalias readonly align 512 "unpacked"="1.3" %.3, [128 x i32]* noalias readonly align 512 "unpacked"="1.4" %.4, [128 x float]* noalias readonly align 512 "unpacked"="1.5" %.5, %struct.Vector* noalias "unpacked"="2", [128 x float]* noalias readonly align 512 "unpacked"="3.0" %.01, i32* noalias nocapture readonly align 512 "unpacked"="3.1" %.12, %struct.Vector* noalias "unpacked"="4", [128 x float]* noalias readonly align 512 "unpacked"="5.0" %.02, i32* noalias nocapture readonly align 512 "unpacked"="5.1" %.13) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.Vector.16(%struct.Vector* %2, [128 x float]* align 512 %.02, i32* align 512 %.13)
  ret void
}

declare void @csr_vmul_hw_stub(%struct.CSR_Matrix* noalias nocapture nonnull readonly, %struct.Vector* noalias nocapture nonnull readonly, %struct.Vector* noalias nocapture nonnull)

define void @csr_vmul_hw_stub_wrapper(i32*, i32*, i32*, [128 x i32]*, [128 x i32]*, [128 x float]*, [128 x float]*, i32*, [128 x float]*, i32*) #5 {
entry:
  %10 = call i8* @malloc(i64 1548)
  %11 = bitcast i8* %10 to %struct.CSR_Matrix*
  %12 = call i8* @malloc(i64 516)
  %13 = bitcast i8* %12 to %struct.Vector*
  %14 = call i8* @malloc(i64 516)
  %15 = bitcast i8* %14 to %struct.Vector*
  call void @copy_out(%struct.CSR_Matrix* %11, i32* %0, i32* %1, i32* %2, [128 x i32]* %3, [128 x i32]* %4, [128 x float]* %5, %struct.Vector* %13, [128 x float]* %6, i32* %7, %struct.Vector* %15, [128 x float]* %8, i32* %9)
  call void @csr_vmul_hw_stub(%struct.CSR_Matrix* %11, %struct.Vector* %13, %struct.Vector* %15)
  call void @copy_in(%struct.CSR_Matrix* %11, i32* %0, i32* %1, i32* %2, [128 x i32]* %3, [128 x i32]* %4, [128 x float]* %5, %struct.Vector* %13, [128 x float]* %6, i32* %7, %struct.Vector* %15, [128 x float]* %8, i32* %9)
  call void @free(i8* %10)
  call void @free(i8* %12)
  call void @free(i8* %14)
  ret void
}

attributes #0 = { inaccessiblemem_or_argmemonly noinline willreturn "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}

; ModuleID = '/home/spence/Documents/misery/college/RES/csr_vmul/csr_vmul/csr_vmul/hls/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%struct.CSR_Matrix = type { i32, i32, i32, [1024 x i32], [1024 x i32], [1024 x float] }
%struct.Vector = type { [1024 x float], i32 }

; Function Attrs: noinline
define void @apatb_csr_vmul_ir(%struct.CSR_Matrix* noalias nocapture nonnull readonly %matrix, %struct.Vector* noalias nocapture nonnull readonly %vector, %struct.Vector* noalias nocapture nonnull %out) local_unnamed_addr #0 {
entry:
  %.0 = call i8* @malloc(i64 4)
  %matrix_copy.0 = bitcast i8* %.0 to i32*
  %.1 = call i8* @malloc(i64 4)
  %matrix_copy.1 = bitcast i8* %.1 to i32*
  %.2 = call i8* @malloc(i64 4)
  %matrix_copy.2 = bitcast i8* %.2 to i32*
  %.3 = call i8* @malloc(i64 4096)
  %matrix_copy.3 = bitcast i8* %.3 to [1024 x i32]*
  %.4 = call i8* @malloc(i64 4096)
  %matrix_copy.4 = bitcast i8* %.4 to [1024 x i32]*
  %.5 = call i8* @malloc(i64 4096)
  %matrix_copy.5 = bitcast i8* %.5 to [1024 x float]*
  %.01 = call i8* @malloc(i64 4096)
  %vector_copy.0 = bitcast i8* %.01 to [1024 x float]*
  %.12 = call i8* @malloc(i64 4)
  %vector_copy.1 = bitcast i8* %.12 to i32*
  %.03 = call i8* @malloc(i64 4096)
  %out_copy.0 = bitcast i8* %.03 to [1024 x float]*
  %.14 = call i8* @malloc(i64 4)
  %out_copy.1 = bitcast i8* %.14 to i32*
  call fastcc void @copy_in(%struct.CSR_Matrix* nonnull %matrix, i32* %matrix_copy.0, i32* %matrix_copy.1, i32* %matrix_copy.2, [1024 x i32]* %matrix_copy.3, [1024 x i32]* %matrix_copy.4, [1024 x float]* %matrix_copy.5, %struct.Vector* nonnull %vector, [1024 x float]* %vector_copy.0, i32* %vector_copy.1, %struct.Vector* nonnull %out, [1024 x float]* %out_copy.0, i32* %out_copy.1)
  call void @apatb_csr_vmul_hw(i32* %matrix_copy.0, i32* %matrix_copy.1, i32* %matrix_copy.2, [1024 x i32]* %matrix_copy.3, [1024 x i32]* %matrix_copy.4, [1024 x float]* %matrix_copy.5, [1024 x float]* %vector_copy.0, i32* %vector_copy.1, [1024 x float]* %out_copy.0, i32* %out_copy.1)
  call void @copy_back(%struct.CSR_Matrix* %matrix, i32* %matrix_copy.0, i32* %matrix_copy.1, i32* %matrix_copy.2, [1024 x i32]* %matrix_copy.3, [1024 x i32]* %matrix_copy.4, [1024 x float]* %matrix_copy.5, %struct.Vector* %vector, [1024 x float]* %vector_copy.0, i32* %vector_copy.1, %struct.Vector* %out, [1024 x float]* %out_copy.0, i32* %out_copy.1)
  call void @free(i8* %.0)
  call void @free(i8* %.1)
  call void @free(i8* %.2)
  call void @free(i8* %.3)
  call void @free(i8* %.4)
  call void @free(i8* %.5)
  call void @free(i8* %.01)
  call void @free(i8* %.12)
  call void @free(i8* %.03)
  call void @free(i8* %.14)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in(%struct.CSR_Matrix* readonly "unpacked"="0", i32* nocapture "unpacked"="1.0" %.0, i32* nocapture "unpacked"="1.1" %.1, i32* nocapture "unpacked"="1.2" %.2, [1024 x i32]* "unpacked"="1.3" %.3, [1024 x i32]* "unpacked"="1.4" %.4, [1024 x float]* "unpacked"="1.5" %.5, %struct.Vector* readonly "unpacked"="2", [1024 x float]* "unpacked"="3.0" %.01, i32* nocapture "unpacked"="3.1" %.12, %struct.Vector* readonly "unpacked"="4", [1024 x float]* "unpacked"="5.0" %.02, i32* nocapture "unpacked"="5.1" %.13) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.CSR_Matrix(i32* %.0, i32* %.1, i32* %.2, [1024 x i32]* %.3, [1024 x i32]* %.4, [1024 x float]* %.5, %struct.CSR_Matrix* %0)
  call fastcc void @onebyonecpy_hls.p0struct.Vector([1024 x float]* %.01, i32* %.12, %struct.Vector* %1)
  call fastcc void @onebyonecpy_hls.p0struct.Vector([1024 x float]* %.02, i32* %.13, %struct.Vector* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.CSR_Matrix(i32* nocapture "unpacked"="0.0" %dst.01, i32* nocapture "unpacked"="0.1" %dst.12, i32* nocapture "unpacked"="0.2" %dst.23, [1024 x i32]* "unpacked"="0.3" %dst.34, [1024 x i32]* "unpacked"="0.4" %dst.45, [1024 x float]* "unpacked"="0.5" %dst.56, %struct.CSR_Matrix* readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %struct.CSR_Matrix* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %src, i64 0, i32 0
  %1 = load i32, i32* %src.0, align 4
  store i32 %1, i32* %dst.01, align 4
  %src.1 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %src, i64 0, i32 1
  %2 = load i32, i32* %src.1, align 4
  store i32 %2, i32* %dst.12, align 4
  %src.2 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %src, i64 0, i32 2
  %3 = load i32, i32* %src.2, align 4
  store i32 %3, i32* %dst.23, align 4
  %src.3 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %src, i64 0, i32 3
  call void @arraycpy_hls.p0a1024i32([1024 x i32]* %dst.34, [1024 x i32]* %src.3, i64 1024)
  %src.4 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %src, i64 0, i32 4
  call void @arraycpy_hls.p0a1024i32([1024 x i32]* %dst.45, [1024 x i32]* %src.4, i64 1024)
  %src.5 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %src, i64 0, i32 5
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.56, [1024 x float]* %src.5, i64 1024)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1024i32([1024 x i32]* %dst, [1024 x i32]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [1024 x i32]* %src, null
  %1 = icmp eq [1024 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1024 x i32], [1024 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [1024 x i32], [1024 x i32]* %src, i64 0, i64 %for.loop.idx2
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
define void @arraycpy_hls.p0a1024f32([1024 x float]* %dst, [1024 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [1024 x float]* %src, null
  %1 = icmp eq [1024 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1024 x float], [1024 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [1024 x float], [1024 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @copy_out(%struct.CSR_Matrix* "unpacked"="0", i32* nocapture readonly "unpacked"="1.0" %.0, i32* nocapture readonly "unpacked"="1.1" %.1, i32* nocapture readonly "unpacked"="1.2" %.2, [1024 x i32]* readonly "unpacked"="1.3" %.3, [1024 x i32]* readonly "unpacked"="1.4" %.4, [1024 x float]* readonly "unpacked"="1.5" %.5, %struct.Vector* "unpacked"="2", [1024 x float]* readonly "unpacked"="3.0" %.01, i32* nocapture readonly "unpacked"="3.1" %.12, %struct.Vector* "unpacked"="4", [1024 x float]* readonly "unpacked"="5.0" %.02, i32* nocapture readonly "unpacked"="5.1" %.13) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.CSR_Matrix.4(%struct.CSR_Matrix* %0, i32* %.0, i32* %.1, i32* %.2, [1024 x i32]* %.3, [1024 x i32]* %.4, [1024 x float]* %.5)
  call fastcc void @onebyonecpy_hls.p0struct.Vector.16(%struct.Vector* %1, [1024 x float]* %.01, i32* %.12)
  call fastcc void @onebyonecpy_hls.p0struct.Vector.16(%struct.Vector* %2, [1024 x float]* %.02, i32* %.13)
  ret void
}

declare i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.CSR_Matrix.4(%struct.CSR_Matrix* "unpacked"="0" %dst, i32* nocapture readonly "unpacked"="1.0" %src.01, i32* nocapture readonly "unpacked"="1.1" %src.12, i32* nocapture readonly "unpacked"="1.2" %src.23, [1024 x i32]* readonly "unpacked"="1.3" %src.34, [1024 x i32]* readonly "unpacked"="1.4" %src.45, [1024 x float]* readonly "unpacked"="1.5" %src.56) unnamed_addr #2 {
entry:
  %0 = icmp eq %struct.CSR_Matrix* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %dst, i64 0, i32 0
  %1 = load i32, i32* %src.01, align 4
  store i32 %1, i32* %dst.0, align 4
  %dst.1 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %dst, i64 0, i32 1
  %2 = load i32, i32* %src.12, align 4
  store i32 %2, i32* %dst.1, align 4
  %dst.2 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %dst, i64 0, i32 2
  %3 = load i32, i32* %src.23, align 4
  store i32 %3, i32* %dst.2, align 4
  %dst.3 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %dst, i64 0, i32 3
  call void @arraycpy_hls.p0a1024i32([1024 x i32]* %dst.3, [1024 x i32]* %src.34, i64 1024)
  %dst.4 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %dst, i64 0, i32 4
  call void @arraycpy_hls.p0a1024i32([1024 x i32]* %dst.4, [1024 x i32]* %src.45, i64 1024)
  %dst.5 = getelementptr %struct.CSR_Matrix, %struct.CSR_Matrix* %dst, i64 0, i32 5
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.5, [1024 x float]* %src.56, i64 1024)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.Vector([1024 x float]* "unpacked"="0.0" %dst.01, i32* nocapture "unpacked"="0.1" %dst.12, %struct.Vector* readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %struct.Vector* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0 = getelementptr %struct.Vector, %struct.Vector* %src, i64 0, i32 0
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.01, [1024 x float]* %src.0, i64 1024)
  %src.1 = getelementptr %struct.Vector, %struct.Vector* %src, i64 0, i32 1
  %1 = load i32, i32* %src.1, align 4
  store i32 %1, i32* %dst.12, align 4
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.Vector.16(%struct.Vector* "unpacked"="0" %dst, [1024 x float]* readonly "unpacked"="1.0" %src.01, i32* nocapture readonly "unpacked"="1.1" %src.12) unnamed_addr #2 {
entry:
  %0 = icmp eq %struct.Vector* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0 = getelementptr %struct.Vector, %struct.Vector* %dst, i64 0, i32 0
  call void @arraycpy_hls.p0a1024f32([1024 x float]* %dst.0, [1024 x float]* %src.01, i64 1024)
  %dst.1 = getelementptr %struct.Vector, %struct.Vector* %dst, i64 0, i32 1
  %1 = load i32, i32* %src.12, align 4
  store i32 %1, i32* %dst.1, align 4
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare void @apatb_csr_vmul_hw(i32*, i32*, i32*, [1024 x i32]*, [1024 x i32]*, [1024 x float]*, [1024 x float]*, i32*, [1024 x float]*, i32*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back(%struct.CSR_Matrix* "unpacked"="0", i32* nocapture readonly "unpacked"="1.0" %.0, i32* nocapture readonly "unpacked"="1.1" %.1, i32* nocapture readonly "unpacked"="1.2" %.2, [1024 x i32]* readonly "unpacked"="1.3" %.3, [1024 x i32]* readonly "unpacked"="1.4" %.4, [1024 x float]* readonly "unpacked"="1.5" %.5, %struct.Vector* "unpacked"="2", [1024 x float]* readonly "unpacked"="3.0" %.01, i32* nocapture readonly "unpacked"="3.1" %.12, %struct.Vector* "unpacked"="4", [1024 x float]* readonly "unpacked"="5.0" %.02, i32* nocapture readonly "unpacked"="5.1" %.13) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.Vector.16(%struct.Vector* %2, [1024 x float]* %.02, i32* %.13)
  ret void
}

declare void @csr_vmul_hw_stub(%struct.CSR_Matrix* noalias nocapture nonnull readonly, %struct.Vector* noalias nocapture nonnull readonly, %struct.Vector* noalias nocapture nonnull)

define void @csr_vmul_hw_stub_wrapper(i32*, i32*, i32*, [1024 x i32]*, [1024 x i32]*, [1024 x float]*, [1024 x float]*, i32*, [1024 x float]*, i32*) #5 {
entry:
  %10 = call i8* @malloc(i64 12300)
  %11 = bitcast i8* %10 to %struct.CSR_Matrix*
  %12 = call i8* @malloc(i64 4100)
  %13 = bitcast i8* %12 to %struct.Vector*
  %14 = call i8* @malloc(i64 4100)
  %15 = bitcast i8* %14 to %struct.Vector*
  call void @copy_out(%struct.CSR_Matrix* %11, i32* %0, i32* %1, i32* %2, [1024 x i32]* %3, [1024 x i32]* %4, [1024 x float]* %5, %struct.Vector* %13, [1024 x float]* %6, i32* %7, %struct.Vector* %15, [1024 x float]* %8, i32* %9)
  call void @csr_vmul_hw_stub(%struct.CSR_Matrix* %11, %struct.Vector* %13, %struct.Vector* %15)
  call void @copy_in(%struct.CSR_Matrix* %11, i32* %0, i32* %1, i32* %2, [1024 x i32]* %3, [1024 x i32]* %4, [1024 x float]* %5, %struct.Vector* %13, [1024 x float]* %6, i32* %7, %struct.Vector* %15, [1024 x float]* %8, i32* %9)
  call void @free(i8* %10)
  call void @free(i8* %12)
  call void @free(i8* %14)
  ret void
}

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
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

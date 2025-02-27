// RUN: %run_test hipify "%s" "%t" %hipify_args 3 --skip-excluded-preprocessor-conditional-blocks --experimental --use-hip-data-types %clang_args -ferror-limit=500

// CHECK: #include <hip/hip_runtime.h>
#include <cuda_runtime.h>
// CHECK: #include "hip/hip_complex.h"
#include "cuComplex.h"
#include <stdio.h>
// CHECK: #include "hipsparse.h"
#include "cusparse.h"
// CHECK-NOT: #include "hipsparse.h"

int main() {
  printf("17. cuSPARSE API to hipSPARSE API synthetic test\n");

  // CHECK: hipsparseHandle_t handle_t;
  cusparseHandle_t handle_t;

  // CHECK: hipsparseMatDescr_t matDescr_t, matDescr_t_2, matDescr_A, matDescr_C;
  cusparseMatDescr_t matDescr_t, matDescr_t_2, matDescr_A, matDescr_C;

  // CHECK: hipsparseColorInfo_t colorInfo_t;
  cusparseColorInfo_t colorInfo_t;

  // CHECK: hipsparseOperation_t sparseOperation_t;
  // CHECK-NEXT: hipsparseOperation_t OPERATION_NON_TRANSPOSE = HIPSPARSE_OPERATION_NON_TRANSPOSE;
  // CHECK-NEXT: hipsparseOperation_t OPERATION_TRANSPOSE = HIPSPARSE_OPERATION_TRANSPOSE;
  // CHECK-NEXT: hipsparseOperation_t OPERATION_CONJUGATE_TRANSPOSE = HIPSPARSE_OPERATION_CONJUGATE_TRANSPOSE;
  cusparseOperation_t sparseOperation_t;
  cusparseOperation_t OPERATION_NON_TRANSPOSE = CUSPARSE_OPERATION_NON_TRANSPOSE;
  cusparseOperation_t OPERATION_TRANSPOSE = CUSPARSE_OPERATION_TRANSPOSE;
  cusparseOperation_t OPERATION_CONJUGATE_TRANSPOSE = CUSPARSE_OPERATION_CONJUGATE_TRANSPOSE;

  // CHECK: hipsparseIndexBase_t indexBase_t;
  // CHECK-NEXT: hipsparseIndexBase_t INDEX_BASE_ZERO = HIPSPARSE_INDEX_BASE_ZERO;
  // CHECK-NEXT: hipsparseIndexBase_t INDEX_BASE_ONE = HIPSPARSE_INDEX_BASE_ONE;
  cusparseIndexBase_t indexBase_t;
  cusparseIndexBase_t INDEX_BASE_ZERO = CUSPARSE_INDEX_BASE_ZERO;
  cusparseIndexBase_t INDEX_BASE_ONE = CUSPARSE_INDEX_BASE_ONE;

  // CHECK: hipsparseMatrixType_t matrixType_t;
  // CHECK-NEXT: hipsparseMatrixType_t MATRIX_TYPE_GENERAL = HIPSPARSE_MATRIX_TYPE_GENERAL;
  // CHECK-NEXT: hipsparseMatrixType_t MATRIX_TYPE_SYMMETRIC = HIPSPARSE_MATRIX_TYPE_SYMMETRIC;
  // CHECK-NEXT: hipsparseMatrixType_t MATRIX_TYPE_HERMITIAN = HIPSPARSE_MATRIX_TYPE_HERMITIAN;
  // CHECK-NEXT: hipsparseMatrixType_t MATRIX_TYPE_TRIANGULAR = HIPSPARSE_MATRIX_TYPE_TRIANGULAR;
  cusparseMatrixType_t matrixType_t;
  cusparseMatrixType_t MATRIX_TYPE_GENERAL = CUSPARSE_MATRIX_TYPE_GENERAL;
  cusparseMatrixType_t MATRIX_TYPE_SYMMETRIC = CUSPARSE_MATRIX_TYPE_SYMMETRIC;
  cusparseMatrixType_t MATRIX_TYPE_HERMITIAN = CUSPARSE_MATRIX_TYPE_HERMITIAN;
  cusparseMatrixType_t MATRIX_TYPE_TRIANGULAR = CUSPARSE_MATRIX_TYPE_TRIANGULAR;

  // CHECK: hipsparseDiagType_t diagType_t;
  // CHECK-NEXT: hipsparseDiagType_t DIAG_TYPE_NON_UNIT = HIPSPARSE_DIAG_TYPE_NON_UNIT;
  // CHECK-NEXT: hipsparseDiagType_t DIAG_TYPE_UNIT = HIPSPARSE_DIAG_TYPE_UNIT;
  cusparseDiagType_t diagType_t;
  cusparseDiagType_t DIAG_TYPE_NON_UNIT = CUSPARSE_DIAG_TYPE_NON_UNIT;
  cusparseDiagType_t DIAG_TYPE_UNIT = CUSPARSE_DIAG_TYPE_UNIT;

  // CHECK: hipsparseFillMode_t fillMode_t;
  // CHECK-NEXT: hipsparseFillMode_t FILL_MODE_LOWER = HIPSPARSE_FILL_MODE_LOWER;
  // CHECK-NEXT: hipsparseFillMode_t FILL_MODE_UPPER = HIPSPARSE_FILL_MODE_UPPER;
  cusparseFillMode_t fillMode_t;
  cusparseFillMode_t FILL_MODE_LOWER = CUSPARSE_FILL_MODE_LOWER;
  cusparseFillMode_t FILL_MODE_UPPER = CUSPARSE_FILL_MODE_UPPER;

  // CHECK: hipsparseAction_t action_t, copyValues;
  // CHECK-NEXT: hipsparseAction_t ACTION_SYMBOLIC = HIPSPARSE_ACTION_SYMBOLIC;
  // CHECK-NEXT: hipsparseAction_t ACTION_NUMERIC = HIPSPARSE_ACTION_NUMERIC;
  cusparseAction_t action_t, copyValues;
  cusparseAction_t ACTION_SYMBOLIC = CUSPARSE_ACTION_SYMBOLIC;
  cusparseAction_t ACTION_NUMERIC = CUSPARSE_ACTION_NUMERIC;

  // CHECK: hipsparseDirection_t direction_t;
  // CHECK-NEXT: hipsparseDirection_t DIRECTION_ROW = HIPSPARSE_DIRECTION_ROW;
  // CHECK-NEXT: hipsparseDirection_t DIRECTION_COLUMN = HIPSPARSE_DIRECTION_COLUMN;
  cusparseDirection_t direction_t;
  cusparseDirection_t DIRECTION_ROW = CUSPARSE_DIRECTION_ROW;
  cusparseDirection_t DIRECTION_COLUMN = CUSPARSE_DIRECTION_COLUMN;

  // CHECK: hipsparseSolvePolicy_t solvePolicy_t;
  // CHECK-NEXT: hipsparseSolvePolicy_t SOLVE_POLICY_NO_LEVEL = HIPSPARSE_SOLVE_POLICY_NO_LEVEL;
  // CHECK-NEXT: hipsparseSolvePolicy_t SOLVE_POLICY_USE_LEVEL = HIPSPARSE_SOLVE_POLICY_USE_LEVEL;
  cusparseSolvePolicy_t solvePolicy_t;
  cusparseSolvePolicy_t SOLVE_POLICY_NO_LEVEL = CUSPARSE_SOLVE_POLICY_NO_LEVEL;
  cusparseSolvePolicy_t SOLVE_POLICY_USE_LEVEL = CUSPARSE_SOLVE_POLICY_USE_LEVEL;

  // CHECK: hipsparsePointerMode_t pointerMode_t;
  // CHECK-NEXT: hipsparsePointerMode_t POINTER_MODE_HOST = HIPSPARSE_POINTER_MODE_HOST;
  // CHECK-NEXT: hipsparsePointerMode_t POINTER_MODE_DEVICE = HIPSPARSE_POINTER_MODE_DEVICE;
  cusparsePointerMode_t pointerMode_t;
  cusparsePointerMode_t POINTER_MODE_HOST = CUSPARSE_POINTER_MODE_HOST;
  cusparsePointerMode_t POINTER_MODE_DEVICE = CUSPARSE_POINTER_MODE_DEVICE;

  // CHECK: hipsparseStatus_t status_t;
  // CHECK-NEXT: hipsparseStatus_t STATUS_SUCCESS = HIPSPARSE_STATUS_SUCCESS;
  // CHECK-NEXT: hipsparseStatus_t STATUS_NOT_INITIALIZED = HIPSPARSE_STATUS_NOT_INITIALIZED;
  // CHECK-NEXT: hipsparseStatus_t STATUS_ALLOC_FAILED = HIPSPARSE_STATUS_ALLOC_FAILED;
  // CHECK-NEXT: hipsparseStatus_t STATUS_INVALID_VALUE = HIPSPARSE_STATUS_INVALID_VALUE;
  // CHECK-NEXT: hipsparseStatus_t STATUS_ARCH_MISMATCH = HIPSPARSE_STATUS_ARCH_MISMATCH;
  // CHECK-NEXT: hipsparseStatus_t STATUS_MAPPING_ERROR = HIPSPARSE_STATUS_MAPPING_ERROR;
  // CHECK-NEXT: hipsparseStatus_t STATUS_EXECUTION_FAILED = HIPSPARSE_STATUS_EXECUTION_FAILED;
  // CHECK-NEXT: hipsparseStatus_t STATUS_INTERNAL_ERROR = HIPSPARSE_STATUS_INTERNAL_ERROR;
  // CHECK-NEXT: hipsparseStatus_t STATUS_MATRIX_TYPE_NOT_SUPPORTED = HIPSPARSE_STATUS_MATRIX_TYPE_NOT_SUPPORTED;
  // CHECK-NEXT: hipsparseStatus_t STATUS_ZERO_PIVOT = HIPSPARSE_STATUS_ZERO_PIVOT;
  cusparseStatus_t status_t;
  cusparseStatus_t STATUS_SUCCESS = CUSPARSE_STATUS_SUCCESS;
  cusparseStatus_t STATUS_NOT_INITIALIZED = CUSPARSE_STATUS_NOT_INITIALIZED;
  cusparseStatus_t STATUS_ALLOC_FAILED = CUSPARSE_STATUS_ALLOC_FAILED;
  cusparseStatus_t STATUS_INVALID_VALUE = CUSPARSE_STATUS_INVALID_VALUE;
  cusparseStatus_t STATUS_ARCH_MISMATCH = CUSPARSE_STATUS_ARCH_MISMATCH;
  cusparseStatus_t STATUS_MAPPING_ERROR = CUSPARSE_STATUS_MAPPING_ERROR;
  cusparseStatus_t STATUS_EXECUTION_FAILED = CUSPARSE_STATUS_EXECUTION_FAILED;
  cusparseStatus_t STATUS_INTERNAL_ERROR = CUSPARSE_STATUS_INTERNAL_ERROR;
  cusparseStatus_t STATUS_MATRIX_TYPE_NOT_SUPPORTED = CUSPARSE_STATUS_MATRIX_TYPE_NOT_SUPPORTED;
  cusparseStatus_t STATUS_ZERO_PIVOT = CUSPARSE_STATUS_ZERO_PIVOT;

  // CHECK: hipStream_t stream_t;
  cudaStream_t stream_t;

  int iVal = 0;
  int batchCount = 0;
  int m = 0;
  int n = 0;
  int mb = 0;
  int nb = 0;
  int nnza = 0;
  int nnzb = 0;
  int nnzc = 0;
  int nnzPerRow = 0;
  int nnzPerCol = 0;
  int innz = 0;
  int lda = 0;
  int blockDim = 0;
  int csrSortedRowPtr = 0;
  int csrSortedColInd = 0;
  int cscRowIndA = 0;
  int cscColPtrA = 0;
  int csrRowPtrA = 0;
  int csrColIndA = 0;
  int ncolors = 0;
  int coloring = 0;
  int reordering = 0;
  int bscRowInd = 0;
  int bsrRowPtrA = 0;
  int bsrRowPtrC = 0;
  int csrRowPtrC = 0;
  int bscColPtr = 0;
  int bsrColIndA = 0;
  int bsrColIndC = 0;
  int csrColIndC = 0;
  int rowBlockDim = 0;
  int rowBlockDimA = 0;
  int colBlockDimA = 0;
  int rowBlockDimC = 0;
  int colBlockDim = 0;
  int colBlockDimC = 0;
  int bsrSortedRowPtr = 0;
  int bsrSortedRowPtrC = 0;
  int bsrSortedColInd = 0;
  int bsrSortedColIndC = 0;
  int bufferSizeInBytes = 0;
  int nnzTotalDevHostPtr = 0;
  int nnzPerRowCol = 0;
  int userEllWidth = 0;
  int64_t size = 0;
  int64_t nnz = 0;
  int64_t rows = 0;
  int64_t cols = 0;
  int64_t ellCols = 0;
  int64_t ellBlockSize = 0;
  int64_t batchStride = 0;
  int64_t offsetsBatchStride = 0;
  int64_t columnsValuesBatchStride = 0;
  int64_t ld = 0;
  void *indices = nullptr;
  void *values = nullptr;
  void *cooRowInd = nullptr;
  int icooRowInd = 0;
  void *cscRowInd = nullptr;
  void *csrColInd = nullptr;
  void *cooColInd = nullptr;
  void *ellColInd = nullptr;
  void *cooValues = nullptr;
  void *csrValues = nullptr;
  void *cscValues = nullptr;
  void *ellValue = nullptr;
  void *csrRowOffsets = nullptr;
  void *cscColOffsets = nullptr;
  void *cooRows = nullptr;
  int icooRows = 0;
  void *cooColumns = nullptr;
  int icooColumns = 0;
  void *data = nullptr;
  void *alpha = nullptr;
  void *beta = nullptr;
  void *pBuffer = nullptr;
  int *P = nullptr;
  void *tempBuffer = nullptr;
  void *c_coeff = nullptr;
  void *s_coeff = nullptr;
  size_t dataSize = 0;
  size_t bufferSize = 0;
  double dfractionToColor = 0.f;
  float ffractionToColor = 0.f;
  double bsrValA = 0.f;
  double csrValA = 0.f;
  float fcsrValA = 0.f;
  double csrValC = 0.f;
  float fcsrValC = 0.f;
  float csrSortedVal = 0.f;
  float cscSortedVal = 0.f;
  float csrSortedValA = 0.f;
  double dcsrSortedVal = 0.f;
  double dcscSortedVal = 0.f;
  double dcsrSortedValA = 0.f;
  double dbsrSortedVal = 0.f;
  double dbsrSortedValA = 0.f;
  double dbsrSortedValC = 0.f;
  float fbsrSortedVal = 0.f;
  float fbsrSortedValA = 0.f;
  float fbsrSortedValC = 0.f;
  float fcsrSortedValC = 0.f;
  double dcsrSortedValC = 0.f;
  double percentage = 0.f;
  float fpercentage = 0.f;
  double dthreshold = 0.f;
  float fthreshold = 0.f;
  double dtol = 0.f;
  float ftol = 0.f;
  double dbscVal = 0.f;
  float fbscVal = 0.f;
  double dA = 0.f;
  float fA = 0.f;
  int algo = 0;
  double dds = 0.f;
  double ddl = 0.f;
  double dd = 0.f;
  double ddu = 0.f;
  double ddw = 0.f;
  double dx = 0.f;
  float fds = 0.f;
  float fdl = 0.f;
  float fd = 0.f;
  float fdu = 0.f;
  float fdw = 0.f;
  float fx = 0.f;
  pruneInfo_t prune_info;

  // CHECK: hipDoubleComplex dcomplex, dcomplexA, dComplexbsrSortedValA, dComplexbsrSortedValC, dComplexcsrSortedValA, dComplexcsrSortedValC, dcomplextol, dComplexbsrSortedVal, dComplexbscVal, dComplexcscSortedVal, dcomplexds, dcomplexdl, dcomplexd, dcomplexdu, dcomplexdw, dcomplexx;
  cuDoubleComplex dcomplex, dcomplexA, dComplexbsrSortedValA, dComplexbsrSortedValC, dComplexcsrSortedValA, dComplexcsrSortedValC, dcomplextol, dComplexbsrSortedVal, dComplexbscVal, dComplexcscSortedVal, dcomplexds, dcomplexdl, dcomplexd, dcomplexdu, dcomplexdw, dcomplexx;

  // CHECK: hipComplex complex, complexA, complexbsrValA, complexbsrSortedValC, complexcsrSortedValA, complexcsrSortedValC, complextol, complexbsrSortedVal, complexbscVal, complexcscSortedVal, complexds, complexdl, complexd, complexdu, complexdw, complexx;
  cuComplex complex, complexA, complexbsrValA, complexbsrSortedValC, complexcsrSortedValA, complexcsrSortedValC, complextol, complexbsrSortedVal, complexbscVal, complexcscSortedVal, complexds, complexdl, complexd, complexdu, complexdw, complexx;

  // CHECK: hipsparseOperation_t opA, opB;
  cusparseOperation_t opA, opB;

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCreate(cusparseHandle_t* handle);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCreate(hipsparseHandle_t* handle);
  // CHECK: status_t = hipsparseCreate(&handle_t);
  status_t = cusparseCreate(&handle_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDestroy(cusparseHandle_t handle);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDestroy(hipsparseHandle_t handle);
  // CHECK: status_t = hipsparseDestroy(handle_t);
  status_t = cusparseDestroy(handle_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSetStream(cusparseHandle_t handle, cudaStream_t streamId);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSetStream(hipsparseHandle_t handle, hipStream_t streamId);
  // CHECK: status_t = hipsparseSetStream(handle_t, stream_t);
  status_t = cusparseSetStream(handle_t, stream_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseGetStream(cusparseHandle_t handle, cudaStream_t* streamId);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseGetStream(hipsparseHandle_t handle, hipStream_t* streamId);
  // CHECK: status_t = hipsparseGetStream(handle_t, &stream_t);
  status_t = cusparseGetStream(handle_t, &stream_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSetPointerMode(cusparseHandle_t handle, cusparsePointerMode_t mode);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSetPointerMode(hipsparseHandle_t handle, hipsparsePointerMode_t mode);
  // CHECK: status_t = hipsparseSetPointerMode(handle_t, pointerMode_t);
  status_t = cusparseSetPointerMode(handle_t, pointerMode_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseGetPointerMode(cusparseHandle_t handle, cusparsePointerMode_t* mode);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseGetPointerMode(hipsparseHandle_t handle, hipsparsePointerMode_t* mode);
  // CHECK: status_t = hipsparseGetPointerMode(handle_t, &pointerMode_t);
  status_t = cusparseGetPointerMode(handle_t, &pointerMode_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseGetVersion(cusparseHandle_t handle, int* version);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseGetVersion(hipsparseHandle_t handle, int* version);
  // CHECK: status_t = hipsparseGetVersion(handle_t, &iVal);
  status_t = cusparseGetVersion(handle_t, &iVal);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCreateMatDescr(cusparseMatDescr_t* descrA);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCreateMatDescr(hipsparseMatDescr_t* descrA);
  // CHECK: status_t = hipsparseCreateMatDescr(&matDescr_t);
  status_t = cusparseCreateMatDescr(&matDescr_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDestroyMatDescr(cusparseMatDescr_t descrA);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDestroyMatDescr(hipsparseMatDescr_t descrA);
  // CHECK: status_t = hipsparseDestroyMatDescr(matDescr_t);
  status_t = cusparseDestroyMatDescr(matDescr_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSetMatIndexBase(cusparseMatDescr_t descrA, cusparseIndexBase_t base);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSetMatIndexBase(hipsparseMatDescr_t descrA, hipsparseIndexBase_t base);
  // CHECK: status_t = hipsparseSetMatIndexBase(matDescr_t, indexBase_t);
  status_t = cusparseSetMatIndexBase(matDescr_t, indexBase_t);

  // CUDA: cusparseIndexBase_t CUSPARSEAPI cusparseGetMatIndexBase(const cusparseMatDescr_t descrA);
  // HIP: HIPSPARSE_EXPORT hipsparseIndexBase_t hipsparseGetMatIndexBase(const hipsparseMatDescr_t descrA);
  // CHECK: indexBase_t = hipsparseGetMatIndexBase(matDescr_t);
  indexBase_t = cusparseGetMatIndexBase(matDescr_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSetMatType(cusparseMatDescr_t descrA, cusparseMatrixType_t type);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSetMatType(hipsparseMatDescr_t descrA, hipsparseMatrixType_t type);
  // CHECK: status_t = hipsparseSetMatType(matDescr_t, matrixType_t);
  status_t = cusparseSetMatType(matDescr_t, matrixType_t);

  // CUDA: cusparseMatrixType_t CUSPARSEAPI cusparseGetMatType(const cusparseMatDescr_t descrA);
  // HIP: HIPSPARSE_EXPORT hipsparseMatrixType_t hipsparseGetMatType(const hipsparseMatDescr_t descrA);
  // CHECK: matrixType_t = hipsparseGetMatType(matDescr_t);
  matrixType_t = cusparseGetMatType(matDescr_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSetMatFillMode(cusparseMatDescr_t descrA, cusparseFillMode_t fillMode);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSetMatFillMode(hipsparseMatDescr_t descrA, hipsparseFillMode_t fillMode);
  // CHECK: status_t = hipsparseSetMatFillMode(matDescr_t, fillMode_t);
  status_t = cusparseSetMatFillMode(matDescr_t, fillMode_t);

  // CUDA: cusparseFillMode_t CUSPARSEAPI cusparseGetMatFillMode(const cusparseMatDescr_t descrA);
  // HIP: HIPSPARSE_EXPORT hipsparseFillMode_t hipsparseGetMatFillMode(const hipsparseMatDescr_t descrA);
  // CHECK: fillMode_t = hipsparseGetMatFillMode(matDescr_t);
  fillMode_t = cusparseGetMatFillMode(matDescr_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSetMatDiagType(cusparseMatDescr_t descrA, cusparseDiagType_t diagType);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSetMatDiagType(hipsparseMatDescr_t descrA, hipsparseDiagType_t diagType);
  // CHECK: status_t = hipsparseSetMatDiagType(matDescr_t, diagType_t);
  status_t = cusparseSetMatDiagType(matDescr_t, diagType_t);

  // CUDA: cusparseDiagType_t CUSPARSEAPI cusparseGetMatDiagType(const cusparseMatDescr_t descrA);
  // HIP: HIPSPARSE_EXPORT hipsparseDiagType_t hipsparseGetMatDiagType(const hipsparseMatDescr_t descrA);
  // CHECK: diagType_t = hipsparseGetMatDiagType(matDescr_t);
  diagType_t = cusparseGetMatDiagType(matDescr_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCreateColorInfo(cusparseColorInfo_t* info);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCreateColorInfo(hipsparseColorInfo_t* info);
  // CHECK: status_t = hipsparseCreateColorInfo(&colorInfo_t);
  status_t = cusparseCreateColorInfo(&colorInfo_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDestroyColorInfo(cusparseColorInfo_t info);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDestroyColorInfo(hipsparseColorInfo_t info);
  // CHECK: status_t = hipsparseDestroyColorInfo(colorInfo_t);
  status_t = cusparseDestroyColorInfo(colorInfo_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseZcsrcolor(cusparseHandle_t handle, int m, int nnz, const cusparseMatDescr_t descrA, const cuDoubleComplex* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, const double* fractionToColor, int* ncolors, int* coloring, int* reordering, const cusparseColorInfo_t info);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZcsrcolor(hipsparseHandle_t handle, int m, int nnz, const hipsparseMatDescr_t descrA, const hipDoubleComplex* csrValA, const int* csrRowPtrA, const int* csrColIndA, const double* fractionToColor, int* ncolors, int* coloring, int* reordering, hipsparseColorInfo_t info);
  // CHECK: status_t = hipsparseZcsrcolor(handle_t, m, innz, matDescr_t, &dcomplex, &csrRowPtrA, &csrColIndA, &dfractionToColor, &ncolors, &coloring, &reordering, colorInfo_t);
  status_t = cusparseZcsrcolor(handle_t, m, innz, matDescr_t, &dcomplex, &csrRowPtrA, &csrColIndA, &dfractionToColor, &ncolors, &coloring, &reordering, colorInfo_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCcsrcolor(cusparseHandle_t handle, int m, int nnz, const cusparseMatDescr_t descrA, const cuComplex* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, const float* fractionToColor, int* ncolors, int* coloring, int* reordering, const cusparseColorInfo_t info);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCcsrcolor(hipsparseHandle_t handle, int m, int nnz, const hipsparseMatDescr_t descrA, const hipComplex* csrValA, const int* csrRowPtrA, const int* csrColIndA, const float* fractionToColor, int* ncolors, int* coloring, int* reordering, hipsparseColorInfo_t info);
  // CHECK: status_t = hipsparseCcsrcolor(handle_t, m, innz, matDescr_t, &complex, &csrRowPtrA, &csrColIndA, &ffractionToColor, &ncolors, &coloring, &reordering, colorInfo_t);
  status_t = cusparseCcsrcolor(handle_t, m, innz, matDescr_t, &complex, &csrRowPtrA, &csrColIndA, &ffractionToColor, &ncolors, &coloring, &reordering, colorInfo_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDcsrcolor(cusparseHandle_t handle, int m, int nnz, const cusparseMatDescr_t descrA, const double* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, const double* fractionToColor, int* ncolors, int* coloring, int* reordering, const cusparseColorInfo_t info);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDcsrcolor(hipsparseHandle_t handle, int m, int nnz, const hipsparseMatDescr_t descrA, const double* csrValA, const int* csrRowPtrA, const int* csrColIndA, const double* fractionToColor, int* ncolors, int* coloring, int* reordering, hipsparseColorInfo_t info);
  // CHECK: status_t = hipsparseDcsrcolor(handle_t, m, innz, matDescr_t, &csrValA, &csrRowPtrA, &csrColIndA, &dfractionToColor, &ncolors, &coloring, &reordering, colorInfo_t);
  status_t = cusparseDcsrcolor(handle_t, m, innz, matDescr_t, &csrValA, &csrRowPtrA, &csrColIndA, &dfractionToColor, &ncolors, &coloring, &reordering, colorInfo_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseScsrcolor(cusparseHandle_t handle, int m, int nnz, const cusparseMatDescr_t descrA, const float* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, const float* fractionToColor, int* ncolors, int* coloring, int* reordering, const cusparseColorInfo_t info);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseScsrcolor(hipsparseHandle_t handle, int m, int nnz, const hipsparseMatDescr_t descrA, const float* csrValA, const int* csrRowPtrA, const int* csrColIndA, const float* fractionToColor, int* ncolors, int* coloring, int* reordering, hipsparseColorInfo_t info);
  // CHECK: status_t = hipsparseScsrcolor(handle_t, m, innz, matDescr_t, &csrSortedValA, &csrRowPtrA, &csrColIndA, &ffractionToColor, &ncolors, &coloring, &reordering, colorInfo_t);
  status_t = cusparseScsrcolor(handle_t, m, innz, matDescr_t, &csrSortedValA, &csrRowPtrA, &csrColIndA, &ffractionToColor, &ncolors, &coloring, &reordering, colorInfo_t);

  // CUDA:cusparseStatus_t CUSPARSEAPI cusparseZgebsr2gebsr(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, int nnzb, const cusparseMatDescr_t descrA, const cuDoubleComplex* bsrSortedValA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int rowBlockDimA, int colBlockDimA, const cusparseMatDescr_t descrC, cuDoubleComplex* bsrSortedValC, int* bsrSortedRowPtrC, int* bsrSortedColIndC, int rowBlockDimC, int colBlockDimC, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZgebsr2gebsr(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, int nnzb, const hipsparseMatDescr_t descrA, const hipDoubleComplex* bsrValA, const int* bsrRowPtrA, const int* bsrColIndA, int rowBlockDimA, int colBlockDimA, const hipsparseMatDescr_t descrC, hipDoubleComplex* bsrValC, int* bsrRowPtrC, int* bsrColIndC, int rowBlockDimC, int colBlockDimC, void* buffer);
  // CHECK: status_t = hipsparseZgebsr2gebsr(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &dcomplex, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &dComplexbsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC, bsrRowPtrC, bsrColIndC, tempBuffer);
  status_t = cusparseZgebsr2gebsr(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &dcomplex, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &dComplexbsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC, bsrRowPtrC, bsrColIndC, tempBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseZgebsr2gebsr_bufferSize(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, int nnzb, const cusparseMatDescr_t descrA, const cuDoubleComplex* bsrSortedValA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int rowBlockDimA, int colBlockDimA, int rowBlockDimC,int colBlockDimC, int* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZgebsr2gebsr_bufferSize(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, int nnzb, const hipsparseMatDescr_t descrA, const hipDoubleComplex* bsrValA, const int* bsrRowPtrA, const int* bsrColIndA, int rowBlockDimA, int colBlockDimA, int rowBlockDimC, int colBlockDimC, int* bufferSize);
  // CHECK: status_t = hipsparseZgebsr2gebsr_bufferSize(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &dcomplex, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, rowBlockDimC, colBlockDimC, &bufferSizeInBytes);
  status_t = cusparseZgebsr2gebsr_bufferSize(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &dcomplex, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, rowBlockDimC, colBlockDimC, &bufferSizeInBytes);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCgebsr2gebsr(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, int nnzb, const cusparseMatDescr_t descrA, const cuComplex* bsrSortedValA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int rowBlockDimA, int colBlockDimA, const cusparseMatDescr_t descrC, cuComplex* bsrSortedValC, int* bsrSortedRowPtrC, int* bsrSortedColIndC, int rowBlockDimC, int colBlockDimC, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCgebsr2gebsr(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, int nnzb, const hipsparseMatDescr_t descrA, const hipComplex* bsrValA, const int* bsrRowPtrA, const int* bsrColIndA, int rowBlockDimA, int colBlockDimA, const hipsparseMatDescr_t descrC, hipComplex* bsrValC, int* bsrRowPtrC, int* bsrColIndC, int rowBlockDimC, int colBlockDimC, void* buffer);
  // CHECK: status_t = hipsparseCgebsr2gebsr(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &complex, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &complexbsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC, rowBlockDimC, colBlockDimC, tempBuffer);
  status_t = cusparseCgebsr2gebsr(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &complex, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &complexbsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC, rowBlockDimC, colBlockDimC, tempBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCgebsr2gebsr_bufferSize(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, int nnzb, const cusparseMatDescr_t descrA, const cuComplex* bsrSortedValA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int rowBlockDimA, int colBlockDimA, int rowBlockDimC, int colBlockDimC, int* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCgebsr2gebsr_bufferSize(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, int nnzb, const hipsparseMatDescr_t descrA, const hipComplex* bsrValA, const int* bsrRowPtrA, const int* bsrColIndA, int rowBlockDimA, int colBlockDimA, int rowBlockDimC, int colBlockDimC, int* bufferSize);
  // CHECK: status_t = hipsparseCgebsr2gebsr_bufferSize(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &complex, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, rowBlockDimC, colBlockDimC, &bufferSizeInBytes);
  status_t = cusparseCgebsr2gebsr_bufferSize(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &complex, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, rowBlockDimC, colBlockDimC, &bufferSizeInBytes);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDgebsr2gebsr(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, int nnzb, const cusparseMatDescr_t descrA, const double* bsrSortedValA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int rowBlockDimA, int colBlockDimA, const cusparseMatDescr_t descrC, double* bsrSortedValC, int* bsrSortedRowPtrC, int* bsrSortedColIndC, int rowBlockDimC, int colBlockDimC, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDgebsr2gebsr(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, int nnzb, const hipsparseMatDescr_t descrA, const double* bsrValA, const int* bsrRowPtrA, const int* bsrColIndA, int rowBlockDimA, int colBlockDimA, const hipsparseMatDescr_t descrC, double* bsrValC, int* bsrRowPtrC, int* bsrColIndC, int rowBlockDimC, int colBlockDimC, void* buffer);
  // CHECK: status_t = hipsparseDgebsr2gebsr(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &dbsrSortedValA, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &dbsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC, rowBlockDimC, colBlockDimC, tempBuffer);
  status_t = cusparseDgebsr2gebsr(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &dbsrSortedValA, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &dbsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC, rowBlockDimC, colBlockDimC, tempBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDgebsr2gebsr_bufferSize(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, int nnzb, const cusparseMatDescr_t descrA, const double* bsrSortedValA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int rowBlockDimA, int colBlockDimA, int rowBlockDimC, int colBlockDimC, int* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDgebsr2gebsr_bufferSize(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, int nnzb, const hipsparseMatDescr_t descrA, const double* bsrValA, const int* bsrRowPtrA, const int* bsrColIndA, int rowBlockDimA, int colBlockDimA, int rowBlockDimC, int colBlockDimC, int* bufferSize);
  // CHECK: status_t = hipsparseDgebsr2gebsr_bufferSize(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &dbsrSortedValA, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, rowBlockDimC, colBlockDimC, &bufferSizeInBytes);
  status_t = cusparseDgebsr2gebsr_bufferSize(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &dbsrSortedValA, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, rowBlockDimC, colBlockDimC, &bufferSizeInBytes);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSgebsr2gebsr(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, int nnzb, const cusparseMatDescr_t descrA, const float* bsrSortedValA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int rowBlockDimA, int colBlockDimA, const cusparseMatDescr_t descrC, float* bsrSortedValC, int* bsrSortedRowPtrC, int* bsrSortedColIndC, int rowBlockDimC, int colBlockDimC, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSgebsr2gebsr(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, int nnzb, const hipsparseMatDescr_t descrA, const float* bsrValA, const int* bsrRowPtrA, const int* bsrColIndA, int rowBlockDimA, int colBlockDimA, const hipsparseMatDescr_t descrC, float* bsrValC, int* bsrRowPtrC, int* bsrColIndC, int rowBlockDimC, int colBlockDimC, void* buffer);
  // CHECK: status_t = hipsparseSgebsr2gebsr(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &fbsrSortedValA, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &fbsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC, rowBlockDimC, colBlockDimC, tempBuffer);
  status_t = cusparseSgebsr2gebsr(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &fbsrSortedValA, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &fbsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC, rowBlockDimC, colBlockDimC, tempBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSgebsr2gebsr_bufferSize(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, int nnzb, const cusparseMatDescr_t descrA, const float* bsrSortedValA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int rowBlockDimA, int colBlockDimA, int rowBlockDimC, int colBlockDimC, int* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSgebsr2gebsr_bufferSize(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, int nnzb, const hipsparseMatDescr_t descrA, const float* bsrValA, const int* bsrRowPtrA, const int* bsrColIndA, int rowBlockDimA, int colBlockDimA, int rowBlockDimC, int colBlockDimC, int* bufferSize);
  // CHECK: status_t = hipsparseSgebsr2gebsr_bufferSize(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &fbsrSortedValA, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, rowBlockDimC, colBlockDimC, &bufferSizeInBytes);
  status_t = cusparseSgebsr2gebsr_bufferSize(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &fbsrSortedValA, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, rowBlockDimC, colBlockDimC, &bufferSizeInBytes);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseXgebsr2gebsrNnz(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, int nnzb, const cusparseMatDescr_t descrA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int rowBlockDimA, int colBlockDimA, const cusparseMatDescr_t descrC, int* bsrSortedRowPtrC, int rowBlockDimC, int colBlockDimC, int* nnzTotalDevHostPtr, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseXgebsr2gebsrNnz(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, int nnzb, const hipsparseMatDescr_t descrA, const int* bsrRowPtrA, const int* bsrColIndA, int rowBlockDimA, int colBlockDimA, const hipsparseMatDescr_t descrC, int* bsrRowPtrC, int rowBlockDimC, int colBlockDimC, int* nnzTotalDevHostPtr, void* buffer);
  // CHECK: status_t = hipsparseXgebsr2gebsrNnz(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &bsrSortedRowPtrC, rowBlockDimC, colBlockDimC, &nnzTotalDevHostPtr, &tempBuffer);
  status_t = cusparseXgebsr2gebsrNnz(handle_t, direction_t, mb, nb, nnzb, matDescr_t, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &bsrSortedRowPtrC, rowBlockDimC, colBlockDimC, &nnzTotalDevHostPtr, &tempBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseZgebsr2csr(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, const cusparseMatDescr_t descrA, const cuDoubleComplex* bsrSortedValA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int rowBlockDim, int colBlockDim, const cusparseMatDescr_t descrC, cuDoubleComplex* csrSortedValC, int* csrSortedRowPtrC, int* csrSortedColIndC);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZgebsr2csr(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, const hipsparseMatDescr_t descrA, const hipDoubleComplex* bsrValA, const int* bsrRowPtrA, const int* bsrColIndA, int rowBlockDim, int colBlockDim, const hipsparseMatDescr_t descrC, hipDoubleComplex* csrValC, int* csrRowPtrC, int* csrColIndC);
  // CHECK: status_t = hipsparseZgebsr2csr(handle_t, direction_t, mb, nb, matDescr_A, &dComplexbsrSortedValA, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &dComplexbsrSortedValC, &csrRowPtrC, &csrColIndC);
  status_t = cusparseZgebsr2csr(handle_t, direction_t, mb, nb, matDescr_A, &dComplexbsrSortedValA, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &dComplexbsrSortedValC, &csrRowPtrC, &csrColIndC);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCgebsr2csr(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, const cusparseMatDescr_t descrA, const cuComplex* bsrSortedValA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int rowBlockDim, int colBlockDim, const cusparseMatDescr_t descrC, cuComplex* csrSortedValC, int* csrSortedRowPtrC, int* csrSortedColIndC);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCgebsr2csr(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, const hipsparseMatDescr_t descrA, const hipComplex* bsrValA, const int* bsrRowPtrA, const int* bsrColIndA, int rowBlockDim, int colBlockDim, const hipsparseMatDescr_t descrC, hipComplex* csrValC, int* csrRowPtrC, int* csrColIndC);
  // CHECK: status_t = hipsparseCgebsr2csr(handle_t, direction_t, mb, nb, matDescr_A, &complexbsrValA, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &complexbsrSortedValC, &csrRowPtrC, &csrColIndC);
  status_t = cusparseCgebsr2csr(handle_t, direction_t, mb, nb, matDescr_A, &complexbsrValA, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &complexbsrSortedValC, &csrRowPtrC, &csrColIndC);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDgebsr2csr(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, const cusparseMatDescr_t descrA, const double* bsrSortedValA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int rowBlockDim, int colBlockDim, const cusparseMatDescr_t descrC, double* csrSortedValC, int* csrSortedRowPtrC, int* csrSortedColIndC);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDgebsr2csr(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, const hipsparseMatDescr_t descrA, const double* bsrValA, const int* bsrRowPtrA, const int* bsrColIndA, int rowBlockDim, int colBlockDim, const hipsparseMatDescr_t descrC, double* csrValC, int* csrRowPtrC, int* csrColIndC);
  // CHECK: status_t = hipsparseDgebsr2csr(handle_t, direction_t, mb, nb, matDescr_A, &bsrValA, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &csrValC, &csrRowPtrC, &csrColIndC);
  status_t = cusparseDgebsr2csr(handle_t, direction_t, mb, nb, matDescr_A, &bsrValA, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &csrValC, &csrRowPtrC, &csrColIndC);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSgebsr2csr(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, const cusparseMatDescr_t descrA, const float* bsrSortedValA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int rowBlockDim, int colBlockDim, const cusparseMatDescr_t descrC, float* csrSortedValC, int* csrSortedRowPtrC, int* csrSortedColIndC);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSgebsr2csr(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, const hipsparseMatDescr_t descrA, const float* bsrValA, const int* bsrRowPtrA, const int* bsrColIndA, int rowBlockDim, int colBlockDim, const hipsparseMatDescr_t descrC, float* csrValC, int* csrRowPtrC, int* csrColIndC);
  // CHECK: status_t = hipsparseSgebsr2csr(handle_t, direction_t, mb, nb, matDescr_A, &fbsrSortedValA, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &fcsrSortedValC, &csrRowPtrC, &csrColIndC);
  status_t = cusparseSgebsr2csr(handle_t, direction_t, mb, nb, matDescr_A, &fbsrSortedValA, &bsrRowPtrA, &bsrColIndA, rowBlockDimA, colBlockDimA, matDescr_C, &fcsrSortedValC, &csrRowPtrC, &csrColIndC);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseZbsr2csr(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, const cusparseMatDescr_t descrA, const cuDoubleComplex* bsrSortedValA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int blockDim, const cusparseMatDescr_t descrC, cuDoubleComplex* csrSortedValC, int* csrSortedRowPtrC, int* csrSortedColIndC);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZbsr2csr(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, const hipsparseMatDescr_t descrA, const hipDoubleComplex* bsrValA, const int* bsrRowPtrA, const int* bsrColIndA, int blockDim, const hipsparseMatDescr_t descrC, hipDoubleComplex* csrValC, int* csrRowPtrC, int* csrColIndC);
  // CHECK: status_t = hipsparseZbsr2csr(handle_t, direction_t, mb, nb, matDescr_A, &dComplexbsrSortedValA, &bsrRowPtrA, &bsrColIndA, blockDim, matDescr_C, &dComplexbsrSortedValC, &csrRowPtrC, &csrColIndC);
  status_t = cusparseZbsr2csr(handle_t, direction_t, mb, nb, matDescr_A, &dComplexbsrSortedValA, &bsrRowPtrA, &bsrColIndA, blockDim, matDescr_C, &dComplexbsrSortedValC, &csrRowPtrC, &csrColIndC);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCbsr2csr(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, const cusparseMatDescr_t descrA, const cuComplex* bsrSortedValA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int blockDim, const cusparseMatDescr_t descrC, cuComplex* csrSortedValC, int* csrSortedRowPtrC, int* csrSortedColIndC);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCbsr2csr(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, const hipsparseMatDescr_t descrA, const hipComplex* bsrValA, const int* bsrRowPtrA, const int* bsrColIndA, int blockDim, const hipsparseMatDescr_t descrC, hipComplex* csrValC, int* csrRowPtrC, int* csrColIndC);
  // CHECK: status_t = hipsparseCbsr2csr(handle_t, direction_t, mb, nb, matDescr_A, &complexbsrValA, &bsrRowPtrA, &bsrColIndA, blockDim, matDescr_C, &complexbsrSortedValC, &csrRowPtrC, &csrColIndC);
  status_t = cusparseCbsr2csr(handle_t, direction_t, mb, nb, matDescr_A, &complexbsrValA, &bsrRowPtrA, &bsrColIndA, blockDim, matDescr_C, &complexbsrSortedValC, &csrRowPtrC, &csrColIndC);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDbsr2csr(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, const cusparseMatDescr_t descrA, const double* bsrSortedValA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int blockDim, const cusparseMatDescr_t descrC, double* csrSortedValC, int* csrSortedRowPtrC, int* csrSortedColIndC);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDbsr2csr(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, const hipsparseMatDescr_t descrA, const double* bsrValA, const int* bsrRowPtrA, const int* bsrColIndA, int blockDim, const hipsparseMatDescr_t descrC, double* csrValC, int* csrRowPtrC, int* csrColIndC);
  // CHECK: status_t = hipsparseDbsr2csr(handle_t, direction_t, mb, nb, matDescr_A, &bsrValA, &bsrRowPtrA, &bsrColIndA, blockDim, matDescr_C, &csrValC, &csrRowPtrC, &csrColIndC);
  status_t = cusparseDbsr2csr(handle_t, direction_t, mb, nb, matDescr_A, &bsrValA, &bsrRowPtrA, &bsrColIndA, blockDim, matDescr_C, &csrValC, &csrRowPtrC, &csrColIndC);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSbsr2csr(cusparseHandle_t handle, cusparseDirection_t dirA, int mb, int nb, const cusparseMatDescr_t descrA, const float* bsrSortedValA, const int* bsrSortedRowPtrA, const int* bsrSortedColIndA, int blockDim, const cusparseMatDescr_t descrC, float* csrSortedValC, int* csrSortedRowPtrC, int* csrSortedColIndC);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSbsr2csr(hipsparseHandle_t handle, hipsparseDirection_t dirA, int mb, int nb, const hipsparseMatDescr_t descrA, const float* bsrValA, const int* bsrRowPtrA, const int* bsrColIndA, int blockDim, const hipsparseMatDescr_t descrC, float* csrValC, int* csrRowPtrC, int* csrColIndC);
  // CHECK: status_t = hipsparseSbsr2csr(handle_t, direction_t, mb, nb, matDescr_A, &fbsrSortedValA, &bsrRowPtrA, &bsrColIndA, blockDim, matDescr_C, &fcsrSortedValC, &csrRowPtrC, &csrColIndC);
  status_t = cusparseSbsr2csr(handle_t, direction_t, mb, nb, matDescr_A, &fbsrSortedValA, &bsrRowPtrA, &bsrColIndA, blockDim, matDescr_C, &fcsrSortedValC, &csrRowPtrC, &csrColIndC);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseXcoosortByColumn(cusparseHandle_t handle, int m, int n, int nnz, int* cooRowsA, int* cooColsA, int* P, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseXcoosortByColumn(hipsparseHandle_t handle, int m, int n, int nnz, int* cooRows, int* cooCols, int* P, void* pBuffer);
  // CHECK: status_t = hipsparseXcoosortByColumn(handle_t, m, n, innz, &icooRows, &icooColumns, P, pBuffer);
  status_t = cusparseXcoosortByColumn(handle_t, m, n, innz, &icooRows, &icooColumns, P, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseXcoosortByRow(cusparseHandle_t handle, int m, int n, int nnz, int* cooRowsA, int* cooColsA, int* P, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseXcoosortByRow(hipsparseHandle_t handle, int m, int n, int nnz, int* cooRows, int* cooCols, int* P, void* pBuffer);
  // CHECK: status_t = hipsparseXcoosortByRow(handle_t, m, n, innz, &icooRows, &icooColumns, P, pBuffer);
  status_t = cusparseXcoosortByRow(handle_t, m, n, innz, &icooRows, &icooColumns, P, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseXcoosort_bufferSizeExt(cusparseHandle_t handle, int m, int n, int nnz, const int* cooRowsA, const int* cooColsA, size_t* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseXcoosort_bufferSizeExt(hipsparseHandle_t handle, int m, int n, int nnz, const int* cooRows, const int* cooCols, size_t* pBufferSizeInBytes);
  // CHECK: status_t = hipsparseXcoosort_bufferSizeExt(handle_t, m, n, innz, &icooRows, &icooColumns, &bufferSize);
  status_t = cusparseXcoosort_bufferSizeExt(handle_t, m, n, innz, &icooRows, &icooColumns, &bufferSize);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseXcscsort(cusparseHandle_t handle, int m, int n, int nnz, const cusparseMatDescr_t descrA, const int* cscColPtrA, int* cscRowIndA, int* P, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseXcscsort(hipsparseHandle_t handle, int m, int n, int nnz, const hipsparseMatDescr_t descrA, const int* cscColPtr, int* cscRowInd, int* P, void* pBuffer);
  // CHECK: status_t = hipsparseXcscsort(handle_t, m, n, innz, matDescr_A, &cscColPtrA, &cscRowIndA, P, pBuffer);
  status_t = cusparseXcscsort(handle_t, m, n, innz, matDescr_A, &cscColPtrA, &cscRowIndA, P, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseXcscsort_bufferSizeExt(cusparseHandle_t handle, int m, int n, int nnz, const int* cscColPtrA, const int* cscRowIndA, size_t* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseXcscsort_bufferSizeExt(hipsparseHandle_t handle, int m, int n, int nnz, const int* cscColPtr, const int* cscRowInd, size_t* pBufferSizeInBytes);
  // CHECK: status_t = hipsparseXcscsort_bufferSizeExt(handle_t, m, n, innz, &cscColPtrA, &cscRowIndA, &bufferSize);
  status_t = cusparseXcscsort_bufferSizeExt(handle_t, m, n, innz, &cscColPtrA, &cscRowIndA, &bufferSize);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseXcsrsort(cusparseHandle_t handle, int m, int n, int nnz, const cusparseMatDescr_t descrA, const int* csrRowPtrA, int* csrColIndA, int* P, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseXcsrsort(hipsparseHandle_t handle, int m, int n, int nnz, const hipsparseMatDescr_t descrA, const int* csrRowPtr, int* csrColInd, int* P, void* pBuffer);
  // CHECK: status_t = hipsparseXcsrsort(handle_t, m, n, innz, matDescr_A, &cscRowIndA, &cscColPtrA, P, pBuffer);
  status_t = cusparseXcsrsort(handle_t, m, n, innz, matDescr_A, &cscRowIndA, &cscColPtrA, P, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseXcsrsort_bufferSizeExt(cusparseHandle_t handle, int m, int n, int nnz, const int* csrRowPtrA, const int* csrColIndA, size_t* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseXcsrsort_bufferSizeExt(hipsparseHandle_t handle, int m, int n, int nnz, const int* csrRowPtr, const int* csrColInd, size_t* pBufferSizeInBytes);
  // CHECK: status_t = hipsparseXcsrsort_bufferSizeExt(handle_t, m, n, innz, &cscRowIndA, &cscColPtrA, &bufferSize);
  status_t = cusparseXcsrsort_bufferSizeExt(handle_t, m, n, innz, &cscRowIndA, &cscColPtrA, &bufferSize);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCreateIdentityPermutation(cusparseHandle_t handle, int n, int* p);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCreateIdentityPermutation(hipsparseHandle_t handle, int n, int* p);
  // CHECK: status_t = hipsparseCreateIdentityPermutation(handle_t, n, P);
  status_t = cusparseCreateIdentityPermutation(handle_t, n, P);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseXcoo2csr(cusparseHandle_t handle, const int* cooRowInd, int nnz, int m, int* csrSortedRowPtr, cusparseIndexBase_t idxBase);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseXcoo2csr(hipsparseHandle_t handle, const int* cooRowInd, int nnz, int m, int* csrRowPtr, hipsparseIndexBase_t idxBase);
  // CHECK: status_t = hipsparseXcoo2csr(handle_t, &icooRowInd, nnz, m, &csrRowPtrA, indexBase_t);
  status_t = cusparseXcoo2csr(handle_t, &icooRowInd, nnz, m, &csrRowPtrA, indexBase_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseZcsr2gebsr(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const cuDoubleComplex* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, const cusparseMatDescr_t descrC, cuDoubleComplex* bsrSortedValC, int* bsrSortedRowPtrC, int* bsrSortedColIndC, int rowBlockDim, int colBlockDim, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZcsr2gebsr(hipsparseHandle_t handle, hipsparseDirection_t dir, int m, int n, const hipsparseMatDescr_t csr_descr, const hipDoubleComplex* csr_val, const int* csr_row_ptr, const int* csr_col_ind, const hipsparseMatDescr_t bsr_descr, hipDoubleComplex* bsr_val, int* bsr_row_ptr, int* bsr_col_ind, int row_block_dim, int col_block_dim, void* p_buffer);
  // CHECK: status_t = hipsparseZcsr2gebsr(handle_t, direction_t, m, n, matDescr_A, &dcomplex, &csrRowPtrA, &csrColIndA, matDescr_C, &dComplexcsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC, rowBlockDimA, colBlockDimA, pBuffer);
 status_t = cusparseZcsr2gebsr(handle_t, direction_t, m, n, matDescr_A, &dcomplex, &csrRowPtrA, &csrColIndA, matDescr_C, &dComplexcsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC, rowBlockDimA, colBlockDimA, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCcsr2gebsr(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const cuComplex* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, const cusparseMatDescr_t descrC, cuComplex* bsrSortedValC, int* bsrSortedRowPtrC, int* bsrSortedColIndC, int rowBlockDim, int colBlockDim, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCcsr2gebsr(hipsparseHandle_t handle, hipsparseDirection_t dir, int m, int n, const hipsparseMatDescr_t csr_descr, const hipComplex* csr_val, const int* csr_row_ptr, const int* csr_col_ind, const hipsparseMatDescr_t bsr_descr, hipComplex* bsr_val, int* bsr_row_ptr, int* bsr_col_ind, int row_block_dim, int col_block_dim, void* p_buffer);
  // CHECK: status_t = hipsparseCcsr2gebsr(handle_t, direction_t, m, n, matDescr_A, &complexcsrSortedValA, &csrRowPtrA, &csrColIndA, matDescr_C, &complexcsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC, rowBlockDimA, colBlockDimA, pBuffer);
  status_t = cusparseCcsr2gebsr(handle_t, direction_t, m, n, matDescr_A, &complexcsrSortedValA, &csrRowPtrA, &csrColIndA, matDescr_C, &complexcsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC, rowBlockDimA, colBlockDimA, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDcsr2gebsr(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const double* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, const cusparseMatDescr_t descrC, double* bsrSortedValC, int* bsrSortedRowPtrC, int* bsrSortedColIndC, int rowBlockDim, int colBlockDim, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDcsr2gebsr(hipsparseHandle_t handle, hipsparseDirection_t dir, int m, int n, const hipsparseMatDescr_t csr_descr, const double* csr_val, const int* csr_row_ptr, const int* csr_col_ind, const hipsparseMatDescr_t bsr_descr, double* bsr_val, int* bsr_row_ptr, int* bsr_col_ind, int row_block_dim, int col_block_dim, void* p_buffer);
  // CHECK: status_t = hipsparseDcsr2gebsr(handle_t, direction_t, m, n, matDescr_A, &dcsrSortedValA, &csrRowPtrA, &csrColIndA, matDescr_C, &dcsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC, rowBlockDimA, colBlockDimA, pBuffer);
  status_t = cusparseDcsr2gebsr(handle_t, direction_t, m, n, matDescr_A, &dcsrSortedValA, &csrRowPtrA, &csrColIndA, matDescr_C, &dcsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC, rowBlockDimA, colBlockDimA, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseScsr2gebsr(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const float* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, const cusparseMatDescr_t descrC, float* bsrSortedValC, int* bsrSortedRowPtrC, int* bsrSortedColIndC, int rowBlockDim, int colBlockDim, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseScsr2gebsr(hipsparseHandle_t handle, hipsparseDirection_t dir, int m, int n, const hipsparseMatDescr_t csr_descr, const float* csr_val, const int* csr_row_ptr, const int* csr_col_ind, const hipsparseMatDescr_t bsr_descr, float* bsr_val, int* bsr_row_ptr, int* bsr_col_ind, int row_block_dim, int col_block_dim, void* p_buffer);
  // CHECK: status_t = hipsparseScsr2gebsr(handle_t, direction_t, m, n, matDescr_A, &csrSortedValA, &csrRowPtrA, &csrColIndA, matDescr_C, &fcsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC, rowBlockDimA, colBlockDimA, pBuffer);
  status_t = cusparseScsr2gebsr(handle_t, direction_t, m, n, matDescr_A, &csrSortedValA, &csrRowPtrA, &csrColIndA, matDescr_C, &fcsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC, rowBlockDimA, colBlockDimA, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseXcsr2gebsrNnz(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, const cusparseMatDescr_t descrC, int* bsrSortedRowPtrC, int rowBlockDim, int colBlockDim, int* nnzTotalDevHostPtr, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseXcsr2gebsrNnz(hipsparseHandle_t handle, hipsparseDirection_t dir, int m, int n, const hipsparseMatDescr_t csr_descr, const int* csr_row_ptr, const int* csr_col_ind, const hipsparseMatDescr_t bsr_descr, int* bsr_row_ptr, int row_block_dim, int col_block_dim, int* bsr_nnz_devhost, void* p_buffer);
  // CHECK: status_t = hipsparseXcsr2gebsrNnz(handle_t, direction_t, m, n, matDescr_A, &csrRowPtrA, &csrColIndA, matDescr_C, &bsrSortedRowPtrC, rowBlockDimA, colBlockDimA, &nnzTotalDevHostPtr, pBuffer);
  status_t = cusparseXcsr2gebsrNnz(handle_t, direction_t, m, n, matDescr_A, &csrRowPtrA, &csrColIndA, matDescr_C, &bsrSortedRowPtrC, rowBlockDimA, colBlockDimA, &nnzTotalDevHostPtr, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseZcsr2gebsr_bufferSize(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const cuDoubleComplex* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, int rowBlockDim, int colBlockDim, int* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZcsr2gebsr_bufferSize(hipsparseHandle_t handle, hipsparseDirection_t dir, int m, int n, const hipsparseMatDescr_t csr_descr, const hipDoubleComplex* csr_val, const int* csr_row_ptr, const int* csr_col_ind, int row_block_dim, int col_block_dim, size_t* p_buffer_size);
  // CHECK: status_t = hipsparseZcsr2gebsr_bufferSize(handle_t, direction_t, m, n, matDescr_A, &dComplexcsrSortedValA, &csrRowPtrA, &csrColIndA, rowBlockDimA, colBlockDimA, &bufferSizeInBytes);
  status_t = cusparseZcsr2gebsr_bufferSize(handle_t, direction_t, m, n, matDescr_A, &dComplexcsrSortedValA, &csrRowPtrA, &csrColIndA, rowBlockDimA, colBlockDimA, &bufferSizeInBytes);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCcsr2gebsr_bufferSize(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const cuComplex* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, int rowBlockDim, int colBlockDim, int* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCcsr2gebsr_bufferSize(hipsparseHandle_t handle, hipsparseDirection_t dir, int m, int n, const hipsparseMatDescr_t csr_descr, const hipComplex* csr_val, const int* csr_row_ptr, const int* csr_col_ind, int row_block_dim, int col_block_dim, size_t* p_buffer_size);
 // CHECK: status_t = hipsparseCcsr2gebsr_bufferSize(handle_t, direction_t, m, n, matDescr_A, &complexcsrSortedValA, &csrRowPtrA, &csrColIndA, rowBlockDimA, colBlockDimA, &bufferSizeInBytes);
  status_t = cusparseCcsr2gebsr_bufferSize(handle_t, direction_t, m, n, matDescr_A, &complexcsrSortedValA, &csrRowPtrA, &csrColIndA, rowBlockDimA, colBlockDimA, &bufferSizeInBytes);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDcsr2gebsr_bufferSize(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const double* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, int rowBlockDim, int colBlockDim, int* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDcsr2gebsr_bufferSize(hipsparseHandle_t handle, hipsparseDirection_t dir, int m, int n, const hipsparseMatDescr_t csr_descr, const double* csr_val, const int* csr_row_ptr, const int* csr_col_ind, int row_block_dim, int col_block_dim, size_t* p_buffer_size);
  // CHECK: status_t = hipsparseDcsr2gebsr_bufferSize(handle_t, direction_t, m, n, matDescr_A, &dcsrSortedValA, &csrRowPtrA, &csrColIndA, rowBlockDimA, colBlockDimA, &bufferSizeInBytes);
  status_t = cusparseDcsr2gebsr_bufferSize(handle_t, direction_t, m, n, matDescr_A, &dcsrSortedValA, &csrRowPtrA, &csrColIndA, rowBlockDimA, colBlockDimA, &bufferSizeInBytes);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseScsr2gebsr_bufferSize(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const float* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, int rowBlockDim, int colBlockDim, int* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseScsr2gebsr_bufferSize(hipsparseHandle_t handle, hipsparseDirection_t dir, int m, int n, const hipsparseMatDescr_t csr_descr, const float* csr_val, const int* csr_row_ptr, const int* csr_col_ind, int row_block_dim, int col_block_dim, size_t* p_buffer_size);
  // CHECK: status_t = hipsparseScsr2gebsr_bufferSize(handle_t, direction_t, m, n, matDescr_A, &csrSortedValA, &csrRowPtrA, &csrColIndA, rowBlockDimA, colBlockDimA, &bufferSizeInBytes);
  status_t = cusparseScsr2gebsr_bufferSize(handle_t, direction_t, m, n, matDescr_A, &csrSortedValA, &csrRowPtrA, &csrColIndA, rowBlockDimA, colBlockDimA, &bufferSizeInBytes);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseZcsr2bsr(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const cuDoubleComplex* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, int blockDim, const cusparseMatDescr_t descrC, cuDoubleComplex* bsrSortedValC, int* bsrSortedRowPtrC, int* bsrSortedColIndC);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZcsr2bsr(hipsparseHandle_t handle, hipsparseDirection_t dirA, int m, int n, const hipsparseMatDescr_t descrA, const hipDoubleComplex* csrValA, const int* csrRowPtrA, const int* csrColIndA, int blockDim, const hipsparseMatDescr_t descrC, hipDoubleComplex* bsrValC, int* bsrRowPtrC, int* bsrColIndC);
  // CHECK: status_t = hipsparseZcsr2bsr(handle_t, direction_t, m, n, matDescr_A, &dComplexcsrSortedValA, &csrRowPtrA, &csrColIndA, blockDim, matDescr_C, &dComplexcsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC);
  status_t = cusparseZcsr2bsr(handle_t, direction_t, m, n, matDescr_A, &dComplexcsrSortedValA, &csrRowPtrA, &csrColIndA, blockDim, matDescr_C, &dComplexcsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCcsr2bsr(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const cuComplex* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, int blockDim, const cusparseMatDescr_t descrC, cuComplex* bsrSortedValC, int* bsrSortedRowPtrC, int* bsrSortedColIndC);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCcsr2bsr(hipsparseHandle_t handle, hipsparseDirection_t dirA, int m, int n, const hipsparseMatDescr_t descrA, const hipComplex* csrValA, const int* csrRowPtrA, const int* csrColIndA, int blockDim, const hipsparseMatDescr_t descrC, hipComplex* bsrValC, int* bsrRowPtrC, int* bsrColIndC);
  // CHECK: status_t = hipsparseCcsr2bsr(handle_t, direction_t, m, n, matDescr_A, &complexcsrSortedValA, &csrRowPtrA, &csrColIndA, blockDim, matDescr_C, &complexcsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC);
  status_t = cusparseCcsr2bsr(handle_t, direction_t, m, n, matDescr_A, &complexcsrSortedValA, &csrRowPtrA, &csrColIndA, blockDim, matDescr_C, &complexcsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDcsr2bsr(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const double* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, int blockDim, const cusparseMatDescr_t descrC, double* bsrSortedValC, int* bsrSortedRowPtrC, int* bsrSortedColIndC);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDcsr2bsr(hipsparseHandle_t handle, hipsparseDirection_t dirA, int m, int n,const hipsparseMatDescr_t descrA, const double* csrValA, const int* csrRowPtrA, const int* csrColIndA, int blockDim,const hipsparseMatDescr_t descrC, double* bsrValC, int* bsrRowPtrC, int* bsrColIndC);
  // CHECK: status_t = hipsparseDcsr2bsr(handle_t, direction_t, m, n, matDescr_A, &dcsrSortedValA, &csrRowPtrA, &csrColIndA, blockDim, matDescr_C, &dcsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC);
  status_t = cusparseDcsr2bsr(handle_t, direction_t, m, n, matDescr_A, &dcsrSortedValA, &csrRowPtrA, &csrColIndA, blockDim, matDescr_C, &dcsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseScsr2bsr(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const float* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, int blockDim, const cusparseMatDescr_t descrC, float* bsrSortedValC, int* bsrSortedRowPtrC, int* bsrSortedColIndC);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseScsr2bsr(hipsparseHandle_t handle, hipsparseDirection_t dirA, int m, int n, const hipsparseMatDescr_t descrA, const float* csrValA, const int* csrRowPtrA, const int* csrColIndA, int blockDim, const hipsparseMatDescr_t descrC, float* bsrValC, int* bsrRowPtrC, int* bsrColIndC);
  // CHECK: status_t = hipsparseScsr2bsr(handle_t, direction_t, m, n, matDescr_A, &csrSortedValA, &csrRowPtrA, &csrColIndA, blockDim, matDescr_C, &fcsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC);
  status_t = cusparseScsr2bsr(handle_t, direction_t, m, n, matDescr_A, &csrSortedValA, &csrRowPtrA, &csrColIndA, blockDim, matDescr_C, &fcsrSortedValC, &bsrSortedRowPtrC, &bsrSortedColIndC);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseXcsr2bsrNnz(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, int blockDim, const cusparseMatDescr_t descrC, int* bsrSortedRowPtrC, int* nnzTotalDevHostPtr);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseXcsr2bsrNnz(hipsparseHandle_t handle, hipsparseDirection_t dirA, int m, int n, const hipsparseMatDescr_t descrA, const int* csrRowPtrA, const int* csrColIndA, int blockDim, const hipsparseMatDescr_t descrC, int* bsrRowPtrC, int* bsrNnzb);
  // CHECK: status_t = hipsparseXcsr2bsrNnz(handle_t, direction_t, m, n, matDescr_A, &csrRowPtrA, &csrColIndA, blockDim, matDescr_C, &bsrSortedRowPtrC, &nnzTotalDevHostPtr);
  status_t = cusparseXcsr2bsrNnz(handle_t, direction_t, m, n, matDescr_A, &csrRowPtrA, &csrColIndA, blockDim, matDescr_C, &bsrSortedRowPtrC, &nnzTotalDevHostPtr);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseZgebsr2gebsc(cusparseHandle_t handle, int mb, int nb, int nnzb, const cuDoubleComplex* bsrSortedVal, const int* bsrSortedRowPtr, const int* bsrSortedColInd, int rowBlockDim, int colBlockDim, cuDoubleComplex* bscVal, int* bscRowInd, int* bscColPtr, cusparseAction_t copyValues, cusparseIndexBase_t idxBase, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZgebsr2gebsc(hipsparseHandle_t handle, int mb, int nb, int nnzb, const hipDoubleComplex* bsr_val, const int* bsr_row_ptr, const int* bsr_col_ind, int row_block_dim, int col_block_dim, hipDoubleComplex* bsc_val, int* bsc_row_ind, int* bsc_col_ptr, hipsparseAction_t copy_values, hipsparseIndexBase_t idx_base, void* temp_buffer);
  // CHECK: status_t = hipsparseZgebsr2gebsc(handle_t, mb, nb, nnzb, &dComplexbsrSortedVal, &bsrSortedRowPtr, &bsrSortedColInd, rowBlockDim, colBlockDim, &dComplexbscVal, &bscRowInd, &bscColPtr, copyValues, indexBase_t, pBuffer);
  status_t = cusparseZgebsr2gebsc(handle_t, mb, nb, nnzb, &dComplexbsrSortedVal, &bsrSortedRowPtr, &bsrSortedColInd, rowBlockDim, colBlockDim, &dComplexbscVal, &bscRowInd, &bscColPtr, copyValues, indexBase_t, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCgebsr2gebsc(cusparseHandle_t handle, int mb, int nb, int nnzb, const cuComplex* bsrSortedVal, const int* bsrSortedRowPtr, const int* bsrSortedColInd, int rowBlockDim, int colBlockDim, cuComplex* bscVal, int* bscRowInd, int* bscColPtr, cusparseAction_t copyValues, cusparseIndexBase_t idxBase, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCgebsr2gebsc(hipsparseHandle_t handle, int mb, int nb, int nnzb, const hipComplex* bsr_val, const int* bsr_row_ptr, const int* bsr_col_ind, int row_block_dim, int col_block_dim, hipComplex* bsc_val, int* bsc_row_ind, int* bsc_col_ptr,hipsparseAction_t copy_values, hipsparseIndexBase_t idx_base, void* temp_buffer);
  // CHECK: status_t = hipsparseCgebsr2gebsc(handle_t, mb, nb, nnzb, &complexbsrSortedVal, &bsrSortedRowPtr, &bsrSortedColInd, rowBlockDim, colBlockDim, &complexbscVal, &bscRowInd, &bscColPtr, copyValues, indexBase_t, pBuffer);
  status_t = cusparseCgebsr2gebsc(handle_t, mb, nb, nnzb, &complexbsrSortedVal, &bsrSortedRowPtr, &bsrSortedColInd, rowBlockDim, colBlockDim, &complexbscVal, &bscRowInd, &bscColPtr, copyValues, indexBase_t, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDgebsr2gebsc(cusparseHandle_t handle, int mb, int nb, int nnzb, const double* bsrSortedVal, const int* bsrSortedRowPtr, const int* bsrSortedColInd, int rowBlockDim, int colBlockDim, double* bscVal, int* bscRowInd, int* bscColPtr, cusparseAction_t copyValues, cusparseIndexBase_t idxBase, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDgebsr2gebsc(hipsparseHandle_t handle, int mb, int nb, int nnzb, const double* bsr_val, const int* bsr_row_ptr, const int* bsr_col_ind, int row_block_dim, int col_block_dim, double* bsc_val, int* bsc_row_ind, int* bsc_col_ptr, hipsparseAction_t copy_values, hipsparseIndexBase_t idx_base, void* temp_buffer);
  // CHECK: status_t = hipsparseDgebsr2gebsc(handle_t, mb, nb, nnzb, &dbsrSortedVal, &bsrSortedRowPtr, &bsrSortedColInd, rowBlockDim, colBlockDim, &dbscVal, &bscRowInd, &bscColPtr, copyValues, indexBase_t, pBuffer);
  status_t = cusparseDgebsr2gebsc(handle_t, mb, nb, nnzb, &dbsrSortedVal, &bsrSortedRowPtr, &bsrSortedColInd, rowBlockDim, colBlockDim, &dbscVal, &bscRowInd, &bscColPtr, copyValues, indexBase_t, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSgebsr2gebsc(cusparseHandle_t handle, int mb, int nb, int nnzb, const float* bsrSortedVal, const int* bsrSortedRowPtr, const int* bsrSortedColInd, int rowBlockDim, int colBlockDim, float* bscVal, int* bscRowInd, int* bscColPtr, cusparseAction_t copyValues, cusparseIndexBase_t idxBase, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSgebsr2gebsc(hipsparseHandle_t handle, int mb, int nb, int nnzb, const float* bsr_val, const int* bsr_row_ptr, const int* bsr_col_ind, int row_block_dim, int col_block_dim, float* bsc_val, int* bsc_row_ind, int* bsc_col_ptr, hipsparseAction_t copy_values, hipsparseIndexBase_t idx_base, void* temp_buffer);
  // CHECK: status_t = hipsparseSgebsr2gebsc(handle_t, mb, nb, nnzb, &fbsrSortedVal, &bsrSortedRowPtr, &bsrSortedColInd, rowBlockDim, colBlockDim, &fbscVal, &bscRowInd, &bscColPtr, copyValues, indexBase_t, pBuffer);
  status_t = cusparseSgebsr2gebsc(handle_t, mb, nb, nnzb, &fbsrSortedVal, &bsrSortedRowPtr, &bsrSortedColInd, rowBlockDim, colBlockDim, &fbscVal, &bscRowInd, &bscColPtr, copyValues, indexBase_t, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseZgebsr2gebsc_bufferSize(cusparseHandle_t handle, int mb, int nb, int nnzb, const cuDoubleComplex* bsrSortedVal, const int* bsrSortedRowPtr, const int* bsrSortedColInd, int rowBlockDim, int colBlockDim, int* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZgebsr2gebsc_bufferSize(hipsparseHandle_t handle, int mb, int nb, int nnzb, const hipDoubleComplex* bsr_val, const int* bsr_row_ptr, const int* bsr_col_ind, int row_block_dim, int col_block_dim, size_t* p_buffer_size);
  // CHECK: status_t = hipsparseZgebsr2gebsc_bufferSize(handle_t, mb, nb, nnzb, &dComplexbsrSortedVal, &bsrSortedRowPtr, &bsrSortedColInd, rowBlockDim, colBlockDim, &bufferSizeInBytes);
  status_t = cusparseZgebsr2gebsc_bufferSize(handle_t, mb, nb, nnzb, &dComplexbsrSortedVal, &bsrSortedRowPtr, &bsrSortedColInd, rowBlockDim, colBlockDim, &bufferSizeInBytes);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCgebsr2gebsc_bufferSize(cusparseHandle_t handle, int mb, int nb, int nnzb, const cuComplex* bsrSortedVal, const int* bsrSortedRowPtr, const int* bsrSortedColInd, int rowBlockDim, int colBlockDim, int* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCgebsr2gebsc_bufferSize(hipsparseHandle_t handle, int mb, int nb, int nnzb, const hipComplex* bsr_val, const int* bsr_row_ptr, const int* bsr_col_ind, int row_block_dim, int col_block_dim, size_t* p_buffer_size);
  // CHECK: status_t = hipsparseCgebsr2gebsc_bufferSize(handle_t, mb, nb, nnzb, &complexbsrSortedVal, &bsrSortedRowPtr, &bsrSortedColInd, rowBlockDim, colBlockDim, &bufferSizeInBytes);
  status_t = cusparseCgebsr2gebsc_bufferSize(handle_t, mb, nb, nnzb, &complexbsrSortedVal, &bsrSortedRowPtr, &bsrSortedColInd, rowBlockDim, colBlockDim, &bufferSizeInBytes);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDgebsr2gebsc_bufferSize(cusparseHandle_t handle, int mb, int nb, int nnzb, const double* bsrSortedVal, const int* bsrSortedRowPtr, const int* bsrSortedColInd, int rowBlockDim, int colBlockDim, int* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDgebsr2gebsc_bufferSize(hipsparseHandle_t handle, int mb, int nb, int nnzb, const double* bsr_val, const int* bsr_row_ptr, const int* bsr_col_ind, int row_block_dim, int col_block_dim, size_t* p_buffer_size);
  // CHECK: status_t = hipsparseDgebsr2gebsc_bufferSize(handle_t, mb, nb, nnzb, &dbsrSortedVal, &bsrSortedRowPtr, &bsrSortedColInd, rowBlockDim, colBlockDim, &bufferSizeInBytes);
  status_t = cusparseDgebsr2gebsc_bufferSize(handle_t, mb, nb, nnzb, &dbsrSortedVal, &bsrSortedRowPtr, &bsrSortedColInd, rowBlockDim, colBlockDim, &bufferSizeInBytes);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSgebsr2gebsc_bufferSize(cusparseHandle_t handle, int mb, int nb, int nnzb, const float* bsrSortedVal, const int* bsrSortedRowPtr, const int* bsrSortedColInd, int rowBlockDim, int colBlockDim, int* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSgebsr2gebsc_bufferSize(hipsparseHandle_t handle, int mb, int nb, int nnzb, const float* bsr_val, const int* bsr_row_ptr, const int* bsr_col_ind, int row_block_dim, int col_block_dim, size_t* p_buffer_size);
  // CHECK: status_t = hipsparseSgebsr2gebsc_bufferSize(handle_t, mb, nb, nnzb, &fbsrSortedVal, &bsrSortedRowPtr, &bsrSortedColInd, rowBlockDim, colBlockDim, &bufferSizeInBytes);
  status_t = cusparseSgebsr2gebsc_bufferSize(handle_t, mb, nb, nnzb, &fbsrSortedVal, &bsrSortedRowPtr, &bsrSortedColInd, rowBlockDim, colBlockDim, &bufferSizeInBytes);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseXcsr2coo(cusparseHandle_t handle, const int* csrSortedRowPtr, int nnz, int m, int* cooRowInd, cusparseIndexBase_t idxBase);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseXcsr2coo(hipsparseHandle_t handle, const int* csrRowPtr, int nnz, int m, int* cooRowInd, hipsparseIndexBase_t idxBase);
  // CHECK: status_t = hipsparseXcsr2coo(handle_t, &csrSortedRowPtr, nnz, m, &icooRowInd, indexBase_t);
  status_t = cusparseXcsr2coo(handle_t, &csrSortedRowPtr, nnz, m, &icooRowInd, indexBase_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseZnnz(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const cuDoubleComplex* A, int lda, int* nnzPerRowCol, int* nnzTotalDevHostPtr);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZnnz(hipsparseHandle_t handle, hipsparseDirection_t dirA, int m, int n, const hipsparseMatDescr_t descrA, const hipDoubleComplex* A, int lda, int* nnzPerRowColumn, int* nnzTotalDevHostPtr);
  // CHECK: status_t = hipsparseZnnz(handle_t, direction_t, m, n, matDescr_A, &dcomplexA, lda, &nnzPerRowCol, &nnzTotalDevHostPtr);
  status_t = cusparseZnnz(handle_t, direction_t, m, n, matDescr_A, &dcomplexA, lda, &nnzPerRowCol, &nnzTotalDevHostPtr);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCnnz(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const cuComplex* A, int lda, int* nnzPerRowCol, int* nnzTotalDevHostPtr);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCnnz(hipsparseHandle_t handle, hipsparseDirection_t dirA, int m, int n, const hipsparseMatDescr_t descrA, const hipComplex* A, int lda, int* nnzPerRowColumn, int* nnzTotalDevHostPtr);
  // CHECK: status_t = hipsparseCnnz(handle_t, direction_t, m, n, matDescr_A, &complexA, lda, &nnzPerRowCol, &nnzTotalDevHostPtr);
  status_t = cusparseCnnz(handle_t, direction_t, m, n, matDescr_A, &complexA, lda, &nnzPerRowCol, &nnzTotalDevHostPtr);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDnnz(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const double* A, int lda, int* nnzPerRowCol, int* nnzTotalDevHostPtr);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDnnz(hipsparseHandle_t handle, hipsparseDirection_t dirA, int m, int n, const hipsparseMatDescr_t descrA, const double* A, int lda, int* nnzPerRowColumn, int* nnzTotalDevHostPtr);
  // CHECK: status_t = hipsparseDnnz(handle_t, direction_t, m, n, matDescr_A, &dA, lda, &nnzPerRowCol, &nnzTotalDevHostPtr);
  status_t = cusparseDnnz(handle_t, direction_t, m, n, matDescr_A, &dA, lda, &nnzPerRowCol, &nnzTotalDevHostPtr);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSnnz(cusparseHandle_t handle, cusparseDirection_t dirA, int m, int n, const cusparseMatDescr_t descrA, const float* A, int lda, int* nnzPerRowCol, int* nnzTotalDevHostPtr);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSnnz(hipsparseHandle_t handle, hipsparseDirection_t dirA, int m, int n, const hipsparseMatDescr_t descrA, const float* A, int lda, int* nnzPerRowColumn, int* nnzTotalDevHostPtr);
  // CHECK: status_t = hipsparseSnnz(handle_t, direction_t, m, n, matDescr_A, &fA, lda, &nnzPerRowCol, &nnzTotalDevHostPtr);
  status_t = cusparseSnnz(handle_t, direction_t, m, n, matDescr_A, &fA, lda, &nnzPerRowCol, &nnzTotalDevHostPtr);

#if CUDA_VERSION >= 8000
  // CHECK: hipDataType dataType_t;
  // CHECK-NEXT: hipDataType dataType;
  cudaDataType_t dataType_t;
  cudaDataType dataType;

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseZcsr2csr_compress(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const cuDoubleComplex* csrSortedValA, const int* csrSortedColIndA, const int* csrSortedRowPtrA, int nnzA, const int* nnzPerRow, cuDoubleComplex* csrSortedValC, int* csrSortedColIndC, int* csrSortedRowPtrC, cuDoubleComplex tol);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZcsr2csr_compress(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descrA, const hipDoubleComplex* csrValA, const int* csrColIndA, const int* csrRowPtrA, int nnzA, const int* nnzPerRow, hipDoubleComplex* csrValC, int* csrColIndC, int* csrRowPtrC, hipDoubleComplex tol);
  // CHECK: status_t = hipsparseZcsr2csr_compress(handle_t, m, n, matDescr_A, &dComplexcsrSortedValA, &csrColIndA, &csrRowPtrA, nnza, &nnzPerRow, &dComplexcsrSortedValC, &csrColIndC, &csrRowPtrC, dcomplextol);
  status_t = cusparseZcsr2csr_compress(handle_t, m, n, matDescr_A, &dComplexcsrSortedValA, &csrColIndA, &csrRowPtrA, nnza, &nnzPerRow, &dComplexcsrSortedValC, &csrColIndC, &csrRowPtrC, dcomplextol);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCcsr2csr_compress(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const cuComplex* csrSortedValA, const int* csrSortedColIndA, const int* csrSortedRowPtrA, int nnzA, const int* nnzPerRow, cuComplex* csrSortedValC, int* csrSortedColIndC, int* csrSortedRowPtrC, cuComplex tol);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCcsr2csr_compress(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descrA, const hipComplex* csrValA, const int* csrColIndA, const int* csrRowPtrA, int nnzA, const int* nnzPerRow, hipComplex* csrValC, int* csrColIndC, int* csrRowPtrC, hipComplex tol);
  // CHECK: status_t = hipsparseCcsr2csr_compress(handle_t, m, n, matDescr_A, &complexcsrSortedValA, &csrColIndA, &csrRowPtrA, nnza, &nnzPerRow, &complexcsrSortedValC, &csrColIndC, &csrRowPtrC, complextol);
  status_t = cusparseCcsr2csr_compress(handle_t, m, n, matDescr_A, &complexcsrSortedValA, &csrColIndA, &csrRowPtrA, nnza, &nnzPerRow, &complexcsrSortedValC, &csrColIndC, &csrRowPtrC, complextol);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDcsr2csr_compress(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const double* csrSortedValA, const int* csrSortedColIndA, const int* csrSortedRowPtrA, int nnzA, const int* nnzPerRow, double* csrSortedValC, int* csrSortedColIndC, int* csrSortedRowPtrC, double tol);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDcsr2csr_compress(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descrA, const double* csrValA, const int* csrColIndA, const int* csrRowPtrA, int nnzA, const int* nnzPerRow, double* csrValC, int* csrColIndC, int* csrRowPtrC, double tol);
  // CHECK: status_t = hipsparseDcsr2csr_compress(handle_t, m, n, matDescr_A, &dcsrSortedValA, &csrColIndA, &csrRowPtrA, nnza, &nnzPerRow, &dcsrSortedValC, &csrColIndC, &csrRowPtrC, dtol);
  status_t = cusparseDcsr2csr_compress(handle_t, m, n, matDescr_A, &dcsrSortedValA, &csrColIndA, &csrRowPtrA, nnza, &nnzPerRow, &dcsrSortedValC, &csrColIndC, &csrRowPtrC, dtol);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseScsr2csr_compress(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const float* csrSortedValA, const int* csrSortedColIndA, const int* csrSortedRowPtrA, int nnzA, const int* nnzPerRow, float* csrSortedValC, int* csrSortedColIndC, int* csrSortedRowPtrC, float tol);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseScsr2csr_compress(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descrA, const float* csrValA, const int* csrColIndA, const int* csrRowPtrA, int nnzA, const int* nnzPerRow, float* csrValC, int* csrColIndC, int* csrRowPtrC, float tol);
  // CHECK: status_t = hipsparseScsr2csr_compress(handle_t, m, n, matDescr_A, &csrSortedValA, &csrColIndA, &csrRowPtrA, nnza, &nnzPerRow, &fcsrSortedValC, &csrColIndC, &csrRowPtrC, ftol);
  status_t = cusparseScsr2csr_compress(handle_t, m, n, matDescr_A, &csrSortedValA, &csrColIndA, &csrRowPtrA, nnza, &nnzPerRow, &fcsrSortedValC, &csrColIndC, &csrRowPtrC, ftol);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseZnnz_compress(cusparseHandle_t handle, int m, const cusparseMatDescr_t descr, const cuDoubleComplex* csrSortedValA, const int* csrSortedRowPtrA, int* nnzPerRow, int* nnzC, cuDoubleComplex tol);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZnnz_compress(hipsparseHandle_t handle, int m, const hipsparseMatDescr_t descrA, const hipDoubleComplex* csrValA, const int* csrRowPtrA, int* nnzPerRow, int* nnzC, hipDoubleComplex tol);
  // CHECK: status_t = hipsparseZnnz_compress(handle_t, m, matDescr_A, &dComplexcsrSortedValA, &csrRowPtrA, &nnzPerRow, &nnzc, dcomplextol);
 status_t = cusparseZnnz_compress(handle_t, m, matDescr_A, &dComplexcsrSortedValA, &csrRowPtrA, &nnzPerRow, &nnzc, dcomplextol);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseCnnz_compress(cusparseHandle_t handle, int m, const cusparseMatDescr_t descr, const cuComplex* csrSortedValA, const int* csrSortedRowPtrA, int* nnzPerRow, int* nnzC, cuComplex tol);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCnnz_compress(hipsparseHandle_t handle, int m, const hipsparseMatDescr_t descrA, const hipComplex* csrValA, const int* csrRowPtrA, int* nnzPerRow, int* nnzC, hipComplex tol);
  // CHECK: status_t = hipsparseCnnz_compress(handle_t, m, matDescr_A, &complexcsrSortedValA, &csrRowPtrA, &nnzPerRow, &nnzc, complextol);
 status_t = cusparseCnnz_compress(handle_t, m, matDescr_A, &complexcsrSortedValA, &csrRowPtrA, &nnzPerRow, &nnzc, complextol);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseDnnz_compress(cusparseHandle_t handle, int m, const cusparseMatDescr_t descr, const double* csrSortedValA, const int* csrSortedRowPtrA, int* nnzPerRow, int* nnzC, double tol);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDnnz_compress(hipsparseHandle_t handle, int m, const hipsparseMatDescr_t descrA, const double* csrValA, const int* csrRowPtrA, int* nnzPerRow, int* nnzC, double tol);
  // CHECK: status_t = hipsparseDnnz_compress(handle_t, m, matDescr_A, &dcsrSortedValA, &csrRowPtrA, &nnzPerRow, &nnzc, dtol);
 status_t = cusparseDnnz_compress(handle_t, m, matDescr_A, &dcsrSortedValA, &csrRowPtrA, &nnzPerRow, &nnzc, dtol);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseSnnz_compress(cusparseHandle_t handle, int m, const cusparseMatDescr_t descr, const float* csrSortedValA, const int* csrSortedRowPtrA, int* nnzPerRow, int* nnzC, float tol);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSnnz_compress(hipsparseHandle_t handle, int m, const hipsparseMatDescr_t descrA, const float* csrValA, const int* csrRowPtrA, int* nnzPerRow, int* nnzC, float tol);
  // CHECK: status_t = hipsparseSnnz_compress(handle_t, m, matDescr_A, &csrSortedValA, &csrRowPtrA, &nnzPerRow, &nnzc, ftol);
 status_t = cusparseSnnz_compress(handle_t, m, matDescr_A, &csrSortedValA, &csrRowPtrA, &nnzPerRow, &nnzc, ftol);
#endif

#if CUDA_VERSION >= 8000 && CUDA_VERSION < 12000
  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCopyMatDescr(cusparseMatDescr_t dest, const cusparseMatDescr_t src);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCopyMatDescr(hipsparseMatDescr_t dest, const hipsparseMatDescr_t src);
  // CHECK: status_t = hipsparseCopyMatDescr(matDescr_t, matDescr_t_2);
  status_t = cusparseCopyMatDescr(matDescr_t, matDescr_t_2);
#endif

#if CUDA_VERSION >= 9000
  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDpruneCsr2csrByPercentage(cusparseHandle_t handle, int m, int n, int nnzA, const cusparseMatDescr_t descrA, const double* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, float percentage, const cusparseMatDescr_t descrC, double* csrSortedValC, const int* csrSortedRowPtrC, int* csrSortedColIndC, pruneInfo_t info, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDpruneCsr2csrByPercentage(hipsparseHandle_t handle, int m, int n, int nnzA, const hipsparseMatDescr_t descrA, const double* csrValA, const int* csrRowPtrA, const int* csrColIndA, double percentage, const hipsparseMatDescr_t descrC, double* csrValC, const int* csrRowPtrC, int* csrColIndC, pruneInfo_t info, void* buffer);
  // CHECK: status_t = hipsparseDpruneCsr2csrByPercentage(handle_t, m, n, nnz, matDescr_A, &csrValA, &csrRowPtrA, &csrColIndA, percentage, matDescr_C, &csrValC, &csrRowPtrC, &csrColIndC, prune_info, pBuffer);
  status_t = cusparseDpruneCsr2csrByPercentage(handle_t, m, n, nnz, matDescr_A, &csrValA, &csrRowPtrA, &csrColIndA, percentage, matDescr_C, &csrValC, &csrRowPtrC, &csrColIndC, prune_info, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpruneCsr2csrByPercentage(cusparseHandle_t handle, int m, int n, int nnzA, const cusparseMatDescr_t descrA, const float* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, float percentage, const cusparseMatDescr_t descrC, float* csrSortedValC, const int* csrSortedRowPtrC, int* csrSortedColIndC, pruneInfo_t info, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpruneCsr2csrByPercentage(hipsparseHandle_t handle, int m, int n, int nnzA, const hipsparseMatDescr_t descrA, const float* csrValA, const int* csrRowPtrA, const int* csrColIndA, float percentage, const hipsparseMatDescr_t descrC, float* csrValC, const int* csrRowPtrC, int* csrColIndC, pruneInfo_t info, void* buffer);
  // CHECK: status_t = hipsparseSpruneCsr2csrByPercentage(handle_t, m, n, nnz, matDescr_A, &fcsrValA, &csrRowPtrA, &csrColIndA, percentage, matDescr_C, &fcsrValC, &csrRowPtrC, &csrColIndC, prune_info, pBuffer);
  status_t = cusparseSpruneCsr2csrByPercentage(handle_t, m, n, nnz, matDescr_A, &fcsrValA, &csrRowPtrA, &csrColIndA, percentage, matDescr_C, &fcsrValC, &csrRowPtrC, &csrColIndC, prune_info, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDpruneCsr2csrNnzByPercentage(cusparseHandle_t handle, int m, int n, int nnzA, const cusparseMatDescr_t descrA, const double* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, float percentage, const cusparseMatDescr_t descrC, int* csrSortedRowPtrC, int* nnzTotalDevHostPtr, pruneInfo_t info, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDpruneCsr2csrNnzByPercentage(hipsparseHandle_t handle, int m, int n, int nnzA, const hipsparseMatDescr_t descrA, const double* csrValA, const int* csrRowPtrA, const int* csrColIndA, double percentage, const hipsparseMatDescr_t descrC, int* csrRowPtrC, int* nnzTotalDevHostPtr, pruneInfo_t info, void* buffer);
  // CHECK: status_t = hipsparseDpruneCsr2csrNnzByPercentage(handle_t, m, n, nnz, matDescr_A, &dbsrSortedValA, &csrRowPtrA, &csrColIndA, percentage, matDescr_C, &csrRowPtrC, &csrColIndC, prune_info, pBuffer);
  status_t = cusparseDpruneCsr2csrNnzByPercentage(handle_t, m, n, nnz, matDescr_A, &dbsrSortedValA, &csrRowPtrA, &csrColIndA, percentage, matDescr_C, &csrRowPtrC, &csrColIndC, prune_info, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpruneCsr2csrNnzByPercentage(cusparseHandle_t handle, int m, int n, int nnzA, const cusparseMatDescr_t descrA, const float* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, float percentage, const cusparseMatDescr_t descrC, int* csrSortedRowPtrC, int* nnzTotalDevHostPtr, pruneInfo_t info, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpruneCsr2csrNnzByPercentage(hipsparseHandle_t handle, int m, int n, int nnzA, const hipsparseMatDescr_t descrA, const float* csrValA, const int* csrRowPtrA, const int* csrColIndA, float percentage, const hipsparseMatDescr_t descrC, int* csrRowPtrC, int* nnzTotalDevHostPtr, pruneInfo_t info, void* buffer);
  // CHECK: status_t = hipsparseSpruneCsr2csrNnzByPercentage(handle_t, m, n, nnz, matDescr_A, &csrSortedValA, &csrRowPtrA, &csrColIndA, percentage, matDescr_C, &csrRowPtrC, &csrColIndC, prune_info, pBuffer);
  status_t = cusparseSpruneCsr2csrNnzByPercentage(handle_t, m, n, nnz, matDescr_A, &csrSortedValA, &csrRowPtrA, &csrColIndA, percentage, matDescr_C, &csrRowPtrC, &csrColIndC, prune_info, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDpruneCsr2csrByPercentage_bufferSizeExt(cusparseHandle_t handle, int m, int n, int nnzA, const cusparseMatDescr_t descrA, const double* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, float percentage, const cusparseMatDescr_t descrC, const double* csrSortedValC, const int* csrSortedRowPtrC, const int* csrSortedColIndC, pruneInfo_t info, size_t* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDpruneCsr2csrByPercentage_bufferSizeExt(hipsparseHandle_t handle, int m, int n, int nnzA, const hipsparseMatDescr_t descrA, const double* csrValA, const int* csrRowPtrA, const int* csrColIndA, double percentage, const hipsparseMatDescr_t descrC, const double* csrValC, const int* csrRowPtrC, const int* csrColIndC, pruneInfo_t info, size_t* bufferSize);
  // CHECK: status_t = hipsparseDpruneCsr2csrByPercentage_bufferSizeExt(handle_t, m, n, nnz, matDescr_A, &dbsrSortedValA, &csrRowPtrA, &csrColIndA, percentage, matDescr_C, &dbsrSortedValC, &csrRowPtrC, &csrColIndC, prune_info, &bufferSize);
  status_t = cusparseDpruneCsr2csrByPercentage_bufferSizeExt(handle_t, m, n, nnz, matDescr_A, &dbsrSortedValA, &csrRowPtrA, &csrColIndA, percentage, matDescr_C, &dbsrSortedValC, &csrRowPtrC, &csrColIndC, prune_info, &bufferSize);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpruneCsr2csrByPercentage_bufferSizeExt(cusparseHandle_t handle, int m, int n, int nnzA, const cusparseMatDescr_t descrA, const float* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, float percentage, const cusparseMatDescr_t descrC, const float* csrSortedValC, const int* csrSortedRowPtrC, const int* csrSortedColIndC, pruneInfo_t info, size_t* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpruneCsr2csrByPercentage_bufferSizeExt(hipsparseHandle_t handle, int m, int n, int nnzA, const hipsparseMatDescr_t descrA, const float* csrValA, const int* csrRowPtrA, const int* csrColIndA, float percentage, const hipsparseMatDescr_t descrC, const float* csrValC, const int* csrRowPtrC, const int* csrColIndC, pruneInfo_t info, size_t* bufferSize);
  // CHECK: status_t = hipsparseSpruneCsr2csrByPercentage_bufferSizeExt(handle_t, m, n, nnz, matDescr_A, &fbsrSortedValA, &csrRowPtrA, &csrColIndA, percentage, matDescr_C, &fbsrSortedValC, &csrRowPtrC, &csrColIndC, prune_info, &bufferSize);
  status_t = cusparseSpruneCsr2csrByPercentage_bufferSizeExt(handle_t, m, n, nnz, matDescr_A, &fbsrSortedValA, &csrRowPtrA, &csrColIndA, percentage, matDescr_C, &fbsrSortedValC, &csrRowPtrC, &csrColIndC, prune_info, &bufferSize);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDpruneCsr2csr(cusparseHandle_t handle, int m, int n, int nnzA, const cusparseMatDescr_t descrA, const double* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, const double* threshold, const cusparseMatDescr_t descrC, double* csrSortedValC, const int* csrSortedRowPtrC, int* csrSortedColIndC, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDpruneCsr2csr(hipsparseHandle_t handle, int m, int n, int nnzA, const hipsparseMatDescr_t descrA, const double* csrValA, const int* csrRowPtrA, const int* csrColIndA, const double* threshold, const hipsparseMatDescr_t descrC, double* csrValC, const int* csrRowPtrC, int* csrColIndC, void* buffer);
  // CHECK: status_t = hipsparseDpruneCsr2csr(handle_t, m, n, nnz, matDescr_A, &dbsrSortedValA, &csrRowPtrA, &csrColIndA, &dthreshold, matDescr_C, &dbsrSortedValC, &csrRowPtrC, &csrColIndC, pBuffer);
  status_t = cusparseDpruneCsr2csr(handle_t, m, n, nnz, matDescr_A, &dbsrSortedValA, &csrRowPtrA, &csrColIndA, &dthreshold, matDescr_C, &dbsrSortedValC, &csrRowPtrC, &csrColIndC, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpruneCsr2csr(cusparseHandle_t handle, int m, int n, int nnzA, const cusparseMatDescr_t descrA, const float* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, const float* threshold, const cusparseMatDescr_t descrC, float* csrSortedValC, const int* csrSortedRowPtrC, int* csrSortedColIndC, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpruneCsr2csr(hipsparseHandle_t handle, int m, int n, int nnzA, const hipsparseMatDescr_t descrA, const float* csrValA, const int* csrRowPtrA, const int* csrColIndA, const float* threshold, const hipsparseMatDescr_t descrC, float* csrValC, const int* csrRowPtrC, int* csrColIndC, void* buffer);
  // CHECK: status_t = hipsparseSpruneCsr2csr(handle_t, m, n, nnz, matDescr_A, &fbsrSortedValA, &csrRowPtrA, &csrColIndA, &fthreshold, matDescr_C, &fbsrSortedValC, &csrRowPtrC, &csrColIndC, pBuffer);
  status_t = cusparseSpruneCsr2csr(handle_t, m, n, nnz, matDescr_A, &fbsrSortedValA, &csrRowPtrA, &csrColIndA, &fthreshold, matDescr_C, &fbsrSortedValC, &csrRowPtrC, &csrColIndC, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDpruneCsr2csrNnz(cusparseHandle_t handle, int m, int n, int nnzA, const cusparseMatDescr_t descrA, const double* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, const double* threshold, const cusparseMatDescr_t descrC, int* csrSortedRowPtrC, int* nnzTotalDevHostPtr, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDpruneCsr2csrNnz(hipsparseHandle_t handle, int m, int n, int nnzA, const hipsparseMatDescr_t descrA, const double* csrValA, const int* csrRowPtrA, const int* csrColIndA, const double* threshold, const hipsparseMatDescr_t descrC, int* csrRowPtrC, int* nnzTotalDevHostPtr, void* buffer);
  // CHECK: status_t = hipsparseDpruneCsr2csrNnz(handle_t, m, n, nnz, matDescr_A, &dbsrSortedValA, &csrRowPtrA, &csrColIndA, &dthreshold, matDescr_C, &csrRowPtrC, &nnzTotalDevHostPtr, pBuffer);
  status_t = cusparseDpruneCsr2csrNnz(handle_t, m, n, nnz, matDescr_A, &dbsrSortedValA, &csrRowPtrA, &csrColIndA, &dthreshold, matDescr_C, &csrRowPtrC, &nnzTotalDevHostPtr, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpruneCsr2csrNnz(cusparseHandle_t handle, int m, int n, int nnzA, const cusparseMatDescr_t descrA, const float* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, const float* threshold, const cusparseMatDescr_t descrC, int* csrSortedRowPtrC, int* nnzTotalDevHostPtr, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpruneCsr2csrNnz(hipsparseHandle_t handle, int m, int n, int nnzA, const hipsparseMatDescr_t descrA, const float* csrValA, const int* csrRowPtrA, const int* csrColIndA, const float* threshold, const hipsparseMatDescr_t descrC, int* csrRowPtrC, int* nnzTotalDevHostPtr, void* buffer);
  // CHECK: status_t = hipsparseSpruneCsr2csrNnz(handle_t, m, n, nnz, matDescr_A, &csrSortedValA, &csrRowPtrA, &csrColIndA, &fthreshold, matDescr_C, &csrRowPtrC, &nnzTotalDevHostPtr, pBuffer);
  status_t = cusparseSpruneCsr2csrNnz(handle_t, m, n, nnz, matDescr_A, &csrSortedValA, &csrRowPtrA, &csrColIndA, &fthreshold, matDescr_C, &csrRowPtrC, &nnzTotalDevHostPtr, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDpruneCsr2csr_bufferSizeExt(cusparseHandle_t handle, int m, int n, int nnzA, const cusparseMatDescr_t descrA, const double* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, const double* threshold, const cusparseMatDescr_t descrC, const double* csrSortedValC, const int* csrSortedRowPtrC, const int* csrSortedColIndC, size_t* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDpruneCsr2csr_bufferSizeExt(hipsparseHandle_t handle, int m, int n, int nnzA, const hipsparseMatDescr_t descrA, const double* csrValA, const int* csrRowPtrA, const int* csrColIndA, const double* threshold, const hipsparseMatDescr_t descrC, const double* csrValC, const int* csrRowPtrC, const int* csrColIndC, size_t* bufferSize);
  // CHECK: status_t = hipsparseDpruneCsr2csr_bufferSizeExt(handle_t, m, n, nnz, matDescr_A, &dbsrSortedValA, &csrRowPtrA, &csrColIndA, &dthreshold, matDescr_C, &dbsrSortedValC, &csrRowPtrC, &csrColIndC, &bufferSize);
  status_t = cusparseDpruneCsr2csr_bufferSizeExt(handle_t, m, n, nnz, matDescr_A, &dbsrSortedValA, &csrRowPtrA, &csrColIndA, &dthreshold, matDescr_C, &dbsrSortedValC, &csrRowPtrC, &csrColIndC, &bufferSize);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpruneCsr2csr_bufferSizeExt(cusparseHandle_t handle, int m, int n, int nnzA, const cusparseMatDescr_t descrA, const float* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, const float* threshold, const cusparseMatDescr_t descrC, const float* csrSortedValC, const int* csrSortedRowPtrC, const int* csrSortedColIndC, size_t* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpruneCsr2csr_bufferSizeExt(hipsparseHandle_t handle, int m, int n, int nnzA, const hipsparseMatDescr_t descrA, const float* csrValA, const int* csrRowPtrA, const int* csrColIndA, const float* threshold, const hipsparseMatDescr_t descrC, const float* csrValC, const int* csrRowPtrC, const int* csrColIndC, size_t* bufferSize);
  // CHECK: status_t = hipsparseSpruneCsr2csr_bufferSizeExt(handle_t, m, n, nnz, matDescr_A, &fbsrSortedValA, &csrRowPtrA, &csrColIndA, &fthreshold, matDescr_C, &fbsrSortedValC, &csrRowPtrC, &csrColIndC, &bufferSize);
  status_t = cusparseSpruneCsr2csr_bufferSizeExt(handle_t, m, n, nnz, matDescr_A, &fbsrSortedValA, &csrRowPtrA, &csrColIndA, &fthreshold, matDescr_C, &fbsrSortedValC, &csrRowPtrC, &csrColIndC, &bufferSize);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseDpruneDense2csrByPercentage(cusparseHandle_t handle, int m, int n, const double* A, int lda, float percentage, const cusparseMatDescr_t descrC, double* csrSortedValC, const int* csrSortedRowPtrC,int* csrSortedColIndC, pruneInfo_t info, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDpruneDense2csrByPercentage(hipsparseHandle_t handle, int m, int n, const double* A, int lda, double percentage, const hipsparseMatDescr_t descr, double* csrVal, const int* csrRowPtr, int* csrColInd, pruneInfo_t info, void* buffer);
  // CHECK: status_t = hipsparseDpruneDense2csrByPercentage(handle_t, m, n, &dA, lda, percentage, matDescr_C, &dcsrSortedValC, &csrRowPtrC, &csrColIndC, prune_info, pBuffer);
  status_t = cusparseDpruneDense2csrByPercentage(handle_t, m, n, &dA, lda, percentage, matDescr_C, &dcsrSortedValC, &csrRowPtrC, &csrColIndC, prune_info, pBuffer);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseSpruneDense2csrByPercentage(cusparseHandle_t handle, int m, int n, const float* A, int lda, float percentage, const cusparseMatDescr_t descrC, float* csrSortedValC, const int* csrSortedRowPtrC, int* csrSortedColIndC, pruneInfo_t info, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpruneDense2csrByPercentage(hipsparseHandle_t handle, int m, int n, const float* A, int lda, float percentage, const hipsparseMatDescr_t descr, float* csrVal, const int* csrRowPtr, int* csrColInd, pruneInfo_t info, void* buffer);
  // CHECK: status_t = hipsparseSpruneDense2csrByPercentage(handle_t, m, n, &fA, lda, fpercentage, matDescr_C, &fcsrSortedValC, &csrRowPtrC, &csrColIndC, prune_info, pBuffer);
  status_t = cusparseSpruneDense2csrByPercentage(handle_t, m, n, &fA, lda, fpercentage, matDescr_C, &fcsrSortedValC, &csrRowPtrC, &csrColIndC, prune_info, pBuffer);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseDpruneDense2csrNnzByPercentage(cusparseHandle_t handle, int m, int n, const double* A, int lda, float percentage, const cusparseMatDescr_t descrC, int* csrRowPtrC, int* nnzTotalDevHostPtr, pruneInfo_t info, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDpruneDense2csrNnzByPercentage(hipsparseHandle_t handle, int m, int n, const double* A, int lda, double percentage, const hipsparseMatDescr_t descr, int* csrRowPtr, int* nnzTotalDevHostPtr, pruneInfo_t info, void* buffer);
  // CHECK: status_t = hipsparseDpruneDense2csrNnzByPercentage(handle_t, m, n, &dA, lda, fpercentage, matDescr_C, &csrRowPtrC, &nnzTotalDevHostPtr, prune_info, pBuffer);
  status_t = cusparseDpruneDense2csrNnzByPercentage(handle_t, m, n, &dA, lda, fpercentage, matDescr_C, &csrRowPtrC, &nnzTotalDevHostPtr, prune_info, pBuffer);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseSpruneDense2csrNnzByPercentage(cusparseHandle_t handle, int m, int n, const float* A, int lda, float percentage, const cusparseMatDescr_t descrC, int* csrRowPtrC, int* nnzTotalDevHostPtr, pruneInfo_t info, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpruneDense2csrNnzByPercentage(hipsparseHandle_t handle, int m, int n, const float* A, int lda, float percentage, const hipsparseMatDescr_t descr, int* csrRowPtr, int* nnzTotalDevHostPtr, pruneInfo_t info, void* buffer);
  // CHECK: status_t = hipsparseSpruneDense2csrNnzByPercentage(handle_t, m, n, &fA, lda, fpercentage, matDescr_C, &csrRowPtrC, &nnzTotalDevHostPtr, prune_info, pBuffer);
  status_t = cusparseSpruneDense2csrNnzByPercentage(handle_t, m, n, &fA, lda, fpercentage, matDescr_C, &csrRowPtrC, &nnzTotalDevHostPtr, prune_info, pBuffer);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseDpruneDense2csrByPercentage_bufferSizeExt(cusparseHandle_t handle, int m, int n, const double* A, int lda, float percentage, const cusparseMatDescr_t descrC, const double* csrSortedValC, const int* csrSortedRowPtrC, const int* csrSortedColIndC, pruneInfo_t info, size_t* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDpruneDense2csrByPercentage_bufferSizeExt(hipsparseHandle_t handle, int m, int n, const double* A, int lda, double percentage, const hipsparseMatDescr_t descr, const double* csrVal, const int* csrRowPtr, const int* csrColInd, pruneInfo_t info, size_t* bufferSize);
  // CHECK: status_t = hipsparseDpruneDense2csrByPercentage_bufferSizeExt(handle_t, m, n, &dA, lda, fpercentage, matDescr_C, &dcsrSortedValC, &csrRowPtrC, &csrColIndC, prune_info, &bufferSize);
  status_t = cusparseDpruneDense2csrByPercentage_bufferSizeExt(handle_t, m, n, &dA, lda, fpercentage, matDescr_C, &dcsrSortedValC, &csrRowPtrC, &csrColIndC, prune_info, &bufferSize);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseSpruneDense2csrByPercentage_bufferSizeExt(cusparseHandle_t handle, int m, int n, const float* A, int lda, float percentage, const cusparseMatDescr_t descrC, const float* csrSortedValC, const int* csrSortedRowPtrC, const int* csrSortedColIndC, pruneInfo_t info, size_t* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpruneDense2csrByPercentage_bufferSizeExt(hipsparseHandle_t handle, int m, int n, const float* A, int lda, float percentage, const hipsparseMatDescr_t descr, const float* csrVal, const int* csrRowPtr, const int* csrColInd, pruneInfo_t info, size_t* bufferSize);
  // CHECK: status_t = hipsparseSpruneDense2csrByPercentage_bufferSizeExt(handle_t, m, n, &fA, lda, fpercentage, matDescr_C, &fcsrSortedValC, &csrRowPtrC, &csrColIndC, prune_info, &bufferSize);
  status_t = cusparseSpruneDense2csrByPercentage_bufferSizeExt(handle_t, m, n, &fA, lda, fpercentage, matDescr_C, &fcsrSortedValC, &csrRowPtrC, &csrColIndC, prune_info, &bufferSize);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseDpruneDense2csr(cusparseHandle_t handle, int m, int n, const double* A, int lda, const double* threshold, const cusparseMatDescr_t descrC, double* csrSortedValC, const int* csrSortedRowPtrC, int* csrSortedColIndC, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDpruneDense2csr(hipsparseHandle_t handle, int m, int n, const double* A, int lda, const double* threshold, const hipsparseMatDescr_t descr, double* csrVal, const int* csrRowPtr, int* csrColInd, void* buffer);
  // CHECK: status_t = hipsparseDpruneDense2csr(handle_t, m, n, &dA, lda, &dthreshold, matDescr_C, &dcsrSortedValC, &csrRowPtrC, &csrColIndC, pBuffer);
  status_t = cusparseDpruneDense2csr(handle_t, m, n, &dA, lda, &dthreshold, matDescr_C, &dcsrSortedValC, &csrRowPtrC, &csrColIndC, pBuffer);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseSpruneDense2csr(cusparseHandle_t handle, int m, int n, const float* A, int lda, const float* threshold, const cusparseMatDescr_t descrC, float* csrSortedValC, const int* csrSortedRowPtrC, int* csrSortedColIndC, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpruneDense2csr(hipsparseHandle_t handle, int m, int n, const float* A, int lda, const float* threshold, const hipsparseMatDescr_t descr, float* csrVal, const int* csrRowPtr, int* csrColInd, void* buffer);
  // CHECK: status_t = hipsparseSpruneDense2csr(handle_t, m, n, &fA, lda, &fthreshold, matDescr_C, &fcsrSortedValC, &csrRowPtrC, &csrColIndC, pBuffer);
  status_t = cusparseSpruneDense2csr(handle_t, m, n, &fA, lda, &fthreshold, matDescr_C, &fcsrSortedValC, &csrRowPtrC, &csrColIndC, pBuffer);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseDpruneDense2csrNnz(cusparseHandle_t handle, int m, int n, const double* A, int lda, const double* threshold, const cusparseMatDescr_t descrC, int* csrSortedRowPtrC, int* nnzTotalDevHostPtr, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDpruneDense2csrNnz(hipsparseHandle_t handle, int m, int n, const double* A, int lda, const double* threshold, const hipsparseMatDescr_t descr, int* csrRowPtr, int* nnzTotalDevHostPtr, void* buffer);
  // CHECK: status_t = hipsparseDpruneDense2csrNnz(handle_t, m, n, &dA, lda, &dthreshold, matDescr_C, &csrRowPtrC, &nnzTotalDevHostPtr, pBuffer);
  status_t = cusparseDpruneDense2csrNnz(handle_t, m, n, &dA, lda, &dthreshold, matDescr_C, &csrRowPtrC, &nnzTotalDevHostPtr, pBuffer);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseSpruneDense2csrNnz(cusparseHandle_t handle, int m, int n, const float* A, int lda, const float* threshold, const cusparseMatDescr_t descrC, int* csrRowPtrC, int* nnzTotalDevHostPtr, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpruneDense2csrNnz(hipsparseHandle_t handle, int m, int n, const float* A, int lda, const float* threshold, const hipsparseMatDescr_t descr, int* csrRowPtr, int* nnzTotalDevHostPtr, void* buffer);
  // CHECK: status_t = hipsparseSpruneDense2csrNnz(handle_t, m, n, &fA, lda, &fthreshold, matDescr_C, &csrRowPtrC, &nnzTotalDevHostPtr, pBuffer);
  status_t = cusparseSpruneDense2csrNnz(handle_t, m, n, &fA, lda, &fthreshold, matDescr_C, &csrRowPtrC, &nnzTotalDevHostPtr, pBuffer);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseDpruneDense2csr_bufferSizeExt(cusparseHandle_t handle, int m, int n, const double* A, int lda, const double* threshold, const cusparseMatDescr_t descrC, const double* csrSortedValC, const int* csrSortedRowPtrC, const int* csrSortedColIndC, size_t* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDpruneDense2csr_bufferSizeExt(hipsparseHandle_t handle, int m, int n, const double* A, int lda, const double* threshold, const hipsparseMatDescr_t descr, const double* csrVal, const int* csrRowPtr, const int* csrColInd, size_t* bufferSize);
  // CHECK: status_t = hipsparseDpruneDense2csr_bufferSizeExt(handle_t, m, n, &dA, lda, &dthreshold, matDescr_C, &dcsrSortedValC, &csrRowPtrC, &csrColIndC, &bufferSize);
  status_t = cusparseDpruneDense2csr_bufferSizeExt(handle_t, m, n, &dA, lda, &dthreshold, matDescr_C, &dcsrSortedValC, &csrRowPtrC, &csrColIndC, &bufferSize);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseSpruneDense2csr_bufferSizeExt(cusparseHandle_t handle, int m, int n, const float* A, int lda, const float* threshold, const cusparseMatDescr_t descrC, const float* csrSortedValC, const int* csrSortedRowPtrC, const int* csrSortedColIndC, size_t* pBufferSizeInBytes);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpruneDense2csr_bufferSizeExt(hipsparseHandle_t handle, int m, int n, const float* A, int lda, const float* threshold, const hipsparseMatDescr_t descr,const float* csrVal, const int* csrRowPtr, const int* csrColInd, size_t* bufferSize);
  // CHECK: status_t = hipsparseSpruneDense2csr_bufferSizeExt(handle_t, m, n, &fA, lda, &fthreshold, matDescr_C, &fcsrSortedValC, &csrRowPtrC, &csrColIndC, &bufferSize);
  status_t = cusparseSpruneDense2csr_bufferSizeExt(handle_t, m, n, &fA, lda, &fthreshold, matDescr_C, &fcsrSortedValC, &csrRowPtrC, &csrColIndC, &bufferSize);
#endif

#if CUDA_VERSION >= 9020
  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseZgpsvInterleavedBatch(cusparseHandle_t handle, int algo, int m, cuDoubleComplex* ds, cuDoubleComplex* dl, cuDoubleComplex* d, cuDoubleComplex* du, cuDoubleComplex* dw, cuDoubleComplex* x, int batchCount, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZgpsvInterleavedBatch(hipsparseHandle_t handle, int algo, int m, hipDoubleComplex* ds, hipDoubleComplex* dl, hipDoubleComplex* d, hipDoubleComplex* du, hipDoubleComplex* dw, hipDoubleComplex* x, int batchCount, void* pBuffer);
  // CHECK: status_t = hipsparseZgpsvInterleavedBatch(handle_t, algo, m, &dcomplexds, &dcomplexdl, &dcomplexd, &dcomplexdu, &dcomplexdw, &dcomplexx, batchCount, pBuffer);
  status_t = cusparseZgpsvInterleavedBatch(handle_t, algo, m, &dcomplexds, &dcomplexdl, &dcomplexd, &dcomplexdu, &dcomplexdw, &dcomplexx, batchCount, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCgpsvInterleavedBatch(cusparseHandle_t handle, int algo, int m, cuComplex* ds, cuComplex* dl, cuComplex* d, cuComplex* du, cuComplex* dw, cuComplex* x, int batchCount, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCgpsvInterleavedBatch(hipsparseHandle_t handle, int algo, int m, hipComplex* ds, hipComplex* dl, hipComplex* d, hipComplex* du, hipComplex* dw, hipComplex* x, int batchCount, void* pBuffer);
  // CHECK: status_t = hipsparseCgpsvInterleavedBatch(handle_t, algo, m, &complexds, &complexdl, &complexd, &complexdu, &complexdw, &complexx, batchCount, pBuffer);
  status_t = cusparseCgpsvInterleavedBatch(handle_t, algo, m, &complexds, &complexdl, &complexd, &complexdu, &complexdw, &complexx, batchCount, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDgpsvInterleavedBatch(cusparseHandle_t handle, int algo, int m, double* ds, double* dl, double* d, double* du, double* dw, double* x, int batchCount, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDgpsvInterleavedBatch(hipsparseHandle_t handle, int algo, int m, double* ds, double* dl, double* d, double* du, double* dw, double* x, int batchCount, void* pBuffer);
  // CHECK: status_t = hipsparseDgpsvInterleavedBatch(handle_t, algo, m, &dds, &ddl, &dd, &ddu, &ddw, &dx, batchCount, pBuffer);
  status_t = cusparseDgpsvInterleavedBatch(handle_t, algo, m, &dds, &ddl, &dd, &ddu, &ddw, &dx, batchCount, pBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSgpsvInterleavedBatch(cusparseHandle_t handle, int algo, int m, float* ds, float* dl, float* d, float* du, float* dw, float* x, int batchCount, void* pBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSgpsvInterleavedBatch(hipsparseHandle_t handle, int algo, int m, float* ds, float* dl, float* d, float* du, float* dw, float* x, int batchCount, void* pBuffer);
  // CHECK: status_t = hipsparseSgpsvInterleavedBatch(handle_t, algo, m, &fds, &fdl, &fd, &fdu, &fdw, &fx, batchCount, pBuffer);
  status_t = cusparseSgpsvInterleavedBatch(handle_t, algo, m, &fds, &fdl, &fd, &fdu, &fdw, &fx, batchCount, pBuffer);
#endif

#if CUDA_VERSION >= 10010
  // CHECK: hipsparseCsr2CscAlg_t Csr2CscAlg_t;
  // CHECK-NEXT: hipsparseCsr2CscAlg_t CSR2CSC_ALG1 = HIPSPARSE_CSR2CSC_ALG1;
  cusparseCsr2CscAlg_t Csr2CscAlg_t;
  cusparseCsr2CscAlg_t CSR2CSC_ALG1 = CUSPARSE_CSR2CSC_ALG1;
#endif

#if (CUDA_VERSION >= 10010 && CUDA_VERSION < 11000 && !defined(_WIN32)) || CUDA_VERSION >= 11000
  // CHECK: hipsparseSpMatDescr_t spMatDescr_t, matC;
  cusparseSpMatDescr_t spMatDescr_t, matC;

  // CHECK: hipsparseDnMatDescr_t dnMatDescr_t, matA, matB;
  cusparseDnMatDescr_t dnMatDescr_t, matA, matB;

  // CHECK: hipsparseIndexType_t indexType_t;
  // CHECK-NEXT: hipsparseIndexType_t csrRowOffsetsType;
  // CHECK-NEXT: hipsparseIndexType_t cscColOffsetsType;
  // CHECK-NEXT: hipsparseIndexType_t cscRowIndType;
  // CHECK-NEXT: hipsparseIndexType_t csrColIndType;
  // CHECK-NEXT: hipsparseIndexType_t ellIdxType;
  // CHECK-NEXT: hipsparseIndexType_t INDEX_16U = HIPSPARSE_INDEX_16U;
  // CHECK-NEXT: hipsparseIndexType_t INDEX_32I = HIPSPARSE_INDEX_32I;
  // CHECK-NEXT: hipsparseIndexType_t INDEX_64I = HIPSPARSE_INDEX_64I;
  cusparseIndexType_t indexType_t;
  cusparseIndexType_t csrRowOffsetsType;
  cusparseIndexType_t cscColOffsetsType;
  cusparseIndexType_t cscRowIndType;
  cusparseIndexType_t csrColIndType;
  cusparseIndexType_t ellIdxType;
  cusparseIndexType_t INDEX_16U = CUSPARSE_INDEX_16U;
  cusparseIndexType_t INDEX_32I = CUSPARSE_INDEX_32I;
  cusparseIndexType_t INDEX_64I = CUSPARSE_INDEX_64I;

  // CHECK: hipsparseFormat_t format_t;
  // CHECK-NEXT: hipsparseFormat_t FORMAT_CSR = HIPSPARSE_FORMAT_CSR;
  // CHECK-NEXT: hipsparseFormat_t FORMAT_CSC = HIPSPARSE_FORMAT_CSC;
  // CHECK-NEXT: hipsparseFormat_t FORMAT_CSO = HIPSPARSE_FORMAT_COO;
  cusparseFormat_t format_t;
  cusparseFormat_t FORMAT_CSR = CUSPARSE_FORMAT_CSR;
  cusparseFormat_t FORMAT_CSC = CUSPARSE_FORMAT_CSC;
  cusparseFormat_t FORMAT_CSO = CUSPARSE_FORMAT_COO;

  // CHECK: hipsparseOrder_t order_t;
  // CHECK-NEXT: hipsparseOrder_t ORDER_COL = HIPSPARSE_ORDER_COL;
  // CHECK-NEXT: hipsparseOrder_t ORDER_ROW = HIPSPARSE_ORDER_ROW;
  cusparseOrder_t order_t;
  cusparseOrder_t ORDER_COL = CUSPARSE_ORDER_COL;
  cusparseOrder_t ORDER_ROW = CUSPARSE_ORDER_ROW;

  // CHECK: hipsparseSpMMAlg_t spMMAlg_t;
  cusparseSpMMAlg_t spMMAlg_t;

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCreateCoo(cusparseSpMatDescr_t* spMatDescr, int64_t ows, int64_t cols, int64_t nnz, void* cooRowInd, void* cooColInd, void* cooValues, cusparseIndexType_t cooIdxType, cusparseIndexBase_t idxBase, cudaDataType valueType);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCreateCoo(hipsparseSpMatDescr_t* spMatDescr, int64_t rows, int64_t cols, int64_t nnz, void* cooRowInd, void* cooColInd, void* cooValues, hipsparseIndexType_t cooIdxType, hipsparseIndexBase_t idxBase, hipDataType valueType);
  // CHECK: status_t = hipsparseCreateCoo(&spMatDescr_t, rows, cols, nnz, cooRowInd, cooColInd, cooValues, indexType_t, indexBase_t, dataType);
  status_t = cusparseCreateCoo(&spMatDescr_t, rows, cols, nnz, cooRowInd, cooColInd, cooValues, indexType_t, indexBase_t, dataType);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDestroySpMat(cusparseConstSpMatDescr_t spMatDescr);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDestroySpMat(hipsparseSpMatDescr_t spMatDescr);
  // CHECK: status_t = hipsparseDestroySpMat(spMatDescr_t);
  status_t = cusparseDestroySpMat(spMatDescr_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCooGet(cusparseSpMatDescr_t spMatDescr, int64_t* rows, int64_t* cols, int64_t* nnz, void** cooRowInd, void** cooColInd, void** cooValues, cusparseIndexType_t* idxType, cusparseIndexBase_t* idxBase, cudaDataType* valueType);
  // HIP: hipsparseStatus_t hipsparseCooGet(const hipsparseSpMatDescr_t spMatDescr, int64_t* rows, int64_t* cols, int64_t* nnz, void** cooRowInd, void** cooColInd, void** cooValues, hipsparseIndexType_t* idxType, hipsparseIndexBase_t* idxBase, hipDataType* valueType);
  // CHECK: status_t = hipsparseCooGet(spMatDescr_t, &rows, &cols, &nnz, &cooRowInd, &cooColInd, &cooValues, &indexType_t, &indexBase_t, &dataType);
  status_t = cusparseCooGet(spMatDescr_t, &rows, &cols, &nnz, &cooRowInd, &cooColInd, &cooValues, &indexType_t, &indexBase_t, &dataType);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpMatGetFormat(cusparseConstSpMatDescr_t spMatDescr, cusparseFormat_t* format);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpMatGetFormat(const hipsparseSpMatDescr_t spMatDescr, hipsparseFormat_t* format);
  // CHECK: status_t = hipsparseSpMatGetFormat(spMatDescr_t, &format_t);
  status_t = cusparseSpMatGetFormat(spMatDescr_t, &format_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpMatGetIndexBase(cusparseConstSpMatDescr_t spMatDescr, cusparseIndexBase_t* idxBase);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpMatGetIndexBase(const hipsparseSpMatDescr_t spMatDescr, hipsparseIndexBase_t* idxBase);
  // CHECK: status_t = hipsparseSpMatGetIndexBase(spMatDescr_t, &indexBase_t);
  status_t = cusparseSpMatGetIndexBase(spMatDescr_t, &indexBase_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCreateDnMat(cusparseDnMatDescr_t* dnMatDescr, int64_t rows, int64_t cols, int64_t ld, void* values, cudaDataType valueType, cusparseOrder_t order);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCreateDnMat(hipsparseDnMatDescr_t* dnMatDescr, int64_t rows, int64_t cols, int64_t ld, void* values, hipDataType valueType, hipsparseOrder_t order);
  // CHECK: status_t = hipsparseCreateDnMat(&dnMatDescr_t, rows, cols, ld, values, dataType, order_t);
  status_t = cusparseCreateDnMat(&dnMatDescr_t, rows, cols, ld, values, dataType, order_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDestroyDnMat(cusparseConstDnMatDescr_t dnMatDescr);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDestroyDnMat(hipsparseDnMatDescr_t dnMatDescr);
  // CHECK: status_t = hipsparseDestroyDnMat(dnMatDescr_t);
  status_t = cusparseDestroyDnMat(dnMatDescr_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDnMatGet(cusparseDnMatDescr_t dnMatDescr, int64_t* rows, int64_t* cols, int64_t* ld, void** values, cudaDataType* type, cusparseOrder_t* order);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDnMatGet(const hipsparseDnMatDescr_t dnMatDescr, int64_t* rows, int64_t* cols, int64_t* ld, void** values, hipDataType* valueType, hipsparseOrder_t* order);
  // CHECK: status_t = hipsparseDnMatGet(dnMatDescr_t, &rows, &cols, &ld, &values, &dataType, &order_t);
  status_t = cusparseDnMatGet(dnMatDescr_t, &rows, &cols, &ld, &values, &dataType, &order_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDnMatGetStridedBatch(cusparseConstDnMatDescr_t dnMatDescr, int* batchCount, int64_t* batchStride);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDnMatGetStridedBatch(hipsparseDnMatDescr_t dnMatDescr, int* batchCount, int64_t* batchStride);
  // CHECK: status_t = hipsparseDnMatGetStridedBatch(dnMatDescr_t, &batchCount, &batchStride);
  status_t = cusparseDnMatGetStridedBatch(dnMatDescr_t, &batchCount, &batchStride);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDnMatSetStridedBatch(cusparseDnMatDescr_t dnMatDescr, int batchCount, int64_t batchStride);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDnMatSetStridedBatch(hipsparseDnMatDescr_t dnMatDescr, int batchCount, int64_t batchStride);
  // CHECK: status_t = hipsparseDnMatSetStridedBatch(dnMatDescr_t, batchCount, batchStride);
  status_t = cusparseDnMatSetStridedBatch(dnMatDescr_t, batchCount, batchStride);
#endif

#if (CUDA_VERSION >= 10010 && CUDA_VERSION < 11000 && !defined(_WIN32)) || (CUDA_VERSION >= 11000 && CUDA_VERSION < 12000)
  // CHECK: hipsparseSpMMAlg_t COOMM_ALG1 = HIPSPARSE_COOMM_ALG1;
  // CHECK-NEXT: hipsparseSpMMAlg_t COOMM_ALG2 = HIPSPARSE_COOMM_ALG2;
  // CHECK-NEXT: hipsparseSpMMAlg_t COOMM_ALG3 = HIPSPARSE_COOMM_ALG3;
  cusparseSpMMAlg_t COOMM_ALG1 = CUSPARSE_COOMM_ALG1;
  cusparseSpMMAlg_t COOMM_ALG2 = CUSPARSE_COOMM_ALG2;
  cusparseSpMMAlg_t COOMM_ALG3 = CUSPARSE_COOMM_ALG3;
#endif

#if CUDA_VERSION >= 10010 && CUDA_VERSION < 12000
  // CHECK: hipsparseCsr2CscAlg_t CSR2CSC_ALG2 = HIPSPARSE_CSR2CSC_ALG2;
  cusparseCsr2CscAlg_t CSR2CSC_ALG2 = CUSPARSE_CSR2CSC_ALG2;
#endif

#if (CUDA_VERSION >= 10020 && CUDA_VERSION < 11000 && !defined(_WIN32)) || CUDA_VERSION >= 11000
  // CHECK: hipsparseSpVecDescr_t spVecDescr_t;
  cusparseSpVecDescr_t spVecDescr_t;

  // CHECK: hipsparseDnVecDescr_t dnVecDescr_t, vecX, vecY;
  cusparseDnVecDescr_t dnVecDescr_t, vecX, vecY;

  // CHECK: hipsparseSpMVAlg_t spMVAlg_t;
  cusparseSpMVAlg_t spMVAlg_t;

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCreateSpVec(cusparseSpVecDescr_t* spVecDescr, int64_t size, int64_t nnz, void* indices, void* values, cusparseIndexType_t idxType, cusparseIndexBase_t idxBase, cudaDataType valueType);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCreateSpVec(hipsparseSpVecDescr_t* spVecDescr, int64_t size, int64_t nnz, void* indices, void* values, hipsparseIndexType_t idxType, hipsparseIndexBase_t idxBase, hipDataType valueType);
  // CHECK: status_t = hipsparseCreateSpVec(&spVecDescr_t, size, nnz, indices, values, indexType_t, indexBase_t, dataType);
  status_t = cusparseCreateSpVec(&spVecDescr_t, size, nnz, indices, values, indexType_t, indexBase_t, dataType);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDestroySpVec(cusparseConstSpVecDescr_t spVecDescr);
  // HIP: hipsparseStatus_t hipsparseDestroySpVec(hipsparseSpVecDescr_t spVecDescr);
  // CHECK: status_t = hipsparseDestroySpVec(spVecDescr_t);
  status_t = cusparseDestroySpVec(spVecDescr_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpVecGet(cusparseSpVecDescr_t spVecDescr, int64_t* size, int64_t* nnz, void** indices, void** values, cusparseIndexType_t* idxType, cusparseIndexBase_t* idxBase, cudaDataType* valueType);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpVecGet(const hipsparseSpVecDescr_t spVecDescr, int64_t* size, int64_t* nnz, void** indices, void** values, hipsparseIndexType_t* idxType, hipsparseIndexBase_t* idxBase, hipDataType* valueType);
  // CHECK: status_t = hipsparseSpVecGet(spVecDescr_t, &size, &nnz, &indices, &values, &indexType_t, &indexBase_t, &dataType);
  status_t = cusparseSpVecGet(spVecDescr_t, &size, &nnz, &indices, &values, &indexType_t, &indexBase_t, &dataType);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpVecGetIndexBase(cusparseConstSpVecDescr_t spVecDescr, cusparseIndexBase_t* idxBase);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpVecGetIndexBase(const hipsparseSpVecDescr_t spVecDescr, hipsparseIndexBase_t* idxBase);
  // CHECK: status_t = hipsparseSpVecGetIndexBase(spVecDescr_t, &indexBase_t);
  status_t = cusparseSpVecGetIndexBase(spVecDescr_t, &indexBase_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpVecGetValues(cusparseSpVecDescr_t spVecDescr, void** values);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpVecGetValues(const hipsparseSpVecDescr_t spVecDescr, void** values);
  // CHECK: status_t = hipsparseSpVecGetValues(spVecDescr_t, &values);
  status_t = cusparseSpVecGetValues(spVecDescr_t, &values);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpVecSetValues(cusparseSpVecDescr_t spVecDescr, void* values);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpVecSetValues(hipsparseSpVecDescr_t spVecDescr, void* values);
  // CHECK: status_t = hipsparseSpVecSetValues(spVecDescr_t, values);
  status_t = cusparseSpVecSetValues(spVecDescr_t, values);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCreateCsr(cusparseSpMatDescr_t* spMatDescr, int64_t rows, int64_t cols, int64_t nnz, void* csrRowOffsets, void* csrColInd, void* csrValues, cusparseIndexType_t csrRowOffsetsType, cusparseIndexType_t csrColIndType, cusparseIndexBase_t idxBase, cudaDataType valueType);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCreateCsr(hipsparseSpMatDescr_t* spMatDescr, int64_t rows, int64_t cols, int64_t nnz, void* csrRowOffsets, void* csrColInd, void* csrValues, hipsparseIndexType_t csrRowOffsetsType, hipsparseIndexType_t csrColIndType, hipsparseIndexBase_t idxBase, hipDataType valueType);
  // CHECK: status_t = hipsparseCreateCsr(&spMatDescr_t, rows, cols, nnz, csrRowOffsets, csrColInd, csrValues, csrRowOffsetsType, csrColIndType, indexBase_t, dataType);
  status_t = cusparseCreateCsr(&spMatDescr_t, rows, cols, nnz, csrRowOffsets, csrColInd, csrValues, csrRowOffsetsType, csrColIndType, indexBase_t, dataType);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCsrGet(cusparseSpMatDescr_t spMatDescr, int64_t* rows, int64_t* cols, int64_t* nnz, void** csrRowOffsets, void** csrColInd, void** csrValues, cusparseIndexType_t* csrRowOffsetsType, cusparseIndexType_t* csrColIndType, cusparseIndexBase_t* idxBase, cudaDataType* valueType);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCsrGet(const hipsparseSpMatDescr_t spMatDescr, int64_t* rows, int64_t* cols, int64_t* nnz, void** csrRowOffsets, void** csrColInd, void** csrValues, hipsparseIndexType_t* csrRowOffsetsType, hipsparseIndexType_t* csrColIndType, hipsparseIndexBase_t* idxBase, hipDataType* valueType);
  // CHECK: status_t = hipsparseCsrGet(spMatDescr_t, &rows, &cols, &nnz, &csrRowOffsets, &csrColInd, &csrValues, &csrRowOffsetsType, &csrColIndType, &indexBase_t, &dataType);
  status_t = cusparseCsrGet(spMatDescr_t, &rows, &cols, &nnz, &csrRowOffsets, &csrColInd, &csrValues, &csrRowOffsetsType, &csrColIndType, &indexBase_t, &dataType);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpMatGetValues(cusparseSpMatDescr_t spMatDescr, void** values);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpMatGetValues(hipsparseSpMatDescr_t spMatDescr, void** values);
  // CHECK: status_t = hipsparseSpMatGetValues(spMatDescr_t, &values);
  status_t = cusparseSpMatGetValues(spMatDescr_t, &values);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpMatSetValues(cusparseSpMatDescr_t spMatDescr, void* values);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpMatSetValues(hipsparseSpMatDescr_t spMatDescr, void* values);
  // CHECK: status_t = hipsparseSpMatSetValues(spMatDescr_t, values);
  status_t = cusparseSpMatSetValues(spMatDescr_t, values);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpMatGetStridedBatch(cusparseConstSpMatDescr_t spMatDescr, int* batchCount);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpMatGetStridedBatch(hipsparseSpMatDescr_t spMatDescr, int* batchCount);
  // CHECK: status_t = hipsparseSpMatGetStridedBatch(spMatDescr_t, &batchCount);
  status_t = cusparseSpMatGetStridedBatch(spMatDescr_t, &batchCount);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCreateDnVec(cusparseDnVecDescr_t* dnVecDescr, int64_t size, void* values, cudaDataType valueType);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCreateDnVec(hipsparseDnVecDescr_t* dnVecDescr, int64_t size, void* values, hipDataType valueType);
  // CHECK: status_t = hipsparseCreateDnVec(&dnVecDescr_t, size, values, dataType);
  status_t = cusparseCreateDnVec(&dnVecDescr_t, size, values, dataType);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDestroyDnVec(cusparseConstDnVecDescr_t dnVecDescr);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDestroyDnVec(hipsparseDnVecDescr_t dnVecDescr);
  // CHECK: status_t = hipsparseDestroyDnVec(dnVecDescr_t);
  status_t = cusparseDestroyDnVec(dnVecDescr_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDnVecGet(cusparseDnVecDescr_t dnVecDescr, int64_t* size, void** values, cudaDataType* valueType);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDnVecGet(const hipsparseDnVecDescr_t dnVecDescr, int64_t* size, void** values, hipDataType* valueType);
  // CHECK: status_t = hipsparseDnVecGet(dnVecDescr_t, &size, &values, &dataType);
  status_t = cusparseDnVecGet(dnVecDescr_t, &size, &values, &dataType);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDnVecGetValues(cusparseDnVecDescr_t dnVecDescr, void** values);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDnVecGetValues(const hipsparseDnVecDescr_t dnVecDescr, void** values);
  // CHECK: status_t = hipsparseDnVecGetValues(dnVecDescr_t, &values);
  status_t = cusparseDnVecGetValues(dnVecDescr_t, &values);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDnVecSetValues(cusparseDnVecDescr_t dnVecDescr, void* values);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDnVecSetValues(hipsparseDnVecDescr_t dnVecDescr, void* values);
  // CHECK: status_t = hipsparseDnVecSetValues(dnVecDescr_t, values);
  status_t = cusparseDnVecSetValues(dnVecDescr_t, values);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDnMatGetValues(cusparseDnMatDescr_t dnMatDescr, void** values);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDnMatGetValues(const hipsparseDnMatDescr_t dnMatDescr, void** values);
  // CHECK: status_t = hipsparseDnMatGetValues(dnMatDescr_t, &values);
  status_t = cusparseDnMatGetValues(dnMatDescr_t, &values);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDnMatSetValues(cusparseDnMatDescr_t dnMatDescr, void* values);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDnMatSetValues(hipsparseDnMatDescr_t dnMatDescr, void* values);
  // CHECK: status_t = hipsparseDnMatSetValues(dnMatDescr_t, values);
  status_t = cusparseDnMatSetValues(dnMatDescr_t, values);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpMV(cusparseHandle_t handle, cusparseOperation_t opA, const void* alpha, cusparseConstSpMatDescr_t matA, cusparseConstDnVecDescr_t vecX, const void* beta, cusparseDnVecDescr_t vecY, cudaDataType computeType, cusparseSpMVAlg_t alg, void* externalBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpMV(hipsparseHandle_t handle, hipsparseOperation_t opA, const void* alpha, const hipsparseSpMatDescr_t matA, const hipsparseDnVecDescr_t vecX, const void* beta, const hipsparseDnVecDescr_t vecY, hipDataType computeType, hipsparseSpMVAlg_t alg, void* externalBuffer);
  // CHECK: status_t = hipsparseSpMV(handle_t, opA, alpha, spMatDescr_t, vecX, beta, vecY, dataType, spMVAlg_t, tempBuffer);
  status_t = cusparseSpMV(handle_t, opA, alpha, spMatDescr_t, vecX, beta, vecY, dataType, spMVAlg_t, tempBuffer);
#endif

#if CUDA_VERSION >= 10020
  // CHECK: hipsparseStatus_t STATUS_NOT_SUPPORTED = HIPSPARSE_STATUS_NOT_SUPPORTED;
  cusparseStatus_t STATUS_NOT_SUPPORTED = CUSPARSE_STATUS_NOT_SUPPORTED;
#endif

#if (CUDA_VERSION >= 10020 && CUDA_VERSION < 11000 && !defined(_WIN32)) || (CUDA_VERSION >= 11000 && CUDA_VERSION < 12000)
  // CHECK: hipsparseFormat_t FORMAT_COO_AOS = HIPSPARSE_FORMAT_COO_AOS;
  cusparseFormat_t FORMAT_COO_AOS = CUSPARSE_FORMAT_COO_AOS;

  // CHECK: hipsparseSpMVAlg_t MV_ALG_DEFAULT = HIPSPARSE_MV_ALG_DEFAULT;
  cusparseSpMVAlg_t MV_ALG_DEFAULT = CUSPARSE_MV_ALG_DEFAULT;

  // CHECK: hipsparseSpMVAlg_t COOMV_ALG = HIPSPARSE_COOMV_ALG;
  // CHECK-NEXT: hipsparseSpMVAlg_t CSRMV_ALG1 = HIPSPARSE_CSRMV_ALG1;
  // CHECK-NEXT: hipsparseSpMVAlg_t CSRMV_ALG2 = HIPSPARSE_CSRMV_ALG2;
  cusparseSpMVAlg_t COOMV_ALG = CUSPARSE_COOMV_ALG;
  cusparseSpMVAlg_t CSRMV_ALG1 = CUSPARSE_CSRMV_ALG1;
  cusparseSpMVAlg_t CSRMV_ALG2 = CUSPARSE_CSRMV_ALG2;

  // CHECK: hipsparseSpMMAlg_t MM_ALG_DEFAULT = HIPSPARSE_MM_ALG_DEFAULT;
  // CHECK: hipsparseSpMMAlg_t CSRMM_ALG1 = HIPSPARSE_CSRMM_ALG1;
  cusparseSpMMAlg_t MM_ALG_DEFAULT = CUSPARSE_MM_ALG_DEFAULT;
  cusparseSpMMAlg_t CSRMM_ALG1 = CUSPARSE_CSRMM_ALG1;

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCreateCooAoS(cusparseSpMatDescr_t* spMatDescr, int64_t rows, int64_t cols, int64_t nnz, void* cooInd, void* cooValues, cusparseIndexType_t cooIdxType, cusparseIndexBase_t idxBase, cudaDataType valueType);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCreateCooAoS(hipsparseSpMatDescr_t* spMatDescr, int64_t rows, int64_t cols, int64_t nnz, void* cooInd, void* cooValues, hipsparseIndexType_t cooIdxType, hipsparseIndexBase_t idxBase, hipDataType valueType);
  // CHECK: status_t = hipsparseCreateCooAoS(&spMatDescr_t, rows, cols, nnz, cooColInd, cooValues, indexType_t, indexBase_t, dataType);
  status_t = cusparseCreateCooAoS(&spMatDescr_t, rows, cols, nnz, cooColInd, cooValues, indexType_t, indexBase_t, dataType);

  // CUDA: CUSPARSE_DEPRECATED(cusparseCooGet) cusparseStatus_t CUSPARSEAPI cusparseCooAoSGet(cusparseSpMatDescr_t spMatDescr, int64_t* rows, int64_t* cols, int64_t* nnz, void** cooInd, void** cooValues, cusparseIndexType_t* idxType, cusparseIndexBase_t* idxBase, cudaDataType* valueType);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCooAoSGet(const hipsparseSpMatDescr_t spMatDescr, int64_t* rows, int64_t* cols, int64_t* nnz, void** cooInd, void** cooValues, hipsparseIndexType_t* idxType, hipsparseIndexBase_t* idxBase, hipDataType* valueType);
  // CHECK: status_t = hipsparseCooAoSGet(spMatDescr_t, &rows, &cols, &nnz, &cooColInd, &cooValues, &indexType_t, &indexBase_t, &dataType);
  status_t = cusparseCooAoSGet(spMatDescr_t, &rows, &cols, &nnz, &cooColInd, &cooValues, &indexType_t, &indexBase_t, &dataType);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpMatSetStridedBatch(cusparseSpMatDescr_t spMatDescr, int batchCount);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpMatSetStridedBatch(hipsparseSpMatDescr_t spMatDescr, int batchCount);
  // CHECK: status_t = hipsparseSpMatSetStridedBatch(spMatDescr_t, batchCount);
  status_t = cusparseSpMatSetStridedBatch(spMatDescr_t, batchCount);
#endif

#if CUDA_VERSION < 11000
  // CHECK: hipsparseHybMat_t hybMat_t;
  cusparseHybMat_t hybMat_t;

  // CHECK: hipsparseHybPartition_t hybPartition_t;
  // CHECK-NEXT: hipsparseHybPartition_t HYB_PARTITION_AUTO = HIPSPARSE_HYB_PARTITION_AUTO;
  // CHECK-NEXT: hipsparseHybPartition_t HYB_PARTITION_USER = HIPSPARSE_HYB_PARTITION_USER;
  // CHECK-NEXT: hipsparseHybPartition_t HYB_PARTITION_MAX = HIPSPARSE_HYB_PARTITION_MAX;
  cusparseHybPartition_t hybPartition_t;
  cusparseHybPartition_t HYB_PARTITION_AUTO = CUSPARSE_HYB_PARTITION_AUTO;
  cusparseHybPartition_t HYB_PARTITION_USER = CUSPARSE_HYB_PARTITION_USER;
  cusparseHybPartition_t HYB_PARTITION_MAX = CUSPARSE_HYB_PARTITION_MAX;

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCreateHybMat(cusparseHybMat_t* hybA);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCreateHybMat(hipsparseHybMat_t* hybA);
  // CHECK: status_t = hipsparseCreateHybMat(&hybMat_t);
  status_t = cusparseCreateHybMat(&hybMat_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseDestroyHybMat(cusparseHybMat_t hybA);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDestroyHybMat(hipsparseHybMat_t hybA);
  // CHECK: status_t = hipsparseDestroyHybMat(hybMat_t);
  status_t = cusparseDestroyHybMat(hybMat_t);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseZhyb2csr(cusparseHandle_t handle, const cusparseMatDescr_t descrA, const cusparseHybMat_t hybA, cuDoubleComplex* csrSortedValA, int* csrSortedRowPtrA, int* csrSortedColIndA);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZhyb2csr(hipsparseHandle_t handle, const hipsparseMatDescr_t descrA, const hipsparseHybMat_t hybA, hipDoubleComplex* csrSortedValA, int* csrSortedRowPtrA, int* csrSortedColIndA);
  // CHECK: status_t = hipsparseZhyb2csr(handle_t, matDescr_t, hybMat_t, &dComplexbsrSortedValA, &csrRowPtrA, &csrColIndA);
  status_t = cusparseZhyb2csr(handle_t, matDescr_t, hybMat_t, &dComplexbsrSortedValA, &csrRowPtrA, &csrColIndA);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseChyb2csr(cusparseHandle_t handle, const cusparseMatDescr_t descrA, const cusparseHybMat_t hybA, cuComplex* csrSortedValA, int* csrSortedRowPtrA, int* csrSortedColIndA);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseChyb2csr(hipsparseHandle_t handle, const hipsparseMatDescr_t descrA, const hipsparseHybMat_t hybA, hipComplex* csrSortedValA, int* csrSortedRowPtrA, int* csrSortedColIndA);
  // CHECK: status_t = hipsparseChyb2csr(handle_t, matDescr_t, hybMat_t, &complex, &csrRowPtrA, &csrColIndA);
  status_t = cusparseChyb2csr(handle_t, matDescr_t, hybMat_t, &complex, &csrRowPtrA, &csrColIndA);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseDhyb2csr(cusparseHandle_t handle, const cusparseMatDescr_t descrA, const cusparseHybMat_t hybA, double* csrSortedValA, int* csrSortedRowPtrA, int* csrSortedColIndA);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDhyb2csr(hipsparseHandle_t handle, const hipsparseMatDescr_t descrA, const hipsparseHybMat_t hybA, double* csrSortedValA, int* csrSortedRowPtrA, int* csrSortedColIndA);
  // CHECK: status_t = hipsparseDhyb2csr(handle_t, matDescr_t, hybMat_t, &csrValA, &csrRowPtrA, &csrColIndA);
  status_t = cusparseDhyb2csr(handle_t, matDescr_t, hybMat_t, &csrValA, &csrRowPtrA, &csrColIndA);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseShyb2csr(cusparseHandle_t handle, const cusparseMatDescr_t descrA, const cusparseHybMat_t hybA, float* csrSortedValA, int* csrSortedRowPtrA, int* csrSortedColIndA);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseShyb2csr(hipsparseHandle_t handle, const hipsparseMatDescr_t descrA, const hipsparseHybMat_t hybA, float* csrSortedValA, int* csrSortedRowPtrA, int* csrSortedColIndA);
  // CHECK: status_t = hipsparseShyb2csr(handle_t, matDescr_t, hybMat_t, &fcsrValA, &csrRowPtrA, &csrColIndA);
  status_t = cusparseShyb2csr(handle_t, matDescr_t, hybMat_t, &fcsrValA, &csrRowPtrA, &csrColIndA);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseZcsr2hyb(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const cuDoubleComplex* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, cusparseHybMat_t hybA, int userEllWidth, cusparseHybPartition_t   partitionType);
  // HIP: DEPRECATED_CUDA_10000("The routine will be removed in CUDA 11") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZcsr2hyb(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descrA, const hipDoubleComplex* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, hipsparseHybMat_t hybA, int userEllWidth, hipsparseHybPartition_t partitionType);
  // CHECK: status_t = hipsparseZcsr2hyb(handle_t, m, n, matDescr_A, &dComplexcsrSortedValA, &csrRowPtrA, &csrColIndA, hybMat_t, userEllWidth, hybPartition_t);
  status_t = cusparseZcsr2hyb(handle_t, m, n, matDescr_A, &dComplexcsrSortedValA, &csrRowPtrA, &csrColIndA, hybMat_t, userEllWidth, hybPartition_t);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseCcsr2hyb(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const cuComplex* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, cusparseHybMat_t hybA, int userEllWidth, cusparseHybPartition_t partitionType);
  // HIP: DEPRECATED_CUDA_10000("The routine will be removed in CUDA 11") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCcsr2hyb(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descrA, const hipComplex* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, hipsparseHybMat_t hybA, int userEllWidth, hipsparseHybPartition_t partitionType);
  // CHECK: status_t = hipsparseCcsr2hyb(handle_t, m, n, matDescr_A, &complexcsrSortedValA, &csrRowPtrA, &csrColIndA, hybMat_t, userEllWidth, hybPartition_t);
  status_t = cusparseCcsr2hyb(handle_t, m, n, matDescr_A, &complexcsrSortedValA, &csrRowPtrA, &csrColIndA, hybMat_t, userEllWidth, hybPartition_t);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseDcsr2hyb(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const double* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, cusparseHybMat_t hybA, int userEllWidth, cusparseHybPartition_t partitionType);
  // HIP: DEPRECATED_CUDA_10000("The routine will be removed in CUDA 11") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDcsr2hyb(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descrA, const double* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, hipsparseHybMat_t hybA, int userEllWidth, hipsparseHybPartition_t partitionType);
  // CHECK: status_t = hipsparseDcsr2hyb(handle_t, m, n, matDescr_A, &dcsrSortedValA, &csrRowPtrA, &csrColIndA, hybMat_t, userEllWidth, hybPartition_t);
  status_t = cusparseDcsr2hyb(handle_t, m, n, matDescr_A, &dcsrSortedValA, &csrRowPtrA, &csrColIndA, hybMat_t, userEllWidth, hybPartition_t);

  // CUDA: CUSPARSE_DEPRECATED cusparseStatus_t CUSPARSEAPI cusparseScsr2hyb(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const float* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, cusparseHybMat_t hybA, int userEllWidth, cusparseHybPartition_t partitionType);
  // HIP: DEPRECATED_CUDA_10000("The routine will be removed in CUDA 11") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseScsr2hyb(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descrA, const float* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, hipsparseHybMat_t hybA, int userEllWidth, hipsparseHybPartition_t partitionType);
  // CHECK: status_t = hipsparseScsr2hyb(handle_t, m, n, matDescr_A, &csrSortedValA, &csrRowPtrA, &csrColIndA, hybMat_t, userEllWidth, hybPartition_t);
  status_t = cusparseScsr2hyb(handle_t, m, n, matDescr_A, &csrSortedValA, &csrRowPtrA, &csrColIndA, hybMat_t, userEllWidth, hybPartition_t);

  // CUDA: CUSPARSE_DEPRECATED_HINT(cusparseCsr2cscEx2) cusparseStatus_t CUSPARSEAPI cusparseZcsr2csc(cusparseHandle_t handle, int m, int n, int nnz, const cuDoubleComplex* csrSortedVal, const int* csrSortedRowPtr, const int* csrSortedColInd, cuDoubleComplex* cscSortedVal, int* cscSortedRowInd, int* cscSortedColPtr, cusparseAction_t copyValues, cusparseIndexBase_t idxBase);
  // HIP: DEPRECATED_CUDA_10000("The routine will be removed in CUDA 11") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZcsr2csc(hipsparseHandle_t handle, int m, int n, int nnz, const hipDoubleComplex* csrSortedVal, const int* csrSortedRowPtr, const int* csrSortedColInd, hipDoubleComplex* cscSortedVal, int* cscSortedRowInd, int* cscSortedColPtr, hipsparseAction_t copyValues, hipsparseIndexBase_t idxBase);
  // CHECK: status_t = hipsparseZcsr2csc(handle_t, m, n, nnz, &dComplexcsrSortedValA, &csrRowPtrA, &csrColIndA, &dComplexcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, copyValues, indexBase_t);
  status_t = cusparseZcsr2csc(handle_t, m, n, nnz, &dComplexcsrSortedValA, &csrRowPtrA, &csrColIndA, &dComplexcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, copyValues, indexBase_t);

  // CUDA: CUSPARSE_DEPRECATED_HINT(cusparseCsr2cscEx2) cusparseStatus_t CUSPARSEAPI cusparseCcsr2csc(cusparseHandle_t handle, int m, int n, int nnz, const cuComplex* csrSortedVal, const int* csrSortedRowPtr, const int* csrSortedColInd, cuComplex* cscSortedVal, int* cscSortedRowInd, int* cscSortedColPtr,cusparseAction_t copyValues, cusparseIndexBase_t idxBase);
  // HIP: DEPRECATED_CUDA_10000("The routine will be removed in CUDA 11") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCcsr2csc(hipsparseHandle_t handle, int m, int n, int nnz, const hipComplex* csrSortedVal, const int* csrSortedRowPtr, const int* csrSortedColInd, hipComplex* cscSortedVal, int* cscSortedRowInd, int* cscSortedColPtr, hipsparseAction_t copyValues, hipsparseIndexBase_t idxBase);
  // CHECK: status_t = hipsparseCcsr2csc(handle_t, m, n, nnz, &complexcsrSortedValA, &csrRowPtrA, &csrColIndA, &ñomplexcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, copyValues, indexBase_t);
  status_t = cusparseCcsr2csc(handle_t, m, n, nnz, &complexcsrSortedValA, &csrRowPtrA, &csrColIndA, &ñomplexcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, copyValues, indexBase_t);

  // CUDA: CUSPARSE_DEPRECATED_HINT(cusparseCsr2cscEx2) cusparseStatus_t CUSPARSEAPI cusparseDcsr2csc(cusparseHandle_t handle, int m, int n, int nnz, const double* csrSortedVal, const int* csrSortedRowPtr, const int* csrSortedColInd, double* cscSortedVal, int* cscSortedRowInd, int* cscSortedColPtr, cusparseAction_t copyValues, cusparseIndexBase_t idxBase);
  // HIP: DEPRECATED_CUDA_10000("The routine will be removed in CUDA 11") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDcsr2csc(hipsparseHandle_t handle, int m, int n, int nnz, const double* csrSortedVal, const int* csrSortedRowPtr, const int* csrSortedColInd, double* cscSortedVal, int* cscSortedRowInd, int* cscSortedColPtr, hipsparseAction_t copyValues, hipsparseIndexBase_t idxBase);
  // CHECK: status_t = hipsparseDcsr2csc(handle_t, m, n, nnz, &dcsrSortedVal, &csrRowPtrA, &csrColIndA, &dcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, copyValues, indexBase_t);
  status_t = cusparseDcsr2csc(handle_t, m, n, nnz, &dcsrSortedVal, &csrRowPtrA, &csrColIndA, &dcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, copyValues, indexBase_t);

  // CUDA: CUSPARSE_DEPRECATED_HINT(cusparseCsr2cscEx2) cusparseStatus_t CUSPARSEAPI cusparseScsr2csc(cusparseHandle_t handle, int m, int n, int nnz, const float* csrSortedVal, const int* csrSortedRowPtr, const int* csrSortedColInd, float* cscSortedVal, int* cscSortedRowInd, int* cscSortedColPtr, cusparseAction_t copyValues, cusparseIndexBase_t idxBase);
  // HIP: DEPRECATED_CUDA_10000("The routine will be removed in CUDA 11") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseScsr2csc(hipsparseHandle_t handle, int m, int n, int nnz, const float* csrSortedVal, const int* csrSortedRowPtr, const int* csrSortedColInd, float* cscSortedVal, int* cscSortedRowInd, int* cscSortedColPtr, hipsparseAction_t copyValues, hipsparseIndexBase_t idxBase);
  // CHECK: status_t = hipsparseScsr2csc(handle_t, m, n, nnz, &csrSortedVal, &csrRowPtrA, &csrColIndA, &cscSortedVal, &csrSortedRowPtr, &csrSortedColInd, copyValues, indexBase_t);
  status_t = cusparseScsr2csc(handle_t, m, n, nnz, &csrSortedVal, &csrRowPtrA, &csrColIndA, &cscSortedVal, &csrSortedRowPtr, &csrSortedColInd, copyValues, indexBase_t);
#endif

#if CUDA_VERSION >= 11000
  // CHECK: hipsparseStatus_t STATUS_INSUFFICIENT_RESOURCES = HIPSPARSE_STATUS_INSUFFICIENT_RESOURCES;
  cusparseStatus_t STATUS_INSUFFICIENT_RESOURCES = CUSPARSE_STATUS_INSUFFICIENT_RESOURCES;

  // CHECK: hipsparseSpGEMMAlg_t spGEMMAlg_t;
  // CHECK-NEXT: hipsparseSpGEMMAlg_t SPGEMM_DEFAULT = HIPSPARSE_SPGEMM_DEFAULT;
  cusparseSpGEMMAlg_t spGEMMAlg_t;
  cusparseSpGEMMAlg_t SPGEMM_DEFAULT = CUSPARSE_SPGEMM_DEFAULT;

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCsrSetPointers(cusparseSpMatDescr_t spMatDescr, void* csrRowOffsets, void* csrColInd, void* csrValues);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCsrSetPointers(hipsparseSpMatDescr_t spMatDescr, void* csrRowOffsets, void* csrColInd, void* csrValues);
  // CHECK: status_t = hipsparseCsrSetPointers(spMatDescr_t, csrRowOffsets, csrColInd, csrValues);
  status_t = cusparseCsrSetPointers(spMatDescr_t, csrRowOffsets, csrColInd, csrValues);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpMatGetSize(cusparseConstSpMatDescr_t spMatDescr, int64_t* rows, int64_t* cols, int64_t* nnz);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpMatGetSize(hipsparseSpMatDescr_t spMatDescr, int64_t* rows, int64_t* cols, int64_t* nnz);
  // CHECK: status_t = hipsparseSpMatGetSize(spMatDescr_t, &rows, &cols, &nnz);
  status_t = cusparseSpMatGetSize(spMatDescr_t, &rows, &cols, &nnz);
#endif

#if CUDA_VERSION >= 11000 && CUSPARSE_VERSION >= 11100
  // CHECK: hipsparseSpMMAlg_t SPMM_ALG_DEFAULT = HIPSPARSE_SPMM_ALG_DEFAULT;
  // CHECK-NEXT: hipsparseSpMMAlg_t SPMM_COO_ALG1 = HIPSPARSE_SPMM_COO_ALG1;
  // CHECK-NEXT: hipsparseSpMMAlg_t SPMM_COO_ALG2 = HIPSPARSE_SPMM_COO_ALG2;
  // CHECK-NEXT: hipsparseSpMMAlg_t SPMM_COO_ALG3 = HIPSPARSE_SPMM_COO_ALG3;
  // CHECK-NEXT: hipsparseSpMMAlg_t SPMM_CSR_ALG1 = HIPSPARSE_SPMM_CSR_ALG1;
  // CHECK-NEXT: hipsparseSpMMAlg_t SPMM_COO_ALG4 = HIPSPARSE_SPMM_COO_ALG4;
  // CHECK-NEXT: hipsparseSpMMAlg_t SPMM_CSR_ALG2 = HIPSPARSE_SPMM_CSR_ALG2;
  cusparseSpMMAlg_t SPMM_ALG_DEFAULT = CUSPARSE_SPMM_ALG_DEFAULT;
  cusparseSpMMAlg_t SPMM_COO_ALG1 = CUSPARSE_SPMM_COO_ALG1;
  cusparseSpMMAlg_t SPMM_COO_ALG2 = CUSPARSE_SPMM_COO_ALG2;
  cusparseSpMMAlg_t SPMM_COO_ALG3 = CUSPARSE_SPMM_COO_ALG3;
  cusparseSpMMAlg_t SPMM_CSR_ALG1 = CUSPARSE_SPMM_CSR_ALG1;
  cusparseSpMMAlg_t SPMM_COO_ALG4 = CUSPARSE_SPMM_COO_ALG4;
  cusparseSpMMAlg_t SPMM_CSR_ALG2 = CUSPARSE_SPMM_CSR_ALG2;

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCooSetStridedBatch(cusparseSpMatDescr_t spMatDescr, int batchCount, int64_t batchStride);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCooSetStridedBatch(hipsparseSpMatDescr_t spMatDescr, int batchCount, int64_t batchStride);
  // CHECK: status_t = hipsparseCooSetStridedBatch(spMatDescr_t, batchCount, batchStride);
  status_t = cusparseCooSetStridedBatch(spMatDescr_t, batchCount, batchStride);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCsrSetStridedBatch(cusparseSpMatDescr_t spMatDescr, int batchCount, int64_t offsetsBatchStride, int64_t columnsValuesBatchStride);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCsrSetStridedBatch(hipsparseSpMatDescr_t spMatDescr, int batchCount, int64_t offsetsBatchStride, int64_t columnsValuesBatchStride);
  // CHECK: status_t = hipsparseCsrSetStridedBatch(spMatDescr_t, batchCount, offsetsBatchStride, columnsValuesBatchStride);
  status_t = cusparseCsrSetStridedBatch(spMatDescr_t, batchCount, offsetsBatchStride, columnsValuesBatchStride);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseRot(cusparseHandle_t handle, const void* c_coeff, const void* s_coeff, cusparseSpVecDescr_t vecX, cusparseDnVecDescr_t vecY);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseRot(hipsparseHandle_t handle, const void* c_coeff, const void* s_coeff, hipsparseSpVecDescr_t vecX, hipsparseDnVecDescr_t vecY);
  // CHECK: status_t = hipsparseRot(handle_t, c_coeff, s_coeff, spVecDescr_t, vecY);
  status_t = cusparseRot(handle_t, c_coeff, s_coeff, spVecDescr_t, vecY);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseScatter(cusparseHandle_t handle, cusparseConstSpVecDescr_t vecX, cusparseDnVecDescr_t vecY);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseScatter(hipsparseHandle_t handle, hipsparseSpVecDescr_t vecX, hipsparseDnVecDescr_t vecY);
  // CHECK: status_t = hipsparseScatter(handle_t, spVecDescr_t, vecY);
  status_t = cusparseScatter(handle_t, spVecDescr_t, vecY);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseGather(cusparseHandle_t handle, cusparseConstDnVecDescr_t vecY, cusparseSpVecDescr_t vecX);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseGather(hipsparseHandle_t handle, hipsparseDnVecDescr_t vecY, hipsparseSpVecDescr_t vecX);
  // CHECK: status_t = hipsparseGather(handle_t, vecY, spVecDescr_t);
  status_t = cusparseGather(handle_t, vecY, spVecDescr_t);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseAxpby(cusparseHandle_t handle, const void* alpha, cusparseConstSpVecDescr_t vecX, const void* beta, cusparseDnVecDescr_t vecY);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseAxpby(hipsparseHandle_t handle, const void* alpha, hipsparseSpVecDescr_t vecX, const void* beta, hipsparseDnVecDescr_t vecY);
  // CHECK: status_t = hipsparseAxpby(handle_t, alpha, spVecDescr_t, beta, vecY);
  status_t = cusparseAxpby(handle_t, alpha, spVecDescr_t, beta, vecY);
#endif

#if CUDA_VERSION >= 11010 && CUSPARSE_VERSION >= 11300
  // CHECK: hipsparseSparseToDenseAlg_t sparseToDenseAlg_t;
  // CHECK-NEXT: hipsparseSparseToDenseAlg_t SPARSETODENSE_ALG_DEFAULT = HIPSPARSE_SPARSETODENSE_ALG_DEFAULT;
  cusparseSparseToDenseAlg_t sparseToDenseAlg_t;
  cusparseSparseToDenseAlg_t SPARSETODENSE_ALG_DEFAULT = CUSPARSE_SPARSETODENSE_ALG_DEFAULT;

  // CHECK: hipsparseDenseToSparseAlg_t denseToSparseAlg_t;
  // CHECK-NEXT: hipsparseDenseToSparseAlg_t DENSETOSPARSE_ALG_DEFAULT = HIPSPARSE_DENSETOSPARSE_ALG_DEFAULT;
  cusparseDenseToSparseAlg_t denseToSparseAlg_t;
  cusparseDenseToSparseAlg_t DENSETOSPARSE_ALG_DEFAULT = CUSPARSE_DENSETOSPARSE_ALG_DEFAULT;

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCreateCsc(cusparseSpMatDescr_t* spMatDescr, int64_t rows, int64_t cols, int64_t nnz, void* cscColOffsets, void* cscRowInd, void* cscValues, cusparseIndexType_t cscColOffsetsType, cusparseIndexType_t cscRowIndType, cusparseIndexBase_t idxBase, cudaDataType valueType);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCreateCsc(hipsparseSpMatDescr_t* spMatDescr, int64_t rows, int64_t cols, int64_t nnz, void* cscColOffsets, void* cscRowInd, void* cscValues, hipsparseIndexType_t cscColOffsetsType, hipsparseIndexType_t cscRowIndType, hipsparseIndexBase_t idxBase, hipDataType valueType);
  // CHECK: status_t = hipsparseCreateCsc(&spMatDescr_t, rows, cols, nnz, cscColOffsets, cscRowInd, cscValues, cscColOffsetsType, csrColIndType, indexBase_t, dataType);
  status_t = cusparseCreateCsc(&spMatDescr_t, rows, cols, nnz, cscColOffsets, cscRowInd, cscValues, cscColOffsetsType, csrColIndType, indexBase_t, dataType);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCooSetPointers(cusparseSpMatDescr_t spMatDescr, void* cooRows, void* cooColumns, void* cooValues);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCooSetPointers(hipsparseSpMatDescr_t spMatDescr, void* cooRowInd, void* cooColInd, void* cooValues);
  // CHECK: status_t = hipsparseCooSetPointers(spMatDescr_t, cooRows, cooColumns, cooValues);
  status_t = cusparseCooSetPointers(spMatDescr_t, cooRows, cooColumns, cooValues);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCscSetPointers(cusparseSpMatDescr_t spMatDescr, void* cscColOffsets, void* cscRowInd, void* cscValues);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCscSetPointers(hipsparseSpMatDescr_t spMatDescr, void* cscColOffsets, void* cscRowInd, void* cscValues);
  // CHECK: status_t = hipsparseCscSetPointers(spMatDescr_t, cscColOffsets, cscRowInd, cscValues);
  status_t = cusparseCscSetPointers(spMatDescr_t, cscColOffsets, cscRowInd, cscValues);
#endif

#if CUDA_VERSION >= 11020 && CUSPARSE_VERSION >= 11400
  // CHECK: hipsparseFormat_t FORMAT_BLOCKED_ELL = HIPSPARSE_FORMAT_BLOCKED_ELL;
  cusparseFormat_t FORMAT_BLOCKED_ELL = CUSPARSE_FORMAT_BLOCKED_ELL;

  // CHECK: hipsparseSpMVAlg_t SPMV_ALG_DEFAULT = HIPSPARSE_SPMV_ALG_DEFAULT;
  // CHECK-NEXT: hipsparseSpMVAlg_t SPMV_COO_ALG1 = HIPSPARSE_SPMV_COO_ALG1;
  // CHECK-NEXT: hipsparseSpMVAlg_t SPMV_COO_ALG2 = HIPSPARSE_SPMV_COO_ALG2;
  // CHECK-NEXT: hipsparseSpMVAlg_t SPMV_CSR_ALG1 = HIPSPARSE_SPMV_CSR_ALG1;
  // CHECK-NEXT: hipsparseSpMVAlg_t SPMV_CSR_ALG2 = HIPSPARSE_SPMV_CSR_ALG2;
  cusparseSpMVAlg_t SPMV_ALG_DEFAULT = CUSPARSE_SPMV_ALG_DEFAULT;
  cusparseSpMVAlg_t SPMV_COO_ALG1 = CUSPARSE_SPMV_COO_ALG1;
  cusparseSpMVAlg_t SPMV_COO_ALG2 = CUSPARSE_SPMV_COO_ALG2;
  cusparseSpMVAlg_t SPMV_CSR_ALG1 = CUSPARSE_SPMV_CSR_ALG1;
  cusparseSpMVAlg_t SPMV_CSR_ALG2 = CUSPARSE_SPMV_CSR_ALG2;

  // CHECK: hipsparseSpMMAlg_t SPMM_CSR_ALG3 = HIPSPARSE_SPMM_CSR_ALG3;
  // CHECK-NEXT: hipsparseSpMMAlg_t SPMM_BLOCKED_ELL_ALG1 = HIPSPARSE_SPMM_BLOCKED_ELL_ALG1;
  cusparseSpMMAlg_t SPMM_CSR_ALG3 = CUSPARSE_SPMM_CSR_ALG3;
  cusparseSpMMAlg_t SPMM_BLOCKED_ELL_ALG1 = CUSPARSE_SPMM_BLOCKED_ELL_ALG1;

  // CHECK: hipsparseSDDMMAlg_t sDDMMAlg_t;
  // CHECK-NEXT: hipsparseSDDMMAlg_t SDDMM_ALG_DEFAULT = HIPSPARSE_SDDMM_ALG_DEFAULT;
  cusparseSDDMMAlg_t sDDMMAlg_t;
  cusparseSDDMMAlg_t SDDMM_ALG_DEFAULT = CUSPARSE_SDDMM_ALG_DEFAULT;

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseCreateBlockedEll(cusparseSpMatDescr_t* spMatDescr, int64_t rows, int64_t cols, int64_t ellBlockSize, int64_t ellCols, void* ellColInd, void* ellValue, cusparseIndexType_t ellIdxType, cusparseIndexBase_t idxBase, cudaDataType valueType);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCreateBlockedEll(hipsparseSpMatDescr_t* spMatDescr, int64_t rows, int64_t cols, int64_t ellBlockSize, int64_t ellCols, void* ellColInd, void* ellValue, hipsparseIndexType_t ellIdxType, hipsparseIndexBase_t idxBase, hipDataType valueType);
  // CHECK: status_t = hipsparseCreateBlockedEll(&spMatDescr_t, rows, cols, ellBlockSize, ellCols, ellColInd, ellValue, ellIdxType, indexBase_t, dataType);
  status_t = cusparseCreateBlockedEll(&spMatDescr_t, rows, cols, ellBlockSize, ellCols, ellColInd, ellValue, ellIdxType, indexBase_t, dataType);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseBlockedEllGet(cusparseSpMatDescr_t spMatDescr, int64_t* rows, int64_t* cols, int64_t* ellBlockSize, int64_t* ellCols, void** ellColInd, void** ellValue, cusparseIndexType_t* ellIdxType, cusparseIndexBase_t* idxBase, cudaDataType* valueType);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseBlockedEllGet(const hipsparseSpMatDescr_t spMatDescr, int64_t* rows, int64_t* cols, int64_t* ellBlockSize, int64_t* ellCols, void** ellColInd, void** ellValue, hipsparseIndexType_t* ellIdxType, hipsparseIndexBase_t* idxBase, hipDataType* valueType);
  // CHECK: status_t = hipsparseBlockedEllGet(spMatDescr_t, &rows, &cols, &ellBlockSize, &ellCols, &ellColInd, &ellValue, &ellIdxType, &indexBase_t, &dataType);
  status_t = cusparseBlockedEllGet(spMatDescr_t, &rows, &cols, &ellBlockSize, &ellCols, &ellColInd, &ellValue, &ellIdxType, &indexBase_t, &dataType);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSDDMM_preprocess(cusparseHandle_t handle, cusparseOperation_t opA, cusparseOperation_t opB, const void* alpha, cusparseConstDnMatDescr_t matA, cusparseConstDnMatDescr_t matB, const void* beta, cusparseSpMatDescr_t matC, cudaDataType computeType, cusparseSDDMMAlg_t alg, void* externalBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSDDMM_preprocess(hipsparseHandle_t handle, hipsparseOperation_t opA, hipsparseOperation_t opB, const void* alpha, const hipsparseDnMatDescr_t A, const hipsparseDnMatDescr_t B, const void* beta, hipsparseSpMatDescr_t C, hipDataType computeType, hipsparseSDDMMAlg_t alg, void* tempBuffer);
  // CHECK: status_t = hipsparseSDDMM_preprocess(handle_t, opA, opB, alpha, matA, matB, beta, matC, dataType, sDDMMAlg_t, tempBuffer);
 status_t = cusparseSDDMM_preprocess(handle_t, opA, opB, alpha, matA, matB, beta, matC, dataType, sDDMMAlg_t, tempBuffer);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSDDMM_bufferSize(cusparseHandle_t handle, cusparseOperation_t opA, cusparseOperation_t opB, const void* alpha, cusparseConstDnMatDescr_t matA, cusparseConstDnMatDescr_t matB, const void* beta, cusparseSpMatDescr_t matC, cudaDataType computeType, cusparseSDDMMAlg_t alg, size_t* bufferSize);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSDDMM_bufferSize(hipsparseHandle_t handle, hipsparseOperation_t opA, hipsparseOperation_t opB, const void* alpha, const hipsparseDnMatDescr_t A, const hipsparseDnMatDescr_t B, const void* beta, hipsparseSpMatDescr_t C, hipDataType computeType, hipsparseSDDMMAlg_t alg, size_t* bufferSize);
  // CHECK: status_t = hipsparseSDDMM_bufferSize(handle_t, opA, opB, alpha, matA, matB, beta, matC, dataType, sDDMMAlg_t, &bufferSize);
 status_t = cusparseSDDMM_bufferSize(handle_t, opA, opB, alpha, matA, matB, beta, matC, dataType, sDDMMAlg_t, &bufferSize);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSDDMM(cusparseHandle_t handle, cusparseOperation_t opA, cusparseOperation_t opB, const void* alpha, cusparseConstDnMatDescr_t matA, cusparseConstDnMatDescr_t matB, const void* beta, cusparseSpMatDescr_t matC, cudaDataType computeType, cusparseSDDMMAlg_t alg, void* externalBuffer);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSDDMM(hipsparseHandle_t handle, hipsparseOperation_t opA, hipsparseOperation_t opB, const void* alpha, const hipsparseDnMatDescr_t A, const hipsparseDnMatDescr_t B, const void* beta, hipsparseSpMatDescr_t C, hipDataType computeType, hipsparseSDDMMAlg_t alg, void* tempBuffer);
  // CHECK: status_t = hipsparseSDDMM(handle_t, opA, opB, alpha, matA, matB, beta, matC, dataType, sDDMMAlg_t, tempBuffer);
 status_t = cusparseSDDMM(handle_t, opA, opB, alpha, matA, matB, beta, matC, dataType, sDDMMAlg_t, tempBuffer);
#endif

#if CUDA_VERSION >= 11030
  // CHECK: hipsparseSpMatAttribute_t spMatAttribute_t;
  // CHECK-NEXT: hipsparseSpMatAttribute_t SPMAT_FILL_MODE = HIPSPARSE_SPMAT_FILL_MODE;
  // CHECK-NEXT: hipsparseSpMatAttribute_t SPMAT_DIAG_TYPE = HIPSPARSE_SPMAT_DIAG_TYPE;
  cusparseSpMatAttribute_t spMatAttribute_t;
  cusparseSpMatAttribute_t SPMAT_FILL_MODE = CUSPARSE_SPMAT_FILL_MODE;
  cusparseSpMatAttribute_t SPMAT_DIAG_TYPE = CUSPARSE_SPMAT_DIAG_TYPE;

  // CHECK: hipsparseSpSVAlg_t spSVAlg_t;
  // CHECK-NEXT: hipsparseSpSVAlg_t SPSV_ALG_DEFAULT = HIPSPARSE_SPSV_ALG_DEFAULT;
  cusparseSpSVAlg_t spSVAlg_t;
  cusparseSpSVAlg_t SPSV_ALG_DEFAULT = CUSPARSE_SPSV_ALG_DEFAULT;

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpMatGetAttribute(cusparseConstSpMatDescr_t spMatDescr, cusparseSpMatAttribute_t attribute, void* data, size_t dataSize);
  // HIP: hipsparseStatus_t hipsparseSpMatGetAttribute(hipsparseSpMatDescr_t spMatDescr, hipsparseSpMatAttribute_t attribute, void* data, size_t dataSize);
  // CHECK: status_t = hipsparseSpMatGetAttribute(spMatDescr_t, spMatAttribute_t, &data, dataSize);
  status_t = cusparseSpMatGetAttribute(spMatDescr_t, spMatAttribute_t, &data, dataSize);

  // CUDA: cusparseStatus_t CUSPARSEAPI cusparseSpMatSetAttribute(cusparseSpMatDescr_t spMatDescr, cusparseSpMatAttribute_t attribute, void* data, size_t dataSize);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSpMatSetAttribute(hipsparseSpMatDescr_t spMatDescr, hipsparseSpMatAttribute_t attribute, const void* data, size_t dataSize);
  // CHECK: status_t = hipsparseSpMatSetAttribute(spMatDescr_t, spMatAttribute_t, &data, dataSize);
  status_t = cusparseSpMatSetAttribute(spMatDescr_t, spMatAttribute_t, &data, dataSize);
#endif

#if CUDA_VERSION >= 11030 && CUSPARSE_VERSION >= 11600
  // CHECK: hipsparseSpSMAlg_t spSMAlg_t;
  // CHECK-NEXT: hipsparseSpSMAlg_t SPSM_ALG_DEFAULT = HIPSPARSE_SPSM_ALG_DEFAULT;
  cusparseSpSMAlg_t spSMAlg_t;
  cusparseSpSMAlg_t SPSM_ALG_DEFAULT = CUSPARSE_SPSM_ALG_DEFAULT;

  // CHECK: hipsparseSpGEMMAlg_t SPGEMM_CSR_ALG_DETERMINITIC = HIPSPARSE_SPGEMM_CSR_ALG_DETERMINISTIC;
  // CHECK-NEXT: hipsparseSpGEMMAlg_t SPGEMM_CSR_ALG_NONDETERMINITIC = HIPSPARSE_SPGEMM_CSR_ALG_NONDETERMINISTIC;
  cusparseSpGEMMAlg_t SPGEMM_CSR_ALG_DETERMINITIC = CUSPARSE_SPGEMM_CSR_ALG_DETERMINITIC;
  cusparseSpGEMMAlg_t SPGEMM_CSR_ALG_NONDETERMINITIC = CUSPARSE_SPGEMM_CSR_ALG_NONDETERMINITIC;
#endif

#if CUDA_VERSION < 12000
  // CUDA: CUSPARSE_DEPRECATED(cusparseSparseToDense) cusparseStatus_t CUSPARSEAPI cusparseZcsc2dense(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const cuDoubleComplex* cscSortedValA, const int* cscSortedRowIndA, const int* cscSortedColPtrA, cuDoubleComplex* A, int lda);
  // HIP: DEPRECATED_CUDA_11000("The routine will be removed in CUDA 12") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZcsc2dense(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descr, const hipDoubleComplex* csc_val, const int* csc_row_ind, const int* csc_col_ptr, hipDoubleComplex* A, int ld);
  // CHECK: status_t = hipsparseZcsc2dense(handle_t, m, n, matDescr_A, &dComplexcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, &dcomplexA, lda);
  status_t = cusparseZcsc2dense(handle_t, m, n, matDescr_A, &dComplexcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, &dcomplexA, lda);

  // CUDA: CUSPARSE_DEPRECATED(cusparseSparseToDense) cusparseStatus_t CUSPARSEAPI cusparseCcsc2dense(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const cuComplex* cscSortedValA, const int* cscSortedRowIndA, const int* cscSortedColPtrA, cuComplex* A, int lda);
  // HIP: DEPRECATED_CUDA_11000("The routine will be removed in CUDA 12") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCcsc2dense(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descr, const hipComplex* csc_val, const int* csc_row_ind, const int* csc_col_ptr, hipComplex* A, int ld);
  // CHECK: status_t = hipsparseCcsc2dense(handle_t, m, n, matDescr_A, &complexcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, &complexA, lda);
  status_t = cusparseCcsc2dense(handle_t, m, n, matDescr_A, &complexcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, &complexA, lda);

  // CUDA: CUSPARSE_DEPRECATED(cusparseSparseToDense) cusparseStatus_t CUSPARSEAPI cusparseDcsc2dense(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const double* cscSortedValA, const int* cscSortedRowIndA, const int* cscSortedColPtrA, double* A, int lda);
  // HIP: DEPRECATED_CUDA_11000("The routine will be removed in CUDA 12") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDcsc2dense(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descr, const double* csc_val, const int* csc_row_ind, const int* csc_col_ptr, double* A, int ld);
  // CHECK: status_t = hipsparseDcsc2dense(handle_t, m, n, matDescr_A, &dcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, &dA, lda);
  status_t = cusparseDcsc2dense(handle_t, m, n, matDescr_A, &dcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, &dA, lda);

  // CUDA: CUSPARSE_DEPRECATED(cusparseSparseToDense) cusparseStatus_t CUSPARSEAPI cusparseScsc2dense(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const float* cscSortedValA, const int* cscSortedRowIndA, const int* cscSortedColPtrA, float* A, int lda);
  // HIP: DEPRECATED_CUDA_11000("The routine will be removed in CUDA 12") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseScsc2dense(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descr, const float* csc_val, const int* csc_row_ind, const int* csc_col_ptr, float* A, int ld);
  // CHECK: status_t = hipsparseScsc2dense(handle_t, m, n, matDescr_A, &cscSortedVal, &csrSortedRowPtr, &csrSortedColInd, &fA, lda);
  status_t = cusparseScsc2dense(handle_t, m, n, matDescr_A, &cscSortedVal, &csrSortedRowPtr, &csrSortedColInd, &fA, lda);

  // CUDA: CUSPARSE_DEPRECATED(cusparseSparseToDense) cusparseStatus_t CUSPARSEAPI cusparseZcsr2dense(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const cuDoubleComplex* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, cuDoubleComplex* A, int lda);
  // HIP: DEPRECATED_CUDA_11000("The routine will be removed in CUDA 12") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZcsr2dense(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descr, const hipDoubleComplex* csr_val, const int* csr_row_ptr, const int* csr_col_ind, hipDoubleComplex* A, int ld);
  // CHECK: status_t = hipsparseZcsr2dense(handle_t, m, n, matDescr_A, &dComplexcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, &dcomplexA, lda);
  status_t = cusparseZcsr2dense(handle_t, m, n, matDescr_A, &dComplexcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, &dcomplexA, lda);

  // CUDA: CUSPARSE_DEPRECATED(cusparseSparseToDense) cusparseStatus_t CUSPARSEAPI cusparseCcsr2dense(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const cuComplex* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, cuComplex* A, int lda);
  // HIP: DEPRECATED_CUDA_11000("The routine will be removed in CUDA 12") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCcsr2dense(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descr, const hipComplex* csr_val, const int* csr_row_ptr, const int* csr_col_ind, hipComplex* A, int ld);
  // CHECK: status_t = hipsparseCcsr2dense(handle_t, m, n, matDescr_A, &complexcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, &complexA, lda);
  status_t = cusparseCcsr2dense(handle_t, m, n, matDescr_A, &complexcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, &complexA, lda);

  // CUDA: CUSPARSE_DEPRECATED(cusparseSparseToDense) cusparseStatus_t CUSPARSEAPI cusparseDcsr2dense(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const double* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, double* A, int lda);
  // HIP: DEPRECATED_CUDA_11000("The routine will be removed in CUDA 12") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDcsr2dense(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descr, const double* csr_val, const int* csr_row_ptr, const int* csr_col_ind, double* A, int ld);
  // CHECK: status_t = hipsparseDcsr2dense(handle_t, m, n, matDescr_A, &dcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, &dA, lda);
  status_t = cusparseDcsr2dense(handle_t, m, n, matDescr_A, &dcscSortedVal, &csrSortedRowPtr, &csrSortedColInd, &dA, lda);

  // CUDA: CUSPARSE_DEPRECATED(cusparseSparseToDense) cusparseStatus_t CUSPARSEAPI cusparseScsr2dense(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const float* csrSortedValA, const int* csrSortedRowPtrA, const int* csrSortedColIndA, float* A, int lda);
  // HIP: DEPRECATED_CUDA_11000("The routine will be removed in CUDA 12") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseScsr2dense(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descr, const float* csr_val, const int* csr_row_ptr, const int* csr_col_ind, float* A, int ld);
  // CHECK: status_t = hipsparseScsr2dense(handle_t, m, n, matDescr_A, &cscSortedVal, &csrSortedRowPtr, &csrSortedColInd, &fA, lda);
  status_t = cusparseScsr2dense(handle_t, m, n, matDescr_A, &cscSortedVal, &csrSortedRowPtr, &csrSortedColInd, &fA, lda);

  // CUDA: CUSPARSE_DEPRECATED(cusparseDenseToSparse) cusparseStatus_t CUSPARSEAPI cusparseZdense2csc(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const cuDoubleComplex* A, int lda, const int* nnzPerCol, cuDoubleComplex* cscSortedValA, int* cscSortedRowIndA, int* cscSortedColPtrA);
  // HIP: DEPRECATED_CUDA_11000("The routine will be removed in CUDA 12") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZdense2csc(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descr, const hipDoubleComplex* A, int ld, const int* nnz_per_columns, hipDoubleComplex* csc_val, int* csc_row_ind, int* csc_col_ptr);
  // CHECK: status_t = hipsparseZdense2csc(handle_t, m, n, matDescr_A, &dcomplexA, lda, &nnzPerCol, &dComplexcscSortedVal, &csrSortedRowPtr, &csrSortedColInd);
  status_t = cusparseZdense2csc(handle_t, m, n, matDescr_A, &dcomplexA, lda, &nnzPerCol, &dComplexcscSortedVal, &csrSortedRowPtr, &csrSortedColInd);

  // CUDA: CUSPARSE_DEPRECATED(cusparseDenseToSparse) cusparseStatus_t CUSPARSEAPI cusparseCdense2csc(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const cuComplex* A, int lda, const int* nnzPerCol, cuComplex* cscSortedValA, int* cscSortedRowIndA, int* cscSortedColPtrA);
  // HIP: DEPRECATED_CUDA_11000("The routine will be removed in CUDA 12") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCdense2csc(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descr, const hipComplex* A, int ld, const int* nnz_per_columns, hipComplex* csc_val, int* csc_row_ind, int* csc_col_ptr);
  // CHECK: status_t = hipsparseCdense2csc(handle_t, m, n, matDescr_A, &complexA, lda, &nnzPerCol, &complexcscSortedVal, &csrSortedRowPtr, &csrSortedColInd);
  status_t = cusparseCdense2csc(handle_t, m, n, matDescr_A, &complexA, lda, &nnzPerCol, &complexcscSortedVal, &csrSortedRowPtr, &csrSortedColInd);

  // CUDA: CUSPARSE_DEPRECATED(cusparseDenseToSparse) cusparseStatus_t CUSPARSEAPI cusparseDdense2csc(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const double* A, int lda, const int* nnzPerCol, double* cscSortedValA, int* cscSortedRowIndA, int* cscSortedColPtrA);
  // HIP: DEPRECATED_CUDA_11000("The routine will be removed in CUDA 12") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDdense2csc(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descr, const double* A, int ld, const int* nnz_per_columns, double* csc_val, int* csc_row_ind, int* csc_col_ptr);
  // CHECK: status_t = hipsparseDdense2csc(handle_t, m, n, matDescr_A, &dA, lda, &nnzPerCol, &dcscSortedVal, &csrSortedRowPtr, &csrSortedColInd);
  status_t = cusparseDdense2csc(handle_t, m, n, matDescr_A, &dA, lda, &nnzPerCol, &dcscSortedVal, &csrSortedRowPtr, &csrSortedColInd);

  // CUDA: CUSPARSE_DEPRECATED(cusparseDenseToSparse) cusparseStatus_t CUSPARSEAPI cusparseSdense2csc(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const float* A, int lda, const int* nnzPerCol, float* cscSortedValA, int* cscSortedRowIndA, int* cscSortedColPtrA);
  // HIP: DEPRECATED_CUDA_11000("The routine will be removed in CUDA 12") HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSdense2csc(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descr, const float* A, int ld, const int* nnz_per_columns, float* csc_val, int* csc_row_ind, int* csc_col_ptr);
  // CHECK: status_t = hipsparseSdense2csc(handle_t, m, n, matDescr_A, &fA, lda, &nnzPerCol, &cscSortedVal, &csrSortedRowPtr, &csrSortedColInd);
  status_t = cusparseSdense2csc(handle_t, m, n, matDescr_A, &fA, lda, &nnzPerCol, &cscSortedVal, &csrSortedRowPtr, &csrSortedColInd);

  // CUDA: CUSPARSE_DEPRECATED(cusparseDenseToSparse) cusparseStatus_t CUSPARSEAPI cusparseZdense2csr(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const cuDoubleComplex* A, int lda, const int* nnzPerRow, cuDoubleComplex* csrSortedValA, int* csrSortedRowPtrA, int* csrSortedColIndA);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseZdense2csr(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descr, const hipDoubleComplex* A, int ld, const int* nnz_per_rows, hipDoubleComplex* csr_val, int* csr_row_ptr, int* csr_col_ind);
  // CHECK: status_t = hipsparseZdense2csr(handle_t, m, n, matDescr_A, &dcomplexA, lda, &nnzPerRow, &dComplexcsrSortedValA, &csrRowPtrA, &csrColIndA);
  status_t = cusparseZdense2csr(handle_t, m, n, matDescr_A, &dcomplexA, lda, &nnzPerRow, &dComplexcsrSortedValA, &csrRowPtrA, &csrColIndA);

  // CUDA: CUSPARSE_DEPRECATED(cusparseDenseToSparse) cusparseStatus_t CUSPARSEAPI cusparseCdense2csr(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const cuComplex* A, int lda, const int* nnzPerRow, cuComplex* csrSortedValA, int* csrSortedRowPtrA, int* csrSortedColIndA);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseCdense2csr(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descr, const hipComplex* A, int ld, const int* nnz_per_rows, hipComplex* csr_val, int* csr_row_ptr, int* csr_col_ind);
  // CHECK: status_t = hipsparseCdense2csr(handle_t, m, n, matDescr_A, &complexA, lda, &nnzPerRow, &complexcsrSortedValA, &csrRowPtrA, &csrColIndA);
  status_t = cusparseCdense2csr(handle_t, m, n, matDescr_A, &complexA, lda, &nnzPerRow, &complexcsrSortedValA, &csrRowPtrA, &csrColIndA);

  // CUDA: CUSPARSE_DEPRECATED(cusparseDenseToSparse) cusparseStatus_t CUSPARSEAPI cusparseDdense2csr(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const double* A, int lda, const int* nnzPerRow, double* csrSortedValA, int* csrSortedRowPtrA, int* csrSortedColIndA);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseDdense2csr(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descr, const double* A, int ld, const int* nnz_per_rows, double* csr_val, int* csr_row_ptr, int* csr_col_ind);
  // CHECK: status_t = hipsparseDdense2csr(handle_t, m, n, matDescr_A, &dA, lda, &nnzPerRow, &dcsrSortedValA, &csrRowPtrA, &csrColIndA);
  status_t = cusparseDdense2csr(handle_t, m, n, matDescr_A, &dA, lda, &nnzPerRow, &dcsrSortedValA, &csrRowPtrA, &csrColIndA);

  // CUDA: CUSPARSE_DEPRECATED(cusparseDenseToSparse) cusparseStatus_t CUSPARSEAPI cusparseSdense2csr(cusparseHandle_t handle, int m, int n, const cusparseMatDescr_t descrA, const float* A, int lda, const int* nnzPerRow, float* csrSortedValA, int* csrSortedRowPtrA, int* csrSortedColIndA);
  // HIP: HIPSPARSE_EXPORT hipsparseStatus_t hipsparseSdense2csr(hipsparseHandle_t handle, int m, int n, const hipsparseMatDescr_t descr, const float* A, int ld, const int* nnz_per_rows, float* csr_val, int* csr_row_ptr, int* csr_col_ind);
  // CHECK: status_t = hipsparseSdense2csr(handle_t, m, n, matDescr_A, &fA, lda, &nnzPerRow, &csrSortedValA, &csrRowPtrA, &csrColIndA);
  status_t = cusparseSdense2csr(handle_t, m, n, matDescr_A, &fA, lda, &nnzPerRow, &csrSortedValA, &csrRowPtrA, &csrColIndA);
#endif

#if CUDA_VERSION >= 12000
  // CHECK: hipsparseCsr2CscAlg_t CSR2CSC_ALG_DEFAULT = HIPSPARSE_CSR2CSC_ALG_DEFAULT;
  cusparseCsr2CscAlg_t CSR2CSC_ALG_DEFAULT = CUSPARSE_CSR2CSC_ALG_DEFAULT;

  // CHECK: hipsparseSpGEMMAlg_t SPGEMM_ALG1 = HIPSPARSE_SPGEMM_ALG1;
  // CHECK: hipsparseSpGEMMAlg_t SPGEMM_ALG2 = HIPSPARSE_SPGEMM_ALG2;
  // CHECK: hipsparseSpGEMMAlg_t SPGEMM_ALG3 = HIPSPARSE_SPGEMM_ALG3;
  cusparseSpGEMMAlg_t SPGEMM_ALG1 = CUSPARSE_SPGEMM_ALG1;
  cusparseSpGEMMAlg_t SPGEMM_ALG2 = CUSPARSE_SPGEMM_ALG2;
  cusparseSpGEMMAlg_t SPGEMM_ALG3 = CUSPARSE_SPGEMM_ALG3;
#endif

  return 0;
}

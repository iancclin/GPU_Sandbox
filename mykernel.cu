#include <complex>
#include <cuComplex.h>
#include "mykernel.h"

namespace dftfe {
    namespace {
        __device__ double Mult(double x,
                               double y) {
            return x * y;
        }

        __device__ cuDoubleComplex Mult(cuDoubleComplex x,
                                        cuDoubleComplex y) {
            return cuCmul(x, y);
        }

        template<typename NumType>
        __global__
        void saxpy_kernel(int n,
                          NumType a,
                          NumType *x,
                          NumType *y) {
            int i = blockIdx.x * blockDim.x + threadIdx.x;
            if (i < n) y[i] = Mult(a, x[i]);
        }

    }

    template<typename NumType>
    void saxpy(int n,
               NumType a,
               NumType *x,
               NumType *y) {
        saxpy_kernel<<<1, 1>>>(n,
                               a,
                               x,
                               y);
    }

    template void
    saxpy(int n,
          double a,
          double *x,
          double *y);

    template void
    saxpy(int n,
          cuDoubleComplex a,
          cuDoubleComplex *x,
          cuDoubleComplex *y);
}

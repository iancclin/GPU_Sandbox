#ifndef GPU_SANDBOX_MYKERNEL_H
#define GPU_SANDBOX_MYKERNEL_H

namespace dftfe {
    template<typename NumType>
    void saxpy(int n,
               NumType a,
               NumType *x,
               NumType *y);
}
#endif //GPU_SANDBOX_MYKERNEL_H

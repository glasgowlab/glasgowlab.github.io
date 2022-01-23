#include <cstdio>
extern "C" {
  void dsyev_(char*, char*, int&, double*, int&, double*,double*,int&,int&);
  void dgemm_(char*, char*, int&, int&, int&, double&,
              double*, int&, double*, int&, double&, double*, int&);
}
int main() {
  int n_cols = 3, lwork = 102, info;
  double work[102], mat[9], vec[3], alpha = 1.0;
  mat[0] = 1.0; mat[1] = 1.0; mat[2] = 1.0;
  mat[3] = 1.0; mat[4] = 1.0; mat[5] = 1.0;
  mat[6] = 1.0; mat[7] = 1.0; mat[8] = 1.0;
  dsyev_((char*)"V", (char*)"U", n_cols, mat, n_cols, vec, work, lwork, info);
  dgemm_((char*)"N",(char*)"N", n_cols, n_cols, n_cols, alpha,
         mat, n_cols, mat, n_cols, alpha, mat, n_cols);
  printf("Testing\n"); return 0;
}

#include <iostream>
#include <vector>
#include <memory>
#include "./p0_starter.h"

using namespace std;

void CustomTest(const scudb::RowMatrix<int> &sample){
        for(int row = 0; row < sample.GetRowCount(); row++){
            for(int col = 0; col < sample.GetColumnCount(); col++)
            {
                cout << "\t" << sample.GetElement(row, col);
            }
            cout << endl;
        }
        cout << endl;
}

int main(){

    cout << endl << "--CustomTest--" << endl << endl;
    cout << "M1(Initialized with row=3, col=6, and element increments from 4):" << endl;
    scudb::RowMatrix<int> m1(3, 6);
    int i = 4;
    for(int row = 0; row < m1.GetRowCount(); row++){
        for(int col = 0; col < m1.GetColumnCount(); col++){
            m1.SetElement(row, col, i);
            i++;
        }
    }
    CustomTest(m1);

    cout << endl << "M2(Filled from vector(6*3, 2)):" << endl << endl;
    vector<int> v1(6 * 3, 2);
    scudb::RowMatrix<int> m2(6, 3);
    m2.FillFrom(v1);
    CustomTest(m2);

    cout << endl << "M3(M1 Add M1):" << endl << endl;
    unique_ptr<scudb::RowMatrix<int>> m3 = scudb::RowMatrixOperations<int>::Add(&m1, &m1);
    CustomTest(*m3);

    cout << endl << "M4(M1 Mutiply M2):" << endl << endl;
    unique_ptr<scudb::RowMatrix<int>> m4 = scudb::RowMatrixOperations<int>::Multiply(&m1, &m2);
    CustomTest(*m4);

    cout << endl << "M5(GEMM(M1, M2, M4)):" << endl << endl;
    unique_ptr<scudb::RowMatrix<int>> ma6 = scudb::RowMatrixOperations<int>::GEMM(&m1, &m2, m4.get());
    CustomTest(*ma6);

    return 0;
}
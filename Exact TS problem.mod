/*********************************************
 * OPL 12.8.0.0 Model
 * Author: luigimissri
 * Creation Date: 26/dic/2018 at 12:03:10
 *********************************************/

 int Nnodes = ...;
 setof(int) I = asSet(1..Nnodes);
 setof(int) J = asSet(1..Nnodes);
 
 int start= ...;
 float	C[I][J] = ...;		
 
 dvar int+ x[I][J];
 dvar boolean y[I][J];
 
 minimize sum (i in I, j in J) (C[i][j] * y[i][j]);
 
 subject to {
 
 startFlow: sum ( j in J)  x[start][j] == Nnodes;
 
forall ( j in J :j!=start ) {
	nodeFlow: sum ( i in I ) x[i][j] - sum( i in I) x[j][i] ==1;
}

forall ( i in I ) {
	exitEdge: sum ( j in J ) y[i][j] ==1;
}

forall ( j in J ) {
	enteringEdge: sum ( i in I ) y[i][j] ==1;
}
forall ( j in J, i in I ) {
	tec: x[i][j] <= Nnodes*y[i][j];
}


}
 
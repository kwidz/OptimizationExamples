import pulp
from itertools import product
#nombre de villes
n=5
#Matrice de distance pour les distances entre chaque ville

D = [
    [0, 2451, 713, 1018, 163],
    [2451, 0, 1745, 1524, 831],
    [713, 1745, 0, 355, 920],
    [1018, 1524, 355, 0, 700],
    [1631, 831, 920, 700, 0]
    ]  


prob = pulp.LpProblem('TSP', pulp.LpMinimize)

x = {(u, v): pulp.LpVariable('x_{0}_{1}'.format(u, v), lowBound=0, cat='Binary')
     for (u, v) in product(range(n), range(n)) if u != v}
u = {i: pulp.LpVariable('u_{0}'.format(i), lowBound=0,
                        cat='Integer') for i in range(n)}
prob += u[0] == 1
for i in range(1, n):
    prob += u[i] <= n
    prob += u[i] >= 2

prob += pulp.lpSum(D[i][j] * x[i, j]
                    for i in range(n) for j in range(n) if i != j)
for i in range(n):
    prob += pulp.lpSum(x[i, j] for j in range(n) if i != j) == 1
for i in range(n):
    prob += pulp.lpSum(x[j, i] for j in range(n) if i != j) == 1
for i in range(1, n):
    for j in range(1, n):
        if i != j:
            prob += u[i] - u[j] + (n+1) * x[i, j] <= n


prob.solve()
#writing solution
for i in range(n):
    for j in range(n):
        if i != j:
            if pulp.value(x[i, j]) == 1:
                print(i,j)
                

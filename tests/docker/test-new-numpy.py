import numpy as np

a = np.arange(6).reshape(3, 2)
print(a)

b = np.ones((2, 2), dtype=int)
a @= b
print(a)


import numpy as np
import pickle
import matplotlib.pyplot as plt

if __name__ == '__main__':
    with open("output.txt", "rb") as f:
        line = f.readline()
        array = pickle.loads(line)

        print(array)

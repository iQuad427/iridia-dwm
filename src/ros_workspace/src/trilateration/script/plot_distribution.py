import sys
import matplotlib.pyplot as plt
import numpy as np

if __name__ == '__main__':
    means = []
    stds = []
    distances = []

    for distance in [0 + 0.1 * i for i in range(21)]:
        try:
            with open(f"output/distribution/distance_{distance:0.1f}", "r") as f:
                lines = f.readlines()
        except:
            continue

        # Compute histogram of values
        histogram = {}
        for line in lines:
            value = float(line.split('\n')[0])
            if value in histogram:
                histogram[value] += 1
            else:
                histogram[value] = 1

        # Normalize and plot histogram
        total = sum(histogram.values())
        for key in histogram:
            histogram[key] /= total

        # plt.bar(histogram.keys(), histogram.values(), width=0.1)

        # Fit a gaussian on the result
        values = [float(line.split('\n')[0]) for line in lines]
        mean = np.mean(values)
        std = np.std(values)

        means.append(mean)
        stds.append(std)
        distances.append(distance)

        x = np.linspace(min(values), max(values), 100)
        y = 1 / (std * np.sqrt(2 * np.pi)) * np.exp(-0.5 * (x - mean) ** 2 / std ** 2)

        # plt.plot(x, y, label=f"Error: {distance:0.1f}")

    offset = 0.0

    plt.plot(np.array(means) - offset, distances, label="mean value", color='b')
    plt.plot([0] + distances, [0] + distances, 'r', label="y=x")

    # Plot standard deviation as error area for up to 3 standard deviations with increasing transparency
    plt.fill_betweenx(distances, np.array(means) - np.array(stds) * 3 - offset, np.array(means) + np.array(stds) * 3 - offset, color='b', alpha=0.10, label="1 x std")
    plt.fill_betweenx(distances, np.array(means) - np.array(stds) * 2 - offset, np.array(means) + np.array(stds) * 2 - offset, color='b', alpha=0.15, label="2 x std")
    plt.fill_betweenx(distances, np.array(means) - np.array(stds) * 1 - offset, np.array(means) + np.array(stds) * 1 - offset, color='b', alpha=0.2, label="3 x std")



    plt.xlabel('Real Distance')
    plt.ylabel('RToF Distance')

    # Make axis go from 0 to 2 with a step of 0.1
    plt.xticks(np.arange(0, max(means) + 0.1, step=0.2))
    plt.yticks(np.arange(0, max(distances) + 0.1, step=0.2))

    # Put x-axis values vertically
    plt.xticks(rotation=90)

    # Equal axis
    plt.axis('equal')

    plt.legend()
    plt.savefig("output/distribution.png", dpi=300)
    plt.show()


import sys
import matplotlib.pyplot as plt
import numpy as np

if __name__ == '__main__':
    means = []
    stds = []
    distances = []
    X = []
    y = []

    for distance in [0 + 0.1 * i for i in range(21)]:
        try:
            with open(f"output/distribution/distance_{distance:0.1f}", "r") as f:
                lines = f.readlines()
        except:
            continue

        distances.append(distance)

        # Compute histogram of values
        histogram = {}
        for line in lines:
            value = float(line.split('\n')[0])
            if value in histogram:
                histogram[value] += 1
            else:
                histogram[value] = 1

            # Save value for linear regression
            X.append(value)
            y.append(distance)

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

        # x = np.linspace(min(values), max(values), 100)
        # y = 1 / (std * np.sqrt(2 * np.pi)) * np.exp(-0.5 * (x - mean) ** 2 / std ** 2)

        # plt.plot(x, y, label=f"Error: {distance:0.1f}")

    # Recover the different points in the histogram to do a linear regression
    X = np.array(X).reshape(-1, 1)
    y = np.array(y).reshape(-1, 1)

    # Linear regression
    from sklearn.linear_model import LinearRegression
    reg = LinearRegression().fit(X, y)
    print(f"Linear regression: {reg.coef_} x + {reg.intercept_}")

    offset = 0.0

    # Plot standard deviation as error area for up to 3 standard deviations with increasing transparency
    plt.fill_betweenx(distances, np.array(means) - np.array(stds) * 3 - offset, np.array(means) + np.array(stds) * 3 - offset, color='b', alpha=0.10, label="3 x std")
    plt.fill_betweenx(distances, np.array(means) - np.array(stds) * 2 - offset, np.array(means) + np.array(stds) * 2 - offset, color='b', alpha=0.15, label="2 x std")
    plt.fill_betweenx(distances, np.array(means) - np.array(stds) * 1 - offset, np.array(means) + np.array(stds) * 1 - offset, color='b', alpha=0.2, label="1 x std")

    plt.plot([0] + distances, [0] + distances, 'r', label="y = x")
    plt.plot(np.array(means) - offset, distances, label="Mean estimate", color='b')
    plt.plot(X, reg.predict(X), label=f"Linear regression", color='g')

    plt.title('Measured RToF distance vs. True distance')
    plt.xlabel('RToF Distance (m)')
    plt.ylabel('Real Distance (m)')

    # Make axis go from 0 to 2 with a step of 0.1
    plt.xticks(np.arange(0, max(means) + 0.1, step=0.2))
    plt.yticks(np.arange(0, max(distances) + 0.1, step=0.2))

    # Put x-axis values vertically
    # plt.xticks(rotation=90)

    # Equal axis
    plt.axis('equal')

    # Add grid
    plt.grid()

    plt.legend()
    plt.savefig("output/distribution.png", dpi=300)
    plt.show()


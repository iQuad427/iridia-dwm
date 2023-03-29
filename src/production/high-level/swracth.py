# import numpy as np
# import matplotlib.pyplot as plt
#
#
# r = np.arange(0, 2, 0.01)
# theta = 2 * np.pi * r
#
# fig, ax = plt.subplots(subplot_kw={'projection': 'polar'})
# ax.plot(theta, r)
# ax.set_rmax(5)
# ax.set_rlabel_position(-22.5)  # Move radial labels away from plotted line
# ax.grid(True)
#
# ax.set_title("A line plot on a polar axis", va='bottom')
# plt.show()

# import numpy as np
# import matplotlib.pyplot as plt
# from matplotlib.animation import FuncAnimation
#
# length = 250
#
# data = [
# 	[np.sin(i*0.06) for i in range(0, length)],
# 	[np.cos(i*0.06) for i in range(0, length)],
# 	[np.sin(i*0.06) for i in range(0, length)],
# 	[np.cos(i*0.06) for i in range(0, length)],
# 	[np.sin(i*0.06) for i in range(0, length)]
# ]
#
# data = [*data, data[0]]
#
# # # This works too
# # data.append(data[0])
#
# labels = ["Label 1", "Label 2", "Label 3", "Label 4", "Label 5"]
# labels = [*labels, labels[0]]
#
# # # This works too
# # labels.append(labels[0])
#
# # Get len(labels) equal distance points on a circle
# label_loc = np.linspace(0, 2*np.pi, num=len(labels))
#
# fig, ax = plt.subplots(figsize=(10, 10), subplot_kw={'projection': 'polar'})
#
# radar_ln = ax.plot(label_loc, [d[0] for d in data], label="Legend")
#
# ax.set_thetagrids(np.degrees(label_loc), labels=labels)
# ax.legend(loc="lower left", bbox_to_anchor=(0.95, 0.95))
#
# ax.set_rmax(2)
# ax.set_rmin(-2)
#
# def update(i, radar_ln, label_loc, data):
# 	radar_ln[0].set_data(label_loc, [d[i] for d in data])
# 	return radar_ln
#
# ani = FuncAnimation(fig, update, frames=len(data[0]), fargs=(radar_ln, label_loc, data), interval=40)
# plt.show()
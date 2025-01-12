# Generating a horizontal bar chart of the speed up of AiiDA-enabled koopmans vs the old implementation

import matplotlib.pyplot as plt
import seaborn as sns

sns.set(context='talk')

grid = [2, 3, 4, 5, 6]
fbz = [g ** 3 for g in grid]
ibz = [4, 6, 13, 19, 32]

fig, ax = plt.subplots(figsize=(10, 3))
bar_width = 0.6

colors = sns.color_palette(None, 8)
ax.plot(grid, fbz)
ax.plot(grid, ibz)

ax.set_xlabel('time')
ax.set_xticks(grid, [f"${x}\times{x}\times{x}$" for x in grid])
#ax.legend(loc='lower right', ncols=len(times), bbox_to_anchor=(1, 1), frameon=False)
plt.tight_layout()
plt.savefig('bz-to-ibz.svg')

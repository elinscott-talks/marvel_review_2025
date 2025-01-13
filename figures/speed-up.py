# Generating a horizontal bar chart of the speed up of AiiDA-enabled koopmans vs the old implementation

import matplotlib.pyplot as plt
import seaborn as sns

sns.set(context='talk')

timings = {'old': {'initial SCF': 9.32, 'initial NSCF': 14.57, 'Wannierisation': 45.09, 'bands': 12.1, 'projected DOS': 6.69, 'interface to KCW': 28, 'calculate screening': 70980, 'construct Hamiltonian': 60.74},
		   'new': {'initial SCF': 9.32, 'initial NSCF': 14.57, 'Wannierisation': 10.17, 'bands': 12.1, 'projected DOS': 6.69, 'interface to KCW': 28, 'calculate screening': 13020, 'construct Hamiltonian': 60.74}}

fig, ax = plt.subplots(figsize=(10, 3))
bar_width = 0.6

colors = sns.color_palette(None, 8)
# set marvel red to #ff2600
marvel_red = "#ff2600"

for label, times in sorted(timings.items()):
    bottom = 0
    for (code, time), color in zip(times.items(), colors):
        if code != 'calculate screening':
            continue
        if label == 'old':
            code = None
        ax.barh(label, time, bar_width, label=code, left=bottom, color=marvel_red)
        bottom += time

ax.set_xlabel('wall time')
# ax.legend(loc='lower right', ncol=len(times), bbox_to_anchor=(1, 1), frameon=False)
ax.set_xticklabels([None for _ in ax.get_xticks()])
plt.tight_layout()
plt.savefig('aiida-speed-up.svg')

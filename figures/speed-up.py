# Generating a horizontal bar chart of the speed up of AiiDA-enabled koopmans vs the old implementation

import matplotlib.pyplot as plt
import seaborn as sns

sns.set(context='talk')

timings = {'old': {
    'pw.x': 1.0,
    'wannier90.x': 1.0,
    'pw2wannier90.x': 1.0,
    'kcw.x': 1.0,
}, 'new': {
    'pw.x': 0.5,
    'wannier90.x': 0.5,
    'pw2wannier90.x': 0.5,
    'kcw.x': 0.5,
}}

fig, ax = plt.subplots(figsize=(10, 3))
bar_width = 0.6

colors = sns.color_palette(None, 8)
for label, times in sorted(timings.items()):
    bottom = 0
    for (code, time), color in zip(times.items(), colors):
        if label == 'old':
            code = None
        ax.barh(label, time, bar_width, label=code, left=bottom, color=color)
        bottom += time

ax.set_xlabel('time')
ax.legend(loc='lower right', ncols=len(times), bbox_to_anchor=(1, 1), frameon=False)
plt.tight_layout()
plt.savefig('speed-up.svg')

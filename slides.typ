#import "touying/lib.typ": *
#import "@preview/pinit:0.1.4": *
#import "@preview/xarrow:0.3.0": xarrow
#import "@preview/cetz:0.3.0"
#import themes.marvel: *

#set text(font: "Myriad Pro") 
#set footnote.entry(clearance: 0em, separator: [], indent: 0em)
#show footnote.entry: set text(0.8em, fill: marvel-grey)


#show: marvel-theme.with(aspect-ratio: "16-9",
                   config-info(title: [Band structure calculations that are accurate, efficient, accessible, and automated],
                     author: [Edward Linscott],
                     date: datetime(year: 2025, month: 1, day: 14),
                     event: [MARVEL Review & Retreat],
                     location: [Grindelwald],
                     references: [references.bib],
                     institution: [Paul Scherrer Institute],
                  ),
                  config-common(
                    datetime-format: "[day padding:none] [month repr:long] [year]"
                  ),
)

#let blcite(reference) = {
  text(fill: white, cite(reference))
}

#let cetz-canvas = touying-reducer.with(reduce: cetz.canvas, cover: cetz.draw.hide.with(bounds: true))

#title-slide()
== This talk
Our progress on Koopmans functionals, with the goal of band structure calculations that are...

- accurate
- efficient
- accessible
- automated

#pause
#grid(columns: 7, column-gutter: 1em, align: center, row-gutter: 0.5em,
  image("media/mugshots/nicola_colonna.png", height: 40%),
  image("media/mugshots/giovanni_cistaro.jpeg", height: 40%),
  image("media/mugshots/yannick_schubert.jpg", height: 40%),
  image("media/mugshots/junfeng_qiao.jpeg", height: 40%),
  image("media/mugshots/miki_bonacci.jpg", height: 40%),
  image("media/mugshots/julian_geiger.jpg", height: 40%),
  image("media/mugshots/nicola_marzari.jpeg", height: 40%),
  [Nicola Colonna], [Giovanni Cistaro], [Yannick Schubert], [Junfeng Qiao], [Miki Bonacci], [Julian Geiger], [Nicola Marzari]
)

== Koopmans functionals in a nutshell
$
  E^"KI"_bold(alpha) [rho, {rho_i}] =
  E^"DFT" [rho] +
  sum_i alpha_i { &
    - (E^"DFT" [rho] - E^"DFT" [rho - rho_i])
  \ &
    + f_i (E^"DFT" [rho - rho_i + n_i] - E^"DFT" [rho - rho_i])
  }
$

#pause
- an orbital-by-orbital correction to DFT #pause
  - imposes the equivalence between total energy differences and orbital eigenvalues #pause
  - total energy unchanged! #pause
- screening parameters #pause
- orbital-density-dependence


= Accuracy
== The accuracy of Koopmans functionals
... is well-established

=== Molecular systems
#grid(columns: (1fr, 1fr), column-gutter: 1em, row-gutter: 1em,
  [Ionisation potentials@Colonna2019], [UV photoemission spectra@Nguyen2015],
  image("figures/colonna_2019_gw100_ip.jpeg", width: 100%), image("figures/fig_nguyen_prl_spectra.png", width: 100%)
)


== The accuracy of Koopmans functionals
#slide()[
=== Bulk systems
Prototypical semiconductors and insulators@Nguyen2018

#show table.cell: it => {
  if it.x == 3 or it.x == 4 {
    set text(fill: marvel-red, weight: "semibold")
    it
  } else {
    it
  }
}
#grid(align: center + horizon, columns: 2, column-gutter: 1em,
image("figures/fig_nguyen_prx_bandgaps.png", height: 70%),
table(columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr), inset: 0.5em, stroke: none,
table.header([], [PBE], [G#sub[0]W#sub[0]], [KI], [KIPZ], [QSGW̃]),
table.hline(),
[$E_"gap"$], [2.54], [0.56], [0.27], [0.22], [0.18],
[IP], [1.09], [0.39], [0.19], [0.21], [0.49]
))
]

== The accuracy of Koopmans functionals
#slide[
ZnO@Colonna2022
#v(-1em)
#align(center + horizon,
grid(align: center + horizon, columns: 3, column-gutter: 1em,
image("figures/ZnO_lda_cropped.png", height: 50%),
image("figures/ZnO_hse_cropped_noaxis.png", height: 50%),
image("figures/ZnO_ki_cropped_noaxis.png", height: 50%),
))

#show table.cell: it => {
  if it.x == 5 {
    set text(fill: marvel-red, weight: "semibold")
    it
  } else {
    it
  }
}
#table(columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1.5fr), inset: 0.5em, stroke: none,
table.header([], [LDA ], [HSE ], [GW#sub[0] ], [scGW̃ ], [KI ], [exp ]),
table.hline(),
[$E_"gap"$], [0.79], [2.79], [3.0], [3.2], [3.68], [3.60],
[$angle.l epsilon_d angle.r$], [-5.1], [-6.1], [-6.4], [-6.7], [-6.9], [-7.5 to -8.81 ],
[$Delta$], [4.15], [], [], [], [4.99], [5.3]
)
]

CsPbBr#sub[3]@Marrazzo2024a
#v(-2em)
#align(center + horizon,
image("figures/marrazzo_CsPbBr3_bands.svg", height: 60%)
)
#table(columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1.5fr), inset: 0.5em, stroke: none,
table.header([], [LDA ], [HSE ], [G#sub[0]W#sub[0] ], [scGW̃ ], [*KI*], [exp ]),
table.hline(),
[*with SOC*], [0.18], [0.78], [0.94], [1.53], [*1.78*], [1.85],
[without SOC], [1.40], [2.09], [2.56], [3.15], [3.12], [],
)


= Efficiency

== Taking advantage of symmetries
Text

== Machine-learning
Text

= Accessibility
== Barriers to accessibility

- non-standard functionals
- (some) bespoke code
- complicated workflows

#focus-slide()[
#align(center, image(width: 80%, "media/logos/koopmans_white_on_transparent.svg"))
]

== `koopmans`
#matrix-slide()[
  #image("figures/website_cropped.png")
][
  An ongoing effort to make Koopmans functional calculations straightforward for non-experts@Linscott2023
  
  - easy installation
  - automated workflows
  - minimal input required of the user
  - minimal knowledge required of the user
  
  For more details: `koopmans-functionals.org`
]

= Automation
== Automated Wannierization
#slide(repeat: 2, self => [
  #let (uncover, only, alternatives) = utils.methods(self)

  Koopmans functionals use Wannier functions heavily either...
  - to initialize the a guess for the orbitals that minimize the ODD functional
  - in place of the minimizing orbitals entirely
  
  However, Wannierization #alternatives[is a very manual process...][*was* a very manual process!]

])

== Automated Wannierization

#grid(
  columns: (2fr, 2fr, 3fr),
  align: center + horizon,
  gutter: 1em,
  image("figures/proj_disentanglement_fig1a.png", height: 60%),
  image("figures/new_projs.png", height: 60%),
  image("figures/target_manifolds_fig1b.png", height: 60%),

  text("projectability-based disentanglement") + cite(<Qiao2023>),
  text("use PAOs found in pseudopotentials"),
  text("parallel transport to separate manifolds") + cite(<Qiao2023a>),
)

== AiiDA integration

#matrix-slide(align: top + left)[
  #image("media/logos/koopmans_grey_on_transparent.svg", height: 2em)
  - local execution only #pause
  - serial step execution #pause
  - direct access to input/output files #pause
  - simpler installation #pause
][
  #image("media/logos/aiida.svg", height: 2em)
  - remote execution #pause
  - parallel step execution #pause
  - outputs stored in a database #pause
  - installation more involved #pause

  We could really benefit from a lot of the features of `AiiDA` _e.g._ the calculation of screening parameters is embarrassingly parallelizable.
]

#image("media/logos/koopmans_grey_on_transparent_aiida.svg", width: 100%)

== Speed-up

== What did this require?
- substantial refactoring of the `koopmans` code base
  - abstraction of various operations (e.g. reading/writing files)
  - conversion of steps to pure functions, _etc._)
  - removing all reliance on shared directories
- `aiida-blitz` for simplified `AiiDA` setup
- `?` for dumping contents of `AiiDA` database to a local file structure

== What did all this work enable?
ADD PLOT OF SPEED-UPS

- unchanged interface from the perspective of the user

  `$ koopmans tio2.json`

  #pause to

  `$ koopmans --engine=aiida tio2.json`



= Summary
== Summary
#grid(
  columns: (2fr, 2fr),
  gutter: 1em,
  image("figures/black_box_filled_square.png", width: 100%),
  text[
    Koopmans functionals are...
    - *accurate*, with band structures comparable to state-of-the-art GW
      - now also for systems with strong SOC #pause
    - more *efficient* thanks to
      - a new DFPT implementation that takes advantage of symmetries
      - a new machine learning framework for predicting screening parameters #pause
    - more *accessible* thanks to ongoing work on the `koopmans` package #pause
    - more *automated* thanks to
      - automated Wannierization
      - a new integration with `AiiDA`...#pause
        with an `AiiDAlab` app on the horizon!

  ],
)

#focus-slide()[Thank you!]

== References
#show bibliography: set text(0.6em)
#bibliography("references.bib", style: "nature-footnote.csl", title: none)

#show: appendix
#focus-slide()[#align(center, text(size: 2em, [spare slides]))]

= Detailed Theory

== Total energy differences vs. eigenvalues

We all know that DFT underestimates the band gap. But why?

The exact Green's function has poles that correspond to total energy differences

$
  ε_i = cases(E(N) - E_i (N-1) & "if" i in "occ", E_i (N+1) - E(N) & "if" i in "emp")
$

but DFT does #emph[not]

#focus-slide()[Core idea: impose this condition to DFT to improve its description of spectral properties]

#matrix-slide()[
  Formally, every orbital $i$ should have an eigenenergy
  $
    epsilon_i^"Koopmans" = ⟨
      phi_i mid(|)hat(H)mid(|)phi_i
    ⟩ = frac(dif E, dif f_i)
  $
  that is
  - independent of $f_i$
  - equal to $Delta E$ of explicit electron addition/removal
][
  #image(width: 100%, "figures/fig_en_curve_gradients_zoom.svg")
]
#matrix-slide(columns: (1fr, 1fr))[

$
  E^"KI" &[rho, {rho_i}] =
  E^"DFT" [rho]
  \ & +
  sum_i {
    - underbrace((E^"DFT" [rho] - E[rho^(f_i arrow.r 0)]), "remove non-linear dependence")
  \ &
    + underbrace(f_i (E^"DFT" [rho^(f_i arrow.r 1)] - E^"DFT" [rho^(f_i arrow.r 0)]), "restore linear dependence")
  }
$

Bakes the total energy differences $E^"DFT" [rho^(f_i arrow.r 1)] - E^"DFT" [rho^(f_i arrow.r 0)]$ into the functional

][
  #image(width: 100%, "figures/fig_en_curve_gradients_zoom.svg")
]

== 

// $E[rho^(f_i arrow.r f)]$ is the energy of the $N - f_i + f$-electron problem with orbital $i$'s occupation changed from $f_i$ to $f$ -- cannot directly evaluate
// 
// Instead use a frozen-orbital picture:
// 
// $
//  rho^(f_i arrow.r f)(bold(r)) approx rho(bold(r)) + (f - f_i) |phi^N_i (bold(r))|^2
// $
// 
// very easy to evaluate -- but not at all accurate! Correct this _post hoc_ via a screening parameter i.e.
// 
// $
//   E[rho^(f_i arrow.r f)] approx alpha_i E[rho + (f - f_i) |phi^N_i (bold(r))|^2]
// $
#align(center + horizon, 
grid(align: center + horizon, columns: 3, column-gutter: 2cm, row-gutter: 1cm,
cetz.canvas({
  import cetz.draw: *
  content((1.25, 1.5), [$rho$])
  circle((0, 0), radius: 1, fill: marvel-red, stroke: none)
  circle((2.5, 0), radius: 1, fill: marvel-red, stroke: none)

}),
cetz.canvas({
  import cetz.draw: *

  content((9, 1.5), [$rho^(f_1 arrow.r 0)$])
  arc((10.75, 0), start: 0deg, stop: 360deg, radius: (1.5, 1), fill: marvel-red, stroke: none)
  circle((8, 0), radius: 1, fill: none, stroke: (thickness: 2pt, paint: marvel-red))
  circle((8, 0), radius: 1, fill: none, stroke: (dash: "dashed", thickness: 2pt, paint: white))
  // content((8, -1.5), [$f_1 = 0$])
}),
cetz.canvas({
  import cetz.draw: *

  content((17.25, 1.5), [$rho - |psi^N_1(r)|^2$])
  circle((16, 0), radius: 1, fill: none, stroke: (dash: "dashed", thickness: 2pt, paint: marvel-red))
  circle((18.5, 0), radius: 1, fill: marvel-red, stroke: none)
}),
[$N$-electron solution],
[what we'd like to evaluate],
[what we can quickly evaluate]

))


==
$
  E^"KI"_bold(alpha) [rho, {rho_i}] = &
  E^"DFT" [rho]
  \ & +
  sum_i {
    - (E^"DFT" [rho] - E^"DFT"[rho^(f_i arrow.r 0)])
    + f_i (E^"DFT" [rho^(f_i arrow.r 1)] - E^"DFT" [rho^(f_i arrow.r 0)])
  }
  \ approx & 
  E^"DFT" [rho]
  \ & +
  sum_i alpha_i {
    - (E^"DFT" [rho] - E^"DFT"[rho - rho_i])
    + f_i (E^"DFT" [rho - rho_i + n_i] - E^"DFT" [rho - rho_i])
  }
$

==

$ H^"KI"_(i j) = angle.l phi_j|hat(h)^"DFT" + alpha_i hat(v)_i^"KI"|phi_i angle.r $
For _e.g._ occupied orbitals $ hat(v)^"KI"_i = - E_"Hxc" [rho - n_i] + E_"Hxc" [rho] - integral v_"Hxc" (bold(r)', [rho]) n_i d bold(r)' $

== Screening

Construct $alpha_i$ from explicit $Delta$SCF calculations@Nguyen2018@DeGennaro2022a

$
  alpha_i = alpha_i^0 (Delta E_i - lambda_(i i)(0)) / (lambda_(i i)(alpha^0) - lambda_(i i)(0)) "where" lambda_(i i)(alpha) = angle.l phi_i|hat(h)^"DFT" + alpha hat(v)_i^"KI"|phi_i angle.r $

Recast via linear response@Colonna2018:

$
  alpha_i = (angle.l n_i mid(|) epsilon^(-1) f_"Hxc" mid(|) n_i angle.r) / (angle.l n_i mid(|) f_"Hxc" mid(|) n_i angle.r)
$

which can be efficiently computed via DFPT@Colonna2022 #pause ... but is still the bulk of the computational cost (can use machine-learning)

== Calculating screening parameters via SCF
#matrix-slide(columns: (1fr, 1fr))[
#align(center + horizon,
  {only("1")[#image("figures/alpha_calc/fig_alpha_calc_step_0.png", height: 100%)]
  only("2")[#image("figures/alpha_calc/fig_alpha_calc_step_1.png", height: 100%)]
  only("3")[#image("figures/alpha_calc/fig_alpha_calc_step_2.png", height: 100%)]
  only("4-5")[#image("figures/alpha_calc/fig_alpha_calc_step_3.png", height: 100%)]
  only("6-7")[#image("figures/alpha_calc/fig_alpha_calc_step_4.png", height: 100%)]
  }
)
][
#only("7")[$ alpha_i = alpha_i^0 (Delta E_i - lambda_(i i)(0)) / (lambda_(i i)(alpha^0) - lambda_(i i)(0)) $
$ lambda_(i i)(alpha) = angle.l phi_i|hat(h)^"DFT" + alpha hat(v)_i^"KI"|phi_i angle.r $]
]


#slide[
#align(center + horizon, 
  image("figures/fig_pwl.png", height: 100%)
)
]

== Issues with extended systems

#align(center + horizon, 
  image("figures/fig_nguyen_scaling.png", width: 60%)
)

#pause
One cell: $E(N + delta N) - E(N)$ #pause; all cells: $Delta E = 1 / (delta N) (E(N + delta N) - E(N)) = (d E)/ (d N) = - epsilon_(H O)$@Nguyen2018

== Issues with extended systems

#align(center + horizon, 
  image("figures/fig_nguyen_scaling.png", width: 60%)
)

Two options: #pause _1._ use a more advanced functional#pause, or _2._ stay in the "safe" region

== Orbital-density dependence
The potential is orbital-dependent!
  $ v^"KI"_(i in"occ") = - E_"Hxc" [rho - n_i] + E_"Hxc" [rho] - integral v_"Hxc" (bold(r)', [rho]) n_i d bold(r)' $

#pause

#align(center,
  grid(columns: 2,
  image("figures/fig_nguyen_variational_orbital.png", width: 90%),
  image("figures/fig_nguyen_canonical_orbital.png", width: 90%),
  [two variational orbitals],
  [a canonical orbital],
  )
)

#slide[
  Because we have an ODD...
- #pause minimisation gives rise to localised orbitals, so we can use MLWFs@Marzari2012
- we know $hat(H)|phi_i angle.r$ but we don't know $hat(H)$ #pause
- we have a natural generalisation of DFT in the direction of spectral functional theory@Ferretti2014
]

= Exhaustive Results

== Molecular systems

Ionisation potentials@Colonna2019
#align(center + horizon,
image("figures/colonna_2019_gw100_ip.jpeg", width: 100%)
)

UV photoemission spectra@Nguyen2015
#align(center + horizon,
image("figures/fig_nguyen_prl_spectra.png", width: 100%)
)

== Extended systems
#slide[
Prototypical semiconductors and insulators@Nguyen2018


#show table.cell: it => {
  if it.x == 3 or it.x == 4 {
    set text(fill: marvel-red, weight: "semibold")
    it
  } else {
    it
  }
}

#grid(align: center + horizon, columns: 2, column-gutter: 1em,
image("figures/fig_nguyen_prx_bandgaps.png", height: 80%),
table(columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr), inset: 0.5em, stroke: none,
table.header([], [PBE], [G#sub[0]W#sub[0]], [KI], [KIPZ], [QSGW̃]),
table.hline(),
[$E_"gap"$], [2.54], [0.56], [0.27], [0.22], [0.18],
[IP], [1.09], [0.39], [0.19], [0.21], [0.49]
))
  
]

#slide[
ZnO@Colonna2022
#v(-1em)
#align(center + horizon,
grid(align: center + horizon, columns: 3, column-gutter: 1em,
image("figures/ZnO_lda_cropped.png", height: 80%),
image("figures/ZnO_hse_cropped_noaxis.png", height: 80%),
image("figures/ZnO_ki_cropped_noaxis.png", height: 80%),
))
]

#slide[
ZnO@Colonna2022
#table(columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1.5fr), inset: 0.5em, stroke: none,
table.header([], [LDA ], [HSE ], [GW#sub[0] ], [scGW̃ ], [KI ], [exp ]),
table.hline(),
[$E_"gap"$], [0.79], [2.79], [3.0], [3.2], [3.68], [3.60],
[$angle.l epsilon_d angle.r$], [-5.1], [-6.1], [-6.4], [-6.7], [-6.9], [-7.5 to -8.81 ],
[$Delta$], [4.15], [], [], [], [4.99], [5.3]
)
  
]

Spin-orbit coupling@Marrazzo2024a
#align(center + horizon,
image("figures/marrazzo_CsPbBr3_bands.svg", height: 80%)
)

== Model systems
Hooke's atom@Schubert2023

#align(center + horizon, 
  image("figures/schubert_vxc.jpeg", height: 85%)
)

= Caveats

== Limitations

- only valid for systems with $E_"gap"$ > 0 #pause
- empty state localisation in the bulk limit #pause
- can break crystal point group symmetry

== Resonance with other efforts

- Wannier transition state method of Anisimov and Kozhevnikov@Anisimov2005
- Optimally-tuned range-separated hybrid functionals of Kronik, Pasquarello, and others@Kronik2012@Wing2021
- Ensemble DFT of Kraisler and Kronik@Kraisler2013
- Koopmans-Wannier method of Wang and co-workers@Ma2016
- Dielectric-dependent hybrid functionals of Galli and co-workers@Skone2016a
- Scaling corrections of Yang and co-workers@Li2018

= Electronic screening via machine learning

== Electronic screening via machine learning

A key ingredient of Koopmans functional calculations are the screening parameters:

$
  alpha_i = (angle.l n_i|epsilon^(-1) f_"Hxc"|n_i angle.r) / (angle.l n_i|f_"Hxc"|n_i angle.r)
$

#pause

- a local measure of the degree by which electronic interactions are screened #pause
- one screening parameter per (non-equivalent) orbital #pause
- must be computed #emph[ab initio] via $Delta$SCF@Nguyen2018@DeGennaro2022a or DFPT@Colonna2018@Colonna2022 #pause
- corresponds to the vast majority of the computational cost of Koopmans functional calculation

== The machine-learning framework

#slide[
  #align(
    center,
    grid(
      columns: 5,
      align: horizon,
      gutter: 1em,
      image("figures/orbital.emp.00191_cropped.png", height: 30%),
      xarrow("power spectrum decomposition"),
      $vec(delim: "[", x_0, x_1, x_2, dots.v)$,
      xarrow("ridge regression"),
      $alpha_i$,
    ),
  )

  $
    c^i_(n l m, k) & = integral dif bold(r) g_(n l) (r) Y_(l m)(theta,phi) n^i (
      bold(r) - bold(R)^i
    )
  $


  $
    p^i_(n_1 n_2 l,k_1 k_2) = pi sqrt(8 / (2l+1)) sum_m c_(n_1 l m,k_1)^(i *) c_(n_2 l m,k_2)^i
  $

  #blcite(<Schubert2024>)
]

== Two test systems

#slide[
  #align(
    center,
    grid(
      columns: 2,
      align: horizon + center,
      gutter: 1em,
      image("figures/water.png", height: 70%),
      image("figures/CsSnI3_disordered.png", height: 70%),

      "water", "CsSnI" + sub("3"),
    ),
  )
  #blcite(<Schubert2024>)
]

== Results: screening parameters

#slide[
  #grid(
    columns: (1fr, 1fr),
    align: horizon + center,
    gutter: 1em,
    image(
      "figures/water_cls_calc_vs_pred_and_hist_bottom_panel_alphas.svg",
      height: 70%,
    ),
    image(
      "figures/CsSnI3_calc_vs_pred_and_hist_bottom_panel_alphas.svg",
      height: 70%,
    ),

    "water", "CsSnI" + sub("3"),
  )
  #blcite(<Schubert2024>)
]

== Results: balancing accuracy and speedup

#slide[
  #grid(
    columns: (1fr, 1fr),
    align: center + horizon,
    gutter: 1em,
    image(
      "figures/convergence_analysis_Eg_only.svg",
      height: 60%,
    ),
    image("figures/speedup.svg", height: 60%),

    "accurate to within " + $cal("O")$ + "(10 meV) " + emph("cf.") + " typical band gap accuracy of " + $cal("O")$ + "(100 meV)",
    "speedup of " + $cal("O")$ + "(10) to " + $cal("O")$ + "(100)",
  )
  #blcite(<Schubert2024>)
]

= Going beyond single-particle excitations
== Preliminary results

The idea: solve the BSE, skipping GW and instead using Koopmans eigenvalues@Lautenschlager1987@Sottile2003

#align(center + horizon,
grid(columns: 2, image("figures/si_ki_vs_gw.png", height: 70%),
image("figures/si_literature_spectra.png", height: 70%))
)

N.B. using DFT response

= Miscellaneous
== The general workflows

#image("figures/supercell_workflow.png", width: 100%)

#image("figures/primitive_workflow.png", width: 65.5%)

== Connections with approximate self-energies@Ferretti2014@Colonna2019

Orbital-density functional theory:

$ (h + alpha_i v^(K I)_i)|psi_i angle.r = lambda_i|psi_i angle.r $ $v_i^(K I)(bold(r))$ is real, local, and state-dependent #pause

cf. Green's function theory:

$ (h + Sigma_i)|psi_i angle.r = z_i|psi_i angle.r $ $Sigma_i (bold(r), bold(r)')$ is complex, non-local, and state-dependent

#slide[
Hartree-Fock self-energy in localized representation

$Sigma_x (bold(r), bold(r)') = - sum_(k sigma)^("occ") psi_(k sigma)(bold(r)) & f_H (bold(r), bold(r'))psi^*_(k sigma)(bold(r)') \
& arrow.r.double.long angle.l phi_(i sigma)|Sigma_x|phi_(j sigma') angle.r approx - angle.l phi_(i sigma)|v_H [n_(i sigma)]|phi_(i sigma)angle.r delta_(i j)delta_(sigma sigma')$

Unscreened KIPZ#sym.at Hartree ($v_"xc" arrow.r 0$; $f_"Hxc" arrow.r f_H$; $epsilon^(-1) arrow.r 1$)

$angle.l phi_(i sigma)|v^"KIPZ"_(j sigma',"xc")|phi_(j sigma') angle.r
approx {(1/2 - f_(i sigma)) angle.l n_(i sigma)|f_H|n_(i sigma) angle.r - E_H [n_(i sigma)]}
approx - angle.l phi_(i sigma)|v_H [n_(i sigma)]|phi_(i sigma)angle.r delta_(i j)delta_(sigma sigma')$

]

#slide[
Screened exchange plus Coulomb hole (COHSEX)

$ Sigma^"SEX"_"xc" (bold(s), bold(s)') = - sum_(k sigma)^"occ" psi_(k sigma)(bold(r)) psi_(k sigma)^*(bold(r)) W(bold(r), bold(r)') $

$ Sigma^"COH"_"xc" (bold(s), bold(s)') = 1/2 delta(bold(s), bold(s)'){W(bold(r), bold(r)') - f_H (bold(r), bold(r)')} $

$ arrow.r.double.long angle.l phi_(i sigma)|Sigma^"COHSEX"_"xc"|phi_(j sigma')angle.r approx {(1/2 - f_(i sigma)) angle.l n_(i sigma)|W|n_(i sigma)angle.r - E_H [n_(i sigma)]}delta_(i j) delta_(sigma sigma')$

KIPZ#sym.at Hartree with RPA screening ($v_"xc" arrow.r 0$; $f_"Hxc" arrow.r f_H$; $epsilon^(-1) arrow.r "RPA"$)

$ angle.l phi_(i sigma)|v^"KIPZ"_(j sigma',"xc")|phi_(j sigma')angle.r approx{(1/2 - f_(i sigma)) angle.l n_(i sigma)|W|n_(i sigma)angle.r - E_H [n_(i sigma)]}delta_(i j) delta_(sigma sigma')$
]

#slide[
  Static GWΓ#sub[xc] --- local (DFT-based) vertex corrections@Hybertsen1987@DelSole1994

  $ Sigma^(G W Gamma_"xc")_"xc"(1, 2) = i G(1, 2) W_(t-e) (1, 2) $
  
  $ W_(t-e) = (1 - f_"Hxc" chi_0)^(-1) f_H $

  $ arrow.r.double.long angle.l phi_(i sigma)|Sigma^(G W Gamma_"xc")_"xc"|phi_(j sigma')angle.r approx{(1/2 - f_(i sigma)) angle.l n_(i sigma)|W_(t-e)|n_(i sigma)angle.r - E_H [n_(i sigma)]}delta_(i j) delta_(sigma sigma')$

  KIPZ#sym.at DFT ($v_"xc" arrow.r$ DFT; $f_"Hxc" arrow.r$ DFT; $epsilon^(-1) arrow.r$ DFT)

  $ angle.l phi_(i sigma)|v^"KIPZ"_(j sigma',"xc")|phi_(j sigma')angle.r approx{angle.l phi_(i sigma)|v^"DFT"_(sigma,"xc")|phi_(i sigma)angle.r + (1/2 - f_(i sigma)) angle.l n_(i sigma)|epsilon^(-1)_(t-e) f_"Hxc"|n_(i sigma)angle.r - E_H [n_(i sigma)]}delta_(i j) delta_(sigma sigma')$
]

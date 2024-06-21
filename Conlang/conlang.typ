#import "@preview/ascii-ipa:2.0.0": *
#set page(flipped: true)

#show heading: set align(center)
#show table.cell.where(y:0): it => ([
  *#it*
] , [ah])

= Language Reference
== Phonetics
#table(align: horizon, columns: (12),
table.header(
  [],[Bilabial],[],[Labiodental],[],[Dental],[],[Alveolar],[],[Postalveolar],[],[Retroflex],[],[Palatal],[],[Velar],[],[Uvular],[Pharyngeal],[],[Glottal],[]),
  [p],[b],[t],[d],[ʈ],[ɖ],[c],[ɟ],[k],[ɡ],[q],[ɢ],[ʔ]
)
#import "template.typ": imslab, title-slide, outline-slide, slide

#show: imslab.with(
  title: "Title",
  author: "Haowen Zheng",
  date: "20xx/xx/xx",
  institution: "National Yang Ming Chiao Tung University",
  lab: "IMSLab",
)

// Speaker notes: Talk length ~15 min; updated with academic outline.
#title-slide()

// Speaker notes: Academic structure for a 15-min talk.
#outline-slide((
  [Research Background],
  [Motivation],
  [Related Works],
  [Scenario],
  [Experiment],
  [Results],
  [Future Work],
))

// Speaker notes (not visible on the slide):
// It was first used in the field of cryptography to hack a device by leaking
// undirected information when the device performs an operation.
// It leverages information leaked while the device running the model, such as
// cache, power traces, and even electromagnetic signals.
#slide[Introduction]

#slide([Background], numbered: false)

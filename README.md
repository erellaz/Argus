# Argus, the open telescope project

Argus is an open source telescope. This repository contains the design of the various part, all parametric, open source, ready to be machined or changed and adapted by the user.
Argus is a newtonian design, for a 10 inches f/4.5 parabolic mirror and a 12.61" ID tube, optimized for the Paracor type 2 two inches coma corrector. I plan to fully document the built at some points, but the individual parts can be helpful to others as they are.

The metal parts of the original prototype were machined in Aluminum 6061-T6, while the vanes are in stainless steel.

The workflow is as follow:
- Open a parametric part design with OpenSCAD.
- Optionally, modify, adapt, and if a platic prototype is needed, export in STL, slice and 3D print. Important: the $fn line should be uncommented.
- Once the 3D printed prototype is verified to be correct, save the OpenSCAD project.
- Do comment the $fn line in Openscad at that point (or your object will be faceted, which is not appropriate for machining). Import the OpenSCAD project in FreeCAD and export from Freecad to any of the machining format (most user will use .step). This intermediate step is necessary as OpenScad cannot export .step at least at the time of writing.
- If needed create a drawing of the holes to be taped. I do this by opening the .step in Fusion 360. This is also an excellent QC of the .step. You may also modify it (like add filets.)
- send to an online machining shop or to your favorite machinist, so the part can be milled.

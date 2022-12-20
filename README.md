<h1 align="center">cmdWaitBar</h1>

<h3><a href="https://github.com/HumanNeuronLab/cmdWaitBar/releases"><img src="https://raw.githubusercontent.com/jonathanmonney/misc_assets/main/cmdWaitBar/cmdWaitBar_version.png" width="200" align="right"/></a><div align="left"><i>Matlab function that displays a progression bar in the command window.</i></div></h3>

---

This Matlab function will generate an updating progress bar (waitbar) in the command window. 

This is a useful tool during data processing over many iterations or time-cosuming computations. 

This simple visual feedback allows to track current progress and may also be a valuable tool for debugging and finding with value/entry may be causing an error.

By using simple text output rather than a graphical interface, the computational sacrifice is minimised, which speeds tasks when compared to other waitbars that have graphical outputs.

The waitbar will adapt to the current width of your command window.

[![View cmdWaitBar on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://ch.mathworks.com/matlabcentral/fileexchange/122357-cmdwaitbar)

---

<br>

There are 2 viewer modes:

- Waitbar (viewer mode 1 - default): Good for global progression tracking, fast simple, customisable.
- Iteration (viewer mode 2): displays current iteration out of total for detailed view on current progress - good for debugging.

> NB: best use is to call the cmdWaitBar function at the start of the for-loop in order to get most accurate information for debugging!
<br>

<table>
<tr>
<td> Viewer mode: </td> <td> Viewer 1 (default - waitbar) </td> <td> Viewer 2 (Current iteration) </td>
</tr>
<tr>
<td> Example code </td>
<td>

```matlab
iStart = 1;
iStop  = 50000;
for i = iStart:iStop
  
  %(customise with e.g: '-')
  cmdWaitBar(iStart,iStop,i)
  
  %[Your code...]
end
```

</td>
<td>

```matlab
iStart = 1;
iStop  = 50000;
for i = iStart:iStop
  
  cmdWaitBar(iStart,iStop,i,2)
  
  %[Your code...]
end
```

</td>
</tr>
<tr>
<td> Command window output </td>
<td>

![Alt Text](https://github.com/jonathanmonney/misc_assets/blob/main/cmdWaitBar/viewer1.gif)

</td>
<td>

![Alt Text](https://github.com/jonathanmonney/misc_assets/blob/main/cmdWaitBar/viewer2.gif)

</td>
</tr>
</table>
<br><br>

### How to use:

**Within a "for" loop in matlab, insert a call to the function with the following three arguments**
- iStart, the integer the for-loop starts at
- iStop, the final iterative value
- i, the current iteration's value

**Optional arguments that can be passed to the function:**
- '(char-of-choice)' for the waitbar. Default is '·', such as [···]. Only the first char in a string will be used when passed to the function as an argument (e.g: '-;' will generate [---]).
- Viewer mode: value 1 or 2. 1 (default) generates the waitbar with a percentage value. 2 generates the current iteration value over iStop (e.g: "Iteration: 72/223").
<br><br>


---

<p align="center"> <b><u>cmdWaitBar</u></b> 2022 
| <a href="https://www.unige.ch/medecine/neucli/en/groupes-de-recherche/1034megevand/">Human Neuron Lab</a> - UNIGE 
| <a href="mailto:jonathan.monney@unige.ch">jonathan.monney@unige.ch</a></p>
<br>
<div align="center"><a href="https://www.unige.ch/medecine/neucli/en/groupes-de-recherche/1034megevand/">
  <img src="https://raw.githubusercontent.com/HumanNeuronLab/ERWiN/main/assets/UNIGE_logo.png" width="200"/>
</a></div>

---

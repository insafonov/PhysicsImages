input TEX
input hatching

filenametemplate "pendulum.mps";

u := 1.2cm;
ahangle := 30;

r1 := .3u;
r2 := .2u;
l := 3.5u;
alpha := 30;
alphaPrime := -20;
betaPrime := -35;

arcLength := .22l;
arcDelta := .05u;

pair o[];
o1 := (r1, 0);
o2 := (-r2, 0);

  path pendulum[];

pendulum1 := ((0, 0)
  -- fullcircle rotated 270 scaled 2r1 shifted (0, l))
  rotated 180;

pendulum2 := ((0, 0)
  -- fullcircle rotated 270 scaled 2r2 shifted (0, l))
  rotated 180;

picture p[];

p1 := image(
  path arc;

dotlabel.lrt(btex $O$ etex, origin);
  draw ((0, -1){right} .. (0, -1) rotated (alpha - alphaPrime)) rotated alphaPrime scaled l dashed withdots scaled .25;
  draw ((0, -1){right} .. (0, -1) rotated alpha) scaled arcLength;
  label.urt(btex $l$ etex, (0, -1) rotated alpha scaled .7l);
  draw (0, -cosd(alpha)) * l -- (sind(alpha), -cosd(alpha)) * l shifted (-r1, 0);
  dotlabel.urt(btex $A$ etex, (0, -cosd(alpha)) * l);
  drawdblarrow ((0, -cosd(alpha)) -- (0, -1)) shifted (.4sind(alpha), 0) scaled l;
  label.rt(btex $h$ etex, .5(0, -1 - cosd(alpha)) shifted (.4sind(alpha), 0) scaled l);
  label(btex $\alpha$ etex, (0, -1) rotated (alpha / 2) scaled .35l);

  arc := (0, -1){left} .. (0, -1) rotated alphaPrime;
  draw arc scaled (arcLength - arcDelta / 2);
  draw arc scaled (arcLength + arcDelta / 2);
  label(btex $\alpha'$ etex, (0, -1) rotated (alphaPrime / 2) scaled .35l);

  draw pendulum1 rotated alpha dashed withdots scaled .25;
  draw pendulum1 rotated alphaPrime dashed withdots scaled .25;
  draw pendulum1;

  label(btex $m_1$ etex, (0, -1) * l rotated alpha);
);

p2 := image(
  draw ((0, -1){left} .. (0, -1) rotated betaPrime) scaled l dashed withdots scaled .25;

  arc := (0, -1){left} .. (0, -1) rotated betaPrime;
  draw arc scaled (arcLength - arcDelta);
  draw arc scaled arcLength;
  draw arc scaled (arcLength + arcDelta);
  label(btex $\beta'$ etex, (0, -1) rotated (betaPrime / 2) scaled .35l);

  label.bot(btex $m_2$ etex, (0, -1) rotated betaPrime scaled l shifted (0, -r2));
  draw pendulum2;
  draw pendulum2 rotated betaPrime dashed withdots scaled .25;
);

beginfig(0)
  path arc;

  hatchfill unitsquare xscaled (2 * (r1 + r2)) yscaled .2u shifted (-(r1 + 3r2) / 2, 0) withcolor (45, 1mm, -.5bp);
  draw ((0, 0) -- (r1 + r2, 0) * 2) shifted (-(r1 + 3r2) / 2, 0);

  draw p1 shifted o1;
  draw p2 shifted o2;

  drawarrow (sind(betaPrime), -1) * l + (-3r2, 0) -- (sind(alpha), -1) * l + (3r1, 0);
  label.bot(btex $x$ etex, (sind(alpha), -1) * l + (3r1, 0));
endfig;

end

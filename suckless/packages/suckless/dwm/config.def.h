#include <X11/XF86keysym.h>


/* See LICENSE file for copyright and license details. */
#define TERMINAL "st"

/* appearance */
static unsigned int borderpx  = 2;        /* border pixel of windows */
static unsigned int snap      = 12;       /* snap pixel */
static unsigned int gappih    = 8;        /* horiz inner gap between windows */
static unsigned int gappiv    = 8;        /* vert inner gap between windows */
static unsigned int gappoh    = 8;       /* horiz outer gap between windows and screen edge */
static unsigned int gappov    = 8;       /* vert outer gap between windows and screen edge */
static int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static int showbar            = 1;        /* 0 means no bar */
static const Bool viewontag   = True;     /* Switch view on tag switch */
static int topbar             = 1;        /* 0 means bottom bar */
static char *fonts[]          = { "Hack Nerd Font:size=10", "JuliaMono:pixelsize=10:antialias=true:autohint=true"  };
static char normbgcolor[]           = "#222222";
static char normbordercolor[]       = "#444444";
static char normfgcolor[]           = "#bbbbbb";
static char selfgcolor[]            = "#eeeeee";
static char selbordercolor[]        = "#770000";
static char selbgcolor[]            = "#005577";
static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};

typedef struct {
    const char *name;
    const void *cmd;
} Sp;
const char *spcmd1[] = {TERMINAL, "-n", "spterm", "-f", "Hack Nerd Font:size=12", "-g", "120x34", NULL };
const char *spcmd2[] = {TERMINAL, "-n", "spcalc", "-f", "Hack Nerd Font:size=12", "-g", "30x10", "-e", "bc", "-lq", NULL };
static Sp scratchpads[] = {
    /* name          cmd  */
    {"spterm",      spcmd1},
    {"spcalc",      spcmd2},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
    /* xprop(1):
     *  WM_CLASS(STRING) = instance, class
     *  WM_NAME(STRING) = title
    */
    /* class                    instance        title             tags mask     isfloating   isterminal  noswallow  monitor */
   /*{ "Brave",                 NULL,           NULL,             0,            0,           0,          0,        -1 },*/
    { "QGIS3",                  NULL,           NULL,             1 << 7,       0,           0,          0,        -1 },
    { "Inkscape",               NULL,           NULL,             1 << 8,       0,           0,          0,        -1 },
    { "Gimp",                   NULL,           NULL,             1 << 8,       0,           0,          0,        -1 },
    //
    { "Alacritty",              NULL,           NULL,             0,            0,           1,          0,        -1 },
    { "Terminator",             NULL,           NULL,             0,            0,           1,          0,        -1 },
    { "kitty",                  NULL,           NULL,             0,            0,           1,          0,        -1 },
    { "St",                     NULL,           NULL,             0,            0,           1,          0,        -1 },
    {  NULL,                    "xev",          "Event Tester",   0,            1,           0,          1,        -1},
    { NULL,                     "broot",        NULL,             0,            0,           1,          0,        -1 },
    // { "Code",                   NULL,           NULL,             0,            0,           0,          0,        -1 },
    { NULL,                     "spterm",       NULL,             SPTAG(0),     1,           1,          0,        -1 },
    { NULL,                     "spcalc",       NULL,             SPTAG(1),     1,           1,          0,        -1 },
    //
    { NULL,                     "pulsemixer",   "pulsemixer",     0,            1,           0,          1,        -1 },
    { "jupyter-qtconsole",      NULL,           NULL,             0,            0,           0,          1,        -1 },
    { "Pavucontrol",            NULL,           NULL,             0,            1,           0,          1,        -1 },
    { "matplotlib",             NULL,           NULL,             0,            1,           0,          1,        -1 },
    { "vlc",                    NULL,           NULL,             0,            1,           0,          1,        -1 },
    { "Dragon-drag-and-drop",   NULL,           NULL,             0,            1,           0,          1,        -1 },
    { NULL,                     NULL,           "Event Tester",   0,            0,           0,          1,        -1 },
};
#include "vanitygaps.c"

/* layout(s) */
static float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static int nmaster     = 1;    /* number of clients in master area */
static int resizehints = 0;    /* 1 means respect size hints in tiled resizing */
#define FORCE_VSPLIT 1  /* row - grid layout: force two clients to always split vertically */
static const Layout layouts[] = {
    /* symbol     arrange function */
    { "[]=",    tile },         /* Default: Master on left, slaves on right */
    { "[@]",    spiral },       /* Fibonacci spiral */
    { "[M]",    monocle },      /* All windows on top of each other */
    { "|M|",    centeredmaster },       /* Master in middle, slaves on sides */
    { ">M>",    centeredfloatingmaster },   /* Same but master floats */
    { "TTT",    bstack },       /* Master on top, slaves on bottom */
    { "[\\]",   dwindle },      /* Decreasing in size right and leftward */
    { "[D]",    deck },         /* Master on left, slaves in monocle like mode on right */
    { "><>",    NULL },         /* no layout function means floating behavior */
    { NULL,     NULL },
};

/* key definitions */

#define MODKEY Mod4Mask

#define TAGKEYS(KEY, TAG) \
    { MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
    { MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask,           KEY,      toggletag,      {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask|ShiftMask, KEY,      toggleview,     {.ui = 1 << TAG} },

#define STACKKEYS(MOD, ACTION) \
    { MOD,  XK_j,   ACTION##stack,  {.i = INC(+1) } }, \
    { MOD,  XK_k,   ACTION##stack,  {.i = INC(-1) } }, \
    { MOD,  XK_v,   ACTION##stack,  {.i = 0 } }, 
    /* { MOD, XK_grave, ACTION##stack, {.i = PREVSEL } }, \ */
    /* { MOD, XK_a,     ACTION##stack, {.i = 1 } }, \ */
    /* { MOD, XK_z,     ACTION##stack, {.i = 2 } }, \ */
    /* { MOD, XK_x,     ACTION##stack, {.i = -1 } }, */

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *termcmd[]  = { TERMINAL, NULL };
static const char *kittycmd[]  = { "kitty", NULL };
static const char *alacrittycmd[]  = { "alacritty", NULL };
static const char *terminatorcmd[]  = { "terminator", NULL };

#include "shiftview.c"


ResourcePref resources[] = {
        /* border  black */
        { "normalborder",     STRING,  &normbordercolor },
        { "selectborder",     STRING,  &selbordercolor },
        /* { "background",     STRING,  &normbordercolor }, */
        /* { "color13",        STRING,  &selbordercolor }, */
        /* normal window */    
        { "background",     STRING,  &normbgcolor },
        { "foreground",     STRING,  &normfgcolor },
        /* selected window */
        { "background",     STRING,  &selbgcolor },
        { "foreground",     STRING,  &selfgcolor },
        /* bellow are not usually defined....  */
        { "borderpx",       INTEGER, &borderpx },
        { "snap",           INTEGER, &snap },
        { "showbar",        INTEGER, &showbar },
        { "topbar",         INTEGER, &topbar },
        { "nmaster",        INTEGER, &nmaster },
        { "resizehints",    INTEGER, &resizehints },
        { "mfact",          FLOAT,   &mfact },
        { "gappih",         INTEGER, &gappih },
        { "gappiv",         INTEGER, &gappiv },
        { "gappoh",         INTEGER, &gappoh },
        { "gappov",         INTEGER, &gappov },
        { "swallowfloating",INTEGER, &swallowfloating },
        { "smartgaps",      INTEGER, &smartgaps },
};


static Key keys[] = {
    /*-----------------------------------------------------------------------*/
    /*         key               action */
    STACKKEYS( MODKEY,           focus )
    STACKKEYS( MODKEY|ShiftMask, push  )
    /*-----------------------------------------------------------------------*/
    /*       key   tag */
    TAGKEYS( XK_1, 0 )
    TAGKEYS( XK_2, 1 )
    TAGKEYS( XK_3, 2 )
    TAGKEYS( XK_4, 3 )
    TAGKEYS( XK_5, 4 )
    TAGKEYS( XK_6, 5 )
    TAGKEYS( XK_7, 6 )
    TAGKEYS( XK_8, 7 )
    TAGKEYS( XK_9, 8 )
    /*-----------------------------------------------------------------------*/
    /* modifier             key            function      argument            */
    { MODKEY,               XK_0,          view,            {.ui = ~0 } },
    { MODKEY|ShiftMask,     XK_0,          tag,             {.ui = ~0 } },
    { MODKEY,               XK_1,          incrgaps,       {.i = +1 } },
    { MODKEY|ShiftMask,     XK_1,          incrgaps,       {.i = -1 } },    
    { MODKEY,               XK_a,          togglegaps,      {0 } },
    { MODKEY|ShiftMask,     XK_a,          defaultgaps,     {0} },
    { MODKEY,               XK_b,          spawn,           SHCMD("$BROWSER") },
    { MODKEY|ShiftMask,     XK_b,          spawn,           SHCMD("google-chrome-stable") },
    { MODKEY|ControlMask,   XK_b,          togglebar,       {0} },
    { MODKEY,               XK_z,          togglescratch,   {.ui = 0} },
    // { MODKEY|ShiftMask,     XK_z,          togglescratch,   {.ui = 1} },
    { MODKEY,               XK_d,          spawn,           SHCMD("dmenu_run -fn 'Hack Nerd Font:size=12'") },
    { MODKEY,               XK_e,          spawn,           SHCMD(TERMINAL " -e neomutt ; pkill -RTMIN+12 dwmblocks; rmdir ~/.abook") },
    { MODKEY,               XK_f,          togglefullscr,   {0} },
    { MODKEY|ShiftMask,     XK_f,          setlayout,       {.v = &layouts[8]} },  /* floating layout */
    { MODKEY,               XK_bracketleft,setmfact,        {.f = -0.05} },
    { MODKEY,               XK_bracketright,setmfact,        {.f = +0.05} },
    /* y-u-i-o change layouts */
    { MODKEY,               XK_t,          setlayout,       {.v = &layouts[0]} }, /* tile */
    { MODKEY,               XK_g,          setlayout,       {.v = &layouts[1]} }, /* spiral */
    { MODKEY,               XK_m,          setlayout,       {.v = &layouts[2]} }, /* monocle */
    { MODKEY,               XK_c,          setlayout,       {.v = &layouts[3]} }, /* centeredmaster */
    { MODKEY|ControlMask,   XK_c,          setlayout,       {.v = &layouts[4]} }, /* centeredfloatingmaster */
    { MODKEY,               XK_y,          setlayout,       {.v = &layouts[5]} }, /* bstack */ 
    { MODKEY|ShiftMask,     XK_y,          setlayout,       {.v = &layouts[6]} }, /* dwindle */
    { MODKEY,               XK_u,          setlayout,       {.v = &layouts[7]} }, /* deck */
    /*-----------------------------------------------------------------------*/
    { MODKEY,               XK_n,          spawn,           SHCMD(TERMINAL " -e ncmpcpp") },
    { MODKEY|ShiftMask,     XK_n,          spawn,           SHCMD("pamixer -t; kill -44 $(pidof dwmblocks)") },
    { MODKEY|ShiftMask,     XK_p,          spawn,           SHCMD("dmenu_run -fn 'Hack Nerd Font:size=12'") },
    { MODKEY,               XK_p,          spawn,           SHCMD("rofi -modi drun -show drun -show-icons -font 'Hack Nerd Font 9'") },
    { MODKEY|ControlMask,   XK_p,          spawn,           SHCMD("passmenu -fn 'Hack Nerd Font:size=12'") },
    { MODKEY,               XK_q,          spawn,           SHCMD("sysact") },
    // refer to master monitor
    // { MODKEY|ShiftMask,     XK_r,          incnmaster,      {.i = -1 } },
    // { MODKEY,               XK_r,          incnmaster,      {.i = +1 } },
    { MODKEY,               XK_s,          togglesticky,    {0} },
    { MODKEY,               XK_w,          killclient,      {0} },
    { MODKEY,               XK_x,          incrgaps,        {.i = -3 } },
    { MODKEY|ShiftMask,     XK_x,          incrgaps,        {.i = +3 } },
    /*-----------------------------------------------------------------------*/
    { MODKEY,               XK_minus,      spawn,           SHCMD("pamixer --allow-boost -d 5; kill -44 $(pidof dwmblocks)") },
    { MODKEY|ShiftMask,     XK_minus,      spawn,           SHCMD("pamixer --allow-boost -d 10; kill -44 $(pidof dwmblocks)") },
    { MODKEY,               XK_equal,      spawn,           SHCMD("pamixer --allow-boost -i 5; kill -44 $(pidof dwmblocks)") },
    { MODKEY|ShiftMask,     XK_equal,      spawn,           SHCMD("pamixer --allow-boost -i 10; kill -44 $(pidof dwmblocks)") },



    { MODKEY,               XK_Tab,        view,            {0} },
    { MODKEY,               XK_backslash,  view,            {0} },
    { MODKEY|ShiftMask,     XK_Return,     spawn,           {.v = alacrittycmd} },
    { MODKEY,               XK_Return,     spawn,           {.v = kittycmd} },
    { MODKEY|ControlMask,   XK_Return,     spawn,           {.v = terminatorcmd} },
    { MODKEY,               XK_semicolon,  shiftview,       { .i = 1 } },
    { MODKEY|ShiftMask,     XK_semicolon,  shifttag,        { .i = 1 } }, 
    { MODKEY,               XK_space,      zoom,            {0} },
    { MODKEY|ShiftMask,     XK_space,      togglefloating,  {0} },
    { MODKEY,               XK_F4,         spawn,           SHCMD(TERMINAL " -e pulsemixer; kill -44 $(pidof dwmblocks)") },
    { MODKEY,               XK_F10,        spawn,           SHCMD("kbbr") },
    { MODKEY,               XK_F11,        spawn,           SHCMD("flameshot qui") },
    { MODKEY,               XK_F12,        spawn,           SHCMD("mpv --untimed --no-cache --no-osc --no-input-default-bindings --profile=low-latency --input-conf=/dev/null --title=webcam $(ls /dev/video[0,2,4,6,8] | tail -n 1)") },
    /*-----------------------------------------------------------------------*/
    { 0, XK_Print,                         spawn,           SHCMD("flameshot gui") },
    { 0, XF86XK_AudioMute,                 spawn,           SHCMD("pamixer -t; kill -44 $(pidof dwmblocks)") },
    { 0, XF86XK_AudioRaiseVolume,          spawn,           SHCMD("pamixer --allow-boost -i 3; kill -44 $(pidof dwmblocks)") },
    { 0, XF86XK_AudioLowerVolume,          spawn,           SHCMD("pamixer --allow-boost -d 3; kill -44 $(pidof dwmblocks)") },
    { 0, XF86XK_AudioPrev,                 spawn,           SHCMD("mpc prev") },
    { 0, XF86XK_AudioNext,                 spawn,           SHCMD("mpc next") },
    { 0, XF86XK_AudioPause,                spawn,           SHCMD("mpc pause") },
    { 0, XF86XK_AudioPlay,                 spawn,           SHCMD("mpc play") },
    { 0, XF86XK_AudioStop,                 spawn,           SHCMD("mpc stop") },
    { 0, XF86XK_AudioRewind,               spawn,           SHCMD("mpc seek -10") },
    { 0, XF86XK_AudioForward,              spawn,           SHCMD("mpc seek +10") },
    { 0, XF86XK_AudioMedia,                spawn,           SHCMD(TERMINAL " -e ncmpcpp") },
    { 0, XF86XK_AudioMicMute,              spawn,           SHCMD("pactl set-source-mute @DEFAULT_SOURCE@ toggle") },
    /*-----------------------------------------------------------------------*/
    { MODKEY|ShiftMask,     XK_apostrophe,      togglesmartgaps,    {0} },
    { MODKEY,               XK_Left,            focusmon,   {.i = -1 } },
    { MODKEY|ShiftMask,     XK_Left,            tagmon,     {.i = -1 } },
    { MODKEY,               XK_Right,           focusmon,   {.i = +1 } },
    { MODKEY|ShiftMask,     XK_Right,           tagmon,     {.i = +1 } },
    { MODKEY,               XK_Page_Up,         shiftview,  { .i = -1 } },
    { MODKEY|ShiftMask,     XK_Page_Up,         shifttag,   { .i = -1 } },
    { MODKEY,               XK_Page_Down,       shiftview,  { .i = +1 } },
    { MODKEY|ShiftMask,     XK_Page_Down,       shifttag,   { .i = +1 } }, 
    // { MODKEY,               XK_F3,              spawn,      SHCMD("displayselect") },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
    /* click                event mask      button          function        argument */
#ifndef __OpenBSD__
    { ClkStatusText,        0,              Button1,        sigdwmblocks,   {.i = 1} },
    { ClkStatusText,        0,              Button2,        sigdwmblocks,   {.i = 2} },
    { ClkStatusText,        0,              Button3,        sigdwmblocks,   {.i = 3} },
    { ClkStatusText,        0,              Button4,        sigdwmblocks,   {.i = 4} },
    { ClkStatusText,        0,              Button5,        sigdwmblocks,   {.i = 5} },
    { ClkStatusText,        ShiftMask,      Button1,        sigdwmblocks,   {.i = 6} },
#endif
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[5]} },
    { ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
    { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
    { ClkClientWin,         MODKEY,         Button2,        defaultgaps,    {0} },
    { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
    { ClkClientWin,         MODKEY,         Button4,        incrgaps,       {.i = +1} },
    { ClkClientWin,         MODKEY,         Button5,        incrgaps,       {.i = -1} },
    { ClkTagBar,            0,              Button1,        view,           {0} },
    { ClkTagBar,            0,              Button3,        toggleview,     {0} },
    { ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
    { ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
    { ClkTagBar,            0,              Button4,        shiftview,      {.i = -1} },
    { ClkTagBar,            0,              Button5,        shiftview,      {.i = 1} },
    { ClkRootWin,           0,              Button2,        togglebar,      {0} },
};

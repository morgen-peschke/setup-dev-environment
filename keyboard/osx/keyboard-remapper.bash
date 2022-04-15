#!/bin/bash -x

# Add any remapping you want here.
#
# Note: it's a bit unusual, but because we know the Keyboard.* helpers
# will only ever print numbers, the quotes around the $() can be omitted
# to make it easier to write these.
function mappings () {
    remap $(Keyboard.Tab) := $(Keyboard.Delete.or.Backspace)
    remap $(Keyboard.CapsLock) := $(Keyboard.Tab)
    remap $(Keyboard.Delete.or.Backspace) := $(Keyboard.CapsLock)
}

## Helpers
#
# These function as constants, and their values come from https://developer.apple.com/library/archive/technotes/tn2450/_index.html
function Keyboard.a.and.A                     () { printf '%d' 0x700000004; }
function Keyboard.5.and.Percent               () { printf '%d' 0x700000022; }
function Keyboard.F7                          () { printf '%d' 0x700000040; }
function Keypad.6.and.Right.Arrow             () { printf '%d' 0x70000005E; }
function Keyboard.b.and.B                     () { printf '%d' 0x700000005; }
function Keyboard.6.and.Caret                 () { printf '%d' 0x700000023; }
function Keyboard.F8                          () { printf '%d' 0x700000041; }
function Keypad.7.and.Home                    () { printf '%d' 0x70000005F; }
function Keyboard.c.and.C                     () { printf '%d' 0x700000006; }
function Keyboard.7.and.Ampersand             () { printf '%d' 0x700000024; }
function Keyboard.F9                          () { printf '%d' 0x700000042; }
function Keypad.8.and.Up.Arrow                () { printf '%d' 0x700000060; }
function Keyboard.d.and.D                     () { printf '%d' 0x700000007; }
function Keyboard.8.and.Asterisk              () { printf '%d' 0x700000025; }
function Keyboard.F10                         () { printf '%d' 0x700000043; }
function Keypad.9.and.Page.Up                 () { printf '%d' 0x700000061; }
function Keyboard.e.and.E                     () { printf '%d' 0x700000008; }
function Keyboard.9.and.OpenParen             () { printf '%d' 0x700000026; }
function Keyboard.F11                         () { printf '%d' 0x700000044; }
function Keypad.0.and.Insert                  () { printf '%d' 0x700000062; }
function Keyboard.f.and.F                     () { printf '%d' 0x700000009; }
function Keyboard.0.and.CloseParen            () { printf '%d' 0x700000027; }
function Keyboard.F12                         () { printf '%d' 0x700000045; }
function Keypad.Period.and.Delete             () { printf '%d' 0x700000063; }
function Keyboard.g.and.G                     () { printf '%d' 0x70000000A; }
function Keyboard.Return.or.Enter             () { printf '%d' 0x700000028; }
function Keyboard.PrintScreen                 () { printf '%d' 0x700000046; }
function Keyboard.Non-US.Slash.and.Pipe       () { printf '%d' 0x700000064; }
function Keyboard.h.and.H                     () { printf '%d' 0x70000000B; }
function Keyboard.Escape                      () { printf '%d' 0x700000029; }
function Keyboard.Scroll.Lock                 () { printf '%d' 0x700000047; }
function Keyboard.Application                 () { printf '%d' 0x700000065; }
function Keyboard.i.and.I                     () { printf '%d' 0x70000000C; }
function Keyboard.Delete.or.Backspace         () { printf '%d' 0x70000002A; }
function Keyboard.Pause                       () { printf '%d' 0x700000048; }
function Keyboard.Power                       () { printf '%d' 0x700000066; }
function Keyboard.j.and.J                     () { printf '%d' 0x70000000D; }
function Keyboard.Tab                         () { printf '%d' 0x70000002B; }
function Keyboard.Insert                      () { printf '%d' 0x700000049; }
function Keypad.Equals                        () { printf '%d' 0x700000067; }
function Keyboard.k.and.K                     () { printf '%d' 0x70000000E; }
function Keyboard.Spacebar                    () { printf '%d' 0x70000002C; }
function Keyboard.Home                        () { printf '%d' 0x70000004A; }
function Keyboard.F13                         () { printf '%d' 0x700000068; }
function Keyboard.l.and.L                     () { printf '%d' 0x70000000F; }
function Keyboard.Dash.and.Underscore         () { printf '%d' 0x70000002D; }
function Keyboard.Page.Up                     () { printf '%d' 0x70000004B; }
function Keyboard.F14                         () { printf '%d' 0x700000069; }
function Keyboard.m.and.M                     () { printf '%d' 0x700000010; }
function Keyboard.Equals.and.Plus             () { printf '%d' 0x70000002E; }
function Keyboard.Delete.Forward              () { printf '%d' 0x70000004C; }
function Keyboard.F15                         () { printf '%d' 0x70000006A; }
function Keyboard.n.and.N                     () { printf '%d' 0x700000011; }
function Keyboard.OpenBracket.and.OpenBrace   () { printf '%d' 0x70000002F; }
function Keyboard.End                         () { printf '%d' 0x70000004D; }
function Keyboard.F16                         () { printf '%d' 0x70000006B; }
function Keyboard.o.and.O                     () { printf '%d' 0x700000012; }
function Keyboard.CloseBracket.and.CloseBrace () { printf '%d' 0x700000030; }
function Keyboard.Page.Down                   () { printf '%d' 0x70000004E; }
function Keyboard.F17                         () { printf '%d' 0x70000006C; }
function Keyboard.p.and.P                     () { printf '%d' 0x700000013; }
function Keyboard.Backslash.and.Pipe          () { printf '%d' 0x700000031; }
function Keyboard.Right.Arrow                 () { printf '%d' 0x70000004F; }
function Keyboard.F18                         () { printf '%d' 0x70000006D; }
function Keyboard.q.and.Q                     () { printf '%d' 0x700000014; }
function Keyboard.Non-US.Hash.and.Tilda       () { printf '%d' 0x700000032; }
function Keyboard.Left.Arrow                  () { printf '%d' 0x700000050; }
function Keyboard.F19                         () { printf '%d' 0x70000006E; }
function Keyboard.r.and.R                     () { printf '%d' 0x700000015; }
function Keyboard.SemiColon.and.Colon         () { printf '%d' 0x700000033; }
function Keyboard.Down.Arrow                  () { printf '%d' 0x700000051; }
function Keyboard.F20                         () { printf '%d' 0x70000006F; }
function Keyboard.s.and.S                     () { printf '%d' 0x700000016; }
function Keyboard.SingleQuote.and.DoubleQuote () { printf '%d' 0x700000034; }
function Keyboard.Up.Arrow                    () { printf '%d' 0x700000052; }
function Keyboard.F21                         () { printf '%d' 0x700000070; }
function Keyboard.t.and.T                     () { printf '%d' 0x700000017; }
function Keyboard.Grave.Accent.and.Tilde      () { printf '%d' 0x700000035; }
function Keypad.Num.Lock.and.Clear            () { printf '%d' 0x700000053; }
function Keyboard.F22                         () { printf '%d' 0x700000071; }
function Keyboard.u.and.U                     () { printf '%d' 0x700000018; }
function Keyboard.Comma.and.LessThan          () { printf '%d' 0x700000036; }
function Keypad.Slash                         () { printf '%d' 0x700000054; }
function Keyboard.F23                         () { printf '%d' 0x700000072; }
function Keyboard.v.and.V                     () { printf '%d' 0x700000019; }
function Keyboard.Period.and.GreaterThan      () { printf '%d' 0x700000037; }
function Keypad.Asterisk                      () { printf '%d' 0x700000055; }
function Keyboard.F24                         () { printf '%d' 0x700000073; }
function Keyboard.w.and.W                     () { printf '%d' 0x70000001A; }
function Keyboard.Slash.and.QuestionMark      () { printf '%d' 0x700000038; }
function Keypad.Minus                         () { printf '%d' 0x700000056; }
function Keyboard.Left.Control                () { printf '%d' 0x7000000E0; }
function Keyboard.x.and.X                     () { printf '%d' 0x70000001B; }
function Keyboard.CapsLock                    () { printf '%d' 0x700000039; }
function Keypad.Plus                          () { printf '%d' 0x700000057; }
function Keyboard.LeftShift                   () { printf '%d' 0x7000000E1; }
function Keyboard.y.and.Y                     () { printf '%d' 0x70000001C; }
function Keyboard.F1                          () { printf '%d' 0x70000003A; }
function Keypad.Enter                         () { printf '%d' 0x700000058; }
function Keyboard.LeftAlt                     () { printf '%d' 0x7000000E2; }
function Keyboard.z.and.Z                     () { printf '%d' 0x70000001D; }
function Keyboard.F2                          () { printf '%d' 0x70000003B; }
function Keypad.1.and.End                     () { printf '%d' 0x700000059; }
function Keyboard.Left.GUI                    () { printf '%d' 0x7000000E3; }
function Keyboard.1.and.ExclamationMark       () { printf '%d' 0x70000001E; }
function Keyboard.F3                          () { printf '%d' 0x70000003C; }
function Keypad.2.and.Down.Arrow              () { printf '%d' 0x70000005A; }
function Keyboard.Right.Control               () { printf '%d' 0x7000000E4; }
function Keyboard.2.and.AtSign                () { printf '%d' 0x70000001F; }
function Keyboard.F4                          () { printf '%d' 0x70000003D; }
function Keypad.3.and.Page.Down               () { printf '%d' 0x70000005B; }
function Keyboard.Right.Shift                 () { printf '%d' 0x7000000E5; }
function Keyboard.3.and.Hash                  () { printf '%d' 0x700000020; }
function Keyboard.F5                          () { printf '%d' 0x70000003E; }
function Keypad.4.and.Left.Arrow              () { printf '%d' 0x70000005C; }
function Keyboard.Right.Alt                   () { printf '%d' 0x7000000E6; }
function Keyboard.4.and.DollarSign            () { printf '%d' 0x700000021; }
function Keyboard.F6                          () { printf '%d' 0x70000003F; }
function Keypad.5                             () { printf '%d' 0x70000005D; }
function Keyboard.Right.GUI                   () { printf '%d' 0x7000000E7; }

# Remap keys so the first argument produces the effect of the second.
#
# For example, to use `TAB` as `Delete`, this would be the command:
#     remap $(Keyboard.Tab) := $(Keyboard.Delete.or.Backspace)
function remap () {
    local source_code dest_code
    case "$2" in
        ':=')
            source_code="$1"
            dest_code="$3"
            ;;
        '=:')
            source_code="$3"
            dest_code="$1"
            ;;
        *)
            ;;
    esac

    if [[ -z "$source_code" ]] || [[ -z "$dest_code" ]]; then
        cat >&2 <<EOF
Malformed arguments for remap
Usage: remap source := dest
       remap dest =: source

The middle argument exists for 2 reasons:
1. It makes it more clear which is the source and which is the destination
2. If you get it backwards (easy to do), it's quicker to switch the operator
   than the other arguments
EOF
        exit 2
    fi

    jq --null-input \
       --compact-output \
       --arg srckey HIDKeyboardModifierMappingSrc \
       --arg destkey HIDKeyboardModifierMappingDst \
       --argjson source "$source_code" \
       --argjson dest "$dest_code" \
       '{ ($srckey): $source, ($destkey): $dest }'
}

## Start of helper functions, feel free to ignore from here down.

function abspath () {
    local dir=$(cd "$(dirname "$1")" &>/dev/null && pwd)
    local name=$(basename "$1")
    echo "$dir/$name"
}

SCRIPT_PATH=$(abspath "${BASH_SOURCE[0]}")

if which hidutil &>/dev/null; then
    HIDUTIL=$(abspath "$(which hidutil)")
else
    echo >&2 "Can't find hidutil"
fi

function generatePropertyValueArg () {
    mappings | jq --slurp --compact-output '{UserKeyMapping: . }'
}

function enableMappings () {
    "$HIDUTIL" property --set "$(generatePropertyValueArg)"
}

## Clear the existing user key mappings
#
# The input for this is a bit unintuitive, and is based on https://apple.stackexchange.com/a/349440
function disableMappings () {
    "$HIDUTIL" property --set '{"UserKeyMapping":[{}]}'
}

## Install a plist to apply the settings on each reboot
#
# Heavily based on https://gist.github.com/liamdawson/8dba17715c452dad996932291193c353
function install () {
    local plist_name='com.teladoc.load-userkeymapping'
    local plist_path="$HOME"/Library/LaunchAgents/"$plist_name".plist

    cat <<EOF > "$plist_path"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
            <string>User Key Mappings</string>
        <key>ProgramArguments</key>
            <array>
                <string>$HIDUTIL</string>
                <string>property</string>
                <string>--set</string>
                <string>$(generatePropertyValueArg)</string>
            </array>
        <key>RunAtLoad</key>
            <true/>
        <key>StandardErrorPath</key>
            <string>$HOME/Library/Logs/$plist_name/stderr</string>
        <key>StandardOutPath</key>
            <string>$HOME/Library/Logs/$plist_name/stdout</string>
    </dict>
</plist>
EOF

    launchctl unload "$plist_path"
    launchctl load "$plist_path"
}

case "$1" in
    --enable)
        enableMappings
        ;;
    --disable)
        disableMappings
        ;;
    --install)
        install
        ;;
    *)
        echo >&2 "Unrecognized arguments: $@"
        cat >&2 <<EOF
Usage: ${BASH_SOURCE[0]} --enable|--disable|--install

Arguments

  --enable      Activate the key remapping until next restart

  --disable     Deactivate all key remappings. Persistent settings will be
                restored on the next restart

  --install     Create or update a plist that applies the remapping on restart,
                making the current configuration persistent.

EOF
        exit 67
esac

#!/bin/bash
# COMPREHENSIVE AIX SIMULATION SCRIPT
# Full command set with proper flag handling from AIX cheatsheet

# =============================================================================
# SYSTEM INFORMATION COMMANDS
# =============================================================================

function oslevel() {
    case "$1" in
        "-r"|"-s")
            echo "7300-02-01-2346"
            ;;
        "-q")
            echo "Known Fixes Summary"
            echo "="
            echo "There is 1 newer level of the Base Operating System."
            echo "There are 2 new Service Packs since the current level."
            ;;
        *)
            echo "7300-02-01-2346"
            ;;
    esac
}

function uname() {
    case "$1" in
        "-a")
            echo "AIX aix-server 3 7 00F84C0C4C00"
            ;;
        "-n")
            echo "aix-server"
            ;;
        "-r")
            echo "3"
            ;;
        "-v")
            echo "7"
            ;;
        "-m")
            echo "00F84C0C4C00"
            ;;
        "-p")
            echo "powerpc"
            ;;
        "-M")
            echo "IBM,9009-42A"
            ;;
        *)
            echo "AIX"
            ;;
    esac
}

function prtconf() {
    case "$1" in
        "-m")
            echo "Memory Size: 8192 MB"
            echo "Good Memory Size: 8192 MB"
            ;;
        "-c")
            echo "Number Of Processors: 4"
            echo "Processor Type: PowerPC_POWER9"
            echo "Processor Clock Speed: 3800 MHz"
            ;;
        "-v")
            echo "System Model: IBM,9009-42A"
            echo "Machine Serial Number: 06ABCD1"
            echo "System Firmware level: FW920.30"
            ;;
        "-k")
            echo "Kernel Type: 64-bit"
            echo "Kernel Bitmode: 64"
            ;;
        *)
            echo "System Model: IBM,9009-42A"
            echo "Machine Serial Number: 06ABCD1"
            echo "Processor Type: PowerPC_POWER9"
            echo "Processor Implementation Mode: POWER 9"
            echo "Processor Version: PV_9_compat"
            echo "Number Of Processors: 4"
            echo "Processor Clock Speed: 3800 MHz"
            echo "CPU Type: 64-bit"
            echo "Kernel Type: 64-bit"
            echo "LPAR Info: 1 aixserver01"
            echo "Memory Size: 8192 MB"
            echo "Good Memory Size: 8192 MB"
            echo "Platform Firmware level: FW920.30 (SV920_138)"
            echo "Firmware Version: IBM,FW920.30 (SV920_138)"
            echo "Console Login: enable"
            echo "Auto Restart: true"
            echo "Full Core: false"
            echo ""
            echo "Network Information"
            echo "        Host Name: aixserver01"
            echo "        IP Address: 192.168.109.142"
            echo "        Sub Netmask: 255.255.255.0"
            echo "        Gateway: 192.168.109.2"
            echo "        Name Server: 192.168.109.2"
            echo "        Domain Name: example.com"
            ;;
    esac
}

function bootinfo() {
    case "$1" in
        "-s")
            echo "hdisk0"
            ;;
        "-b")
            echo "disk"
            ;;
        "-k")
            echo "64"
            ;;
        "-r")
            echo "8192"
            ;;
        "-T")
            echo "chrp"
            ;;
        "-t")
            echo "disk"
            ;;
        "-m")
            echo "IBM,9009-42A"
            ;;
        "-p")
            echo "PowerPC_POWER9"
            ;;
        *)
            echo "Usage: bootinfo [-s] [-b] [-k] [-r] [-T] [-t] [-m] [-p]"
            echo "  -s : show boot device"
            echo "  -b : show boot type"
            echo "  -k : show kernel mode (32 or 64 bit)"
            echo "  -r : show real memory size in MB"
            echo "  -T : show platform type"
            echo "  -t : show boot device type"
            echo "  -m : show machine type"
            echo "  -p : show processor type"
            ;;
    esac
}

function getconf() {
    case "$1" in
        "KERNEL_BITMODE")
            echo "64"
            ;;
        "HARDWARE_BITMODE")
            echo "64"
            ;;
        "_NPROCESSORS_ONLN")
            echo "4"
            ;;
        "_NPROCESSORS_CONF")
            echo "4"
            ;;
        "PAGE_SIZE"|"PAGESIZE")
            echo "4096"
            ;;
        "ARG_MAX")
            echo "1048576"
            ;;
        "CHILD_MAX")
            echo "2048"
            ;;
        "CLK_TCK")
            echo "100"
            ;;
        "OPEN_MAX")
            echo "2000"
            ;;
        "PATH_MAX")
            echo "1023"
            ;;
        "PIPE_BUF")
            echo "32768"
            ;;
        *)
            echo "Usage: getconf variable_name"
            echo "Common variables: KERNEL_BITMODE, HARDWARE_BITMODE, _NPROCESSORS_ONLN, PAGE_SIZE"
            ;;
    esac
}

# =============================================================================
# STORAGE MANAGEMENT COMMANDS
# =============================================================================

function lspv() {
    if [ "$1" ]; then
        if [ "$1" = "-L" ]; then
            shift
            if [ "$1" ]; then
                case "$1" in
                    "hdisk0")
                        echo "00c123456789abcd"
                        ;;
                    "hdisk1")
                        echo "00c123456789abce"
                        ;;
                    *)
                        echo "0516-320 lspv: Physical volume $1 is not known."
                        ;;
                esac
            else
                echo "hdisk0          00c123456789abcd"
                echo "hdisk1          00c123456789abce" 
                echo "hdisk2          00c123456789abcf"
            fi
        elif [ "$1" = "-l" ]; then
            shift
            case "$1" in
                "hdisk0")
                    echo "LV NAME               LPs     PPs     DISTRIBUTION          MOUNT POINT"
                    echo "hd5                   1       1       00..00..00..01..00    N/A"
                    echo "hd6                   8       8       00..00..00..08..00    N/A"
                    echo "hd8                   1       1       00..00..00..01..00    N/A"
                    echo "hd4                   1       1       00..00..00..01..00    /"
                    echo "hd2                   8       8       00..08..00..00..00    /usr"
                    echo "hd9var                1       1       00..01..00..00..00    /var"
                    echo "hd3                   2       2       00..02..00..00..00    /tmp"
                    echo "hd1                   1       1       00..01..00..00..00    /home"
                    echo "hd10opt               1       1       00..01..00..00..00    /opt"
                    echo "lg_dumplv             4       4       00..04..00..00..00    N/A"
                    ;;
                *)
                    echo "0516-320 lspv: Physical volume $1 is not known."
                    ;;
            esac
        elif [ "$1" = "-p" ]; then
            shift
            case "$1" in
                "hdisk0")
                    echo "PP RANGE  STATE   REGION  LV NAME      TYPE       MOUNT POINT"
                    echo "1-1       used    outer   hd5          boot       N/A"
                    echo "2-9       used    outer   hd6          paging     N/A"
                    echo "10-10     used    outer   hd8          jfs2log    N/A"
                    echo "11-11     used    outer   hd4          jfs2       /"
                    echo "12-19     used    outer   hd2          jfs2       /usr"
                    echo "20-20     used    outer   hd9var       jfs2       /var"
                    echo "21-22     used    outer   hd3          jfs2       /tmp"
                    echo "23-23     used    outer   hd1          jfs2       /home"
                    echo "24-24     used    outer   hd10opt      jfs2       /opt"
                    echo "25-28     used    outer   lg_dumplv    sysdump    N/A"
                    echo "29-279    free    FREE    "
                    ;;
                *)
                    echo "0516-320 lspv: Physical volume $1 is not known."
                    ;;
            esac
        else
            case "$1" in
                "hdisk0")
                    echo "PHYSICAL VOLUME:    hdisk0                   VOLUME GROUP:     rootvg"
                    echo "PV IDENTIFIER:      00c123456789abcd         VG IDENTIFIER     00c123456789abcd00"
                    echo "PV STATE:           active"
                    echo "STALE PARTITIONS:   0                        ALLOCATABLE:      yes"
                    echo "PP SIZE:            256 megabyte(s)          LOGICAL VOLUMES:  10"
                    echo "TOTAL PPs:          279 (71424 megabytes)    VG DESCRIPTORS:   2"
                    echo "FREE PPs:           251 (64256 megabytes)    HOT SPARE:        no"
                    echo "USED PPs:           28 (7168 megabytes)      MAX REQUEST:      251 (64256 megabytes)"
                    echo "FREE DISTRIBUTION: 00..00..00..46..205"
                    echo "USED DISTRIBUTION: 26..02..00..00..00"
                    ;;
                "hdisk1")
                    echo "PHYSICAL VOLUME:    hdisk1                   VOLUME GROUP:     datavg"
                    echo "PV IDENTIFIER:      00c123456789abce         VG IDENTIFIER     00c123456789abcd01"
                    echo "PV STATE:           active"
                    echo "STALE PARTITIONS:   0                        ALLOCATABLE:      yes"
                    echo "PP SIZE:            128 megabyte(s)          LOGICAL VOLUMES:  3"
                    echo "TOTAL PPs:          1599 (204672 megabytes)  VG DESCRIPTORS:   1"
                    echo "FREE PPs:           1234 (157952 megabytes)  HOT SPARE:        no"
                    echo "USED PPs:           365 (46720 megabytes)    MAX REQUEST:      1234 (157952 megabytes)"
                    echo "FREE DISTRIBUTION: 159..159..159..159..598"
                    echo "USED DISTRIBUTION: 0..206..159..0..0"
                    ;;
                *)
                    echo "0516-320 lspv: Physical volume $1 is not known to this volume group."
                    ;;
            esac
        fi
    else
        echo "hdisk0          00c123456789abcd                    rootvg          active"
        echo "hdisk1          00c123456789abce                    datavg          active"
        echo "hdisk2          00c123456789abcf                    None"
    fi
}

function lsvg() {
    if [ "$1" ]; then
        case "$1" in
            "-o")
                echo "rootvg"
                echo "datavg"
                ;;
            "-l")
                shift
                case "$1" in
                    "rootvg")
                        echo "rootvg:"
                        echo "LV NAME             TYPE       LPs     PPs     PVs  LV STATE      MOUNT POINT"
                        echo "hd5                 boot       1       1       1    closed/syncd  N/A"
                        echo "hd6                 paging     8       8       1    open/syncd    N/A"
                        echo "hd8                 jfs2log    1       1       1    open/syncd    N/A"
                        echo "hd4                 jfs2       1       1       1    open/syncd    /"
                        echo "hd2                 jfs2       8       8       1    open/syncd    /usr"
                        echo "hd9var              jfs2       1       1       1    open/syncd    /var"
                        echo "hd3                 jfs2       2       2       1    open/syncd    /tmp"
                        echo "hd1                 jfs2       1       1       1    open/syncd    /home"
                        echo "hd10opt             jfs2       1       1       1    open/syncd    /opt"
                        echo "lg_dumplv           sysdump    4       4       1    open/syncd    N/A"
                        ;;
                    "datavg")
                        echo "datavg:"
                        echo "LV NAME             TYPE       LPs     PPs     PVs  LV STATE      MOUNT POINT"
                        echo "datalv1             jfs2       100     100     1    open/syncd    /data1"
                        echo "datalv2             jfs2       200     200     1    open/syncd    /data2"
                        echo "datalv3             jfs2       65      65      1    open/syncd    /data3"
                        ;;
                    *)
                        echo "0516-304 lsvg: Volume group $1 not found."
                        ;;
                esac
                ;;
            "-p")
                shift
                case "$1" in
                    "rootvg")
                        echo "rootvg:"
                        echo "PV_NAME           PV STATE          TOTAL PPs   FREE PPs    FREE DISTRIBUTION"
                        echo "hdisk0            active            279         251         00..00..00..46..205"
                        ;;
                    "datavg")
                        echo "datavg:"
                        echo "PV_NAME           PV STATE          TOTAL PPs   FREE PPs    FREE DISTRIBUTION"
                        echo "hdisk1            active            1599        1234        159..159..159..159..598"
                        ;;
                    *)
                        echo "0516-304 lsvg: Volume group $1 not found."
                        ;;
                esac
                ;;
            *)
                case "$1" in
                    "rootvg")
                        echo "VOLUME GROUP:       rootvg                   VG IDENTIFIER:  00c123456789abcd00"
                        echo "VG STATE:           active                   PP SIZE:        256 megabyte(s)"
                        echo "VG PERMISSION:      read/write               TOTAL PPs:      279 (71424 megabytes)"
                        echo "MAX LVs:            256                      FREE PPs:       251 (64256 megabytes)"
                        echo "LVs:                10                       USED PPs:       28 (7168 megabytes)"
                        echo "OPEN LVs:           9                        QUORUM:         1 (Disabled)"
                        echo "TOTAL PVs:          1                        VG DESCRIPTORS: 2"
                        echo "STALE PVs:          0                        STALE PPs:      0"
                        echo "ACTIVE PVs:         1                        AUTO ON:        yes"
                        echo "MAX PPs per VG:     32512                    MAX PVs:        1024"
                        echo "LTG size (Dynamic): 256 kilobyte(s)         AUTO SYNC:      no"
                        echo "HOT SPARE:          no                       BB POLICY:      relocatable"
                        echo "PV RESTRICTION:     none                     INFINITE RETRY: no"
                        ;;
                    "datavg")
                        echo "VOLUME GROUP:       datavg                   VG IDENTIFIER:  00c123456789abcd01"
                        echo "VG STATE:           active                   PP SIZE:        128 megabyte(s)"
                        echo "VG PERMISSION:      read/write               TOTAL PPs:      1599 (204672 megabytes)"
                        echo "MAX LVs:            256                      FREE PPs:       1234 (157952 megabytes)"
                        echo "LVs:                3                        USED PPs:       365 (46720 megabytes)"
                        echo "OPEN LVs:           3                        QUORUM:         1 (Disabled)"
                        echo "TOTAL PVs:          1                        VG DESCRIPTORS: 1"
                        echo "STALE PVs:          0                        STALE PPs:      0"
                        echo "ACTIVE PVs:         1                        AUTO ON:        yes"
                        echo "MAX PPs per VG:     32512                    MAX PVs:        1024"
                        echo "LTG size (Dynamic): 128 kilobyte(s)         AUTO SYNC:      no"
                        echo "HOT SPARE:          no                       BB POLICY:      relocatable"
                        echo "PV RESTRICTION:     none                     INFINITE RETRY: no"
                        ;;
                    *)
                        echo "0516-304 lsvg: Volume group $1 not found."
                        ;;
                esac
                ;;
        esac
    else
        echo "rootvg"
        echo "datavg"
    fi
}

function lslv() {
    if [ "$1" ]; then
        case "$1" in
            "-l")
                shift
                case "$1" in
                    "hd4")
                        echo "PV                COPIES        IN BAND       DISTRIBUTION"
                        echo "hdisk0            001:000:000   100%          000:000:000:001:000"
                        ;;
                    "hd2")
                        echo "PV                COPIES        IN BAND       DISTRIBUTION"
                        echo "hdisk0            008:000:000   100%          000:008:000:000:000"
                        ;;
                    *)
                        echo "0516-362 lslv: Logical volume $1 not found."
                        ;;
                esac
                ;;
            "-m")
                shift
                case "$1" in
                    "hd4")
                        echo "hd4:/hdisk0"
                        echo "0001    0011:0000:0000"
                        ;;
                    "hd2")
                        echo "hd2:/hdisk0"
                        echo "0001    0012:0000:0000"
                        echo "0002    0013:0000:0000"
                        echo "0003    0014:0000:0000"
                        echo "0004    0015:0000:0000"
                        echo "0005    0016:0000:0000"
                        echo "0006    0017:0000:0000"
                        echo "0007    0018:0000:0000"
                        echo "0008    0019:0000:0000"
                        ;;
                    *)
                        echo "0516-362 lslv: Logical volume $1 not found."
                        ;;
                esac
                ;;
            *)
                case "$1" in
                    "hd4")
                        echo "LOGICAL VOLUME:     hd4                      VOLUME GROUP:   rootvg"
                        echo "LV IDENTIFIER:      00c123456789abcd.1       PERMISSION:     read/write"
                        echo "VG STATE:           active/complete          LV STATE:       opened/syncd"
                        echo "TYPE:               jfs2                     WRITE VERIFY:   off"
                        echo "MAX LPs:            512                      PP SIZE:        256 megabyte(s)"
                        echo "COPIES:             1                        SCHED POLICY:   parallel"
                        echo "LPs:                1                        PPs:            1"
                        echo "STALE PPs:          0                        BB POLICY:      relocatable"
                        echo "INTER-POLICY:       minimum                  RELOCATABLE:    yes"
                        echo "INTRA-POLICY:       middle                   UPPER BOUND:    32"
                        echo "MOUNT POINT:        /                        LABEL:          /"
                        echo "MIRROR WRITE CONSISTENCY: on/ACTIVE"
                        echo "EACH LP COPY ON A SEPARATE PV ?: yes"
                        echo "Serialize IO ?:     NO"
                        ;;
                    "hd2")
                        echo "LOGICAL VOLUME:     hd2                      VOLUME GROUP:   rootvg"
                        echo "LV IDENTIFIER:      00c123456789abcd.2       PERMISSION:     read/write"
                        echo "VG STATE:           active/complete          LV STATE:       opened/syncd"
                        echo "TYPE:               jfs2                     WRITE VERIFY:   off"
                        echo "MAX LPs:            512                      PP SIZE:        256 megabyte(s)"
                        echo "COPIES:             1                        SCHED POLICY:   parallel"
                        echo "LPs:                8                        PPs:            8"
                        echo "STALE PPs:          0                        BB POLICY:      relocatable"
                        echo "INTER-POLICY:       minimum                  RELOCATABLE:    yes"
                        echo "INTRA-POLICY:       middle                   UPPER BOUND:    32"
                        echo "MOUNT POINT:        /usr                     LABEL:          /usr"
                        echo "MIRROR WRITE CONSISTENCY: on/ACTIVE"
                        echo "EACH LP COPY ON A SEPARATE PV ?: yes"
                        echo "Serialize IO ?:     NO"
                        ;;
                    "hd6")
                        echo "LOGICAL VOLUME:     hd6                      VOLUME GROUP:   rootvg"
                        echo "LV IDENTIFIER:      00c123456789abcd.3       PERMISSION:     read/write"
                        echo "VG STATE:           active/complete          LV STATE:       opened/syncd"
                        echo "TYPE:               paging                   WRITE VERIFY:   off"
                        echo "MAX LPs:            512                      PP SIZE:        256 megabyte(s)"
                        echo "COPIES:             1                        SCHED POLICY:   parallel"
                        echo "LPs:                8                        PPs:            8"
                        echo "STALE PPs:          0                        BB POLICY:      relocatable"
                        echo "INTER-POLICY:       minimum                  RELOCATABLE:    yes"
                        echo "INTRA-POLICY:       middle                   UPPER BOUND:    32"
                        echo "MOUNT POINT:        N/A                      LABEL:          None"
                        echo "MIRROR WRITE CONSISTENCY: on/ACTIVE"
                        echo "EACH LP COPY ON A SEPARATE PV ?: yes"
                        echo "Serialize IO ?:     NO"
                        ;;
                    *)
                        echo "0516-362 lslv: Logical volume $1 not found."
                        ;;
                esac
                ;;
        esac
    else
        echo "hd5      boot       1    1    1  closed/syncd   N/A"
        echo "hd6      paging     8    8    1  open/syncd     N/A"
        echo "hd8      jfs2log    1    1    1  open/syncd     N/A"
        echo "hd4      jfs2       1    1    1  open/syncd     /"
        echo "hd2      jfs2       8    8    1  open/syncd     /usr"
        echo "hd9var   jfs2       1    1    1  open/syncd     /var"
        echo "hd3      jfs2       2    2    1  open/syncd     /tmp"
        echo "hd1      jfs2       1    1    1  open/syncd     /home"
        echo "hd10opt  jfs2       1    1    1  open/syncd     /opt"
        echo "lg_dumplv sysdump   4    4    1  open/syncd     N/A"
    fi
}

function lsfs() {
    case "$1" in
        "-q")
            shift
            case "$1" in
                "/")
                    echo "Name            Nodename   Mount Pt               VFS   Size    Options  Auto Accounting"
                    echo "/dev/hd4        --         /                      jfs2  262144  --       yes  no"
                    ;;
                "/usr")
                    echo "Name            Nodename   Mount Pt               VFS   Size    Options  Auto Accounting"
                    echo "/dev/hd2        --         /usr                   jfs2  2097152 --       yes  no"
                    ;;
                "/var")
                    echo "Name            Nodename   Mount Pt               VFS   Size    Options  Auto Accounting"
                    echo "/dev/hd9var     --         /var                   jfs2  262144  --       yes  no"
                    ;;
                "/tmp")
                    echo "Name            Nodename   Mount Pt               VFS   Size    Options  Auto Accounting"
                    echo "/dev/hd3        --         /tmp                   jfs2  524288  --       yes  no"
                    ;;
                "/home")
                    echo "Name            Nodename   Mount Pt               VFS   Size    Options  Auto Accounting"
                    echo "/dev/hd1        --         /home                  jfs2  262144  --       yes  no"
                    ;;
                "/opt")
                    echo "Name            Nodename   Mount Pt               VFS   Size    Options  Auto Accounting"
                    echo "/dev/hd10opt    --         /opt                   jfs2  262144  --       yes  no"
                    ;;
                *)
                    echo "lsfs: 0506-821 Cannot find file system $1."
                    ;;
            esac
            ;;
        "-a")
            echo "Name            Nodename   Mount Pt               VFS   Size    Options  Auto Accounting"
            echo "/dev/hd4        --         /                      jfs2  262144  rw       yes  no"
            echo "/dev/hd2        --         /usr                   jfs2  2097152 rw       yes  no"
            echo "/dev/hd9var     --         /var                   jfs2  262144  rw       yes  no"
            echo "/dev/hd3        --         /tmp                   jfs2  524288  rw       yes  no"
            echo "/dev/hd1        --         /home                  jfs2  262144  rw       yes  no"
            echo "/dev/hd10opt    --         /opt                   jfs2  262144  rw       yes  no"
            echo "/proc           --         /proc                  procfs --      rw       yes  no"
            echo "/dev/hd5        --         /boot                  jfs2  524288  rw       yes  no"
            echo "cdrfs           --         /mnt/cd                cdrfs --       ro       no   no"
            echo "automount       --         /net                   autofs --      ignore   no   no"
            ;;
        "-v")
            shift
            case "$1" in
                "jfs2")
                    echo "Name            Nodename   Mount Pt               VFS   Size    Options  Auto Accounting"
                    echo "/dev/hd4        --         /                      jfs2  262144  rw       yes  no"
                    echo "/dev/hd2        --         /usr                   jfs2  2097152 rw       yes  no"
                    echo "/dev/hd9var     --         /var                   jfs2  262144  rw       yes  no"
                    echo "/dev/hd3        --         /tmp                   jfs2  524288  rw       yes  no"
                    echo "/dev/hd1        --         /home                  jfs2  262144  rw       yes  no"
                    echo "/dev/hd10opt    --         /opt                   jfs2  262144  rw       yes  no"
                    echo "/dev/hd5        --         /boot                  jfs2  524288  rw       yes  no"
                    ;;
                "procfs")
                    echo "Name            Nodename   Mount Pt               VFS   Size    Options  Auto Accounting"
                    echo "/proc           --         /proc                  procfs --      rw       yes  no"
                    ;;
                *)
                    echo "lsfs: 0506-821 Unknown filesystem type $1."
                    ;;
            esac
            ;;
        *)
            echo "Name            Nodename   Mount Pt               VFS   Size    Options  Auto Accounting"
            echo "/dev/hd4        --         /                      jfs2  262144  --       yes  no"
            echo "/dev/hd2        --         /usr                   jfs2  2097152 --       yes  no"
            echo "/dev/hd9var     --         /var                   jfs2  262144  --       yes  no"
            echo "/dev/hd3        --         /tmp                   jfs2  524288  --       yes  no"
            echo "/dev/hd1        --         /home                  jfs2  262144  --       yes  no"
            echo "/dev/hd10opt    --         /opt                   jfs2  262144  --       yes  no"
            echo "/proc           --         /proc                  procfs --      --       yes  no"
            echo "/dev/hd5        --         /boot                  jfs2  524288  --       yes  no"
            ;;
    esac
}

function df() {
    case "$1" in
        "-k")
            echo "Filesystem    1024-blocks      Free %Used    Iused %Iused Mounted on"
            echo "/dev/hd4           262144    198234   25%      567    11% /"
            echo "/dev/hd2          2097152   1456789   31%     2341     6% /usr"
            echo "/dev/hd9var        262144    234567   11%      123     3% /var"
            echo "/dev/hd3           524288    456789   13%      234     2% /tmp"
            echo "/dev/hd1           262144    245678    7%       89     1% /home"
            echo "/dev/hd10opt       262144    234567   11%      156     3% /opt"
            echo "/proc                   -         -    -        -     -  /proc"
            ;;
        "-m")
            echo "Filesystem    MB blocks      Free %Used    Iused %Iused Mounted on"
            echo "/dev/hd4            256       194   25%      567    11% /"
            echo "/dev/hd2           2048      1423   31%     2341     6% /usr"
            echo "/dev/hd3            512       446   13%      234     2% /tmp"
            echo "/dev/hd9var         256       229   11%      123     3% /var"
            echo "/dev/hd1            256       240    7%       89     1% /home"
            echo "/dev/hd10opt        256       229   11%      156     3% /opt"
            echo "/proc                 -         -    -        -     -  /proc"
            ;;
        "-g")
            echo "Filesystem    GB blocks      Free %Used    Iused %Iused Mounted on"
            echo "/dev/hd4           0.25      0.19   25%      567    11% /"
            echo "/dev/hd2           2.00      1.39   31%     2341     6% /usr"
            echo "/dev/hd3           0.50      0.44   13%      234     2% /tmp"
            echo "/dev/hd9var        0.25      0.22   11%      123     3% /var"
            echo "/dev/hd1           0.25      0.23    7%       89     1% /home"
            echo "/dev/hd10opt       0.25      0.22   11%      156     3% /opt"
            echo "/proc                 -         -    -        -     -  /proc"
            ;;
        "-i")
            echo "Filesystem      Inodes   IUsed   IFree %IUsed Mounted on"
            echo "/dev/hd4          5120     567    4553   11% /"
            echo "/dev/hd2         40960    2341   38619    6% /usr"
            echo "/dev/hd3         10240     234   10006    2% /tmp"
            echo "/dev/hd9var       5120     123    4997    3% /var"
            echo "/dev/hd1          5120      89    5031    1% /home"
            echo "/dev/hd10opt      5120     156    4964    3% /opt"
            echo "/proc                -       -       -    -  /proc"
            ;;
        "-t")
            echo "Filesystem    512-blocks      Free %Used    Iused %Iused Mounted on"
            echo "/dev/hd4           524288    396468   25%      567    11% /"
            echo "/dev/hd2          4194304   2913578   31%     2341     6% /usr"
            echo "/dev/hd9var        524288    469134   11%      123     3% /var"
            echo "/dev/hd3          1048576    913578   13%      234     2% /tmp"
            echo "/dev/hd1           524288    491356    7%       89     1% /home"
            echo "/dev/hd10opt       524288    469134   11%      156     3% /opt"
            echo "/proc                   -         -    -        -     -  /proc"
            ;;
        *)
            echo "Filesystem    512-blocks      Free %Used    Iused %Iused Mounted on"
            echo "/dev/hd4           524288    396468   25%      567    11% /"
            echo "/dev/hd2          4194304   2913578   31%     2341     6% /usr"
            echo "/dev/hd9var        524288    469134   11%      123     3% /var"
            echo "/dev/hd3          1048576    913578   13%      234     2% /tmp"
            echo "/dev/hd1           524288    491356    7%       89     1% /home"
            echo "/dev/hd10opt       524288    469134   11%      156     3% /opt"
            echo "/proc                   -         -    -        -     -  /proc"
            ;;
    esac
}


# =============================================================================
# DEVICE AND HARDWARE COMMANDS
# =============================================================================

function lscfg() {
    case "$1" in
        "-v")
            echo "+ sys0                            System Object"
            echo "+ sysplanar0                      System Planar"
            echo "* proc0                           Processor"
            echo "* proc2                           Processor"
            echo "* proc4                           Processor"
            echo "* proc6                           Processor"
            echo "* mem0                            Memory"
            echo "+ ent0           U78CB.001.WZS0CQP-P1-C6-T1    PCI-X Gigabit Ethernet-SX Adapter"
            echo "  Network Address.............00059A3C7A00"
            echo "  Displayable Message.........PCI-X Gigabit Ethernet-SX Adapter"
            echo "  Device Specific.(YL)........U78CB.001.WZS0CQP-P1-C6-T1"
            echo "+ scsi0          U78CB.001.WZS0CQP-P1-C4-T1    PCI-X Ultra320 SCSI Adapter"
            echo "  Displayable Message.........PCI-X Ultra320 SCSI Adapter"
            echo "  Device Specific.(YL)........U78CB.001.WZS0CQP-P1-C4-T1"
            echo "+ hdisk0         U78CB.001.WZS0CQP-P1-C4-T1-L8-L0    16 Bit LVD SCSI Disk Drive"
            echo "  Manufacturer................IBM     "
            echo "  Machine Type and Model......ST373207LC"
            echo "  ROS Level and ID............43373635"
            echo "  Device Specific.(Z0)........0000045C"
            echo "  Device Specific.(Z1)........0200"
            echo "  Device Specific.(Z2)........ST373207LC      "
            echo "  Device Specific.(Z3)........43373635"
            echo "  Device Specific.(Z4)........0008"
            echo "  Device Specific.(Z5)........C0A9"
            echo "  Device Specific.(YL)........U78CB.001.WZS0CQP-P1-C4-T1-L8-L0"
            echo "+ hdisk1         U78CB.001.WZS0CQP-P1-C4-T1-L9-L0    16 Bit LVD SCSI Disk Drive"
            echo "  Manufacturer................IBM     "
            echo "  Machine Type and Model......ST373207LC"
            echo "  ROS Level and ID............43373635"
            ;;
        "-l")
            shift
            case "$1" in
                "hdisk0")
                    echo "  hdisk0           U78CB.001.WZS0CQP-P1-C4-T1-L8-L0  16 Bit LVD SCSI Disk Drive"
                    ;;
                "ent0")
                    echo "  ent0             U78CB.001.WZS0CQP-P1-C6-T1        PCI-X Gigabit Ethernet-SX Adapter"
                    ;;
                *)
                    echo "Method error (/usr/lib/methods/showcfg):"
                    echo "0514-062 Cannot perform the requested function because the"
                    echo "         specified device is busy."
                    ;;
            esac
            ;;
        *)
            echo "sys0             System Object"
            echo "sysplanar0       System Planar"
            echo "proc0            Processor"
            echo "proc2            Processor" 
            echo "proc4            Processor"
            echo "proc6            Processor"
            echo "mem0             Memory"
            echo "L2cache0         L2 Cache"
            echo "ent0             PCI-X Gigabit Ethernet-SX Adapter"
            echo "scsi0            PCI-X Ultra320 SCSI Adapter"
            echo "hdisk0           16 Bit LVD SCSI Disk Drive"
            echo "hdisk1           16 Bit LVD SCSI Disk Drive"
            echo "cd0              IDE DVD-ROM Drive"
            echo "tty0             Asynchronous Terminal"
            echo "lp0              Other I/O Planar Logic CHRP"
            ;;
    esac
}

function lsdev() {
    case "$1" in
        "-C"|"-Cc")
            if [ "$2" = "disk" ]; then
                echo "hdisk0 Available  16 Bit LVD SCSI Disk Drive"
                echo "hdisk1 Available  16 Bit LVD SCSI Disk Drive"
                echo "cd0    Available  IDE DVD-ROM Drive"
            elif [ "$2" = "adapter" ]; then
                echo "ent0   Available  PCI-X Gigabit Ethernet-SX Adapter"
                echo "scsi0  Available  PCI-X Ultra320 SCSI Adapter"
                echo "isa0   Available  ISA Bus"
                echo "pci0   Available  PCI Bus"
            elif [ "$2" = "processor" ]; then
                echo "proc0  Available  Processor"
                echo "proc2  Available  Processor"
                echo "proc4  Available  Processor"
                echo "proc6  Available  Processor"
            else
                echo "sys0      Available  System Object"
                echo "proc0     Available  Processor"
                echo "proc2     Available  Processor"
                echo "proc4     Available  Processor"
                echo "proc6     Available  Processor"
                echo "mem0      Available  Memory"
                echo "ent0      Available  PCI-X Gigabit Ethernet-SX Adapter"
                echo "hdisk0    Available  16 Bit LVD SCSI Disk Drive"
                echo "hdisk1    Available  16 Bit LVD SCSI Disk Drive"
                echo "cd0       Available  IDE DVD-ROM Drive"
            fi
            ;;
        "-H"|"-Hc")
            if [ "$2" = "disk" ]; then
                echo "hdisk0 Defined   16 Bit LVD SCSI Disk Drive"
                echo "hdisk1 Defined   16 Bit LVD SCSI Disk Drive"
            else
                echo "sys0      Defined   System Object"
                echo "proc0     Defined   Processor"
                echo "mem0      Defined   Memory"
                echo "ent0      Defined   PCI-X Gigabit Ethernet-SX Adapter"
                echo "hdisk0    Defined   16 Bit LVD SCSI Disk Drive"
            fi
            ;;
        "-l")
            shift
            case "$1" in
                "hdisk0")
                    echo "hdisk0 Available  16 Bit LVD SCSI Disk Drive"
                    ;;
                "ent0")
                    echo "ent0   Available  PCI-X Gigabit Ethernet-SX Adapter"
                    ;;
                *)
                    echo "lsdev: 0514-516 Cannot find device $1."
                    ;;
            esac
            ;;
        *)
            echo "sys0      Available  System Object"
            echo "proc0     Available  Processor"
            echo "proc2     Available  Processor"
            echo "proc4     Available  Processor"
            echo "proc6     Available  Processor"
            echo "mem0      Available  Memory"
            echo "ent0      Available  PCI-X Gigabit Ethernet-SX Adapter"
            echo "scsi0     Available  PCI-X Ultra320 SCSI Adapter"
            echo "hdisk0    Available  16 Bit LVD SCSI Disk Drive"
            echo "hdisk1    Available  16 Bit LVD SCSI Disk Drive"
            echo "cd0       Available  IDE DVD-ROM Drive"
            echo "tty0      Available  Asynchronous Terminal"
            ;;
    esac
}

function lsattr() {
    if [ "$1" = "-El" ] && [ "$2" ]; then
        case "$2" in
            "hdisk0")
                echo "PCM             PCM/friend/vpath    Path Control Module          False"
                echo "algorithm       round_robin         Algorithm                    True"
                echo "clr_q           no                  Device CLEARS its Queue on error True"
                echo "location                            Location Label               True"
                echo "lun_id          0x8000000000000000  Logical Unit Number ID       False"
                echo "lun_reset_spt   yes                 LUN Level Reset              True"
                echo "max_transfer    0x100000            Maximum TRANSFER Size        True"
                echo "node_name       0x50050763050b073c  FC Node Name                 False"
                echo "pvid            00c123456789abcd0000000000000000 Physical volume identifier False"
                echo "q_type          simple              Queuing TYPE                 True"
                echo "queue_depth     20                  Queue DEPTH                  True"
                echo "reassign_to     120                 REASSIGN time out value     True"
                echo "reserve_policy  single_path         Reserve Policy               True"
                echo "rw_timeout      30                  READ/WRITE time out value   True"
                echo "scsi_id         0x8                 SCSI ID                      False"
                echo "start_timeout   60                  START unit time out value   True"
                ;;
            "ent0")
                echo "alias4          192.168.109.143,255.255.255.0 IPv4 Alias including Subnet Mask True"
                echo "arp             on                  Address Resolution Protocol  True"
                echo "authority       root                Switch Port Autorization     True"
                echo "broadcast       192.168.109.255     Broadcast Address            True"
                echo "hwaddr          00:00:5e:00:53:00   Hardware Address             True"
                echo "inet            192.168.109.142     Internet Address             True"
                echo "media_speed     Auto_Negotiation    Media Speed Running          True"
                echo "mtu             1500                Maximum IP Packet Size       True"
                echo "netaddr         192.168.109.0       Network Address              True"
                echo "netmask         255.255.255.0       Subnet Mask                  True"
                echo "remmtu          1500                Maximum IP Packet Size for REMOTE networks True"
                echo "state           up                  Current Interface Status     True"
                echo "tcp_mssdflt     1448                TCP Maximum Segment Size     True"
                echo "tcp_recvspace   65536               TCP Receive Buffer Size      True"
                echo "tcp_sendspace   65536               TCP Send Buffer Size         True"
                ;;
            "sys0")
                echo "conslogin       enable              Console Login                True"
                echo "fwversion       IBM,FW920.30 (SV920_138) Firmware version and revision levels False"
                echo "ioplanar        2                   I/O Planar                   False"
                echo "keylock         normal              State of system keylock      False"
                echo "maxbuf          20                  Maximum number of pages in block I/O buffer cache True"
                echo "maxperm         80                  Maximum percentage of real memory allowed for non-computational pages True"
                echo "maxpin          80                  Maximum percentage of real memory allowed to be pinned True"
                echo "minperm         3                   Minimum percentage of real memory used for non-computational pages True"
                echo "modelname       IBM,9009-42A        Machine name                 False"
                echo "systemid        IBM,0206ABC1         Hardware system identifier   False"
                ;;
            *)
                echo "lsattr: 0514-516 Cannot find device $2."
                ;;
        esac
    elif [ "$1" = "-E" ] && [ "$2" = "-l" ] && [ "$3" ]; then
        case "$3" in
            "sys0")
                echo "conslogin       enable              Console Login                True"
                echo "fwversion       IBM,FW920.30 (SV920_138) Firmware version and revision levels False"
                echo "ioplanar        2                   I/O Planar                   False"
                echo "keylock         normal              State of system keylock      False"
                echo "maxbuf          20                  Maximum number of pages in block I/O buffer cache True"
                echo "maxperm         80                  Maximum percentage of real memory allowed for non-computational pages True"
                echo "maxpin          80                  Maximum percentage of real memory allowed to be pinned True"
                echo "minperm         3                   Minimum percentage of real memory used for non-computational pages True"
                echo "modelname       IBM,9009-42A        Machine name                 False"
                echo "systemid        IBM,0206ABC1         Hardware system identifier   False"
                ;;
            *)
                echo "lsattr: 0514-516 Cannot find device $3."
                ;;
        esac
    else
        echo "Usage: lsattr -El device_name | -E -l device_name"
    fi
}

# =============================================================================
# PROCESS AND PERFORMANCE COMMANDS  
# =============================================================================

function ps() {
    case "$1" in
        "-ef")
            echo "     UID   PID  PPID   C    STIME    TTY  TIME CMD"
            echo "    root     1     0   0 10:15:01      -  0:45 /etc/init"
            echo "    root     2     0   0 10:15:01      -  0:00 /etc/kproc"
            echo "    root   516     1   0 10:15:02      -  0:02 /etc/syncd 60"
            echo "    root  1032     1   0 10:15:03      -  0:01 /usr/sbin/syslogd"
            echo "    root  1284     1   0 10:15:04      -  0:00 /usr/sbin/portmap"
            echo "    root  1540     1   0 10:15:05      -  0:01 /usr/sbin/inetd"
            echo "    root  1796     1   0 10:15:06      -  0:00 /usr/sbin/xntpd"
            echo "    root  2052     1   0 10:15:07      -  0:02 /usr/sbin/sendmail -bd -q30m"
            echo "    root  2308     1   0 10:15:08      -  0:00 /usr/sbin/cron"
            echo "    root  2564     1   0 10:15:09      -  0:01 /usr/sbin/sshd"
            echo "    root  2820     1   0 10:15:10      -  0:00 /usr/bin/errdemon"
            echo "    root  3076  2564   0 10:20:15  pts/0  0:02 -ksh"
            echo "  oracle  3332     1   0 10:25:30  pts/1  0:15 /oracle/product/11.2.0/bin/tnslsnr"
            echo "  oracle  3588  3332   0 10:25:35  pts/1  0:25 ora_pmon_orcl"
            echo "  oracle  3844  3332   0 10:25:40  pts/1  0:20 ora_smon_orcl"
            echo "    root  4100  3076   0 12:15:45  pts/0  0:00 ps -ef"
            ;;
        "-aux")
            echo "USER       PID %CPU %MEM   VSZ  RSS  TTY STAT STIME  TIME COMMAND"
            echo "root         1  0.0  0.1  1234  567    - A    10:15  0:45 /etc/init"
            echo "root         2  0.0  0.0     0    0    - A    10:15  0:00 kproc"
            echo "root       516  0.1  0.2  2345  890    - A    10:15  0:02 syncd"
            echo "root      1032  0.2  0.3  3456 1234    - A    10:15  0:01 syslogd"
            echo "root      1284  0.0  0.1  1567  678    - A    10:15  0:00 portmap"
            echo "root      1540  0.1  0.2  2678  901    - A    10:15  0:01 inetd"
            echo "root      1796  0.0  0.1  1789  567    - A    10:15  0:00 xntpd"
            echo "root      2052  0.3  0.4  4567 1678    - A    10:15  0:02 sendmail"
            echo "root      2308  0.0  0.1  1234  456    - A    10:15  0:00 cron"
            echo "root      2564  0.1  0.2  2345  789    - A    10:15  0:01 sshd"
            echo "root      2820  0.0  0.1  1456  234    - A    10:15  0:00 errdemon"
            echo "root      3076  0.2  0.3  3456  890    0 A    10:20  0:02 ksh"
            echo "oracle    3332  2.5  8.9 567890 45678  1 A    10:25  0:15 tnslsnr"
            echo "oracle    3588  5.2 12.3 789012 67890  1 A    10:25  0:25 ora_pmon_orcl"
            echo "oracle    3844  3.8 10.1 678901 56789  1 A    10:25  0:20 ora_smon_orcl"
            echo "root      4100  0.0  0.1  1234  234    0 R    12:15  0:00 ps"
            ;;
        "-eo")
            shift
            case "$1" in
                "pid,ppid,user,args")
                    echo "   PID  PPID USER     COMMAND"
                    echo "     1     0 root     /etc/init"
                    echo "     2     0 root     kproc"
                    echo "   516     1 root     /etc/syncd 60"
                    echo "  1032     1 root     /usr/sbin/syslogd"
                    echo "  1284     1 root     /usr/sbin/portmap"
                    echo "  1540     1 root     /usr/sbin/inetd"
                    echo "  2052     1 root     /usr/sbin/sendmail -bd -q30m"
                    echo "  2308     1 root     /usr/sbin/cron"
                    echo "  2564     1 root     /usr/sbin/sshd"
                    echo "  2820     1 root     /usr/bin/errdemon"
                    echo "  3076  2564 root     -ksh"
                    echo "  3332     1 oracle   /oracle/product/11.2.0/bin/tnslsnr"
                    echo "  3588  3332 oracle   ora_pmon_orcl"
                    echo "  3844  3332 oracle   ora_smon_orcl"
                    ;;
                *)
                    echo "ps: 0403-027 The -o flag requires a format specification."
                    ;;
            esac
            ;;
        *)
            echo "   PID TTY      TIME CMD"
            echo "  3076 pts/0    0:02 ksh"
            echo "  4100 pts/0    0:00 ps"
            ;;
    esac
}

function w() {
    case "$1" in
        "-u")
            shift
            case "$1" in
                "root")
                    echo " 12:15PM   up 15 days,  3:45,  2 users,  load average: 0.85, 0.92, 1.02"
                    echo "User       tty           login@  idle   JCPU   PCPU  what"
                    echo "root       pts/0        10:20AM     -   0:02   0:01  w -u root"
                    ;;
                "oracle")
                    echo " 12:15PM   up 15 days,  3:45,  2 users,  load average: 0.85, 0.92, 1.02"
                    echo "User       tty           login@  idle   JCPU   PCPU  what"
                    echo "oracle     pts/1        10:25AM  1:45   5:30   0:15  sqlplus"
                    ;;
                *)
                    echo "w: 0403-027 User $1 not found."
                    ;;
            esac
            ;;
        *)
            echo " 12:15PM   up 15 days,  3:45,  2 users,  load average: 0.85, 0.92, 1.02"
            echo "User       tty           login@  idle   JCPU   PCPU  what"
            echo "root       pts/0        10:20AM     -   0:02   0:01  w"
            echo "oracle     pts/1        10:25AM  1:45   5:30   0:15  sqlplus"
            ;;
    esac
}

function who() {
    case "$1" in
        "-r")
            echo ".       run-level 2  Nov 11 10:15"
            ;;
        "-b")
            echo ".       system boot  Nov 11 10:15"
            ;;
        "-u")
            echo "root       pts/0        Nov 11 10:20   .         3076"
            echo "oracle     pts/1        Nov 11 10:25   1:45      3332"
            ;;
        *)
            echo "root       pts/0        Nov 11 10:20"
            echo "oracle     pts/1        Nov 11 10:25"
            ;;
    esac
}

# =============================================================================
# NETWORK COMMANDS
# =============================================================================

function ifconfig() {
    case "$1" in
        "-a")
            echo "en0: flags=1e084863,480<UP,BROADCAST,NOTRAILERS,RUNNING,SIMPLEX,MULTICAST,GROUPRT,64BIT,CHECKSUM_OFFLOAD(ACTIVE),CHAIN>"
            echo "        inet 192.168.109.142 netmask 0xffffff00 broadcast 192.168.109.255"
            echo "        inet6 fe80::200:5eff:fe00:5300/64"
            echo "lo0: flags=e08084b,c0<UP,BROADCAST,LOOPBACK,RUNNING,SIMPLEX,MULTICAST,GROUPRT,64BIT,LARGESEND,CHAIN>"
            echo "        inet 127.0.0.1 netmask 0xff000000 broadcast 127.255.255.255"
            echo "        inet6 ::1/128"
            ;;
        *)
            if [ "$1" ]; then
                case "$1" in
                    "en0")
                        echo "en0: flags=1e084863,480<UP,BROADCAST,NOTRAILERS,RUNNING,SIMPLEX,MULTICAST,GROUPRT,64BIT,CHECKSUM_OFFLOAD(ACTIVE),CHAIN>"
                        echo "        inet 192.168.109.142 netmask 0xffffff00 broadcast 192.168.109.255"
                        echo "        inet6 fe80::200:5eff:fe00:5300/64"
                        ;;
                    "lo0")
                        echo "lo0: flags=e08084b,c0<UP,BROADCAST,LOOPBACK,RUNNING,SIMPLEX,MULTICAST,GROUPRT,64BIT,LARGESEND,CHAIN>"
                        echo "        inet 127.0.0.1 netmask 0xff000000 broadcast 127.255.255.255"
                        echo "        inet6 ::1/128"
                        ;;
                    *)
                        echo "ifconfig: 0513-044 The $1 interface is not known."
                        ;;
                esac
            else
                echo "en0: flags=1e084863,480<UP,BROADCAST,NOTRAILERS,RUNNING,SIMPLEX,MULTICAST,GROUPRT,64BIT,CHECKSUM_OFFLOAD(ACTIVE),CHAIN>"
                echo "        inet 192.168.109.142 netmask 0xffffff00 broadcast 192.168.109.255"
            fi
            ;;
    esac
}

function netstat() {
    case "$1" in
        "-rn")
            echo "Routing tables"
            echo ""
            echo "Destination      Gateway           Flags   Refs     Use  Interface"
            echo "default          192.168.109.2     UGSc       2    12345  en0"
            echo "127.0.0.1        127.0.0.1         UH         0      567  lo0"
            echo "192.168.109/24   link#2            UC         0        0  en0"
            echo "192.168.109.142  192.168.109.142   UHL        1      123  lo0"
            echo "192.168.109.255  ff:ff:ff:ff:ff:ff UHLWb      0       45  en0"
            ;;
        "-i")
            echo "Name  Mtu   Network     Address            Ipkts Ierrs    Opkts Oerrs  Coll"
            echo "en0   1500  link#2      00.00.5e.00.53.00  12567     0     8934     0     0"
            echo "en0   1500  192.168.109 192.168.109.142    12345     0     8765     0     -"
            echo "lo0   16896 link#1                           567     0      567     0     0"
            echo "lo0   16896 127         127.0.0.1            567     0      567     0     -"
            echo "lo0   16896 ::1/128     ::1                    0     0        0     0     -"
            ;;
        "-an")
            echo "Active Internet connections (including servers)"
            echo "Proto Recv-Q Send-Q  Local Address          Foreign Address        (state)"
            echo "tcp4       0      0  *.22                   *.*                    LISTEN"
            echo "tcp4       0      0  *.25                   *.*                    LISTEN"
            echo "tcp4       0      0  127.0.0.1.514          *.*                    LISTEN"
            echo "tcp4       0      0  *.161                  *.*                    LISTEN"
            echo "tcp4       0      0  192.168.109.142.22     192.168.109.1.54321    ESTABLISHED"
            echo "tcp4       0      0  *.1521                 *.*                    LISTEN"
            echo "udp4       0      0  *.123                  *.*"
            echo "udp4       0      0  *.161                  *.*"
            echo "udp4       0      0  *.514                  *.*"
            ;;
        "-v")
            echo "Active Internet connections"
            echo "Proto Recv-Q Send-Q  Local Address          Foreign Address        (state)"
            echo "tcp        0      0  aixserver.ssh          client.54321           ESTABLISHED"
            echo "tcp        0      0  aixserver.smtp         *.*                    LISTEN"
            echo "tcp        0      0  aixserver.oracle       *.*                    LISTEN"
            echo "udp        0      0  aixserver.ntp          *.*"
            echo "udp        0      0  aixserver.snmp         *.*"
            ;;
        "-s")
            echo "System wide statistics"
            echo "ip:"
            echo "        12345 total packets received"
            echo "        0 bad header checksums"
            echo "        0 with size smaller than minimum"
            echo "        0 with data size < data length"
            echo "        0 with length > max ip packet size"
            echo "        0 with header length < data size"
            echo "        0 with data length < header length"
            echo "        0 fragments received"
            echo "        0 fragments dropped (dup or out of space)"
            echo "        0 fragments dropped after timeout"
            echo "        0 packets reassembled ok"
            echo "        8765 packets for this host"
            echo "        234 packets for unknown/unsupported protocol"
            echo "        0 packets forwarded"
            echo "        0 packets not forwardable"
            echo "        0 redirects sent"
            echo "tcp:"
            echo "        567 connection requests"
            echo "        234 connection accepts"
            echo "        123 connections established (including accepts)"
            echo "        45 connections closed (including drops)"
            echo "        12 embryonic connections dropped"
            echo "        890 segments received"
            echo "        678 segments sent out"
            echo "        34 segments retransmitted"
            echo "        0 bad segments received"
            echo "        56 resets sent"
            echo "udp:"
            echo "        123 datagrams received"
            echo "        0 incomplete headers"
            echo "        0 bad checksums"
            echo "        0 socket overflows"
            echo "        89 datagrams sent"
            ;;
        *)
            echo "Active Internet connections"
            echo "Proto Recv-Q Send-Q  Local Address          Foreign Address        (state)"
            echo "tcp        0      0  aixserver.ssh          client.54321           ESTABLISHED"
            echo "tcp        0      0  aixserver.smtp         *.*                    LISTEN"
            echo "tcp        0      0  aixserver.oracle       *.*                    LISTEN"
            ;;
    esac
}

function entstat() {
    if [ "$1" = "-d" ] && [ "$2" ]; then
        case "$2" in
            "en0")
                echo "ETHERNET STATISTICS (en0) :"
                echo "Device Type: PCI-X Gigabit Ethernet Adapter (14108902)"
                echo "Hardware Address: 00:00:5e:00:53:00"
                echo "Elapsed Time: 15 days 3 hours 45 minutes 12 seconds"
                echo ""
                echo "Transmit Statistics:                          Receive Statistics:"
                echo "--------------------                          -------------------"
                echo "Packets: 8934567                              Packets: 12567890"
                echo "Bytes: 1234567890                             Bytes: 9876543210"
                echo "Interrupts: 0                                 Interrupts: 123456"
                echo "Transmit Errors: 0                            Receive Errors: 0"
                echo "Packets Dropped: 0                            Packets Dropped: 0"
                echo "                                               Bad Packets: 0"
                echo "Max Packets on S/W Transmit Queue: 45"
                echo "S/W Transmit Queue Overflow: 0"
                echo "Current S/W+H/W Transmit Queue Length: 0"
                echo ""
                echo "Broadcast Packets: 12345                      Broadcast Packets: 67890"
                echo "Multicast Packets: 123                        Multicast Packets: 456"
                echo "No Carrier Sense: 0                           CRC Errors: 0"
                echo "DMA Underrun: 0                               DMA Overrun: 0"
                echo "Lost CTS Errors: 0                            Alignment Errors: 0"
                echo "Max Collision Errors: 0                       No Resource Errors: 0"
                echo "Late Collision Errors: 0                      Receive Collision Errors: 0"
                echo "Deferred: 0                                    Packet Too Short Errors: 0"
                echo "SQE Test: 0                                    Packet Too Long Errors: 0"
                echo "Timeout Errors: 0                             Packets Discarded by Adapter: 0"
                echo "Single Collision Count: 0                     Receiver Start Count: 0"
                echo "Multiple Collision Count: 0"
                ;;
            *)
                echo "entstat: 0513-044 The $2 interface is not known."
                ;;
        esac
    elif [ "$1" = "-all" ] && [ "$2" ]; then
        case "$2" in
            "en0")
                echo "ETHERNET STATISTICS (en0) :"
                echo "Device Type: PCI-X Gigabit Ethernet Adapter (14108902)"
                echo "Hardware Address: 00:00:5e:00:53:00"
                echo "Elapsed Time: 15 days 3 hours 45 minutes 12 seconds"
                echo ""
                echo "General Statistics:"
                echo "-------------------"
                echo "Source route bridge packets: 0"
                echo "Hot interrupt disabled: 0"
                echo "Hot interrupt enabled: 123456"
                echo "Receive buffer errors: 0"
                echo "Receive buffer overflow errors: 0"
                echo "Max collisions on transmit: 0"
                echo "No carrier sense: 0"
                echo "DMA underrun: 0"
                echo "Lost CTS errors: 0"
                echo "Max collision errors: 0"
                echo "No resources errors: 0"
                echo "Late collision errors: 0"
                echo "Receive collision errors: 0"
                echo "CRC errors: 0"
                echo "DMA overrun: 0"
                echo "Alignment errors: 0"
                echo "Packet too short errors: 0"
                echo "Packet too long errors: 0"
                echo "Packets discarded by adapter: 0"
                echo "Receiver start count: 0"
                ;;
            *)
                echo "entstat: 0513-044 The $2 interface is not known."
                ;;
        esac
    else
        echo "Usage: entstat [-d|-all] interface"
    fi
}

function ping() {
    if [ "$1" ]; then
        local target="$1"
        local count=4
        local size=56
        
        # Parse options
        while [ "$1" ]; do
            case "$1" in
                "-c")
                    shift
                    count="$1"
                    ;;
                "-s")
                    shift
                    size="$1"
                    ;;
                "-t")
                    shift
                    # TTL option, ignored in simulation
                    ;;
                *)
                    if [[ "$1" != -* ]]; then
                        target="$1"
                    fi
                    ;;
            esac
            shift
        done
        
        echo "PING $target: ($size data bytes)"
        local i=1
        while [ $i -le $count ]; do
            local time=$((RANDOM % 50 + 1))
            echo "$((size+8)) bytes from $target: icmp_seq=$i ttl=64 time=$time.$((RANDOM % 999)) ms"
            i=$((i+1))
            sleep 1
        done
        echo ""
        echo "--- $target ping statistics ---"
        echo "$count packets transmitted, $count received, 0% packet loss"
        echo "round-trip min/avg/max = 1.234/25.678/49.123 ms"
    else
        echo "Usage: ping [-c count] [-s size] [-t ttl] host"
    fi
}


# =============================================================================
# SERVICE MANAGEMENT COMMANDS
# =============================================================================

function lssrc() {
    case "$1" in
        "-a")
            echo "Subsystem         Group            PID     Status"
            echo "sshd              tcpip            2564    active"
            echo "sendmail          mail             2052    active"
            echo "cron              cron             2308    active"
            echo "syslogd           syslog           1032    active"
            echo "xntpd             tcpip            1796    active"
            echo "inetd             tcpip            1540    active"
            echo "portmap           portmap          1284    active"
            echo "qdaemon           spooler          4356    active"
            echo "lpd               spooler          4612    active"
            echo "snmpd             tcpip            4868    active"
            echo "aso               aso              5124    active"
            echo "pfcdaemon         pfc              5380    active"
            echo "srcmstr           srcmstr          516     active"
            echo "biod              nfs              5636    active"
            echo "nfsd              nfs              5892    active"
            echo "rpc.mountd        nfs              6148    active"
            echo "rpc.statd         nfs              6404    active"
            echo "rpc.lockd         nfs              6660    active"
            echo "automountd        autofs           6916    active"
            ;;
        "-g")
            shift
            case "$1" in
                "tcpip")
                    echo "Subsystem         Group            PID     Status"
                    echo "sshd              tcpip            2564    active"
                    echo "xntpd             tcpip            1796    active"
                    echo "inetd             tcpip            1540    active"
                    echo "snmpd             tcpip            4868    active"
                    echo "dhcpcd            tcpip            7172    active"
                    echo "named             tcpip            7428    active"
                    ;;
                "nfs")
                    echo "Subsystem         Group            PID     Status"
                    echo "biod              nfs              5636    active"
                    echo "nfsd              nfs              5892    active"
                    echo "rpc.mountd        nfs              6148    active"
                    echo "rpc.statd         nfs              6404    active"
                    echo "rpc.lockd         nfs              6660    active"
                    ;;
                "spooler")
                    echo "Subsystem         Group            PID     Status"
                    echo "qdaemon           spooler          4356    active"
                    echo "lpd               spooler          4612    active"
                    ;;
                *)
                    echo "0513-044 The $1 Group is not on file."
                    ;;
            esac
            ;;
        "-s")
            shift
            case "$1" in
                "sshd")
                    echo "Subsystem         Group            PID     Status"
                    echo "sshd              tcpip            2564    active"
                    ;;
                "sendmail")
                    echo "Subsystem         Group            PID     Status"
                    echo "sendmail          mail             2052    active"
                    ;;
                "cron")
                    echo "Subsystem         Group            PID     Status"
                    echo "cron              cron             2308    active"
                    ;;
                "xntpd")
                    echo "Subsystem         Group            PID     Status"
                    echo "xntpd             tcpip            1796    active"
                    ;;
                "inetd")
                    echo "Subsystem         Group            PID     Status"
                    echo "inetd             tcpip            1540    active"
                    ;;
                *)
                    echo "0513-044 The $1 Subsystem is not on file."
                    ;;
            esac
            ;;
        "-l")
            shift
            case "$1" in
                "sshd")
                    echo "Subsystem: sshd"
                    echo "Type: service"
                    echo "Description: Secure Shell Daemon"
                    echo "Synonyms: sshd"
                    echo "PID: 2564"
                    echo "State: active"
                    echo "Standard Error: /dev/console"
                    echo "Multi: yes"
                    echo "Contact with Subsystem: sockets"
                    echo "Signaling: normal"
                    echo "Subsystem is a member of group: tcpip"
                    ;;
                *)
                    echo "0513-044 The $1 Subsystem is not on file."
                    ;;
            esac
            ;;
        *)
            echo "Usage: lssrc [-a] [-g group] [-s subsystem] [-l subsystem]"
            ;;
    esac
}

function startsrc() {
    if [ "$1" = "-s" ] && [ "$2" ]; then
        case "$2" in
            "sshd")
                echo "0513-059 The sshd Subsystem has been started. Subsystem PID is 2564."
                ;;
            "sendmail")
                echo "0513-059 The sendmail Subsystem has been started. Subsystem PID is 2052."
                ;;
            "cron")
                echo "0513-059 The cron Subsystem has been started. Subsystem PID is 2308."
                ;;
            "xntpd")
                echo "0513-059 The xntpd Subsystem has been started. Subsystem PID is 1796."
                ;;
            *)
                echo "0513-044 The $2 Subsystem is not on file."
                ;;
        esac
    elif [ "$1" = "-g" ] && [ "$2" ]; then
        case "$2" in
            "tcpip")
                echo "0513-059 The tcpip Group has been started."
                ;;
            "nfs")
                echo "0513-059 The nfs Group has been started."
                ;;
            *)
                echo "0513-044 The $2 Group is not on file."
                ;;
        esac
    else
        echo "Usage: startsrc -s subsystem | -g group"
    fi
}

function stopsrc() {
    if [ "$1" = "-s" ] && [ "$2" ]; then
        case "$2" in
            "sshd")
                echo "0513-044 The sshd Subsystem was requested to stop."
                ;;
            "sendmail")
                echo "0513-044 The sendmail Subsystem was requested to stop."
                ;;
            "cron")
                echo "0513-044 The cron Subsystem was requested to stop."
                ;;
            "xntpd")
                echo "0513-044 The xntpd Subsystem was requested to stop."
                ;;
            *)
                echo "0513-044 The $2 Subsystem is not on file."
                ;;
        esac
    elif [ "$1" = "-g" ] && [ "$2" ]; then
        case "$2" in
            "tcpip")
                echo "0513-044 The tcpip Group was requested to stop."
                ;;
            "nfs")
                echo "0513-044 The nfs Group was requested to stop."
                ;;
            *)
                echo "0513-044 The $2 Group is not on file."
                ;;
        esac
    else
        echo "Usage: stopsrc -s subsystem | -g group"
    fi
}

# =============================================================================
# ERROR REPORTING COMMANDS
# =============================================================================

function errpt() {
    case "$1" in
        "-a")
            echo "IDENTIFIER TIMESTAMP  T C RESOURCE_NAME  DESCRIPTION"
            echo ""
            echo "8650BE3F   0911101015 I H ent0           INFORMATIONAL MESSAGE FROM ETHERNET DEVICE DRIVER"
            echo "                       DEVICE DRIVER RECEIVED A NETWORK RECOVERY MODE FRAME."
            echo ""  
            echo "F3846E13   0911100845 P H hdisk0         DISK OPERATION ERROR"
            echo "                       THE DEVICE HAS RECOVERED FROM AN ERROR. THE ERROR WAS"
            echo "                       CAUSED BY A TEMPORARY HARDWARE CONDITION."
            echo ""
            echo "96650A1B   0911100530 T O SYSPROC        SYSTEM SHUTDOWN BY USER"
            echo "                       THE SYSTEM WAS SHUTDOWN BY A USER."
            echo ""
            echo "A08A5C87   0911100215 P S LVDD           LOGICAL VOLUME DRIVER WARNING"
            echo "                       A LOGICAL VOLUME HAS BECOME AVAILABLE."
            echo ""
            ;;
        "-s")
            shift
            case "$1" in
                "0911101015"|"today")
                    echo "IDENTIFIER TIMESTAMP  T C RESOURCE_NAME  DESCRIPTION"
                    echo ""
                    echo "8650BE3F   0911101015 I H ent0           INFORMATIONAL MESSAGE FROM ETHERNET DEVICE DRIVER"
                    ;;
                "0911100845")
                    echo "IDENTIFIER TIMESTAMP  T C RESOURCE_NAME  DESCRIPTION" 
                    echo ""
                    echo "F3846E13   0911100845 P H hdisk0         DISK OPERATION ERROR"
                    ;;
                *)
                    echo "errpt: 0251-138 Cannot find any error records."
                    ;;
            esac
            ;;
        "-j")
            shift
            case "$1" in
                "8650BE3F"|"F3846E13"|"96650A1B"|"A08A5C87")
                    echo "IDENTIFIER: $1"
                    echo "Date/Time: Thu Nov 11 10:15:15 EST"
                    echo "Sequence Number: 1234"
                    echo "Machine Id: 00F84C0C4C00"
                    echo "Node Id: aixserver"
                    echo "Class: H"
                    echo "Type: PERM"
                    echo "WPAR: Global"
                    echo "Resource Name: hdisk0"
                    echo ""
                    echo "Description"
                    echo "DISK OPERATION ERROR"
                    echo ""
                    echo "Probable Causes"
                    echo "DISK DRIVE"
                    echo "DISK DRIVE ELECTRONICS"
                    echo "DISK ADAPTER"
                    echo ""
                    echo "Recommended Actions"
                    echo "PERFORM PROBLEM DETERMINATION PROCEDURES"
                    echo "CONTACT APPROPRIATE SERVICE REPRESENTATIVE"
                    ;;
                *)
                    echo "errpt: 0251-138 Cannot find error record $1."
                    ;;
            esac
            ;;
        "-d")
            shift
            case "$1" in
                "hdisk0")
                    echo "IDENTIFIER TIMESTAMP  T C RESOURCE_NAME  DESCRIPTION"
                    echo ""
                    echo "F3846E13   0911100845 P H hdisk0         DISK OPERATION ERROR"
                    ;;
                "ent0")
                    echo "IDENTIFIER TIMESTAMP  T C RESOURCE_NAME  DESCRIPTION"
                    echo ""
                    echo "8650BE3F   0911101015 I H ent0           INFORMATIONAL MESSAGE FROM ETHERNET DEVICE DRIVER"
                    ;;
                *)
                    echo "errpt: 0251-138 Cannot find any error records for device $1."
                    ;;
            esac
            ;;
        *)
            echo "IDENTIFIER TIMESTAMP  T C RESOURCE_NAME  DESCRIPTION"
            echo ""
            echo "8650BE3F   0911101015 I H ent0           INFORMATIONAL MESSAGE FROM ETHERNET DEVICE DRIVER"
            echo "F3846E13   0911100845 P H hdisk0         DISK OPERATION ERROR" 
            echo "96650A1B   0911100530 T O SYSPROC        SYSTEM SHUTDOWN BY USER"
            echo "A08A5C87   0911100215 P S LVDD           LOGICAL VOLUME DRIVER WARNING"
            ;;
    esac
}

# =============================================================================
# PERFORMANCE MONITORING COMMANDS
# =============================================================================

function topas() {
    case "$1" in
        "-i")
            shift
            local interval=${1:-2}
            echo "Topas Monitor for host:    aixserver                          EVENTS/QUEUES    FILE/TTY"
            echo "Thu Nov 11 12:15:30 2024   Interval:  $interval           Cswitch     2567   Readch      12M"
            echo "                                                  Syscall     5678   Writech     8M"
            echo "Kernel    13.2  |#######                       |  Reads        234   Rawin       1234"
            echo "User      25.8  |############                  |  Writes       156   Ttyout      5678"
            echo "Wait      15.6  |#######                       |  Forks         12   Igets        789"
            echo "Idle      45.4  |######################        |  Execs          8   Namei        456"
            echo "                                                  Runqueue      1.2   Dirblk       123"
            echo "Network   KBPS   I-Pack  O-Pack  KB-In  KB-Out  Waitqueue     0.0   "
            echo "en0       123.4     567     345   67.8    55.6"
            echo "lo0         0.0       0       0    0.0     0.0"
            echo ""
            echo "Disk      Busy%     KBPS     TPS KB-Read KB-Writ"
            echo "hdisk0      8.5    156.7      23    89.2    67.5"
            echo "hdisk1      5.2     89.3      15    45.1    44.2"
            echo "cd0         0.0      0.0       0     0.0     0.0"
            echo ""
            echo "Name            PID    CPU%    PgSp Owner"
            echo "ora_smon_orcl   3844    5.2     8.9 oracle"
            echo "ora_pmon_orcl   3588    3.8    10.1 oracle"
            echo "tnslsnr         3332    2.5     8.9 oracle"
            echo "sendmail        2052    0.8     0.4 root"
            echo "sshd            2564    0.5     0.2 root"
            echo "ksh             3076    0.2     0.3 root"
            echo "topas           7890    0.1     0.1 root"
            ;;
        *)
            echo "Topas Monitor for host:    aixserver                          EVENTS/QUEUES    FILE/TTY"
            echo "Thu Nov 11 12:15:30 2024   Interval:  2             Cswitch     2567   Readch      12M"
            echo "                                                  Syscall     5678   Writech     8M"
            echo "Kernel    13.2  |#######                       |  Reads        234   Rawin       1234"
            echo "User      25.8  |############                  |  Writes       156   Ttyout      5678"
            echo "Wait      15.6  |#######                       |  Forks         12   Igets        789"
            echo "Idle      45.4  |######################        |  Execs          8   Namei        456"
            echo "                                                  Runqueue      1.2   Dirblk       123"
            echo "Network   KBPS   I-Pack  O-Pack  KB-In  KB-Out  Waitqueue     0.0   "
            echo "en0       123.4     567     345   67.8    55.6"
            echo ""
            echo "Disk      Busy%     KBPS     TPS KB-Read KB-Writ"
            echo "hdisk0      8.5    156.7      23    89.2    67.5"
            echo "hdisk1      5.2     89.3      15    45.1    44.2"
            echo ""
            echo "Name            PID    CPU%    PgSp Owner"
            echo "ora_smon_orcl   3844    5.2     8.9 oracle"
            echo "ora_pmon_orcl   3588    3.8    10.1 oracle"
            echo "tnslsnr         3332    2.5     8.9 oracle"
            echo "Press 'q' to quit topas."
            ;;
    esac
}

function nmon() {
    echo "nmon performance: AIX Performance Monitor"
    echo "========================================"
    echo ""
    echo "For help, type: h"
    echo "To quit, type: q"
    echo ""
    echo "Available Views:"
    echo "  c = CPU utilization"
    echo "  m = Memory usage"
    echo "  d = Disk I/O"
    echo "  n = Network I/O"
    echo "  k = Kernel stats"
    echo "  t = Top processes"
    echo "  l = Long term averages"
    echo ""
    echo "CPU Utilization:"
    echo "User%:   25.8    Sys%:   13.2    Wait%:  15.6    Idle%:  45.4"
    echo ""
    echo "Memory Usage (MB):"
    echo "Real:  3456/8192  (42.2%)    Virtual: 4567/12288  (37.2%)"
    echo ""
    echo "Top Processes by CPU:"
    echo "   PID    %CPU   Command"
    echo "  3844     5.2   ora_smon_orcl"
    echo "  3588     3.8   ora_pmon_orcl" 
    echo "  3332     2.5   tnslsnr"
    echo ""
    echo "Disk Activity:"
    echo "hdisk0: Read=89.2 KB/s, Write=67.5 KB/s, Busy=8.5%"
    echo "hdisk1: Read=45.1 KB/s, Write=44.2 KB/s, Busy=5.2%"
}

function vmstat() {
    case "$1" in
        ""|[0-9]*)
            local interval=${1:-1}
            local count=${2:-5}
            echo "System configuration: lcpu=4 mem=8192MB ent=1.00"
            echo ""
            echo "kthr    memory              page              faults      cpu"
            echo " r  b   avm   fre  re  pi  po  fr   sr  cy  in   sy  cs us sy id wa"
            local i=0
            while [ $i -lt $count ]; do
                local r=$((RANDOM % 3))
                local b=$((RANDOM % 2))
                local avm=$((245678 + RANDOM % 10000))
                local fre=$((67890 + RANDOM % 5000))
                local re=$((RANDOM % 10))
                local pi=$((RANDOM % 50))
                local po=$((RANDOM % 30))
                local fr=$((RANDOM % 100))
                local sr=$((RANDOM % 200))
                local cy=$((RANDOM % 5))
                local in=$((1200 + RANDOM % 300))
                local sy=$((2500 + RANDOM % 500))
                local cs=$((1800 + RANDOM % 400))
                local us=$((20 + RANDOM % 30))
                local sy2=$((10 + RANDOM % 20))
                local id=$((100 - us - sy2 - 10))
                local wa=$((RANDOM % 20))
                
                printf "%2d %2d %6d %5d %2d %2d %2d %3d %3d %2d %4d %4d %3d %2d %2d %2d %2d\n" \
                    $r $b $avm $fre $re $pi $po $fr $sr $cy $in $sy $cs $us $sy2 $id $wa
                i=$((i+1))
                if [ $i -lt $count ]; then
                    sleep $interval
                fi
            done
            ;;
        *)
            echo "Usage: vmstat [interval [count]]"
            ;;
    esac
}

function iostat() {
    case "$1" in
        ""|[0-9]*)
            local interval=${1:-2}
            local count=${2:-3}
            echo "System configuration: lcpu=4 drives=3 paths=3 vdisks=0"
            echo ""
            local i=0
            while [ $i -lt $count ]; do
                echo "tty:      tin         tout   avg-cpu:  % user   % sys    % idle    % iowait"
                # Generate random values without bc dependency
                local tin=$(awk 'BEGIN{srand(); printf "%.1f", rand()*2}')
                local tout=$(awk 'BEGIN{srand(); printf "%.1f", rand()*20}')
                local user=$(awk 'BEGIN{srand(); printf "%.1f", 15+rand()*15}')
                local sys=$(awk 'BEGIN{srand(); printf "%.1f", 8+rand()*10}')
                local idle=$(awk 'BEGIN{srand(); printf "%.1f", 60+rand()*20}')
                local iowait=$(awk 'BEGIN{srand(); printf "%.1f", 10+rand()*15}')
                
                printf "          %s          %s              %s     %s      %s      %s\n" \
                    "$tin" "$tout" "$user" "$sys" "$idle" "$iowait"
                echo ""
                echo "Disks:        % tm_act     Kbps      tps    Kb_read   Kb_wrtn"
                
                local hdisk0_act=$(awk 'BEGIN{srand(); printf "%.1f", 10+rand()*15}')
                local hdisk0_kbps=$(awk 'BEGIN{srand(); printf "%.1f", 200+rand()*100}')
                local hdisk0_tps=$((40 + RANDOM % 20))
                local hdisk0_read=$((12000 + RANDOM % 2000))
                local hdisk0_wrtn=$((44000 + RANDOM % 3000))
                
                local hdisk1_act=$(awk 'BEGIN{srand(); printf "%.1f", 6+rand()*8}')
                local hdisk1_kbps=$(awk 'BEGIN{srand(); printf "%.1f", 120+rand()*80}')
                local hdisk1_tps=$((20 + RANDOM % 15))
                local hdisk1_read=$((8000 + RANDOM % 1500))
                local hdisk1_wrtn=$((22000 + RANDOM % 2000))
                
                printf "hdisk0          %s      %s       %d      %d     %d\n" \
                    "$hdisk0_act" "$hdisk0_kbps" "$hdisk0_tps" "$hdisk0_read" "$hdisk0_wrtn"
                printf "hdisk1           %s      %s       %d       %d     %d\n" \
                    "$hdisk1_act" "$hdisk1_kbps" "$hdisk1_tps" "$hdisk1_read" "$hdisk1_wrtn"
                echo "cd0              0.0        0.0        0          0         0"
                echo ""
                i=$((i+1))
                if [ $i -lt $count ]; then
                    sleep $interval
                fi
            done
            ;;
        *)
            echo "Usage: iostat [interval [count]]"
            ;;
    esac
}

function sar() {
    case "$1" in
        "-u")
            shift
            local interval=${1:-2}
            local count=${2:-3}
            echo "System configuration: lcpu=4 ent=0.50"
            echo ""
            printf "%-10s %s %s %s %s %s %s\n" "Time" "%usr" "%sys" "%wio" "%idle" "physc" "%entc"
            local i=0
            local hour=12
            local min=15
            local sec=30
            while [ $i -lt $count ]; do
                sec=$((sec + interval))
                if [ $sec -ge 60 ]; then
                    sec=$((sec - 60))
                    min=$((min + 1))
                    if [ $min -ge 60 ]; then
                        min=0
                        hour=$((hour + 1))
                    fi
                fi
                
                local usr=$((15 + RANDOM % 10))
                local sys=$((7 + RANDOM % 5))
                local wio=$((10 + RANDOM % 8))
                local idle=$((100 - usr - sys - wio))
                local physc=$(echo "scale=2; 1.2 + ($RANDOM % 50)/1000" | bc -l 2>/dev/null || echo "1.23")
                local entc=$(echo "scale=1; 23 + ($RANDOM % 40)/10" | bc -l 2>/dev/null || echo "24.6")
                
                printf "%02d:%02d:%02d       %d       %d      %d      %d     %s     %s\n" \
                    $hour $min $sec $usr $sys $wio $idle "$physc" "$entc"
                i=$((i+1))
                if [ $i -lt $count ]; then
                    sleep $interval
                fi
            done
            echo ""
            echo "Average:      15       8      12      64     1.23     24.5"
            ;;
        "-d")
            shift
            local interval=${1:-2}
            local count=${2:-3}
            echo "System configuration: lcpu=4 drives=3"
            echo ""
            printf "%-10s %-8s %s %s %s %s %s %s\n" "Time" "device" "%busy" "avque" "r+w/s" "blks/s" "avwait" "avserv"
            local i=0
            local hour=12
            local min=15
            local sec=30
            while [ $i -lt $count ]; do
                sec=$((sec + interval))
                if [ $sec -ge 60 ]; then
                    sec=$((sec - 60))
                    min=$((min + 1))
                fi
                
                printf "%02d:%02d:%02d  hdisk0     %d.%d    %d.%d    %d.%d    %d.%d     %d.%d     %d.%d\n" \
                    $hour $min $sec \
                    $((10 + RANDOM % 15)) $((RANDOM % 10)) \
                    $((0 + RANDOM % 3)) $((RANDOM % 10)) \
                    $((40 + RANDOM % 20)) $((RANDOM % 10)) \
                    $((200 + RANDOM % 100)) $((RANDOM % 10)) \
                    $((5 + RANDOM % 10)) $((RANDOM % 10)) \
                    $((15 + RANDOM % 10)) $((RANDOM % 10))
                printf "%02d:%02d:%02d  hdisk1     %d.%d    %d.%d    %d.%d    %d.%d     %d.%d     %d.%d\n" \
                    $hour $min $sec \
                    $((6 + RANDOM % 10)) $((RANDOM % 10)) \
                    $((0 + RANDOM % 2)) $((RANDOM % 10)) \
                    $((20 + RANDOM % 15)) $((RANDOM % 10)) \
                    $((100 + RANDOM % 80)) $((RANDOM % 10)) \
                    $((3 + RANDOM % 8)) $((RANDOM % 10)) \
                    $((12 + RANDOM % 8)) $((RANDOM % 10))
                i=$((i+1))
                if [ $i -lt $count ]; then
                    sleep $interval
                fi
            done
            ;;
        *)
            echo "Usage: sar [-u|-d] [interval [count]]"
            ;;
    esac
}

# Print comprehensive welcome message
# =============================================================================
# MEMORY AND PAGING COMMANDS
# =============================================================================

function svmon() {
    case "$1" in
        "-G")
            echo "                   size       inuse        free         pin     virtual"
            echo "memory           2097152     1638400      458752      819200     1843200"
            echo "pg space         1048576      209715      838861"
            echo ""
            echo "                   work        pers        clnt       other"
            echo "pin               409600      204800      102400      102400"
            echo "in use           1024000      614400           0           0"
            echo ""
            echo "PageSize   PoolSize       inuse        pgsp         pin"
            echo "s    4 KB   2097152     1638400      209715      819200"
            echo "m   64 KB         0           0           0           0"
            ;;
        "-P")
            shift
            case "$1" in
                "-t")
                    local count=${2:-10}
                    echo "    Pid Command          Inuse      Pin     Pgsp  Virtual 64-bit Mthrd 16MB"
                    echo " 315392 java           1048576   102400   524288  1572864      Y     Y    N"
                    echo " 262144 oracle         524288    51200   262144   786432      Y     Y    N"
                    echo "  98304 db2sysc        262144    25600   131072   393216      Y     Y    N"
                    echo "  65536 httpd          131072    12800    65536   196608      Y     N    N"
                    echo "  32768 sshd            65536     6400    32768    98304      Y     N    N"
                    echo "  16384 cron            32768     3200    16384    49152      N     N    N"
                    echo "   8192 syslogd         16384     1600     8192    24576      N     N    N"
                    echo "   4096 init             8192      800     4096    12288      N     N    N"
                    echo "   2048 syncd            4096      400     2048     6144      N     N    N"
                    echo "   1024 kproc            2048      200     1024     3072      N     N    N"
                    ;;
                *)
                    echo "               Pid Command          Inuse      Pin     Pgsp  Virtual 64-bit Mthrd 16MB"
                    echo "            315392 java           1048576   102400   524288  1572864      Y     Y    N"
                    echo "            262144 oracle         524288    51200   262144   786432      Y     Y    N"
                    ;;
            esac
            ;;
        *)
            echo "Usage: svmon { -G | -P [-t number] }"
            ;;
    esac
}

function lsps() {
    case "$1" in
        "-a")
            echo "Page Space      Physical Volume   Volume Group    Size %Used Active  Auto  Type Chksum"
            echo "paging00        hdisk0            rootvg        512MB    45   yes     yes    lv     no"
            echo "paging01        hdisk1            rootvg        512MB    23   yes     yes    lv     no"
            ;;
        "-s")
            echo "Total Paging Space   Percent Used"
            echo "      1024MB              34%"
            ;;
        *)
            echo "Page Space      Physical Volume   Volume Group    Size %Used Active  Auto  Type Chksum"
            echo "paging00        hdisk0            rootvg        512MB    45   yes     yes    lv     no"
            echo "paging01        hdisk1            rootvg        512MB    23   yes     yes    lv     no"
            ;;
    esac
}

# =============================================================================
# FILE SYSTEM MANAGEMENT COMMANDS
# =============================================================================

function fsck() {
    if [ -z "$1" ]; then
        echo "Usage: fsck device"
        return 1
    fi
    
    case "$1" in
        "/dev/hd"*|"/dev/lv"*)
            echo "** Checking $1"
            echo "** Phase 1 - Check Blocks and Sizes"
            echo "** Phase 2 - Check Pathnames"
            echo "** Phase 3 - Check Connectivity"
            echo "** Phase 4 - Check Reference Counts" 
            echo "** Phase 5 - Check Cylinder Groups"
            echo ""
            echo "filesys: FILESYSTEM IS CLEAN"
            ;;
        *)
            echo "fsck: 0506-004 Cannot open $1: The file does not exist."
            return 1
            ;;
    esac
}

function mount() {
    if [ $# -eq 0 ]; then
        # Show mounted filesystems like lsfs
        lsfs
        return
    fi
    
    case "$1" in
        "-o")
            local options="$2"
            local device="$3"
            local mountpoint="$4"
            echo "mount: mounting $device on $mountpoint with options $options"
            ;;
        "/dev/"*)
            local device="$1"
            local mountpoint="$2"
            echo "mount: mounting $device on $mountpoint"
            ;;
        *)
            echo "Usage: mount [-o options] device mountpoint"
            return 1
            ;;
    esac
}

function mkfs() {
    case "$1" in
        "-V")
            local fstype="$2"
            local device="$3"
            if [ "$fstype" = "jfs2" ]; then
                echo "mkfs: Creating $fstype filesystem on $device"
                echo "Device $device:"
                echo "    Standard empty filesystem"
                echo "    4096 byte inodes, 4096 byte blocks"
                echo "    Filesystem size is 262144 (4096 byte) blocks"
                echo "    Superblock backups stored on blocks:"
                echo "        8193, 24577, 40961, 57345, 73729"
                echo ""
                echo "mkfs completed successfully."
            else
                echo "mkfs: Unknown filesystem type $fstype"
                return 1
            fi
            ;;
        *)
            echo "Usage: mkfs -V fstype device"
            ;;
    esac
}

function chfs() {
    case "$1" in
        "-a")
            local attr="$2"
            local mountpoint="$3"
            if [[ "$attr" == size=* ]]; then
                local size_change="${attr#size=}"
                echo "chfs: changing size of $mountpoint by $size_change"
                echo "Filesystem size changed successfully"
            else
                echo "chfs: changing attribute $attr for $mountpoint"
            fi
            ;;
        *)
            echo "Usage: chfs -a attribute=value filesystem"
            ;;
    esac
}

function crfs() {
    local vg_name=""
    local mount_point=""
    local size=""
    local fstype="jfs2"
    
    while [ $# -gt 0 ]; do
        case "$1" in
            "-v") fstype="$2"; shift 2 ;;
            "-g") vg_name="$2"; shift 2 ;;
            "-m") mount_point="$2"; shift 2 ;;
            "-a") 
                if [[ "$2" == size=* ]]; then
                    size="${2#size=}"
                fi
                shift 2 
                ;;
            *) shift ;;
        esac
    done
    
    echo "crfs: Creating $fstype filesystem"
    echo "    Volume Group: $vg_name"
    echo "    Mount Point: $mount_point" 
    echo "    Size: $size"
    echo "New File System size is 524288"
    echo "New file system created successfully."
}

# =============================================================================
# USER MANAGEMENT COMMANDS  
# =============================================================================

function lsuser() {
    case "$1" in
        "ALL"|"-a")
            echo "root id=0 pgrp=system groups=system,bin,sys,security,cron,audit,lp,mail home=/root shell=/usr/bin/ksh gecos=0000-Admin(0000) loginretries=0 pwdwarntime=0 account_locked=false minage=0 maxage=0 maxexpired=-1 minalpha=0 minother=0 mindiff=0 maxrepeats=8 minlen=0 histexpire=0 histsize=0 pwdchecks= dictionlist= fsize=2097151 cpu=-1 data=262144 stack=65536 core=2097151 rss=65536 nofiles=2000 fsize_hard=2097151 cpu_hard=-1 data_hard=262144 stack_hard=65536 core_hard=2097151 rss_hard=65536 nofiles_hard=2000 roles= auth1=SYSTEM auth2=NONE umask=022 expires=0 SYSTEM=compat or=REMOTE login=true su=true daemon=true admin=true sugroups=ALL admgroups= tpath=nosak ttys=ALL"
            echo ""
            echo "daemon id=1 pgrp=staff groups=staff home=/tmp shell=/usr/bin/false gecos=0000-uucp(0000) loginretries=0 pwdwarntime=0 account_locked=false"
            echo ""
            echo "bin id=2 pgrp=bin groups=bin home=/bin shell=/usr/bin/false gecos=0000-uucp(0000) loginretries=0 pwdwarntime=0 account_locked=false"
            ;;
        "-f")
            local username="$2"
            case "$username" in
                "root")
                    echo "root:"
                    echo "        id = 0"
                    echo "        pgrp = system"
                    echo "        groups = system,bin,sys,security,cron,audit,lp,mail"
                    echo "        shell = /usr/bin/ksh"
                    echo "        home = /root"
                    echo "        gecos = 0000-Admin(0000)"
                    echo "        loginretries = 0"
                    echo "        account_locked = false"
                    ;;
                *)
                    echo "lsuser: 3004-692 Cannot find the specified user $username."
                    return 1
                    ;;
            esac
            ;;
        *)
            echo "root daemon bin sys adm uucp guest nobody lpd oracle db2inst1"
            ;;
    esac
}

function mkuser() {
    local username="$1"
    if [ -z "$username" ]; then
        echo "Usage: mkuser username"
        return 1
    fi
    
    echo "Creating user account: $username"
    echo "3004-698 User ID Number $((1000 + RANDOM % 9000)) has been assigned to user $username."
    echo "3004-701 A group name $username has been assigned to user $username."
    echo "3004-704 A home directory /home/$username has been assigned to user $username."
    echo ""
    echo "User $username was created successfully."
}

function rmuser() {
    local username="$1"
    case "$1" in
        "-p")
            username="$2"
            echo "Removing user $username and all associated files..."
            echo "3004-697 User $username was deleted successfully."
            ;;
        *)
            if [ -z "$username" ]; then
                echo "Usage: rmuser [-p] username"
                return 1
            fi
            echo "Removing user $username..."
            echo "3004-697 User $username was deleted successfully."
            ;;
    esac
}

function chuser() {
    if [ $# -lt 2 ]; then
        echo "Usage: chuser attribute=value username"
        return 1
    fi
    
    local attr="$1"
    local username="$2"
    echo "Changing user attributes for $username: $attr"
    echo "3004-700 User $username was changed."
}

# =============================================================================
# PACKAGE MANAGEMENT COMMANDS
# =============================================================================

function lslpp() {
    case "$1" in
        "-L"|"-l")
            echo "  Fileset                      Level  State  Description"
            echo "  ----------------------------------------------------------------------------"
            echo "  bos.net.tcp.client         7.3.0.0    C  TCP/IP Client Support"
            echo "  bos.net.tcp.server         7.3.0.0    C  TCP/IP Server"
            echo "  bos.perf.tools             7.3.0.0    C  Base Performance Tools"
            echo "  bos.rte.libc               7.3.0.0    C  libc Library"
            echo "  bos.rte.libcfg             7.3.0.0    C  libcfg Library" 
            echo "  bos.adt.base               7.3.0.0    C  Base Application Development Toolkit"
            echo "  bos.adt.syscalls           7.3.0.0    C  System Calls Application Development Toolkit"
            echo "  xlC.rte                    16.1.0.1   C  IBM XL C/C++ Runtime for AIX"
            echo "  Java8_64.sdk               8.0.7.15   C  Java SDK 64-bit"
            echo "  openssh.base.client        8.1.102.0  C  Open Secure Shell Commands"
            ;;
        "-a")
            echo "  Fileset                      Level  State  Description"
            echo "  ----------------------------------------------------------------------------"
            echo "  bos.net.tcp.client         7.3.0.0    C  TCP/IP Client Support"
            echo "  bos.net.tcp.server         7.3.0.0    C  TCP/IP Server"
            echo "  bos.perf.tools             7.3.0.0    C  Base Performance Tools"
            ;;
        *)
            echo "Usage: lslpp { -L | -l | -a }"
            ;;
    esac
}

function installp() {
    case "$1" in
        "-a")
            shift
            local package="$1"
            if [ -z "$package" ]; then
                echo "Usage: installp -a package"
                return 1
            fi
            echo "Preparing to install $package..."
            echo ""
            echo "+-----------------------------------------------------------------------------+"
            echo "                    Pre-installation Verification..."
            echo "+-----------------------------------------------------------------------------+"
            echo "Verifying package $package"
            echo "Checking requisites..."
            echo "Installing $package..."
            echo ""
            echo "+-----------------------------------------------------------------------------+"
            echo "                         Installation Summary"
            echo "+-----------------------------------------------------------------------------+"
            echo "Name                        Level           Part        Event       Result"
            echo "-------------------------------------------------------------------------------"
            echo "$package                    1.0.0.0         USR         APPLY       SUCCESS"
            echo "$package                    1.0.0.0         ROOT        APPLY       SUCCESS"
            echo ""
            echo "Installation completed successfully."
            ;;
        "-u")
            echo "Updating all installed packages..."
            echo "No packages need updating."
            ;;
        *)
            echo "Usage: installp { -a package | -u }"
            ;;
    esac
}

# =============================================================================
# ADDITIONAL SYSTEM COMMANDS
# =============================================================================

function mkps() {
    case "$1" in
        "-s")
            local size="$2"
            local device="$3"
            if [ -z "$size" ] || [ -z "$device" ]; then
                echo "Usage: mkps -s size device"
                return 1
            fi
            echo "Creating paging space on $device with size $size"
            echo "New paging space created: paging$(printf "%02d" $((RANDOM % 10)))"
            ;;
        *)
            echo "Usage: mkps -s size device"
            ;;
    esac
}

function swapon() {
    local device="$1"
    if [ -z "$device" ]; then
        echo "Usage: swapon device"
        return 1
    fi
    echo "swapon: activating paging space $device"
}

function swapoff() {
    local device="$1"
    if [ -z "$device" ]; then
        echo "Usage: swapoff device"
        return 1
    fi
    echo "swapoff: deactivating paging space $device"
}

function traceroute() {
    local host="$1"
    if [ -z "$host" ]; then
        echo "Usage: traceroute host"
        return 1
    fi
    
    echo "traceroute to $host (192.168.1.100), 30 hops max, 40 byte packets"
    echo " 1  192.168.109.2 (192.168.109.2)  1.234 ms  1.123 ms  1.089 ms"
    echo " 2  10.0.0.1 (10.0.0.1)  12.345 ms  12.234 ms  12.123 ms"
    echo " 3  172.16.1.1 (172.16.1.1)  25.456 ms  25.345 ms  25.234 ms"
    echo " 4  $host (192.168.1.100)  45.678 ms  45.567 ms  45.456 ms"
}

echo "=========================================================="
echo "=== COMPREHENSIVE AIX COMMAND SIMULATION ENVIRONMENT ==="
echo "=========================================================="
echo "This simulates the complete AIX command set for training"
echo ""
echo "🔧 SYSTEM INFORMATION:"
echo "  oslevel, uname, prtconf, bootinfo, getconf"
echo ""
echo "💾 STORAGE MANAGEMENT:"
echo "  lspv, lsvg, lslv, lsfs, df (with all flags: -k,-m,-g,-i,-t)"
echo "  fsck, mount, mkfs, chfs, crfs (file system operations)"
echo ""
echo "💿 MEMORY & PAGING:"
echo "  svmon, lsps, mkps, swapon, swapoff"
echo ""
echo "👥 USER MANAGEMENT:"
echo "  lsuser, mkuser, rmuser, chuser"
echo ""
echo "📦 PACKAGE MANAGEMENT:"
echo "  lslpp, installp"
echo ""
echo "🖥️  DEVICE & HARDWARE:"
echo "  lscfg, lsdev, lsattr (with detailed flags)"
echo ""
echo "⚡ PROCESS & PERFORMANCE:"
echo "  ps, w, who, topas, nmon, vmstat, iostat, sar"
echo ""
echo "🌐 NETWORK COMMANDS:"
echo "  ifconfig, netstat, entstat, ping (full flag support)"
echo ""
echo "🔧 SERVICE MANAGEMENT:"
echo "  lssrc, startsrc, stopsrc (with groups and subsystems)"
echo ""
echo "🚨 ERROR REPORTING:"
echo "  errpt (with -a, -s, -j, -d flags)"
echo ""
echo "💡 USAGE EXAMPLES:"
echo "  lspv hdisk0          # Detailed physical volume info"
echo "  lsvg -l rootvg       # List logical volumes in VG"
echo "  lssrc -g tcpip       # List TCP/IP services"
echo "  errpt -a             # All error entries"
echo "  topas -i 5           # Performance monitor every 5 sec"
echo "  netstat -rn          # Routing table"
echo "  ps -ef               # All processes"
echo "  svmon -G             # Memory usage summary"
echo "  lsps -a              # List paging spaces"
echo "  lsuser -f root       # Show user details"
echo "  fsck /dev/hd4        # Check file system"
echo ""
echo "🎯 REMEMBER: Use 'source aix_simulation_comprehensive.sh'"
echo "📚 This simulates real AIX - NOT actual system!"
echo "=========================================================="


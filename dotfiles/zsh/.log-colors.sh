# Colors used for printing stuff - https://jonasjacek.github.io/colors/
export color_success=$'\e[48;2;0;175;95m\e[38;2;225;225;225m' # white on SpringGreen3
export color_info=$'\e[48;2;0;175;255m\e[38;2;225;225;225m' # white on DeepSkyBlue1
export color_warning=$'\e[48;2;255;215;0m\e[38;2;128;128;128m' # grey on Gold1
export color_error=$'\e[48;2;255;0;0m\e[38;2;225;225;225m' # white on red
export color_default=$'\033[0m'

export tag_success="${color_success} SUCCESS ${color_default}"
export tag_info="${color_info} INFO ${color_default}"
export tag_warning="${color_warning} WARNING ${color_default}"
export tag_error="${color_error} ERROR ${color_default}"
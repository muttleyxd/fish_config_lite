function swap
  argparse (fish_opt -s h -l help) -- $argv

  if test "$_flag_h"
    echo "swap - swap two files around"
    echo "  usage: swap 1 2"
    return
  end

  if test (count $argv) -ne 2
    echo "incorrect argument count, use --help for help message"
    return 1
  end

  mv $argv[1] $argv[1].bak
  mv $argv[2] $argv[1]
  mv $argv[1].bak $argv[2]
end

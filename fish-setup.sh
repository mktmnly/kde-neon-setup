!# /usr/bin/env fish

# Install Fisher #
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install Plugins #
fisher install jorgebucaran/autopair.fish
fisher install franciscolourenco/done
fisher install andreiborisov/sponge
fisher install IlanCosman/tide@v5

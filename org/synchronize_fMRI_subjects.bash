#!/bin/bash
echo $sid
echo old = $old_dir
echo new = $new_dir
rsync -aiv "$old_dir"/"$sid"/ppc/functionals/* "$new_dir"/"$sid"/ppc/
rsync -aiv "$old_dir"/"$sid"/fx/* "$new_dir"/"$sid"/fx/

#!/bin/bash
#
# ln - replacement for the Msys ln command that will actually
#		create hard or symbolic links instead of copying the file
#
#
LN=/usr/bin/ln

function print_usage()
{
	$LN --help
}

function print_version()
{
	echo "ln (Msys kludge) 99.99"
}

function make_symlink()
{
	local tgt=$1
	local lnk=$2

	local lnkdir=$(dirname -- $lnk)

	local ulnk=`readlink -f $lnk`
	local wlnk=`cygpath --windows $ulnk`
	pushd $lnkdir >/dev/null
		local utgt=`readlink -f $tgt`
		local wtgt=`cygpath --windows $tgt`
	popd >/dev/null
	if [ -d "$utgt" ]; then
		cmd /c "mklink /D $wlnk $wtgt" >/dev/null
	elif [ -e "$utgt" ]; then
		cmd /c "mklink $wlnk $wtgt" >/dev/null
	else
		echo "ln: unable to locate link target: $tgt" >&2
		exit 1
	fi
}


function make_hardlink()
{
	local tgt=$1
	local lnk=$2

	local lnkdir=$(dirname -- $lnk)

	local ulnk=`readlink -f $lnk`
	local wlnk=`cygpath --windows $ulnk`
	pushd $lnkdir >/dev/null
		local utgt=`readlink -f $tgt`
		local wtgt=`cygpath --windows $tgt`
	popd >/dev/null
	if [ -d "$utgt" ]; then
		echo "ln: unable to create hardlink to directory: $tgt" >&2
		exit 1
	elif [ -e "$utgt" ]; then
		cmd /c "mklink /H $wlnk $wtgt" >/dev/null
	else
		echo "ln: unable to locate link target: $tgt" >&2
		exit 1
	fi
}


function getOPTARG()
{
	local i=$((OPTIDX+1))
	if [ $i -lt ${#OPTS[*]} ]; then
		OPTIDX=$i
		OPTARG=${OPTS[i]}
		if [ "-" = ${OPTARG:0:1} ]; then
			echo "Expected argument passed to $OPT" >&2
			exit 1
		fi
	else
		echo "Expected argument passed to $OPT" >&2
		exit 1
	fi
}


DIRECTORY=""
TARGET=""
LINK_NAME=""
opt_no_target_directory=""
opt_force=""
opt_interactive=""
opt_symbolic=""
opt_logical=""
opt_verbose=""
opt_version=""

OPTS=("$@")
OPTIDX=0
OPTARG=""
OPT=""


while [ $OPTIDX -lt ${#OPTS[*]} ]
do
	OPT=${OPTS[OPTIDX]}
	case "${OPT}" in
		-h | -help | --help | -\? )
			print_usage
			exit 0
			;;
		-V | --version )
			print_version
			exit 0
			;;
		-t | --target-directory )
			getOPTARG
			DIRECTORY=${OPTARG:-1}
			;;
		-t* )
			OPTARG=${OPT:2}
			DIRECTORY=${OPTARG:-1}
			;;
		--target-directory=* )
			OPTARG="${OPT#*=}"
			DIRECTORY=${OPTARG:-1}
			;;
		-f | --force )
			opt_force="--force"
			;;
		-i | --interactive )
			opt_interactive"--interactive"
			;;
		-s | --symbolic )
			opt_symbolic="--symbolic"
			;;
		-L | --logical )
			opt_logical="--logical"
			;;
		-v | --verbose )
			opt_verbose="--verbose"
			;;
		-T | --no-target-directory )
			opt_no_target_directory="--no-target-directory"
			;;
		--* )
			# catch any other double dash
			print_usage
			exit 1
			;;
		-* )
			ZOPTS="${OPT:1}"
			while [ -n "$ZOPTS" ]
			do
				ZOPT="${ZOPTS:0:1}"
				ZOPTS="${ZOPTS:1}"
				#echo "ZOPTS=$ZOPTS"
				#echo "ZOPT=$ZOPT"
				case "$ZOPT" in
				v )
					opt_verbose="--verbose"
					;;
				s )
					opt_symbolic="--symbolic"
					;;
				f )
					opt_force="--force"
					;;
				i )
					opt_interactive="--interactive"
					;;
				L )
					opt_logical="--logical"
					;;
				T )
					opt_no_target_directory="--no-target-directory"
					;;
				* )
					print_usage
					exit 1
					;;
				esac
			done
			;;
		*)
			if [ -n "$DIRECTORY" ]; then
				TARGET+=" $OPT"
			elif [ -z "$TARGET" ]; then
				TARGET="$OPT"
			elif [ -z "$LINK_NAME" ]; then
				LINK_NAME="$OPT"
			else
				echo "ln: too many arguments" >&2
				print_usage
				exit 1
			fi
			;;
	esac
	OPTIDX=$((OPTIDX+1))
done

#echo "DIRECTORY=$DIRECTORY"
#echo "TARGET=$TARGET"
#echo "LINK_NAME=$LINK_NAME"
#echo "$opt_symbolic $opt_force $opt_verbose $opt_no_target_directory"

if [ -n "$DIRECTORY" ]; then
	if [ -n "$TARGET" ]; then
		mkdir -p $DIRECTORY
		for t in $TARGET
		do
			f=${t##*/}
			[ -n "$opt_force" ]  &&  rm -f $DIRECTORY/$f
			if [ -n "$opt_symbolic" ]; then
				[ -n "$opt_verbose" ]  &&  echo "ln: creating symbolic link: $DIRECTORY/$f to $t"
				make_symlink "$t" "$DIRECTORY/$f"
			else
				[ -n "$opt_verbose" ]  &&  echo "ln: creating link: $DIRECTORY/$f to $t"
				make_hardlink "$t" "$DIRECTORY/$f"
			fi
		done
	else
		echo "ln: missing TARGET argument" >&2
		echo "  please see: ln --help" >&2
		exit 1
	fi
elif [ -n "$TARGET"  -a  -n "$LINK_NAME" ]; then
	[ -n "$opt_force" ]  &&  rm -f $LINK_NAME
	if [ -n "$opt_symbolic" ]; then
		[ -n "$opt_verbose" ]  &&  echo "ln: creating symbolic link: $LINK_NAME to $TARGET"
		make_symlink "$TARGET" "$LINK_NAME"
	else
		[ -n "$opt_verbose" ]  &&  echo "ln: creating link: $LINK_NAME to $TARGET"
		make_hardlink "$TARGET" "$LINK_NAME"
	fi
else
	echo "ln: missing argument" >&2
	echo "  please see: ln --help" >&2
	exit 1
fi

exit 0

#Functions
function psql
{
 
    # -E                        use integrated authentication
    # -S $1						first arg Server 
	# -d $2 					second args Database
	# --row-limit				
	# -Q "SET NOCOUNT ON; $3"	Query, don't print rows affected, third arg is query
    
    sqlcmd -E -S "$1" -d "$2" -Q "$3";
}

#Set upstream branch
function  gsetu 
{
	echo "Hello\n"
	 local current_branch=$(gcb)
	  echo "Current branch: $current_branch\n"
	 local upstream_branch="origin/$current_branch"
	  echo "upstream branch: $upstream_branch\n"
	 git branch --set-upstream-to="$upstream_branch" "$current_branch"
}

#Functions
function sql 
{
 
    # -S $1						first arg Server 
	# -d $2 					second args Database
	# -Q "SET NOCOUNT ON; $3"	Query, don't print rows affected, third arg is query
    
    mssql-cli -U $SQLCMDUSER -P $SQLCMDPASSWORD -S "$1" -d "$2";
}

function gitbn()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}

#Set upstream branch
function  gitsb 
{
	echo "Hello\n"
	 local current_branch=$(gcb)
	  echo "Current branch: $current_branch\n"
	 local upstream_branch="origin/$current_branch"
	  echo "upstream branch: $upstream_branch\n"
	 git branch --set-upstream-to="$upstream_branch" "$current_branch"
}

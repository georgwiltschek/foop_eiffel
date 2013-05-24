note
	description: "Summary description for {BANKACCOUNT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class BANKACCOUNT
	feature
		balance: DOUBLE
		owner:   STRING

	feature
	    make (owner: STRING)

#Textmerge 

A custom tool that I use to generate reptitive config files from either an input file or generated questions.


Installation
------------
▸       gem install textmerge


Help output
-----------

SYNOPSIS

* textmerge help [COMMAND]                 # Describe available commands or one specific command
* textmerge merge -t, --template=TEMPLATE  # Merge input with your custom template
* textmerge version                        # Version of Textmerge


Merge Command
-------------

DESCRIPTION

This utility will take a template that you have created with certain fields that are used to merge in data. 
Format for fields are as follows : 
{1:Question}..., then you can have other areas in the 
document that replace the same data using {1}.

EXAMPLE TEMPLATE
	
This is the text for your template.  You can include anything. 
{1:What is your name}.  Great, {1}...now I know your name.
I can see that you live in {2:Where do you live}.  {2} is a great place to live.


EXAMPLE INPUT FILE

1:Chris<br/>
2:Mountain View, Ca.

**If no input file is provided, then you are prompted with each question individually, in order**

GLOBAL OPTIONS

	-t, --template=Template		#path to your template (required)
	-i, --input=Input File		#path to your input file for preloading data 
								(optional, will prompt for answers otherwise)
	-o, --output=Output File	#


Sample Usage
------------

    textmerge merge -t template.txt



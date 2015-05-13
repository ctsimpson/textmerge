#Textmerge 

A custom tool to generate reptitive config files from either an input file or generated questions.


Installation
------------

▸       gem install textmerge


Need to Install Rubygems?
-------------------------

https://rubygems.org/pages/download

1. Download from http://production.cf.rubygems.org/rubygems/rubygems-2.4.6.tgz or download most recent version from above link
2. Unpack into a directory and cd there `tar -xzvf rubygems-2.4.6.tgz`
3. Install with: ruby setup.rb (you may need admin/root privilege)

Help output
-----------

SYNOPSIS

* textmerge help [COMMAND]                 # Describe available commands or one specific command
* textmerge merge -t, --template=TEMPLATE  # Merge input with your custom template
* textmerge version                        # Version of Textmerge


Merge Command
-------------

DESCRIPTION

>This utility will take a template that you have created with certain fields that are used to merge in data. 
Format for fields are as follows : 
`{1:Question}`, then you can have other areas in the document that replace the same data using `{1:}`.

EXAMPLE TEMPLATE
	
    This is the text for your template.  You can include anything. 
    {1:What is your name}.  Great, {1:}...now I know your name.
    I can see that you live in {2:Where do you live}.  {2:} is a great place to live.


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

Basic Usage

    textmerge merge -t template.txt
    
Using an input file and specifying an output file

    textmerge merge -t template.txt -i inputfile.txt -o outputfile.txt



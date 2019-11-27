import json
import click

"""
Injest FRESH Formatted JSON File
Validate JSON Vailidity
Validate Conformancce to FRESH Schema
Validate Data Actually Makes sense
Copy the strategies used by HackMyResumec
"""

@click.command()
@click.argument('finput', type=click.File('rb'))
@click.argument('foutput', type=click.File('wb'))
def inout(finput, foutput):
    while True:
        chunk = finput.read(1024)
        if not chunk:
            break
        output.write(chunk)

if __name__=="__main__":
    main()

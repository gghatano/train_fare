#!/usr/local/bin/python

## usage: ./scrape.py inputHtmlFile.html

## input: htmls file A**.html
## output: urls of each train-line

from bs4 import BeautifulSoup
import urllib2
import sys

argvs = sys.argv
print argvs[1]

opener = urllib2.build_opener()
html = open(argvs[1]).read().encode('utf-8', 'ignore')

soup = BeautifulSoup(html)

for congestion in  soup.find_all('div', class_="congestionLink"):
  print congestion.find('a').get('href')



#!/usr/bin/env python
#
# this script checks, before a git commit, if there are some files left which are needed for the
# pdfLaTeX run but are not yet added to the git repository
#
# Stefan Stonjek
# 2012-10-25
#

import os,sys,re,subprocess,string

def gitStatus(repoDir):
    cmd = 'git status --porcelain -uall'
    pipe = subprocess.Popen(cmd, shell=True, cwd=repoDir, stdout = subprocess.PIPE, stderr = subprocess.PIPE )
    (out, error) = pipe.communicate()
    pipe.wait()
    return (out, error)

def gitAdd(repoDir,filename):
    cmd = 'git add ' + filename
    pipe = subprocess.Popen(cmd, shell=True, cwd=repoDir, stdout = subprocess.PIPE, stderr = subprocess.PIPE )
    (out, error) = pipe.communicate()
    pipe.wait()
    return (out, error)

def get_untracked_files():
    untracked_files = []
    (out, error) = gitStatus(".")
    lines = out.splitlines()
    for line in lines:
        if line.split()[0] == "??":
            untracked_files.append(line.split()[1])
    return untracked_files

def generate_used_file_list():
    logfile = open("FBR_Bericht_2025.log", 'r', encoding='utf8', errors='ignore')
    data = logfile.read().replace('\n', '').replace('\r', '')
    
    pat = "\./([^\(\)\>\<]*\.tex)"
    tex_file_list = re.findall(pat,data)

    pat = "<use ([^\(\)\>\<]*\.[jpg|png])"
    picture_file_list = re.findall(pat,data)

    pat = "<use ([^\(\)\>\<]*\.pdf)"
    file_list = re.findall(pat,data)
    figure_file_list = []
    for file in file_list:
        pdf_file = file
        eps_file = os.path.splitext(file)[0]+".eps"
        if os.path.isfile(eps_file):
            figure_file_list.append(eps_file)
        else:
            figure_file_list.append(pdf_file)

    used_file_list = tex_file_list + picture_file_list + figure_file_list
    return used_file_list

def main():
    untracked_files = get_untracked_files()
    used_files = generate_used_file_list()
    files_to_add = []
    for file in used_files:
        if file in untracked_files:
            files_to_add.append(file)
    if len(files_to_add) > 0:
        for file in files_to_add:
            gitAdd(".",file)
            print("Added " + file + " to your local git repository")
        return 1

if ( __name__ == "__main__" ):
    sys.exit(main())


#!/usr/bin/env python3

from src.instainfo import instainfo
import argparse
from src import printcolors as pc
from src import artwork
import sys
import signal
import os

is_windows = False

try:
    import gnureadline
except:
    is_windows = True
    import pyreadline

os.system("clear")
def printlogo():
    pc.printout(artwork.ascii_art, pc.YELLOW)
    pc.printout("\nVersion 4.0 - Develops By Waseem Akram\n\n", pc.YELLOW)
    pc.printout("Type 'list' to show all allowed commands\n")
    pc.printout("Type 'FILE=y' to save results to files like '<target username>_<command>.txt (default is disabled)'\n")
    pc.printout("Type 'FILE=n' to disable saving to files'\n")
    pc.printout("Type 'JSON=y' to export results to a JSON files like '<target username>_<command>.json (default is "
                "disabled)'\n")
    pc.printout("Type 'JSON=n' to disable exporting to files'\n")


def cmdlist():
    pc.printout("FILE=y/n\t")
    print("Enable/disable output in a '<target username>_<command>.txt' file'")
    pc.printout("JSON=y/n\t")
    print("Enable/disable export in a '<target username>_<command>.json' file'")
    pc.printout("addrs\t\t")
    print("Get all registered addressed by target photos")
    pc.printout("cache\t\t")
    print("Clear cache of the tool")
    pc.printout("captions\t")
    print("Get target's photos captions")
    pc.printout("commentdata\t")
    print("Get a list of all the comments on the target's posts")
    pc.printout("comments\t")
    print("Get total comments of target's posts")
    pc.printout("followers\t")
    print("Get target followers")
    pc.printout("followings\t")
    print("Get users followed by target")
    pc.printout("followersemail\t")
    print("Get email of target followers")
    pc.printout("followingsemail\t")
    print("Get email of users followed by target")
    pc.printout("followersnumber\t")
    print("Get phone number of target followers")
    pc.printout("followingsnumber\t")
    print("Get phone number of users followed by target")    
    pc.printout("hashtags\t")
    print("Get hashtags used by target")
    pc.printout("info\t\t")
    print("Get target info")
    pc.printout("likes\t\t")
    print("Get total likes of target's posts")
    pc.printout("mediatype\t")
    print("Get target's posts type (photo or video)")
    pc.printout("photodes\t")
    print("Get description of target's photos")
    pc.printout("photos\t\t")
    print("Download target's photos in output folder")
    pc.printout("propic\t\t")
    print("Download target's profile picture")
    pc.printout("stories\t\t")
    print("Download target's stories")
    pc.printout("tagged\t\t")
    print("Get list of users tagged by target")
    pc.printout("target\t\t")
    print("Set new target")
    pc.printout("whocommented\t")
    print("Get a list of user who commented target's photos")
    pc.printout("whotagged\t\t")
    print("Get a list of user who tagged target")


def signal_handler(sig, frame):
    pc.printout("\nThanks For Using Instainfo. Bye..!\n", pc.RED)
    sys.exit(0)


def completer(text, state):
    options = [i for i in commands if i.startswith(text)]
    if state < len(options):
        return options[state]
    else:
        return None

def _quit():
    pc.printout("Thanks For Using Instainfo. Bye..!\n", pc.RED)
    sys.exit(0)


signal.signal(signal.SIGINT, signal_handler)
if is_windows:
    pyreadline.Readline().parse_and_bind("tab: complete")
    pyreadline.Readline().set_completer(completer)
else:
    gnureadline.parse_and_bind("tab: complete")
    gnureadline.set_completer(completer)

parser = argparse.ArgumentParser(description='instainfo is a OSINT tool on Instagram. It offers an interactive shell '
                                             'to perform analysis on Instagram account of any users by its nickname ')
parser.add_argument('id', type=str,  # var = id
                    help='username')
parser.add_argument('-C','--cookies', help='clear\'s previous cookies', action="store_true")
parser.add_argument('-j', '--json', help='save commands output as JSON file', action='store_true')
parser.add_argument('-f', '--file', help='save output in a file', action='store_true')
parser.add_argument('-c', '--command', help='run in single command mode & execute provided command', action='store')
parser.add_argument('-o', '--output', help='where to store photos', action='store')

args = parser.parse_args()


api = instainfo(args.id, args.file, args.json, args.command, args.output, args.cookies)



commands = {
    'list':             cmdlist,
    'help':             cmdlist,
    'quit':             _quit,
    'exit':             _quit,
    'addrs':            api.get_addrs,
    'cache':            api.clear_cache,
    'captions':         api.get_captions,
    "commentdata":      api.get_comment_data,
    'comments':         api.get_total_comments,
    'followers':        api.get_followers,
    'followings':       api.get_followings,
    'followersemail':       api.get_fwersemail,
    'followingsemail':      api.get_fwingsemail,
    'followersnumber':      api.get_fwersnumber,
    'followingsnumber':     api.get_fwingsnumber,
    'hashtags':         api.get_hashtags,
    'info':             api.get_user_info,
    'likes':            api.get_total_likes,
    'mediatype':        api.get_media_type,
    'photodes':         api.get_photo_description,
    'photos':           api.get_user_photo,
    'propic':           api.get_user_propic,
    'stories':          api.get_user_stories,
    'tagged':           api.get_people_tagged_by_user,
    'target':           api.change_target,
    'whocommented':       api.get_people_who_commented,
    'whotagged':          api.get_people_who_tagged
}


signal.signal(signal.SIGINT, signal_handler)
if is_windows:
    pyreadline.Readline().parse_and_bind("tab: complete")
    pyreadline.Readline().set_completer(completer)
else:
    gnureadline.parse_and_bind("tab: complete")
    gnureadline.set_completer(completer)

if not args.command:
    printlogo()


while True:
    if args.command:
        cmd = args.command
        _cmd = commands.get(args.command)
    else:
        signal.signal(signal.SIGINT, signal_handler)
        if is_windows:
            pyreadline.Readline().parse_and_bind("tab: complete")
            pyreadline.Readline().set_completer(completer)
        else:
            gnureadline.parse_and_bind("tab: complete")
            gnureadline.set_completer(completer)
        pc.printout("Run a command: ", pc.YELLOW)
        cmd = input()

        _cmd = commands.get(cmd)

    if _cmd:
        _cmd()
    elif cmd == "FILE=y":
        api.set_write_file(True)
    elif cmd == "FILE=n":
        api.set_write_file(False)
    elif cmd == "JSON=y":
        api.set_json_dump(True)
    elif cmd == "JSON=n":
        api.set_json_dump(False)
    elif cmd == "":
        print("")
    else:
        pc.printout("Unknown command\n", pc.RED)

    if args.command:
        break

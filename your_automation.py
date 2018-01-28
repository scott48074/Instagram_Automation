import csv
import json
from random import shuffle
from instapy import InstaPy

def open_config(path):
    with open(path) as data:
        conf = json.load(data)
        return [conf['user_name'], conf['password']]

def open_csv(path):
    # Open CSV each row[0] is an item put into a list().
    # Remove white space and duplicates.
    with open(path, 'r') as f:
        reader = csv.reader(f)
        item_list = [row[0].strip() for row in reader]
        item_list = list(set(item_list))
        # print(item_list)
    return item_list


def run(insta_username, insta_password, followers, tags, unwanted_tags):
    session = InstaPy(username=insta_username, password=insta_password)
    session.login()

    # set up all the settings
    session.set_ignore_users(followers)
    session.set_dont_like(unwanted_tags)

    # do the actual liking
    session.like_by_tags(tags, amount=20)

    # end the bot session
    session.end()


def main():
    followers = open_csv('followers.csv')
    tags = open_csv('tags.csv')
    unwanted_tags = open_csv('unwanted_tags.csv')
    creds = open_config('config.json')
    shuffle(tags)
    run(creds[0], creds[1], followers, tags, unwanted_tags)


if __name__ == '__main__':
    main()

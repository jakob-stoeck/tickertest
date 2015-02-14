from subprocess import Popen, PIPE
import re

GIT_COMMIT_FIELDS = ['id', 'author_name', 'author_email', 'date', 'message']
GIT_LOG_FORMAT = ['@@@', '%H', '%an', '%ae', '%ad', '%s']

GIT_LOG_FORMAT = '%x1f'.join(GIT_LOG_FORMAT) + '%x1e'

p = Popen('git ls-files', shell=True, stdout=PIPE)
(files, _) = p.communicate()


for f in files.split("\n"):
	p = Popen('git log -p --format="%s" -- %s' % (GIT_LOG_FORMAT, f), shell=True, stdout=PIPE)
	(log, _) = p.communicate()
	log = log.strip('\n\x1e').split("\x1e")
	log = [row.strip().split("\x1f") for row in log]
	# log = [dict(zip(GIT_COMMIT_FIELDS, row)) for row in log]


# print(log)

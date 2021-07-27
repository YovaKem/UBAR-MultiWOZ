import json
import sys

model = sys.argv[1]

informable_slots = {
    "taxi": ["leave", "destination", "departure", "arrive"],
    "police": [],
    "hospital": ["department"],
    "hotel": ["type", "parking", "pricerange", "internet", "stay", "day", "people", "area", "stars", "name"],
    "attraction": ["area", "type", "name"],
    "train": ["destination", "day", "arrive", "departure", "people", "leave"],
    "restaurant": ["food", "pricerange", "area", "name", "time", "day", "people"]
}


def parse_kv(kw, kv):
  dico = {}
  kv = kv.split()
  v = []
  k = None
  for w in kv:
    if w in kw:
      if len(v) and k is not None:
        dico[k] = ' '.join(v)
        v = []
        k = None
      k = w
    else:
      v.append(w)
  if len(v) and k is not None:
        dico[k] = ' '.join(v)
  return dico


out_file = open("{}_tomii.json".format(model), 'w')
dials = {}
in_file = json.load(open("{}.json".format(model)))
for turn in in_file:
  formatted_turn = {}
  if 'trun_num' in turn:
    dial_id = turn['dial_id']
    dials[dial_id] = []
    prev_turn = -1
    continue
  assert prev_turn + 1 == turn['turn_num']
  assert turn['dial_id'] == dial_id
  prev_turn += 1 
  
  formatted_turn['response'] = turn['resp_gen']
  formatted_turn['state'] = {}
  bs = turn['bspn_gen']
  if len(bs.strip()):
    bs = bs[1:].strip().split(' [')
    for bs_ in bs:
      try:
        dom, kv = bs_.strip().split('] ')
      except:
        dom = bs_.replace(']', '').strip()
        formatted_turn['state'][dom] = {}
        print('Solo domain', dom)
        continue
      try:
        kv = parse_kv(informable_slots[dom], kv)
        formatted_turn['state'][dom] = kv
      except: 
        print('Failed at parsing', bs_)
  dials[dial_id].append(formatted_turn)

json.dump(dials, out_file)
  

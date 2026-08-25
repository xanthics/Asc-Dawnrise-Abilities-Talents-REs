with open("dusk_all.csv", 'r') as f:
    dusk = f.readlines()
with open("dawn_ability_talent.csv", 'r') as f:
    dawn = f.readlines()
    dawn_ids = [x.split(',')[4] for x in dawn]
with open("dawn_RE.csv", 'r') as f:
    dawn_RE = f.readlines()
REs = []
dusk_ability = []
dusk_talent = []
for i in dawn_RE:
    REs.append(i.split(',')[1])
for i in dusk.copy():
    i_s = i.split(',')
    if i_s[2].lower() == "talent":
        dusk_talent.append(i)
    elif i_s[2].lower() == "ability":
        dusk_ability.append(i)
    else:
        print("Rogue entry:", i)
    if i_s[4] in dawn_ids or i_s[3] in REs:
        del dusk[dusk.index(i)]

with open('dawn_missing.csv', 'w') as f:
    f.write('Class,Tab,Type,Name,ID,Description,RequiredLevel,RequiredClassAEInvestment,RequiredTabAEInvestment,RequiredClassPoints,RequiredAEInvestment,RequiredClassTEInvestment,RequiredTabTEInvestment,RequiredTEInvestment\n')
    f.write(''.join(dusk))

with open('dusk_talent.csv', 'w') as f:
    f.write('Class,Tab,Type,Name,ID,Description,RequiredLevel,RequiredClassAEInvestment,RequiredTabAEInvestment,RequiredClassPoints,RequiredAEInvestment,RequiredClassTEInvestment,RequiredTabTEInvestment,RequiredTEInvestment\n')
    f.write(''.join(dusk_talent))

with open('dusk_ability.csv', 'w') as f:
    f.write('Class,Tab,Type,Name,ID,Description,RequiredLevel,RequiredClassAEInvestment,RequiredTabAEInvestment,RequiredClassPoints,RequiredAEInvestment,RequiredClassTEInvestment,RequiredTabTEInvestment,RequiredTEInvestment\n')
    f.write(''.join(dusk_ability))

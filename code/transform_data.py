import sys

lines=sys.argv[1]
lines=int(lines)

dic={}

f=open(sys.argv[2],'r+')

for i in range(0,lines):
	tmp=f.readline().split()
	j=2
	l=len(tmp)
	while j<l:
		if not tmp[j] in dic:
			dic[tmp[j]]=1
		j+=2


lis=dic.keys()
length=len(lis)
print "length ", length
f.seek(0)
w=open(sys.argv[2]+'.x','w')
w1=open(sys.argv[2]+'.y','w')
for i in range(0,lines):
	tmp=f.readline().split()
	if tmp[1]=='spam':
		w1.write('-1\n')
	else:
		w1.write('1\n')
	tmpdic={}
	p=len(tmp)
	l=2
	while l<p:
		if tmp[l] in tmpdic:
			tmpdic[tmp[l]]+=int(tmp[l+1])
		else:
			tmpdic[tmp[l]]=int(tmp[l+1])
		l+=2

	l=0
	st=''
	while l<length-1:
		if lis[l] in tmpdic:
			st+=str(tmpdic[lis[l]])+' '
		else:
			st+='0 '
		l+=1
	if lis[l] in tmpdic:
			st+=str(tmpdic[lis[l]])
	else:
			st+='0'
	st+='\n'
	w.write(st);

f.close()
w.close()
w1.close()
lines=sys.argv[3]
print lines
lines=int(lines)
f=open(sys.argv[4],'r')
w=open(sys.argv[4]+'.x','w')
w1=open(sys.argv[4]+'.y','w')

for i in range(0,lines):
	tmp=f.readline().split()
	if tmp[1]=='spam':
		w1.write('-1\n')
	else:
		w1.write('1\n')
	tmpdic={}
	p=len(tmp)
	l=2
	while l<p:
		if tmp[l] in tmpdic:
			tmpdic[tmp[l]]+=int(tmp[l+1])
		else:
			tmpdic[tmp[l]]=int(tmp[l+1])
		l+=2

	l=0
	st=''
	print "length a ",length
	while l<length-1:
		if lis[l] in tmpdic:
			st+=str(tmpdic[lis[l]])+' '
		else:
			st+='0 '
		l+=1
	if lis[l] in tmpdic:
			st+=str(tmpdic[lis[l]])
	else:
			st+='0'
	st+='\n'
	w.write(st);
f.close()
w.close()
w1.close()
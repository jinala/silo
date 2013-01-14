CXXFLAGS := -Wall -g -O2
LDFLAGS  := -lpthread 

HEADERS = btree.h macros.h rcu.h static_assert.h thread.h txn.h txn_btree.h varkey.h util.h
SRCFILES = btree.cc rcu.cc test.cc thread.cc txn.cc txn_btree.cc
OBJFILES = $(SRCFILES:.cc=.o)

all: test

%.o: %.cc $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

test: $(OBJFILES) 
	$(CXX) $(CXXFLAGS) -o test $^ $(LDFLAGS)

.PHONY: clean
clean:
	rm -f *.o test

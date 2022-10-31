# compile flags
OUT		= cv.pdf
ARGS	= -Tpdf -m cv

# redact sensitive info
REDACTED_VARS	= ad r1 r2
REDACTED_MSG	= [redacted-sensitive]
REDACTED_ARGS	= $(addprefix -d, $(addsuffix =$(REDACTED_MSG), $(REDACTED_VARS)))

# by default, make redacted version
default: redacted 

.PHONY: redacted full clean

# use redacted args
redacted: cv.trf 
	groff $(ARGS) $(REDACTED_ARGS) $^ > $(OUT)

# include sensitive file
full: sens.trf cv.trf 
	groff $(ARGS) $^ > $(OUT)

# remove created files
clean:
	rm $(OUT) 

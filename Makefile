ROOT_PATH = .

td-build:
	$(MAKE) -C $(ROOT_PATH)/td all

ds-build:
	$(MAKE) -C $(ROOT_PATH)/ds all

td-clean:
	$(MAKE) -C $(ROOT_PATH)/td clean-all

ds-clean:
	$(MAKE) -C $(ROOT_PATH)/ds clean-all

all: td-build ds-build

clean-all: td-clean ds-clean

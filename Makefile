
all: clean pkg pod gen-code run

gen-code:
	@flutter packages pub run build_runner build --delete-conflicting-outputs

pkg:
	flutter packages get

pod:
	@(cd ios && pod deintegrate && pod cache clean --all && pod install)

run:
	flutter run

upgrade:
	mv .packages .packages.bak	
	(cd "$(which flutter)" && git remote add origin https://github.com/flutter/flutter && flutter upgrade --force)

clean:
	flutter clean


.PHONY: gen_code run upgrade clean pod all

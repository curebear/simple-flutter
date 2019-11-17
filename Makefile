
all: clean pkg pod gen-code run

gen-code:
	flutter packages pub run build_runner build --delete-conflicting-outputs

pkg:
	flutter packages get

pod:
	@(cd ios && pod deintegrate && pod cache clean --all && pod install)

run:
	flutter run

upgrade:	
	flutter upgrade --force

clean:
	flutter clean


.PHONY: gen-code pkg pod run upgrade clean all

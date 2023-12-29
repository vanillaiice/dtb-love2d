ver := 0.2.3

run:
	love src/

zip:
	mkdir -p dist/
	cd src && zip -9 -r ../dist/dtb-${ver}.love .

win64: zip
	mkdir -p dist/win64/
	rm dist/win64/*
	cp love/love-11.5-win64/{SDL2.dll,OpenAL32.dll,license.txt,love.dll,lua51.dll,mpg123.dll,msvcp120.dll,msvcr120.dll,love.ico} dist/win64/
	cat love/love-11.5-win64/love.exe dist/dtb-${ver}.love > dist/win64/dtb-${ver}-64-bit.exe
	cd dist/win64/ && zip -9 -r ../dtb-${ver}-win64.zip .

win32: zip
	mkdir -p dist/win32/
	rm dist/win32/*
	cp love/love-11.5-win32/{SDL2.dll,OpenAL32.dll,license.txt,love.dll,lua51.dll,mpg123.dll,msvcp120.dll,msvcr120.dll,love.ico} dist/win32/
	cat love/love-11.5-win32/love.exe dist/dtb-${ver}.love > dist/win32/dtb-${ver}-32-bit.exe
	cd dist/win32/ && zip -9 -r ../dtb-${ver}-win32.zip .

all: zip win64 win32

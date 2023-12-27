run:
	love .

zip:
	mkdir -p ../dist/
	zip -9 -r ../dist/dtb.love .

win64: zip
	mkdir -p ../dist/win64/
	cp ../love/love-11.5-win64/{SDL2.dll,OpenAL32.dll,license.txt,love.dll,lua51.dll,mpg123.dll,msvcp120.dll,msvcr120.dll,love.ico} ../dist/win64/
	cat ../love/love-11.5-win64/love.exe ../dist/dtb.love > ../dist/win64/dtb-64-bit.exe

win32: zip
	mkdir -p ../dist/win32/
	cp ../love/love-11.5-win32/{SDL2.dll,OpenAL32.dll,license.txt,love.dll,lua51.dll,mpg123.dll,msvcp120.dll,msvcr120.dll,love.ico} ../dist/win32/
	cat ../love/love-11.5-win32/love.exe ../dist/dtb.love > ../dist/win32/dtb-32-bit.exe

all: zip win64 win32

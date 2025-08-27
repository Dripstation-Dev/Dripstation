/datum/controller/subsystem/ticker/proc/choose_lobby_music()
	//Add/remove songs from this list individually, rather than multiple at once. This makes it easier to judge PRs that change the list, since PRs that change it up heavily are less likely to meet broad support
	//Add a comment after the song link in the format [Artist - Name]
	var/list/songs = list(
		"https://www.youtube.com/watch?v=wuJIqmha2Hk", 						// Electric Light Orchestra - Mr. Blue Sky
		"https://www.youtube.com/watch?v=68ugkg9RePc", 						// Eiffel 65 - Blue
		"https://www.youtube.com/watch?v=Ae2N5310MXE",						// SolusLunes - Endless Space
		"https://www.youtube.com/watch?v=5KysITV4t5E",						// Endless Space 2 - Together to the Stars
		"https://www.youtube.com/watch?v=v7emdhDxS7g",						// Sins of a Solar Empire: Rebellion - Birth of the Coalition
		"https://www.youtube.com/watch?v=s29fcv5E52Y", 						// SAINT MOTEL - A Good Song Never Dies
		"https://www.youtube.com/watch?v=UPHmazxB38g", 						// MashedByMachines - Sector11
		"https://www.youtube.com/watch?v=MV_3Dpw-BRY",						// Kavinsky - Nightcall
		"https://www.youtube.com/watch?v=ETEg-SB01QY", 						// MGMT - Little Dark Age
		"https://www.youtube.com/watch?v=mXHKjFKBC0g", 						// Midge Ure - The Man Who Sold The World
		"https://www.youtube.com/watch?v=UaD4AiqYDyA", 						// X-CEED - Flip-Flap
		"https://www.youtube.com/watch?v=ljaTIhNm1MU", 						// Mareux - The Perfect Girl (Retrowave/Synthwave cover)
		"https://www.youtube.com/watch?v=jwIWJIdpNFs", 						// Izar - Born of a Star
		"https://www.youtube.com/watch?v=R5hCkh2AH58", 						// Helldivers 2 Main Theme - "A Cup Of Liber-Tea"
		"https://www.youtube.com/watch?v=puUXtxxYFwM", 						// Chris Nordgren - Frogs are Friends
		"https://www.youtube.com/watch?v=oFDjvsRPQts", 						// Invader 303 - The Long Voyage 
		"https://www.youtube.com/watch?v=SzEp2nv6oZ4", 						// Bolgarich - Running out
		"https://www.youtube.com/watch?v=HRsC2g79V3Y",						// Perturbator - Future Club
		"https://www.youtube.com/watch?v=abETp8Q6H8U",						// Perturbator - Venger
		"https://www.youtube.com/watch?v=ICjD3f-8SXE",						// iamthekidyouknowwhatimean - Run
		"https://www.youtube.com/watch?v=AVblOqZBlJw",						// M.O.O.N. - 'Crystals'
		"https://www.youtube.com/watch?v=9D-QD_HIfjA",						// Scarface - Push It To The Limit
		"https://www.youtube.com/watch?v=BnnbP7pCIvQ",						// Dawid Podsiadło - Let You Down
		"https://www.youtube.com/watch?v=CUsI3Dx0r4Y",						// Nautilus Pompilius - Chained by one chain
		"https://www.youtube.com/watch?v=icy4-CQHVh4", 						// Joseph "Zhaytee" Toscano - Absconditus
		"https://www.youtube.com/watch?v=Shr_pHoGr2M", 						// Franz Ferdinand - This fffire
		"https://www.youtube.com/watch?v=dCPWE4WexM8", 						// Hiroaki Yoshida, Hitomi Komatsu - Robocop Theme (Remix by Cboyardee)
		"https://www.youtube.com/watch?v=TCfBOG6YfF8", 						// Perturbator - technoir (feat. noir deco)
		"https://www.youtube.com/watch?v=BY-1SrsLER0", 						// Jeroen Tel - Tintin on the Moon  (Noisemaker's Remix)
		"https://www.youtube.com/watch?v=YKVmXn-Gv0M", 						// Jeroen Tel - Tintin on the Moon (Remix by Cuboos)
		"https://www.youtube.com/watch?v=GISnTECX8Eg",						// Chris Remo - Space Asshole
		"https://www.youtube.com/watch?v=a2eLupkFGTA",						// Sea Power - Fire Escape In The Sea
		"https://www.youtube.com/watch?v=Ye9hGotPPVk",						// Elton John - I'm Still Standing
		"https://www.youtube.com/watch?v=r-eMVfiT8_c",						// Kelly Bailey - Nuclear Missile Jam/Something Secret Steers Us (Remix)
		"https://www.youtube.com/watch?v=FdJxZ3ECwf8",						// Joel Nielsen - Forget About Freeman (Remix)
		"https://www.youtube.com/watch?v=qeMFqkcPYcg",						// Eurythmics - Sweet Dreams
		"https://www.youtube.com/watch?v=HyHNuVaZJ-k",						// Gorillaz - Feel Good Inc.
		"https://www.youtube.com/watch?v=9whQIbNmu9s",						// Admiral Hippie - Clown.wmv
		"https://www.youtube.com/watch?v=rowkJcfv5ks",						// Gary Lewis & the Playboys - Everybody Loves A Clown
		"https://www.youtube.com/watch?v=UlHGGKgzgzI",						// Elbow - Leaders of the Free World
		"https://www.youtube.com/watch?v=Igq3d6XA75Y",						// Cyberpunk 2077 — Chippin’ In by SAMURAI
		"https://www.youtube.com/watch?v=kmt8WmTenVE",						// Cyberpunk 2077 — Black Dog by SAMURAI
		"https://www.youtube.com/watch?v=LsS6VUdR4R0",						// Cyberpunk 2077 — Force Projection
		"https://www.youtube.com/watch?v=HgS6LBroGiU",						// Cyberpunk 2077 — Gate K9 (Ingame Version)
		"https://www.youtube.com/watch?v=AGsjA1pXajk",						// Cyberpunk 2077 — The Rebel Path (Cello Version)
		"https://www.youtube.com/watch?v=67BwWgrMlxk",						// Chris Christodoulou - Risk of Rain Coalescence
		"https://www.youtube.com/watch?v=SQOdPQQf2Uo",						// Star Trek The Motion Picture: Main Theme Album Style Edit
		"https://www.youtube.com/watch?v=jJDAV9vSmYc",						// Chris Remo - The Wizard
		"https://www.youtube.com/watch?v=J5dzq2womi0",						// Cheshyre - Madness 7
		"https://www.youtube.com/watch?v=4E9L9b_Ga2U",						// Lothyde -  Volgion
		"https://www.youtube.com/watch?v=GByrVWoL9pg",						// Lothyde -  Scuffled
		"https://www.youtube.com/watch?v=Bvrv0lQkaqM",						// Sea Power - Precinct 41 Major Crime Unit
		"https://www.youtube.com/watch?v=O4irXQhgMqg",						// The Rolling Stones - Paint It, Black
		"https://www.youtube.com/watch?v=51Uw-9lNl08",						// fIREHOSE - Brave Captain
		"https://www.youtube.com/watch?v=9YtxlSJ1Qng",						// Edvinas Kandrotas - Butterflies Dancing
		"https://www.youtube.com/watch?v=DCq9zTNL3To",						// Taitoki - I'm Alive
		"https://www.youtube.com/watch?v=ZhhQrFfzFM4",						// Carpenter Brut - Escape from Midwich Valley
		"https://www.youtube.com/watch?v=Bw8w2QxrISU",						// Mili - String Theocracy {Real_Instrumental/Off Vocal}
		"https://www.youtube.com/watch?v=5AI44gnaLxY",						// Little Barrie Official - Better Call Saul
		"https://www.youtube.com/watch?v=LEUwTBWkeas",						// Chris Christodoulou - Moisture Deficit
		"https://www.youtube.com/watch?v=fXvxnDmwB_I",						// Rain World THS - Action Scene
		"https://www.youtube.com/watch?v=YhptRMUIFfU",						// Chikoi The Maid - I'm Cool
		"https://www.youtube.com/watch?v=WniQSF9lEYs",						// Yakui the Maid - Calamity
		"https://www.youtube.com/watch?v=XcZArMwTCQ0",						// Yakui the Maid - Radiostalking
		"https://www.youtube.com/watch?v=uc6f_2nPSX8",						// Styx - Mr. Roboto
		"https://www.youtube.com/watch?v=ZrZcyQNGros",						// Vic Tyler - Space Hero
		"https://www.youtube.com/watch?v=0AlYQewkOLw",						// Leslie Fish - Minus Ten and Counting
		"https://www.youtube.com/watch?v=EZSTkunGczI",						// Julia Ecklar - Everyman
		"https://www.youtube.com/watch?v=uiPJQgw6M_g",						// Ribbiks - Chasing Suns
		"https://www.youtube.com/watch?v=dv13gl0a-FA",						// Super Eurobeat - Deja Vu
		"https://www.youtube.com/watch?v=VJ817kvh_DM",						// Ben Prunty - FTL - Theme Song
		"https://www.youtube.com/watch?v=-E2D2DXpZoc",						// Ben Prunty - FTL - Debris
		"https://www.youtube.com/watch?v=NK_nRSTPM0I",						// Ben Prunty - FTL - Colonial
		"https://www.youtube.com/watch?v=9KZFAkCQ3FU",						// Dido - thank you (Thunderstorm Remix Louder)
		"https://www.youtube.com/watch?v=52Gg9CqhbP8",  					// Stuck in the Sound - Let's G
		"https://www.youtube.com/watch?v=8GW6sLrK40k",						// HOME - Resonance
		"https://www.youtube.com/watch?v=8DNoXUnaQ9k",						// Chris Christodoulou - Dies Irae
		"https://www.youtube.com/watch?v=Nn9trJXUrp0",						// Chris Christodoulou - ...con lentitud poderosa
		"https://www.youtube.com/watch?v=rkas-NHQnsI",						// Clint Eastwood - Magnum Force Theme
		"https://www.youtube.com/watch?v=uYBO_Sk5YiE",						// DM Dokuro - The Tale of a Cruel World
		"https://www.youtube.com/watch?v=4q-La8uR0HU",						// Blinch - Loop Hero OST - Dark Matter Moon
		"https://www.youtube.com/watch?v=V52QTyn6e-A",						// Alistair Lindsay - RimWorld OST - Waiting For The Sun
		"https://www.youtube.com/watch?v=ztzq05IzYds",						// Guillaume David - Children of the Omnissiah
		"https://www.youtube.com/watch?v=4JkIs37a2JE",						// Jamiroquai - Virtual Insanity
		"https://www.youtube.com/watch?v=z01VlftkqY8",						// PilotRedSun - The Grinch's Ultimatum
		"https://www.youtube.com/watch?v=Cl5Vkd4N03Q",						// Mr.Kitty - After Dark
		"https://www.youtube.com/watch?v=iLC-tHvkNvI",						// Fleetwood Mac - The Chain (2004 Remaster)
		"https://www.youtube.com/watch?v=n2rVnRwW0h8",						// Cowboy Bebop OST - Tank!
		)
	selected_lobby_music = pick(songs)

	if(SSevents.holidays) // What's this? Events are initialized before tickers? Let's do something with that!
		for(var/holidayname in SSevents.holidays)
			var/datum/holiday/holiday = SSevents.holidays[holidayname]
			if(LAZYLEN(holiday.lobby_music))
				selected_lobby_music = pick(holiday.lobby_music)
				break

	var/ytdl = CONFIG_GET(string/invoke_youtubedl)
	if(!ytdl)
		to_chat(world, span_boldwarning("Youtube-dl was not configured."))
		log_world("Could not play lobby song because youtube-dl is not configured properly, check the config.")
		return

	var/list/output = world.shelleo("[ytdl] --geo-bypass --format \"bestaudio\[ext=mp3]/best\[ext=mp4]\[height<=360]/bestaudio\[ext=m4a]/bestaudio\[ext=aac]\" --dump-single-json --no-playlist -- \"[selected_lobby_music]\"")
	var/errorlevel = output[SHELLEO_ERRORLEVEL]
	var/stdout = output[SHELLEO_STDOUT]
	var/stderr = output[SHELLEO_STDERR]

	if(!errorlevel)
		var/list/data
		try
			data = json_decode(stdout)
		catch(var/exception/e)
			to_chat(src, span_boldwarning("Youtube-dl JSON parsing FAILED:"), confidential=TRUE)
			to_chat(src, span_warning("[e]: [stdout]"), confidential=TRUE)
			return
		if(data["title"])
			login_music_data["title"] = data["title"]
			login_music_data["url"] = data["url"]

	if(errorlevel)
		to_chat(world, span_boldwarning("Youtube-dl failed."))
		log_world("Could not play lobby song [selected_lobby_music]: [stderr]")
		return
	return stdout
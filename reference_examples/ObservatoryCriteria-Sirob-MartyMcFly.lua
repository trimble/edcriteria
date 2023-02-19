-- https://github.com/Xjph/ObservatoryCore/wiki/Lua-Custom-Criteria
-- https://www.lua.org/

-- Those Criterias are a mix of copy and paste from others, clone and modify from others, as well as self written by Sirob0911 and marty---mcfly
-- While working on this file, lost overview where we grabbed what to copy and paste - please apologize for missing credits!
-- Found mistakes or got errors? Please send feedback on discord ;)
-- All criterias are using no globals - so they can be used single or easily be copied into other customfiles
-- All criterias have a description for their Triggers
-- Take a look where you can SET values / Default values are set a bit more optimistic, so the trigger starts more often; you probably will change it
-- fly safe!
-- o7


-- Triggers for Earth like -, Water - or Ammonia World with Ring
::Criteria::
if (scan.PlanetClass == 'Earthlike body' or scan.PlanetClass == 'Water world' or scan.PlanetClass == 'Ammonia world') and scan.Rings then
	PTYPE = ''
    if scan.PlanetClass == 'Earthlike body' then
		PTYPE = 'Earth Like World'
	end
	if scan.PlanetClass == 'Water world' then
		PTYPE = 'Water World'
	end
	if scan.PlanetClass == 'Ammonia world' then
		PTYPE = 'Ammonia World'
	end
	return true,
	PTYPE .. ' has Ring',
	''
end
::End::


-- Triggers for Landable Moon at Earth like -, Water - or Ammonia World
-- Set LSMAX how close in LS the Moon should be maximum away
::Criteria::
local LSMAX = 2
if scan.Landable and ((scan.SemiMajorAxis / 299792458 ) <= LSMAX ) and parents then
	local PTYPE = ''
	if parents[0].Scan and parents[0].Scan.PlanetClass == 'Earthlike body' then
		PTYPE = 'Earth Like World'
	end
	if parents[0].Scan and parents[0].Scan.PlanetClass == 'Water world' then
		PTYPE = 'Water World'
	end
	if parents[0].Scan and parents[0].Scan.PlanetClass == 'Ammonia world' then
		PTYPE = 'Ammonia World'
	end
	if PTYPE ~= '' then
		return true,
		'Landable Moon at ' .. PTYPE,
		'Moon is ' ..  string.format('%.2f',scan.SemiMajorAxis / 299792458) .. ' LS from Parent'
	end
end
::End::


-- Triggers for a Landable Moon with OR without Atmosphere and Ring AND its Parent has a Ring as well
::Criteria::
if scan.Landable and scan.Rings and parents then
  if parents[0].Scan and parents[0].Scan.Rings then
	local ATMOS = ""
	if scan.Atmosphere ~= "" then
		ATMOS = "and with Atmosphere"
	else
		ATMOS = "and without Atmosphere"
	end
	return true,
	'Landable Moon with Ring ' .. ATMOS ..', has Parent with Ring',
	'Moon: ' .. scan.PlanetClass .. ', ' .. string.format('%.2f',scan.SemiMajorAxis / 299792458 ) .. ' LS to Parent'
  end
end
::End::

-- Triggers for Landable Moon with High Inclanation which is close to a Parent with Ring
-- Set OIMIN for minimum degrees the Inclanition should be
-- Set LSMAX how close in LS the Moon should maximum be away
::Criteria::
local OIMIN = 20
local LSMAX	= 5
if (math.abs(scan.OrbitalInclination) >= OIMIN) and scan.Landable and ((scan.SemiMajorAxis / 299792458 ) <= LSMAX ) and parents then
  if parents[0].Scan and parents[0].Scan.Rings then
    return true,
	'Landable Moon with High Inclanation is close to Parent with Ring',
	'Moon: ' .. scan.PlanetClass .. ', OrbitInc: ' .. string.format('%.2f',scan.OrbitalInclination) .. ', ' .. string.format('%.2f',scan.SemiMajorAxis / 299792458 ) .. ' LS to Parent'
  end
end
::End::


-- Triggers for all kind of Stars with Ring / shows Ringdetails
::Criteria::
if scan.StarType and scan.Rings then
	local RINGTYP = ', Ring:'
	local RINGART = ''
	local HASRING = 0
	local RINGNAME = ''
	local RINGBELT = 0
	for ring in rings(scan.Rings) do
		HASRING = HASRING + 1
		RINGART = scan.Rings[HASRING-1].RingClass:gsub("%eRingClass_", "")
		RINGTYP = RINGTYP .. ' ' .. RINGART
		RINGNAME = scan.Rings[HASRING-1].Name
		RINGBELT = string.find("Belt",RINGNAME,1,true)
	end	
	if RINGBELT == 0 then
		return true,
		'Star with Ring',
		'Startype: ' .. scan.StarType .. ', Sub: ' .. scan.Subclass ..', Ring: ' .. RINGTYP
	end
end
::End::


-- Triggers for all kind of Giants with Ring / shows Ringdetails / optional only if discovered GDISCO = true
::Criteria::
local GDISCO = true
local GIANTART = ''
local GIGANT = false
if 		scan.PlanetClass == 'Sudarsky class I gas giant'
	or 	scan.PlanetClass == 'Sudarsky class II gas giant'
	or 	scan.PlanetClass == 'Sudarsky class III gas giant'
	or 	scan.PlanetClass == 'Sudarsky class IV gas giant'
	or 	scan.PlanetClass == 'Sudarsky class V gas giant'
	then
		GIANTART = scan.PlanetClass:gsub("%Sudarsky ", "")
		GIANTART = GIANTART:gsub("% gas giant", "")
		GIANTART = GIANTART:gsub("class", "Class")
		GIGANT = true
end
if 		scan.PlanetClass == 'Water giant'
	or 	scan.PlanetClass == 'Water giant with life'
	or 	scan.PlanetClass == 'Gas giant with water based life'
	or 	scan.PlanetClass == 'Gas giant with ammonia based life'
	or 	scan.PlanetClass == 'Helium rich gas giant'
	or 	scan.PlanetClass == 'Helium gas giant'
	then
		GIANTART = scan.PlanetClass
		GIANTART = GIANTART:gsub("Gas giant with ", "")
		GIANTART = GIANTART:gsub("water based life", "Water based Life")
		GIANTART = GIANTART:gsub("ammonia based life", "Ammonia based Life")
		GIANTART = GIANTART:gsub("Helium rich gas giant", "Helium rich Gasgiant")
		GIANTART = GIANTART:gsub("Helium gas giant", "Helium Gasgiant")
		GIGANT = true
end
if GIGANT then
	if scan.Rings then
		local HASRING = 0
		local RINGTYP = ', Ring:'
			for ring in rings(scan.Rings) do
				HASRING = HASRING + 1
				RINGART = scan.Rings[HASRING-1].RingClass:gsub("%eRingClass_", "")
				RINGTYP = RINGTYP .. ' ' .. RINGART
			end
		if HASRING then
			local AXIAL
			AXIAL = string.format(', ATilt: %.2f° ', math.deg(scan.AxialTilt))
			if scan.WasDiscovered and GDISCO then
				return true, 
				'Discovered Giant with Ring', 
				GIANTART .. AXIAL .. RINGTYP
			else
				return true, 
				'Giant with Ring', 
				GIANTART .. AXIAL .. RINGTYP
			end
		end
	end
end
::End::

-- More detailed look about the Atmopshere of Landable Moons
-- Triggers for rare elements in Atmosphere and announce them
-- Triggers for more then 1 element in Atmosphere, and if not rare, without announcement
-- Shows in Details the Atmosphere-Composition in both cases
-- Shows in Details in case of rare element(s) the complete compostion
-- Set ATMO[x].rare = true if you want this element to be called as rare
-- Set ATMO[x].minp to a minimum value (%) the element should be part of the Atmosphere-Details listed
::Criteria::
	ATMO = {}; for i=1,13 do ATMO[i] = {} end
	ATMO[1].name ='CarbonDioxide';	ATMO[1].sign ='CO2'; 	ATMO[1].minp = 10; 	ATMO[1].rare = false
	ATMO[2].name ='SulphurDioxide';	ATMO[2].sign ='SO2'; 	ATMO[2].minp = 10; 	ATMO[2].rare = false
	ATMO[3].name ='Nitrogen';		ATMO[3].sign ='N'; 		ATMO[3].minp = 10; 	ATMO[3].rare = false
	ATMO[4].name ='Hydrogen';		ATMO[4].sign ='H'; 		ATMO[4].minp =  0; 	ATMO[4].rare = true
	ATMO[5].name ='Oxygen';			ATMO[5].sign ='O'; 		ATMO[5].minp =  0; 	ATMO[5].rare = true
	ATMO[6].name ='Ammonia';		ATMO[6].sign ='NH3'; 	ATMO[6].minp = 10; 	ATMO[6].rare = false
	ATMO[7].name ='Argon';			ATMO[7].sign ='AR'; 	ATMO[7].minp = 10; 	ATMO[7].rare = false
	ATMO[8].name ='Neon';			ATMO[8].sign ='NE'; 	ATMO[8].minp = 10; 	ATMO[8].rare = false
	ATMO[9].name ='Helium';			ATMO[9].sign ='HE'; 	ATMO[9].minp =  0; 	ATMO[9].rare = true
	ATMO[10].name ='Methane';		ATMO[10].sign ='CH4'; 	ATMO[10].minp = 10; ATMO[10].rare = false
	ATMO[11].name ='Silicates';		ATMO[11].sign ='SiO'; 	ATMO[11].minp =  0; ATMO[11].rare = true
	ATMO[12].name ='Water';			ATMO[12].sign ='H2O'; 	ATMO[12].minp =  0; ATMO[12].rare = true
	ATMO[13].name ='Iron';			ATMO[13].sign ='FE'; 	ATMO[13].minp =  0; ATMO[13].rare = true
if scan.Landable and scan.AtmosphereComposition then
	local COUNT = 0
	local RARE = 0
	local ADETAIL = ''
	for i=1,13 do
		ATMO[i].exist = 0
		for mat in materials(scan.AtmosphereComposition) do
			if mat.name == ATMO[i].name then
				COUNT = COUNT + 1
				ATMO[i].exist = mat.percent
				if ATMO[i].rare == true then
					RARE = RARE + 1
				end
			end
		end
	end
	-- the following can't run in the loop above, cause we need the complete run through to catch all RARE
	for i=1,13 do
		if ATMO[i].exist > 0 then
			if RARE > 0 then								-- if one or more elements are rare, we want to see the complete composition
				ADETAIL = ADETAIL .. string.format(', '.. ATMO[i].sign .. ': %.2f%%', ATMO[i].exist)
			elseif ATMO[i].exist >= ATMO[i].minp then		-- if there is no rare, we want to see only the elements >= ATMO[i].minp
				ADETAIL = ADETAIL .. string.format(', '.. ATMO[i].sign .. ': %.2f%%', ATMO[i].exist)
			end	
		end
	end
	if RARE > 0 then
		return true,
		'Atmosphere contains ' .. string.format('%i rare Element%s', RARE, RARE > 1 and 's' or ''),
		string.sub(ADETAIL, 3)
	end
	if COUNT > 1 then
		return true,
		'', 
		string.sub(ADETAIL, 3)
	end
end
::End::


-- Announce the amount of Biological Signals
-- Set MINBIO for signals minmum
-- Switch off 'Diverse Live' in core to avoid double announcement
::Criteria::
local MINBIO = 5
if biosignals >= MINBIO then
    return true,
	string.format('%i Biological Signal%s found', biosignals, biosignals > 1 and 's' or ''),
	''
end
::End::

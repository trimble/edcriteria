::Criteria::
for ring in rings(scan.Rings) do
  if ring.ringclass == 'eRingClass_Metalic' then
    return true, 'Metallic Ring', ring.name
  end
  -- if ring.ringclass == 'eRingClass_Icy' then
  --   return true, 'Icy Ring', ring.name
  -- end
end
::End::

::Criteria::
local uninterestingRingedStarTypes = {
  ['L'] = true;
  ['T'] = true;
  ['Y'] = true;
}

if scan.StarType and scan.StarType ~= '' and not uninterestingRingedStarTypes[scan.StarType] and scan.Rings then
  local details = ''
  local sep = ''
  for ring in rings(scan.Rings) do
    if (string.find(ring.name, "Ring")) then
      if details ~= '' and sep == '' then sep = ',' end
      details = details .. sep .. ring.ringclass:gsub("%eRingClass_", "")
    end
  end
  if details ~= '' then
    return true, 'Star with Ring', 'Startype: ' .. scan.StarType .. ', Sub: ' .. scan.Subclass .. scan.Luminosity .. ', Rings: ' .. details
  end
end
::End::

-- -- Triggers for all kind of Giants with Ring / shows Ringdetails / optional only if discovered GDISCO = true
-- ::Criteria::
-- local GDISCO = true
-- local GIANTART = ''
-- local GIGANT = false
-- if 		scan.PlanetClass == 'Sudarsky class I gas giant'
-- 	or 	scan.PlanetClass == 'Sudarsky class II gas giant'
-- 	or 	scan.PlanetClass == 'Sudarsky class III gas giant'
-- 	or 	scan.PlanetClass == 'Sudarsky class IV gas giant'
-- 	or 	scan.PlanetClass == 'Sudarsky class V gas giant'
-- 	then
-- 		GIANTART = scan.PlanetClass:gsub("%Sudarsky ", "")
-- 		GIANTART = GIANTART:gsub("% gas giant", "")
-- 		GIANTART = GIANTART:gsub("class", "Class")
-- 		GIGANT = true
-- end
-- if 		scan.PlanetClass == 'Water giant'
-- 	or 	scan.PlanetClass == 'Water giant with life'
-- 	or 	scan.PlanetClass == 'Gas giant with water based life'
-- 	or 	scan.PlanetClass == 'Gas giant with ammonia based life'
-- 	or 	scan.PlanetClass == 'Helium rich gas giant'
-- 	or 	scan.PlanetClass == 'Helium gas giant'
-- 	then
-- 		GIANTART = scan.PlanetClass
-- 		GIANTART = GIANTART:gsub("Gas giant with ", "")
-- 		GIANTART = GIANTART:gsub("water based life", "Water based Life")
-- 		GIANTART = GIANTART:gsub("ammonia based life", "Ammonia based Life")
-- 		GIANTART = GIANTART:gsub("Helium rich gas giant", "Helium rich Gasgiant")
-- 		GIANTART = GIANTART:gsub("Helium gas giant", "Helium Gasgiant")
-- 		GIGANT = true
-- end
-- if GIGANT then
-- 	if scan.Rings then
-- 		local HASRING = 0
-- 		local RINGTYP = ', Ring:'
-- 			for ring in rings(scan.Rings) do
-- 				HASRING = HASRING + 1
-- 				RINGART = scan.Rings[HASRING-1].RingClass:gsub("%eRingClass_", "")
-- 				RINGTYP = RINGTYP .. ' ' .. RINGART
-- 			end
-- 		if HASRING then
-- 			local AXIAL
-- 			AXIAL = string.format(', ATilt: %.2f° ', math.deg(scan.AxialTilt))
-- 			if scan.WasDiscovered and GDISCO then
-- 				return true,
-- 				'Discovered Giant with Ring',
-- 				GIANTART .. AXIAL .. RINGTYP
-- 			else
-- 				return true,
-- 				'Giant with Ring',
-- 				GIANTART .. AXIAL .. RINGTYP
-- 			end
-- 		end
-- 	end
-- end
-- ::End::

-- -- Triggers for all kind of bodies with rings
-- ::Criteria::
-- local HASRING = 0
-- local RINGTYP = ', Ring:'
-- if scan.Rings then
--   for ring in rings(scan.Rings) do
--     HASRING = HASRING + 1
--     RINGART = scan.Rings[HASRING-1].RingClass:gsub("%eRingClass_", "")
--     RINGTYP = RINGTYP .. ' ' .. RINGART
--   end
--   local AXIAL
--   AXIAL = string.format('ATilt: %.2f° ', math.deg(scan.AxialTilt))
--   return true,
--     'Body with Ring',
--     AXIAL .. RINGTYP
-- end
-- ::End::

-- Announce the number of biological signals
-- Set MINBIO for signals minmum
-- Switch off 'Diverse Life' in core to avoid double announcement
::Criteria::
local MINBIO = 5
if biosignals >= MINBIO then
    return true,
	string.format('%i biological signal%s found', biosignals, biosignals > 1 and 's' or ''),
	''
end
::End::

--  Record-breaking bodies
::Criteria::
local maxMetalRichMassEM = 715.209778
local minMetalRichMassEM = 0.0001
local maxMetalRichRadiusM = 20739046
local minMetalRichRadiusM = 137383.25
local maxMetalRichTempK = 47991
local minMetalRichTempK = 20

local maxHMCMassEM = 1397.998047
local minHMCMassEM = 0.0001
local maxHMCRadiusM = 72253984
local minHMCRadiusM = 210242.671875
local maxHMCTempK = 46100
local minHMCTempK = 20

local maxRockyMassEM = 527.839539
local minRockyMassEM = 0.0001
local maxRockyRadiusM = 21765112
local minRockyRadiusM = 181887.875
local maxRockyTempK = 51171
local minRockyTempK = 20

local maxRockyIceMassEM = 298.62381
local minRockyIceMassEM = 0.000107
local maxRockyIceRadiusM = 28515804
local minRockyIceRadiusM = 276000
local maxRockyIceTempK = 15742
local minRockyIceTempK = 20

local maxIcyMassEM = 2214.019287
local minIcyMassEM = 0.0001
local maxIcyRadiusM = 31232910
local minIcyRadiusM = 160000
local maxIcyTempK = 4020
local minIcyTempK = 0

local maxEarthlikeMassEM = 7.1
local minEarthlikeMassEM = 0.026
local maxEarthlikeRadiusM = 11914006
local minEarthlikeRadiusM = 1944262.25
local maxEarthlikeTempK = 497
local minEarthlikeTempK = 260

local maxWaterMassEM = 741.438171
local minWaterMassEM = 0.0687
local maxWaterRadiusM = 29011342
local minWaterRadiusM = 2640894
local maxWaterTempK = 902
local minWaterTempK = 150

local maxWaterGiantMassEM = 1961.928589
local minWaterGiantMassEM = 17.23122
local maxWaterGiantRadiusM = 30942572
local minWaterGiantRadiusM = 15892973
local maxWaterGiantTempK = 2715
local minWaterGiantTempK = 136

local maxAmmoniaMassEM = 1327.610718
local minAmmoniaMassEM = 0.07346
local maxAmmoniaRadiusM = 30741622
local minAmmoniaRadiusM = 2699667.75
local maxAmmoniaTempK = 409
local minAmmoniaTempK = 27

local maxGasGiantWithWaterLifeMassEM = 1367.778809
local minGasGiantWithWaterLifeMassEM = 2.590262
local maxGasGiantWithWaterLifeRadiusM = 77844096
local minGasGiantWithWaterLifeRadiusM = 10265455
local maxGasGiantWithWaterLifeTempK = 250
local minGasGiantWithWaterLifeTempK = 150

local maxGasGiantWithAmmoniaLifeMassEM = 909.972778
local minGasGiantWithAmmoniaLifeMassEM = 1.791545
local maxGasGiantWithAmmoniaLifeRadiusM = 77785448
local minGasGiantWithAmmoniaLifeRadiusM = 9098773
local maxGasGiantWithAmmoniaLifeTempK = 150
local minGasGiantWithAmmoniaLifeTempK = 100

local maxClassIGasGiantMassEM = 911.079224
local minClassIGasGiantMassEM = 1.791545
local maxClassIGasGiantRadiusM = 77787584
local minClassIGasGiantRadiusM = 8728057
local maxClassIGasGiantTempK = 150
local minClassIGasGiantTempK = 1

local maxClassIIGasGiantMassEM = 1368.457764
local minClassIIGasGiantMassEM = 2.641097
local maxClassIIGasGiantRadiusM = 90000000
local minClassIIGasGiantRadiusM = 10222803
local maxClassIIGasGiantTempK = 250
local minClassIIGasGiantTempK = 61

local maxClassIIIGasGiantMassEM = 3457.905762
local minClassIIIGasGiantMassEM = 4.296463
local maxClassIIIGasGiantRadiusM = 77849944
local minClassIIIGasGiantRadiusM = 12120956
local maxClassIIIGasGiantTempK = 800
local minClassIIIGasGiantTempK = 115

local maxClassIVGasGiantMassEM = 5403.108398
local minClassIVGasGiantMassEM = 16.754765
local maxClassIVGasGiantRadiusM = 78291.304
local minClassIVGasGiantRadiusM = 17305.224
local maxClassIVGasGiantTempK = 1450
local minClassIVGasGiantTempK = 800

local maxClassVGasGiantMassEM = 13063.395508
local minClassVGasGiantMassEM = 32.504833
local maxClassVGasGiantRadiusM = 77806.056
local minClassVGasGiantRadiusM = 20016.274
local maxClassVGasGiantTempK = 13713
local minClassVGasGiantTempK = 1400

local maxHeliumRichGasGiantMassEM = 4764.864258
local minHeliumRichGasGiantMassEM = 1.028593
local maxHeliumRichGasGiantRadiusM = 77743.44
local minHeliumRichGasGiantRadiusM = 9557.561
local maxHeliumRichGasGiantTempK = 7787
local minHeliumRichGasGiantTempK = 1

local maxHeliumGasGiantMassEM = 5781.101074
local minHeliumGasGiantMassEM = 9.003934
local maxHeliumGasGiantRadiusM = 75900.72
local minHeliumGasGiantRadiusM = 16762.012
local maxHeliumGasGiantTempK = 1701
local minHeliumGasGiantTempK = 53

if scan.PlanetClass and scan.PlanetClass == 'Metal rich body' then
  if scan.MassEM < minMetalRichMassEM then
    return true,
    'Record-breaking metal-rich',
    string.format('Record breaker, low mass MetalRich: %.2f EM ', scan.MassEM)
  end
  if scan.MassEM > maxMetalRichMassEM then
    return true,
    'Record-breaking metal-rich',
    string.format('Record breaker, high mass MetalRich: %.2f EM ', scan.MassEM)
  end
  if scan.Radius < minMetalRichRadiusM then
    return true,
    'Record-breaking metal-rich',
    string.format('Record breaker, small MetalRich: %.2f m ', scan.Radius)
  end
  if scan.Radius > maxMetalRichRadiusM then
    return true,
    'Record-breaking metal-rich',
    string.format('Record breaker, big MetalRich: %.2f m ', scan.Radius)
  end
  if scan.SurfaceTemperature < minMetalRichTempK then
    return true,
    'Record-breaking metal-rich',
    string.format('Record breaker, cold MetalRich: %.2f K ', scan.SurfaceTemperature)
  end
  if scan.SurfaceTemperature > maxMetalRichTempK then
    return true,
    'Record-breaking metal-rich',
    string.format('Record breaker, hot MetalRich: %.2f K ', scan.SurfaceTemperature)
  end
end

if scan.PlanetClass and scan.PlanetClass == 'High metal content body' then
  if scan.MassEM < minHMCMassEM then
    return true,
    'Record-breaking HMC',
    string.format('Record breaker, low mass HMC: %.2f EM ', scan.MassEM)
  end
  if scan.MassEM > maxHMCMassEM then
    return true,
    'Record-breaking HMC',
    string.format('Record breaker, high mass HMC: %.2f EM ', scan.MassEM)
  end
  if scan.Radius < minMetalRichRadiusM then
    return true,
    'Record-breaking HMC',
    string.format('Record breaker, small HMC: %.2f m ', scan.Radius)
  end
  if scan.Radius > maxMetalRichRadiusM then
    return true,
    'Record-breaking HMC',
    string.format('Record breaker, big HMC: %.2f m ', scan.Radius)
  end
  if scan.SurfaceTemperature < minMetalRichTempK then
    return true,
    'Record-breaking HMC',
    string.format('Record breaker, cold HMC: %.2f K ', scan.SurfaceTemperature)
  end
  if scan.SurfaceTemperature > maxMetalRichTempK then
    return true,
    'Record-breaking HMC',
    string.format('Record breaker, hot HMC: %.2f K ', scan.SurfaceTemperature)
  end
end
::End::
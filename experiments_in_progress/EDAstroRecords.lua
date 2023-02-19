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
  if scan.MassEM < minHMCMassEM or scan.MassEM > maxHMCMassEM then
    return true,
    'Record-breaking HMC mass',
    string.format('Mass: %.2f EM, Known range: %.2f to %.2f EM', scan.MassEM, minHMCMassEM, maxHMCMassEM)
  end
  if scan.Radius < minHMCRadiusM or scan.Radius > maxHMCRadiusM then
    return true,
    'Record-breaking HMC radius',
    string.format('Radius: %.2f m, Known range: %.2f to %.2f meters', scan.Radius, minHMCRadiusM, maxHMCRadiusM)
  end
  if scan.SurfaceTemperature < minHMCTempK or scan.SurfaceTemperature > maxHMCTempK then
    return true,
    'Record-breaking HMC temperature',
    string.format('Temp: %d K , Known range:  %d to %d K', scan.SurfaceTemperature, minHMCTempK, maxHMCTempK)
  end
end

if scan.PlanetClass and scan.PlanetClass == 'Rocky body' then
  if scan.MassEM < minRockyMassEM or scan.MassEM > maxRockyMassEM then
    return true,
      'Record-breaking mass',
      string.format(
        'Mass: %.2f EM, Known range for %s: %.2f to %.2f EM',
        scan.MassEM,
        string.lower(scan.PlanetClass),
        minRockyMassEM,
        maxRockyMassEM
      )
  end
  if scan.Radius < minRockyRadiusM or scan.Radius > maxRockyRadiusM then
    return true,
      'Record-breaking radius',
      string.format(
        'Radius: %.2f m, Known rangefor %s: %.2f to %.2f meters',
        scan.Radius,
        string.lower(scan.PlanetClass),
        minRockyRadiusM,
        maxRockyRadiusM
      )
  end
  if scan.SurfaceTemperature < minRockyTempK or scan.SurfaceTemperature > maxRockyTempK then
    return true,
      'Record-breaking temperature',
      string.format(
        'Temp: %d K , Known range for %s: %d to %d K',
        scan.SurfaceTemperature,
        string.lower(scan.PlanetClass),
        minRockyTempK,
        maxRockyTempK
      )
  end
end

::End::

::Criteria::
local recordBook = {
  ["Metal rich body"] = {
    DistanceFromArrivalLS = {0.087741, 7490780},
    MassEM = {0.0001, 715.209778},
    Radius = {137383.25, 20739046},
    SurfaceGravity = {0.029231388904, 199.958389460213},
    SurfaceTemperature = {20, 47991},
  },
  ["High metal content body"] = {
    DistanceFromArrivalLS = {0.147454, 7489280},
    MassEM = {0.0001, 1397.998047},
    Radius = {210242.671875, 72253984},
    SurfaceGravity = {0.028504229273, 228.220131339448},
    SurfaceTemperature = {20, 46100},
  },
  ["Rocky body"] = {
    DistanceFromArrivalLS = {3.2831, 7491680},
    MassEM = {0.0001, 527.839539},
    Radius = {181887.875, 21765112},
    SurfaceGravity = {0.007895669291, 50.039830862644},
    SurfaceTemperature = {20, 51171},
  },
  ["Icy body"] = {
    DistanceFromArrivalLS = {1.37026, 15652900},
    MassEM = {0.0001, 2214.019287},
    Radius = {160000, 31232910},
    SurfaceGravity = {0.004758505708, 236.648152852392},
    SurfaceTemperature = {1, 4020},
},
  ["Rocky ice body"] = {
    DistanceFromArrivalLS = {5.3542, 5338980},
    MassEM = {0.000107, 298.62381},
    Radius = {276000, 28515804},
    SurfaceGravity = {0.001378452377, 17.259812728912},
    SurfaceTemperature = {20, 15742},
  },
  ["Earthlike body"] = {
    DistanceFromArrivalLS = {6, 736306},
  },
  ["Water world"] = {
    DistanceFromArrivalLS = {3, 4217440},
  },
  ["Ammonia world"] = {
    DistanceFromArrivalLS = {7, 817190},
  },
  ["Water giant"] = {
    DistanceFromArrivalLS = {21, 690129},
  },
  ["Water giant with life"] = {
    DistanceFromArrivalLS = {0.087741, 7490780},
  },
  ["Gas giant with water based life"] = {
    DistanceFromArrivalLS = {0.087741, 7490780},
  },
  ["Gas giant with ammonia based life"] = {
    DistanceFromArrivalLS = {0.087741, 7490780},
  },
  ["Sudarsky class I gas giant"] = {
    DistanceFromArrivalLS = {0.087741, 7490780},
  },
  ["Sudarsky class II gas giant"] = {
    DistanceFromArrivalLS = {0.087741, 7490780},
  },
  ["Sudarsky class III gas giant"] = {
    DistanceFromArrivalLS = {0.087741, 7490780},
  },
  ["Sudarsky class IV gas giant"] = {
    DistanceFromArrivalLS = {0.087741, 7490780},
  },
  ["Sudarsky class V gas giant"] = {
    DistanceFromArrivalLS = {0.087741, 7490780},
  },
  ["Helium rich gas giant"] = {
    DistanceFromArrivalLS = {0.087741, 7490780},
  },
  ["Helium gas giant"] = {
    DistanceFromArrivalLS = {0.087741, 7490780},
  },
}

if scan.PlanetClass and scan.PlanetClass ~= "Barycentre" then
  for parameter, range in pairs(recordBook[scan.PlanetClass])
  do
    if scan[parameter] < range[1] or scan[parameter] > range[2] then
      return true,
        string.format("Record-breaking %s %s", scan.PlanetClass, parameter),
        string.format(
          "Measured = %f, Range = %f to %f",
          scan[parameter],
          range[1],
          range[2]
        )
    end
  end
end
::End::

::Global::
function string.startsWith(String, Start)
    if (String == nil) then
        return false
    end
    return string.sub(String, 1, string.len(Start)) == Start
end

MINBIOLOGICAL = 5 -- minimum to trigger for biological signals (deactivate checkbox in Core 'diverse lifeforms')

TRIGGERCSP = true -- Triggers for CloseStarProximity
CSPMAX = 150 -- maximal QUOT for calling a CloseStarProximity (marty--mcfly = 125 / Sirob = 300)
CSPMAXATMO = 1150 -- adding this value to maximal QUOT in case Landable is with Atmosphere (marty-mcfly = 1000 / Sirob = 1500)
CSPMAXLS = 200 -- set max LS only for Landable at small stars like N, D.., H, X

NOINTERESTSTAR = { -- Set or uncomment star-type with ring you don't want to be triggered
    ['L'] = true,
    ['T'] = true,
    ['Y'] = true -- This Type of Star with Ring will not be called
}

HOWCLOSETORING = 20000 -- Close Ring Proximity: Set how much km in maximum to outer radius of ring the moon should be

-- Trigger for Landable Moon at Earth like -, Water - or Ammonia World
TERRLSMAX = 3 -- Set TERRLSMAX how close in LS the Moon should be maximum away

DECIMALPLACES = 3 -- how many decimal places should be shown for LS in some triggers / close Landables in different variants

-- Trigger for Landable Moon with High Inclanation which is close to a Parent with Ring or Belt
INCLOIMIN = 10 -- Set for minimum degrees the Inclanition should be
INCLLSMAX = 10 -- Set how close in LS the Moon should be maximum away

TRIGGERRINGFACTS = false -- Shows details of the scanned ring

SHOWATMODETAILS = true -- showing atmo-details if more than 1 and not rare (set atmo-detail to rare further down in criteria)

TRIGGERHIGHSOLARMASS = true -- Triggers for certain kind of Stars with High Solar Mass (set Type of Stars within the Criteria)

TRIGGERSTARYEARS = true -- Triggers for Stars which are even or older the given value in MINSTARYEARS
MINSTARYEARS = 13000 -- Minimum of million years (default = 13000 = 13.0 Billion Years)

TRIGGERSPGASGIANTS = true -- Triggers short-period GasGiants	- version 2 (replacement for HotJupiter Version 1)
SPGASGIANTSDAYS = 10 -- max orbitperiod in days for GasGiants - main entrance criteria
SPGASGIANTSLSFACTOR = 30 -- (default = 30) base value to calculate Distance and Radius of Star / results in (20 LS / 0,6 SR or 100 LS / 1,8 SR) or less LS to fire trigger  
SPGASGIANTSTEMP = 2000 -- min temperature to call out for 'Ultra Hot Jupiter'

TRIGGERGASGIANT = true -- Triggers for Giants of Class V, Helium rich and Helium / set more values (or less) within the Criteria itself

-- funtion to form output of numbers
function NumForm(INPUT, NK, EINHEIT)
    local VORKOMMA = 0
    local KOMMAPOS = 0
    local LENGTH = 0
    VORKOMMA, KOMMAPOS = string.find(INPUT, "%.")
    if VORKOMMA then
        INPUT = string.format('%.' .. NK .. 'f', INPUT)
        X = string.gsub(INPUT, "%.", ",") -- replace dot (if exist) into comma
        LENGTH = VORKOMMA - 1 -- get char-length before comma
    else
        X = INPUT
        LENGTH = string.len(X)
    end
    local i = 3
    while i < 18 do -- insert dots for x-thousands
        if LENGTH > i then
            X = string.sub(X, 1, LENGTH - i) .. '.' .. string.sub(X, LENGTH - i + 1)
        end
        i = i + 3
    end
    return X .. EINHEIT;
end

-- needed for maas-quot of rings
function RingFlaeche(RAD1, RAD2)
    local A1 = 0
    local A2 = 0
    A1 = math.pi * (RAD1 * RAD1)
    A2 = math.pi * (RAD2 * RAD2)
    return (A2 - A1)
end

-- Check if the current system has a given star type
-- copy from script by S_K_Tiger
function systemHasStarType(system, StarType)
    for body in bodies(system) do
        if body.StarType then
            if body.StarType == StarType then
                return true
            end
        end
    end
    return false
end

-- Check if the current system has one or more of the star types in the given array
-- copy from script by S_K_Tiger
function systemHasOneOfStarTypes(system, array)
    for body in bodies(system) do
        if body.StarType then
            for index, value in ipairs(array) do
                if body.StarType == value then
                    return true
                end
            end
        end
    end
    return false
end

-- Check if the current system has one or more of the star types as main-stars in the given array
-- extended copy from script by S_K_Tiger
function systemHasOneOfMainStarTypes(system, array)
    for body in bodies(system) do
        if body.StarType and body.BodyID <= 3 then -- in case of barycenter we check on pos 2 or 3 as well
            for index, value in ipairs(array) do
                if body.StarType == value then
                    return true
                end
            end
        end
    end
    return false
end

function CheckForLastLetter(takethis)
    local checkarray = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
                        "t", "u", "v", "w", "x", "y", "z"}
    for _, v in pairs(checkarray) do
        if v == (string.sub(takethis, -1)) then
            return true
        end
    end
    return false
end
function CheckForLastCap(takethis)
    local checkarray = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S",
                        "T", "U", "V", "W", "X", "Y", "Z"}
    for _, v in pairs(checkarray) do
        if v == (string.sub(takethis, -1)) then
            return true
        end
    end
    return false
end
function CheckForLastNumber(takethis)
    local checkarray = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}
    for _, v in pairs(checkarray) do
        if v == (string.sub(takethis, -1)) then
            return true
        end
    end
    return false
end
function CheckForLastOthers(takethis)
    local checkarray = {":", "/", "-"}
    for _, v in pairs(checkarray) do
        if v == (string.sub(takethis, -1)) then
            return true
        end
    end
    return false
end
function SplitString(str, sep)
    local result = {}
    local regex = ("([^%s]+)"):format(sep)
    for each in str:gmatch(regex) do
        table.insert(result, each)
    end
    return result
end
function CutDownToBodyRow(SYSTEMNAME, BODYNAME)
    local BODYCODE = string.sub(BODYNAME, string.len(SYSTEMNAME) + 1)
    local BODYPARTS = SplitString(BODYCODE, ' ')
    local BODYPARTSCOUNT = 0
    local BODYPARENT = ''
    for _, line in ipairs(BODYPARTS) do
        BODYPARTSCOUNT = BODYPARTSCOUNT + 1
        if CheckForLastNumber(line) then
            local i = 0
            BODYPARENT = SYSTEMNAME
            while i < BODYPARTSCOUNT do
                i = i + 1
                BODYPARENT = BODYPARENT .. ' ' .. BODYPARTS[i]
            end
        end
    end
    return BODYPARENT
end
function CutDownToBodyStar(SYSTEMNAME, BODYNAME)
    local BODYCODE = string.sub(BODYNAME, string.len(SYSTEMNAME) + 1)
    local BODYPARTS = SplitString(BODYCODE, ' ')
    local BODYPARTSCOUNT = 0
    local BODYPARENT = ''
    local RETURNPARTS = ''
    for _, line in ipairs(BODYPARTS) do
        BODYPARTSCOUNT = BODYPARTSCOUNT + 1
        if CheckForLastCap(line) then
            local i = 0
            BODYPARENT = SYSTEMNAME
            while i < BODYPARTSCOUNT do
                i = i + 1
                BODYPARENT = BODYPARENT .. ' ' .. BODYPARTS[i]
                RETURNPARTS = BODYPARTS[i]
            end
        end
    end
    return BODYPARENT, RETURNPARTS
end

-- some basic vars
KMINLS = 299792458 -- km in LS
DAYSEC = 86400 -- seconds per day
YEARSEC = 31536000 -- seconds per year
SUNRAD = 695499968.000000 -- (seems to be the game value / as on Wikipedia, Radius of Sun is 696342 km
STARYEARSCALLED = false -- will be true if one old star is called
SYSTEMNAMESTORE = '' -- Value changes when entering a new system (= reset some values - see first criteria)
math.randomseed(os.time())
RNDSELECTIONTHRESHOLD = 0.20 -- probability that any visited system will be randomly selected for scanning
::End::

-- Trigger on arrival in new system. Use to reset globals and roll random chance for scanning when entering new system.
-- hope to get scan.Start and scan.Complete in future versions
::Criteria::
if scan.StarSystem and scan.StarSystem ~= SYSTEMNAMESTORE then
    SYSTEMNAMESTORE = scan.StarSystem
    STARYEARSCALLED = false -- will be true if one old star is called
    RNDROLL = math.random()
    if RNDROLL < RNDSELECTIONTHRESHOLD then
        return true, 'System randomly selected for scanning', RNDROLL .. ' < ' .. RNDSELECTIONTHRESHOLD
    end
    return false -- to avoid empty line in displayed table
end
::End::

-- Trigger on any metallic ring
::Criteria::
for ring in rings(scan.Rings) do
    if ring.ringclass == 'eRingClass_Metalic' then
        return true, 'Metallic Ring', ring.name
    end
end
::End::

-- Trigger on any ring around an interesting star type
::Criteria::
local uninterestingRingedStarTypes = {
    ['L'] = true,
    ['T'] = true,
    ['Y'] = true
}

if scan.StarType and not uninterestingRingedStarTypes[scan.StarType] and hasRings(scan.Rings) then
    local details = ''
    local sep = ''
    for ring in ringsOnly(scan.Rings) do
        if (string.find(ring.name, "Ring")) then
            if details ~= '' and sep == '' then
                sep = ','
            end
            details = details .. sep .. ring.ringclass:gsub("%eRingClass_", "")
        end
    end
    if details ~= '' then
        local starTypeDesc = scan.StarType:gsub('_', ' ') .. ' star'
        if string.startsWith(scan.StarType, 'D') then
            starTypeDesc = 'White Dwarf (' .. scan.StarType .. ') star'
        elseif scan.StarType == 'H' then
            starTypeDesc = 'Black Hole'
        elseif scan.StarType == 'N' then
            starTypeDesc = 'Neutron star'
        elseif scan.StarType == 'X' then
            starTypeDesc = 'Exotic star'
        end
        return true,
        'Ringed ' .. starTypeDesc,
        'Startype: ' .. scan.StarType .. ', Sub: ' .. scan.Subclass .. ', Lum: '.. scan.Luminosity .. ', Rings: ' .. details
    end
end
::End::

-- Trigger on Hot Jupiter
::Criteria::
if scan.ParentType == 'Star' then
    if scan.PlanetClass and string.find(string.lower(scan.PlanetClass), 'gas giant') and (scan.OrbitalPeriod <= 864000) then
        return true, 'Hot Jupiter', 'Orbital Period: ' .. math.floor(scan.OrbitalPeriod / 864) / 100 .. ' days'
    end
end
::End::

-- Trigger on high number of biological signals
::Criteria::
if biosignals >= MINBIOLOGICAL then
    return true,
           string.format('%i biological signal%s found', biosignals, biosignals > 1 and 's' or ''),
           'DfA: ' .. NumForm(scan.DistanceFromArrivalLS, 2, ' LS')
end
::End::

-- Trigger on potential galactic record breakers
::Criteria::
local recordBook = {
    ["Metal rich body"] = {
        DistanceFromArrivalLS = {0.087741, 7490780},
        MassEM = {0.0001, 715.209778},
        Radius = {137383.25, 20739046},
        SurfaceGravity = {0.029231388904, 199.958389460213},
        SurfaceTemperature = {20, 47991}
    },
    ["High metal content body"] = {
        DistanceFromArrivalLS = {0.147454, 7489280},
        MassEM = {0.0001, 1397.998047},
        Radius = {210242.671875, 72253984},
        SurfaceGravity = {0.028504229273, 228.220131339448},
        SurfaceTemperature = {20, 46100}
    },
    ["Rocky body"] = {
        DistanceFromArrivalLS = {3.2831, 7491680},
        MassEM = {0.0001, 527.839539},
        Radius = {181887.875, 21765112},
        SurfaceGravity = {0.007895669291, 50.039830862644},
        SurfaceTemperature = {20, 51171}
    },
    ["Icy body"] = {
        DistanceFromArrivalLS = {1.37026, 15652900},
        MassEM = {0.0001, 2214.019287},
        Radius = {160000, 31232910},
        SurfaceGravity = {0.004758505708, 236.648152852392},
        SurfaceTemperature = {1, 4020}
    },
    ["Rocky ice body"] = {
        DistanceFromArrivalLS = {5.3542, 5338980},
        MassEM = {0.000107, 298.62381},
        Radius = {276000, 28515804},
        SurfaceGravity = {0.001378452377, 17.259812728912},
        SurfaceTemperature = {20, 15742}
    },
    ["Earthlike body"] = {
        DistanceFromArrivalLS = {6, 736306}
    },
    ["Water world"] = {
        DistanceFromArrivalLS = {3, 4217440}
    },
    ["Ammonia world"] = {
        DistanceFromArrivalLS = {7, 817190}
    },
    ["Water giant"] = {
        DistanceFromArrivalLS = {21, 690129}
    },
    ["Water giant with life"] = {
        DistanceFromArrivalLS = {0.087741, 7490780}
    },
    ["Gas giant with water based life"] = {
        DistanceFromArrivalLS = {0.087741, 7490780}
    },
    ["Gas giant with ammonia based life"] = {
        DistanceFromArrivalLS = {0.087741, 7490780}
    },
    ["Sudarsky class I gas giant"] = {
        DistanceFromArrivalLS = {0.087741, 7490780}
    },
    ["Sudarsky class II gas giant"] = {
        DistanceFromArrivalLS = {0.087741, 7490780}
    },
    ["Sudarsky class III gas giant"] = {
        DistanceFromArrivalLS = {0.087741, 7490780}
    },
    ["Sudarsky class IV gas giant"] = {
        DistanceFromArrivalLS = {0.087741, 7490780}
    },
    ["Sudarsky class V gas giant"] = {
        DistanceFromArrivalLS = {0.087741, 7490780}
    },
    ["Helium rich gas giant"] = {
        DistanceFromArrivalLS = {0.087741, 7490780}
    },
    ["Helium gas giant"] = {
        DistanceFromArrivalLS = {0.087741, 7490780}
    }
}

if scan.PlanetClass and scan.PlanetClass ~= "Barycentre" then
    for parameter, range in pairs(recordBook[scan.PlanetClass]) do
        if scan[parameter] < range[1] or scan[parameter] > range[2] then
            return true, string.format("Record-breaking %s %s", scan.PlanetClass, parameter),
                string.format("Measured = %f, Range = %f to %f", scan[parameter], range[1], range[2])
        end
    end
end
::End::

-- Trigger for Landable Planet plus Atmosphere plus Biological Signals
-- in systems with certain StarType (O and B) which must not be the mainstar
-- suggested by Andrew Gaspurr and marty---mcfly
::Criteria::
if scan.Landable and scan.Atmosphere ~= '' and biosignals > 0 then
    local STARTYP = ''
    local STARCOUNT = 0
    for body in bodies(system) do
        if body.StarType then
            if body.StarType == 'O' then
                STARTYP = STARTYP .. 'O, '
                STARCOUNT = STARCOUNT + 1
            end
            if body.StarType == 'B' then
                STARTYP = STARTYP .. 'B, '
                STARCOUNT = STARCOUNT + 1
            end
        end
    end
    if STARCOUNT > 0 then
        return true,
            string.format('Star%s', STARCOUNT > 1 and 's' or '') .. ' of Type ' .. STARTYP ..
                'Landable Planet with Atmosphere and ' ..
                string.format('%i Bio-Signal%s', biosignals, biosignals > 1 and 's' or ''),
            'DfA: ' .. NumForm(scan.DistanceFromArrivalLS, 0, ' LS')
    end
end
::End::

-- On special whish of CMDR Cubitux© ;-)
-- Landable without Atmosphere and with Biological Signals
::Criteria::
if scan.Landable and scan.Atmosphere == '' and biosignals > 0 then
    return true,
        'Landable ' .. scan.PlanetClass .. ' without Atmosphere' .. string.char(10) .. 'and ' ..
            string.format('%i Biological Signal%s found', biosignals, biosignals > 1 and 's' or ''),
        'DfA: ' .. NumForm(scan.DistanceFromArrivalLS, 0, ' LS')
end
::End::

-- Triggers for nested moons which are landable
::Criteria::
if scan.Landable and parents then
    local COUNTIT = 0
    for parent in allparents(parents) do
        if parent.parenttype ~= 'Null' then
            COUNTIT = COUNTIT + 1
        end
    end
    if COUNTIT > 2 then
        local ATMOS = ""
        if scan.Atmosphere ~= "" then
            ATMOS = " with Atmosphere"
        else
            ATMOS = ""
        end
        local AWAY = scan.SemiMajorAxis / KMINLS
        if AWAY < 1 then
            return true,
                'This Nested Landable Moon is just ' .. NumForm(AWAY, DECIMALPLACES, ' LS') ..
                    ' from Parent', 'DfA: ' .. NumForm(scan.DistanceFromArrivalLS, 0, ' LS')
        end
    end
end
::End::

-- Triggers for Earth like -, Water - or Ammonia World with Ring
::Criteria::
if (scan.PlanetClass == 'Earthlike body' or scan.PlanetClass == 'Water world' or scan.PlanetClass == 'Ammonia world') and
    scan.Rings then
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
    return true, 'This ' .. PTYPE .. ' has a Ring',
        'DfA: ' .. NumForm(scan.DistanceFromArrivalLS, 0, ' LS')
end
::End::

-- Triggers for Landable Moon at Earth like -, Water - or Ammonia World
-- Set TERRLSMAX in Globals how close in LS the Moon should be maximum away
::Criteria::
if scan.Landable and ((scan.SemiMajorAxis / KMINLS) <= TERRLSMAX) and parents then
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
        return true, 'A Landable Moon at ' .. PTYPE, 'Moon: ' .. scan.PlanetClass .. ', ' ..
            NumForm(scan.SemiMajorAxis / KMINLS, DECIMALPLACES, ' LS') .. ' from Parent'
    end
end
::End::

-- Triggers for a Landable Moon with OR without Atmosphere and Ring AND its Parent has a Ring as well
::Criteria::
if scan.Landable and scan.Rings and parents then
    if parents[0].Scan and parents[0].Scan.Rings then
        local HASBELT = false
        for ring in rings(parents[0].Scan.Rings) do
            if (string.find(ring.name, "Belt")) then
                HASBELT = true
            end
        end
        if HASBELT == false then
            local ATMOS = ""
            if scan.Atmosphere ~= "" then
                ATMOS = " and Atmosphere"
            else
                ATMOS = ""
            end
            return true, 'Landable Moon with Ring' .. ATMOS .. ', has Parent with Ring', 'Moon: ' ..
                scan.PlanetClass .. ', ' .. NumForm(scan.SemiMajorAxis / KMINLS, DECIMALPLACES, ' LS') .. ' from Parent'
        end
    end
end
::End::

-- Triggers for Landable Moon with High Inclanation which is close to a Parent with Ring or Belt
::Criteria::
if (math.abs(scan.OrbitalInclination) >= INCLOIMIN) and scan.Landable and ((scan.SemiMajorAxis / KMINLS) <= INCLLSMAX) and
    parents then
    if parents[0].Scan and parents[0].Scan.Rings then
        local RINGBELTDETAIL = 'Ring'
        for ring in rings(parents[0].Scan.Rings) do
            if (string.find(ring.name, "Belt")) then
                RINGBELTDETAIL = ring.ringclass:gsub("%eRingClass_", "") .. ' Belt'
            end
        end
        return true,
            'Landable Moon with High Inclanation' .. string.char(10) .. 'is close to Parent with ' ..
                RINGBELTDETAIL,
            'Moon: ' .. scan.PlanetClass .. ' / OrbitInc: ' .. string.format('%.2f', scan.OrbitalInclination) .. '° / ' ..
                NumForm(scan.SemiMajorAxis / KMINLS, DECIMALPLACES, ' LS') .. ' to Parent' .. string.char(10) .. 'DfA: ' ..
                NumForm(scan.DistanceFromArrivalLS, 2, ' LS')
    end
end
::End::

-- Replacement for the built in 'Close Ring Proximity' and 'Shepherd Moon'
-- Triggers for a Landable (or not) Moon which is very close to a Parent with Ring
-- Triggers also for Shepherd Moons 
::Criteria::
local SCANRING = false
if string.find(scan.BodyName, "Ring") then
    SCANRING = true
end
if parents and SCANRING == false then
    local HASBELT = false
    local OUTERRAD = {}
    local INNERRAD = {}
    local LANDBAR = ''
    local SHEPHERD = false
    local MOONORBIT = 0
    local RINGCOUNT = 0
    if parents[0].Scan and parents[0].Scan.Rings then
        for ring in rings(parents[0].Scan.Rings) do
            if (string.find(ring.name, "Belt")) then
                HASBELT = true
            else
                RINGCOUNT = RINGCOUNT + 1
                INNERRAD[RINGCOUNT] = ring.innerrad / 1000
                OUTERRAD[RINGCOUNT] = ring.outerrad / 1000
            end
        end
        if HASBELT == false then
            if scan.Landable then
                LANDBAR = 'Landable '
            end
            MOONORBIT = scan.SemiMajorAxis / 1000
            if (MOONORBIT - OUTERRAD[RINGCOUNT]) < 0 then
                SHEPHERD = true
            end
            if scan.PlanetClass == 'Barycentre' and (MOONORBIT - OUTERRAD[RINGCOUNT]) < HOWCLOSETORING then
                return true, 'This Barycenter is very close to a Ring',
                    'Orbit: ' .. NumForm(MOONORBIT, 0, ' km') .. string.char(10) .. 'Ringradius: ' ..
                        NumForm(OUTERRAD[RINGCOUNT], 0, ' km') .. string.char(10) .. 'Distance to Ring: ' ..
                        NumForm(MOONORBIT - OUTERRAD[RINGCOUNT], 0, ' km')
            end
            if (MOONORBIT - OUTERRAD[RINGCOUNT]) < HOWCLOSETORING then
                if SHEPHERD then
                    return true, 'There is a ' .. LANDBAR .. 'Shepherd Moon',
                        'Inner Ring: ' .. NumForm(INNERRAD[1], 0, ' km') .. ', Orbit: ' .. NumForm(MOONORBIT, 0, ' km') ..
                            ', Outer Ring: ' .. NumForm(OUTERRAD[RINGCOUNT], 0, ' km')
                else
                    return true, 'This ' .. LANDBAR .. 'Moon is VERY close to Ring of Parent',
                        'Orbit: ' .. NumForm(MOONORBIT, 0, ' km') .. ', Moonradius: ' ..
                            NumForm(scan.Radius / 1000, 0, ' km') .. string.char(10) .. 'Ringradius: ' ..
                            NumForm(OUTERRAD[RINGCOUNT], 0, ' km') .. ', Distance to Ring: ' ..
                            NumForm(MOONORBIT - OUTERRAD[RINGCOUNT], 0, ' km')
                end
            end
        end
    end
end
::End::

-- Triggers for Giants of Class V, Helium rich and Helium
-- with or without Ring / shows Ringdetails
-- Shows if or not discovered
::Criteria::
if TRIGGERGASGIANT then
    if scan.PlanetClass and scan.PlanetClass ~= '' and string.find(string.lower(scan.PlanetClass), 'gas giant') then
        local GIGANT = 0
        local RINGTYP = ', Ring: '
        GIANTCLASS = {};
        for i = 1, 3 do
            GIANTCLASS[i] = {}
        end
        GIANTCLASS[1].game = 'Sudarsky class V gas giant';
        GIANTCLASS[1].output = 'Giant Class 5';
        GIANTCLASS[1].call = true;
        GIANTCLASS[2].game = 'Helium rich gas giant';
        GIANTCLASS[2].output = 'Helium Rich Giant';
        GIANTCLASS[2].call = true;
        GIANTCLASS[3].game = 'Helium gas giant';
        GIANTCLASS[3].output = 'Helium Giant';
        GIANTCLASS[3].call = true;
        for i = 1, 3 do
            if scan.PlanetClass == GIANTCLASS[i].game and GIANTCLASS[i].call then
                GIGANT = i
                if scan.Rings then
                    GIANTCLASS[i].output = GIANTCLASS[i].output .. ' with Ring'
                    for ring in rings(scan.Rings) do
                        RINGTYP = RINGTYP .. ring.ringclass:gsub("%eRingClass_", "") .. ' '
                    end
                else
                    RINGTYP = ' / No Ring'
                end
            end
        end
        if GIGANT > 0 then
            if scan.WasDiscovered then
                return true, 'You found a ' .. GIANTCLASS[GIGANT].output,
                    'Giant was discovered' .. RINGTYP
            else
                return true, 'You found an undiscovered ' .. GIANTCLASS[GIGANT].output,
                    'Giant was NOT discovered' .. RINGTYP
            end
        end
    end
end
::End::

-- Triggers for certain kind of Stars with High Solar Mass  
-- on suggest of Andrew Gaspurr
-- https://github.com/Xjph/ObservatoryCore/wiki/Lua-Custom-Criteria#StarType-Values
::Criteria::
if TRIGGERHIGHSOLARMASS then
    STARINTEREST = {};
    for i = 1, 3 do
        STARINTEREST[i] = {}
    end
    STARINTEREST[1].star = 'O';
    STARINTEREST[1].mass = 50; -- O-Stern min 50x SolarMass 
    STARINTEREST[2].star = 'B';
    STARINTEREST[2].mass = 20; -- B-Stern min 20x SolarMass
    STARINTEREST[3].star = 'H';
    STARINTEREST[3].mass = 20; -- BlackHole min 20x SolarMass
    local LUMI = '-'
    if scan.StarType and scan.StarType ~= '' then
        for i = 1, 3 do
            if scan.StarType == STARINTEREST[i].star and scan.StellarMass >= STARINTEREST[i].mass then
                if scan.Luminosity then
                    LUMI = scan.Luminosity
                end
                return true, 'Found a Star of Type ' .. scan.StarType .. ' with High Solar Mass',
                    'Mass: ' .. string.format('%.2f', scan.StellarMass) .. ', StarType: ' .. scan.StarType .. ', Sub: ' ..
                        scan.Subclass .. ', Lum: ' .. LUMI
            end
        end
    end
end
::End::

-- Triggers for Stars which are older or even the given value in MINSTARYEARS in Million  
-- on suggestion of Cubitux©
::Criteria::
if TRIGGERSTARYEARS and not STARYEARSCALLED then
    if scan.StarType and scan.StarType ~= '' then
        if scan.Age_MY >= MINSTARYEARS then
            local LUMI = '-'
            if scan.Luminosity then
                LUMI = scan.Luminosity
            end
            STARYEARSCALLED = true
            return true, 'Star of Type ' .. scan.StarType .. ' is ' .. NumForm(scan.Age_MY, 0, '') ..
                ' Billion Years old',
                'Type: ' .. scan.StarType .. ' / Solar-Radius: ' .. NumForm((scan.Radius / 1000) / SUNRAD, 2, '') ..
                    string.char(10) .. 'Solar-Mass: ' .. NumForm(scan.StellarMass, 2, '') .. ' / Sub: ' .. scan.Subclass ..
                    ' / Lum: ' .. LUMI
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
if scan.Landable and scan.AtmosphereComposition then
    ATMO = {};
    for i = 1, 13 do
        ATMO[i] = {}
    end
    ATMO[1].name = 'CarbonDioxide';
    ATMO[1].sign = 'CO2';
    ATMO[1].minp = 10;
    ATMO[1].rare = false
    ATMO[2].name = 'SulphurDioxide';
    ATMO[2].sign = 'SO2';
    ATMO[2].minp = 10;
    ATMO[2].rare = false
    ATMO[3].name = 'Nitrogen';
    ATMO[3].sign = 'N';
    ATMO[3].minp = 10;
    ATMO[3].rare = false
    ATMO[4].name = 'Hydrogen';
    ATMO[4].sign = 'H';
    ATMO[4].minp = 0;
    ATMO[4].rare = true
    ATMO[5].name = 'Oxygen';
    ATMO[5].sign = 'O';
    ATMO[5].minp = 0;
    ATMO[5].rare = true
    ATMO[6].name = 'Ammonia';
    ATMO[6].sign = 'NH3';
    ATMO[6].minp = 10;
    ATMO[6].rare = false
    ATMO[7].name = 'Argon';
    ATMO[7].sign = 'AR';
    ATMO[7].minp = 10;
    ATMO[7].rare = false
    ATMO[8].name = 'Neon';
    ATMO[8].sign = 'NE';
    ATMO[8].minp = 10;
    ATMO[8].rare = false
    ATMO[9].name = 'Helium';
    ATMO[9].sign = 'HE';
    ATMO[9].minp = 0;
    ATMO[9].rare = true
    ATMO[10].name = 'Methane';
    ATMO[10].sign = 'CH4';
    ATMO[10].minp = 10;
    ATMO[10].rare = false
    ATMO[11].name = 'Silicates';
    ATMO[11].sign = 'SiO';
    ATMO[11].minp = 0;
    ATMO[11].rare = true
    ATMO[12].name = 'Water';
    ATMO[12].sign = 'H2O';
    ATMO[12].minp = 0;
    ATMO[12].rare = true
    ATMO[13].name = 'Iron';
    ATMO[13].sign = 'FE';
    ATMO[13].minp = 0;
    ATMO[13].rare = true
    local COUNT = 0
    local RARE = 0
    local ADETAIL = ''
    for i = 1, 13 do
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
    for i = 1, 13 do
        if ATMO[i].exist > 0 then
            if RARE > 0 then -- if one or more elements are rare, we want to see the complete composition
                ADETAIL = ADETAIL .. string.format(', ' .. ATMO[i].sign .. ': %.2f%%', ATMO[i].exist)
            elseif ATMO[i].exist >= ATMO[i].minp then -- if there is no rare, we want to see only the elements >= ATMO[i].minp
                ADETAIL = ADETAIL .. string.format(', ' .. ATMO[i].sign .. ': %.2f%%', ATMO[i].exist)
            end
        end
    end
    if RARE > 0 then
        return true, 'This Atmosphere contains ' ..
            string.format('%i rare Element%s', RARE, RARE > 1 and 's' or ''), string.sub(ADETAIL, 3)
    end
    if COUNT > 1 and SHOWATMODETAILS then
        return true, '', string.sub(ADETAIL, 3)
    end
end
::End::

-- Just shows Ring-Details
-- Including a quot of Mass/Area (very low value, means ring is possibly not vissible)
::Criteria::
if TRIGGERRINGFACTS then
    if hasRings(scan.Rings) then
        local RINGDETAILS = ''
        local RINGCOUNT = 0
        local RINGQUOTE = 0
        for ring in rings(scan.Rings) do
            if RINGCOUNT > 0 then
                RINGDETAILS = RINGDETAILS .. string.char(10)
            end
            RINGDETAILS = RINGDETAILS .. string.gsub(string.sub(ring.name, -6), ' Ring', '') .. ': '
            RINGDETAILS = RINGDETAILS .. string.gsub(ring.ringclass, 'eRingClass_', '') .. ', '
            RINGDETAILS = RINGDETAILS .. 'Inner: ' .. NumForm(ring.innerrad / 1000, 0, ' km') .. ', '
            RINGDETAILS = RINGDETAILS .. 'Outer: ' .. NumForm(ring.outerrad / 1000, 0, ' km') .. ', '
            RINGDETAILS = RINGDETAILS .. 'Mass: ' .. NumForm(ring.massmt / 1000000, 0, ' MMT') .. ', '
            RINGQUOTE = NumForm((ring.massmt / RingFlaeche(ring.innerrad, ring.outerrad) * 10000000), 3, '')
            RINGDETAILS = RINGDETAILS .. 'Quot: ' .. RINGQUOTE
            RINGCOUNT = RINGCOUNT + 1
        end
        return true, '', RINGDETAILS
    end
end
::End::

-- Triggers for moons which are landable and close to a star
-- this Criteria doesn't work in all cases - for the moment only without BaryCentres
::Criteria::
if TRIGGERCSP then
    if scan.Landable and parents and parents[0].Scan then
        local PARENTSTAR = ''
        local AWAY = 999999
        local STARRADIUS = 0
        local STARTYPE = ''
        local CSPQUOT = 999999
        local ATMOS = ''
        local CHECKSMALLSTAR = false
        local TRIGGERVARIANT = ''

        MAXQUOT = CSPMAX
        if scan.Atmosphere ~= "" then
            ATMOS = " with Atmosphere"
            MAXQUOT = CSPMAX + CSPMAXATMO
        end
        AWAY = scan.SemiMajorAxis / KMINLS -- to it's direct parent / possibly will be changed

        -- Variant 1
        -- Landable has Star as a direct Parent
        if parents[0].Scan.StarType then
            PARENTSTAR = 'Parent: ' .. parents[0].Scan.BodyName .. ' / Star-Type: ' .. parents[0].Scan.StarType
            STARTYPE = parents[0].Scan.StarType
            STARRADIUS = parents[0].Scan.Radius / 1000 / SUNRAD
            CSPQUOT = (AWAY / STARRADIUS) * 10
            if CSPQUOT ~= 0 and CSPQUOT <= MAXQUOT then
                TRIGGERVARIANT = '' -- ' v1'
            else -- if star is in row and CSP isn't in range, we need to reset for the rest
                CSPQUOT = 999999
                TRIGGERVARIANT = ''
            end
        end

        -- Variant 99
        -- For small Stars check to the distance and ... hope to get the right AWAY from the other variants
        if CSPQUOT > MAXQUOT then
            local checkstars = {"N", "H", "X", "D", "DA", "DAB", "DAO", "DAZ", "DAV", "DB", "DBZ", "DBV", "DO", "DOV",
                                "DQ", "DC", "DCV", "DX"}
            for _, star in pairs(checkstars) do
                if star == STARTYPE and AWAY <= CSPMAXLS then
                    CHECKSMALLSTAR = true
                    CSPQUOT = 0
                    TRIGGERVARIANT = '' -- ' small star ' .. TRIGGERVARIANT
                end
            end
        end

        if CSPQUOT ~= 0 and CSPQUOT <= MAXQUOT then
            local SPEAKFIRE = ''
            if SPEAKPHRASE then
                SPEAKFIRE = 'It is on Fire! ' .. TRIGGERVARIANT .. string.char(10)
            end
            return true,
                SPEAKFIRE .. 'Landable' .. ATMOS .. ' is ' .. NumForm(AWAY, 0, ' LS') .. ' away from Star' ..
                    string.char(10) .. 'Score under ' .. MAXQUOT,
                PARENTSTAR .. string.char(10) .. 'Sonnen-Radius ' .. NumForm(STARRADIUS, 4, '') .. string.char(10) ..
                    'DfA: ' .. NumForm(scan.DistanceFromArrivalLS, 2, ' LS') .. string.char(10) .. 'Body-Temp.: ' ..
                    NumForm(scan.SurfaceTemperature, 0, ' K') .. string.char(10) .. 'CSP-Score: ' ..
                    NumForm(CSPQUOT, 2, '')

        elseif CHECKSMALLSTAR == true then
            local SPEAKFIRE = ''
            if SPEAKPHRASE then
                SPEAKFIRE = 'It is on Fire! ' .. TRIGGERVARIANT .. string.char(10)
            end
            return true, SPEAKFIRE .. 'Landable' .. ATMOS .. ' is ' .. NumForm(AWAY, 0, ' LS') ..
                ' away from Star of Type ' .. STARTYPE,
                'DfA: ' .. NumForm(scan.DistanceFromArrivalLS, 2, ' LS') .. string.char(10) .. 'Body-Temp.: ' ..
                    NumForm(scan.SurfaceTemperature, 0, ' K')

        else
            return false
        end
    end
end
::End::

-- Trigger for 'Short-Period Gas Giant' and 'Ultra-Hot-Jupiter'
-- actually without checking BaryCentres
::Criteria::
if TRIGGERSPGASGIANTS then
    if scan.PlanetClass and string.find(string.lower(scan.PlanetClass), 'gas giant') and scan.OrbitalPeriod / DAYSEC <=
        SPGASGIANTSDAYS then
        local PARENTSTAR = ''
        local STARTYPE = ''
        local FACTORBITDAYS = scan.OrbitalPeriod / DAYSEC
        local FACTORBITLS = scan.SemiMajorAxis / KMINLS
        local FACTTEMPERATURE = scan.SurfaceTemperature
        local BARYOFSTARS = 0
        local SPGASGIANTPROXY = 0
        local TRIGGERVARIANT = ''
        local SPGASGIANTFOUND = false
        local STARINROW = ''
        local STARPARTS = ''
        local STARRADIUS = 0

        -- Variant 1
        -- Short Period Gas Giant has Star as a direct Parent
        if parents and parents[0].Scan and parents[0].Scan.StarType then
            PARENTSTAR = 'Parent: ' .. parents[0].Scan.BodyName .. ' / Star-Type: ' .. parents[0].Scan.StarType
            STARTYPE = parents[0].Scan.StarType
            STARRADIUS = parents[0].Scan.Radius / 1000 / SUNRAD
            SPGASGIANTPROXY = (STARRADIUS * SPGASGIANTSLSFACTOR) +
                                  (((STARRADIUS * SPGASGIANTSLSFACTOR) * STARRADIUS) / 2) -- (SR * FAKTOR)+(((SR * FAKTOR) * SR ) / 2)
            SPGASGIANTFOUND = true
            TRIGGERVARIANT = '' -- ' SP1'
        end

        if SPGASGIANTFOUND and FACTORBITLS <= SPGASGIANTPROXY and FACTTEMPERATURE < SPGASGIANTSTEMP then
            return true, 'Short-Period Gas Giant' .. TRIGGERVARIANT,
                'Type: ' .. scan.PlanetClass .. string.char(10) .. 'Temperature: ' ..
                    NumForm(scan.SurfaceTemperature, 0, ' K') .. string.char(10) .. 'Orbital Period: ' ..
                    NumForm(FACTORBITDAYS, 2, ' days') .. string.char(10) .. 'Orbit: ' .. NumForm(FACTORBITLS, 1, ' LS') ..
                    string.char(10) .. 'Calc. max. ' .. NumForm(SPGASGIANTPROXY, 2, ' LS') .. string.char(10) .. 'DfA: ' ..
                    NumForm(scan.DistanceFromArrivalLS, 0, ' LS') .. string.char(10) .. '- - - - - - - -' ..
                    string.char(10) .. PARENTSTAR .. string.char(10) .. 'Radius of Star: ' .. STARRADIUS

        elseif SPGASGIANTFOUND and FACTORBITLS <= SPGASGIANTPROXY and FACTTEMPERATURE > SPGASGIANTSTEMP then
            return true, 'Ultra-Hot-Jupiter!' .. TRIGGERVARIANT,
                'Type: ' .. scan.PlanetClass .. string.char(10) .. 'Temperature: ' ..
                    NumForm(scan.SurfaceTemperature, 0, ' K') .. string.char(10) .. 'Orbital Period: ' ..
                    NumForm(FACTORBITDAYS, 2, ' days') .. string.char(10) .. 'Orbit: ' .. NumForm(FACTORBITLS, 1, ' LS') ..
                    string.char(10) .. 'Calc. max. ' .. NumForm(SPGASGIANTPROXY, 2, ' LS') .. string.char(10) .. 'DfA: ' ..
                    NumForm(scan.DistanceFromArrivalLS, 0, ' LS') .. string.char(10) .. '- - - - - - - -' ..
                    string.char(10) .. PARENTSTAR .. string.char(10) .. 'Radius of Star: ' .. STARRADIUS

        elseif FACTTEMPERATURE > SPGASGIANTSTEMP then -- in case we got no parent (can happen, when autoscan get the gas giant before the star)
            return true, 'Ultra-Hot-Jupiter!' .. TRIGGERVARIANT,
                'Type: ' .. scan.PlanetClass .. string.char(10) .. 'Temperature: ' .. NumForm(FACTTEMPERATURE, 0, ' K') ..
                    string.char(10) .. 'Orbital Period: ' .. NumForm(FACTORBITDAYS, 2, ' days') .. string.char(10) ..
                    'Orbit: ' .. NumForm(FACTORBITLS, 1, ' LS') .. string.char(10) .. 'DfA: ' ..
                    NumForm(scan.DistanceFromArrivalLS, 0, ' LS')
        end

    end
end
::End::

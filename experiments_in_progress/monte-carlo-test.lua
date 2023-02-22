::Global::
ROLLSPERSEED = 1000 -- The number of rolls to use per seed
NUMSEEDS = 10 -- The number of seed values to test incrementally beyond the initial os.time( ) output
MCARRAY[0,0] = 0 -- The array of test results organized by [seed, result] where result goes from 1-20
ALLOWED_DEVIATION = 2 -- The maximum allowed deviation between expected and actual results of a uniform distribution before it is reported as abnormal

-- Runs a distribution test on a range 1-20 for a provided testSeed using numRolls random rolls
-- The number of occurences of each 1-20 outcome is stored in twoDimArray as twoDimArray[testSeed, 1] through twoDimArray[testSeed, 20]
-- numRolls is the number of rolls to use
function DistributionForSeed( testSeed, twoDimArray, numRolls )
    
    -- Spin up the math library with the testing seed
    math.randomseed( testSeed )

    -- Set the results for this seed to zero for all 20 slots
    for r = 1, 20 do
        twoDimArray[testSeed, r] = 0
    end
 
    -- Roll d20 numRolls times (zero based)
    for i = 1 , numRolls do
        r = math.random(20)
        twoDimArray[testSeed, r] = twoDimArray[testSeed, r] + 1
    end

    return true
end

-- Computes the maximum deviation from the expected result of rollsUsed/20 for each of the 20 outputs for a given testSeed
-- testSeed is the seed that was tested by a prior call to DistributionForSeed
-- twoDimArray is the array that holds the results from the prior call to DistrubitionForSeed
-- numRolls is the number of rolls used from a prior call to DistributionForSeed
function MaxDeviationForSeed( testSeed, twoDimArray, rollsUsed )
    
    -- Clear the high water mark for maximum deviation
    maxDev = 0

    -- Compute our expected result
    expected = rollsUsed / 20

    -- Iterate through each rolled result. Determine difference between expected and actual results
    for r = 1, 20 do
        diff = math.abs( expected - twoDimArray[testSeed, r] )
        if ( diff > maxDev ) then
            maxDev = diff
        end
    end

    return maxDev
end


-- Trigger tests on arrival scan of a new system.
::Criteria::
if scan.StarSystem then
    startSeed = os.time( )
    result = "Distribution results for " .. NUMSEEDS .. " seeds: "
    for nextSeed = startSeed, startSeed+NUMSEEDS-1 do
        DistributionForSeed( nextSeed, MCARRAY, ROLLSPERSEED )
        deviation = MaxDeviationForSeed( nextSeed, MCARRAY, ROLLSPERSEED )
        if deviation > ALLOWED_DEVIATION then
            result = result .. deviation .. ", "
        else
            result = result .. "OK, "
        end
    end
end
::End::

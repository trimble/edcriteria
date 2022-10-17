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
local maxClassIGasGiantRadiusM = 77785448
local minClassIGasGiantRadiusM = 9098773
local maxClassIGasGiantTempK = 150
local minClassIGasGiantTempK = 100

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="0.734365">
			<Operation Operator="None">
				<FirstValue Type="EventData">MassEM</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class I gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Mass less than 0.734365 EM and Class I gas giant</Description>
		<Detail>
			<Item>MassEM</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="77787584">
			<Operation Operator="None">
				<FirstValue Type="EventData">Radius</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class I gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Radius greater than 77787.584 km and Class I gas giant</Description>
		<Detail>
			<Item>Radius</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="8079091">
			<Operation Operator="None">
				<FirstValue Type="EventData">Radius</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class I gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Radius less than 8079.091 km and Class I gas giant</Description>
		<Detail>
			<Item>Radius</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="150">
			<Operation Operator="None">
				<FirstValue Type="EventData">SurfaceTemperature</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class I gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Surface Tempature greater than 150 K and Class I gas giant</Description>
		<Detail>
			<Item>SurfaceTemperature</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="1">
			<Operation Operator="None">
				<FirstValue Type="EventData">SurfaceTemperature</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class I gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Surface Tempature less than 1 K and Class I gas giant</Description>
		<Detail>
			<Item>SurfaceTemperature</Item>
		</Detail>
	</Criteria>
	
	<!-- Class II gas giant -->
	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="1368.457764">
			<Operation Operator="None">
				<FirstValue Type="EventData">MassEM</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class II gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Mass greater than 1368.457764 EM and Class II gas giant</Description>
		<Detail>
			<Item>MassEM</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="2.641097">
			<Operation Operator="None">
				<FirstValue Type="EventData">MassEM</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class II gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Mass less than 2.641097 EM and Class II gas giant</Description>
		<Detail>
			<Item>MassEM</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="90000000">
			<Operation Operator="None">
				<FirstValue Type="EventData">Radius</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class II gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Radius greater than 90000 km and Class II gas giant</Description>
		<Detail>
			<Item>Radius</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="10222803">
			<Operation Operator="None">
				<FirstValue Type="EventData">Radius</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class II gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Radius less than 10222.803 km and Class II gas giant</Description>
		<Detail>
			<Item>Radius</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="250">
			<Operation Operator="None">
				<FirstValue Type="EventData">SurfaceTemperature</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class II gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Surface Tempature greater than 250 K and Class II gas giant</Description>
		<Detail>
			<Item>SurfaceTemperature</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="61">
			<Operation Operator="None">
				<FirstValue Type="EventData">SurfaceTemperature</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class II gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Surface Tempature less than 61 K and Class II gas giant</Description>
		<Detail>
			<Item>SurfaceTemperature</Item>
		</Detail>
	</Criteria>
	
	<!-- Class III gas giant -->
	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="3457.905762">
			<Operation Operator="None">
				<FirstValue Type="EventData">MassEM</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class III gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Mass greater than 3457.905762 EM and Class III gas giant</Description>
		<Detail>
			<Item>MassEM</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="4.296463">
			<Operation Operator="None">
				<FirstValue Type="EventData">MassEM</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class III gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Mass less than 4.296463 EM and Class III gas giant</Description>
		<Detail>
			<Item>MassEM</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="77849944">
			<Operation Operator="None">
				<FirstValue Type="EventData">Radius</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class III gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Radius greater than 77849.944 km and Class III gas giant</Description>
		<Detail>
			<Item>Radius</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="12120956">
			<Operation Operator="None">
				<FirstValue Type="EventData">Radius</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class III gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Radius less than 12120.956 km and Class III gas giant</Description>
		<Detail>
			<Item>Radius</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="800">
			<Operation Operator="None">
				<FirstValue Type="EventData">SurfaceTemperature</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class III gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Surface Tempature greater than 800 K and Class III gas giant</Description>
		<Detail>
			<Item>SurfaceTemperature</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="115">
			<Operation Operator="None">
				<FirstValue Type="EventData">SurfaceTemperature</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class III gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Surface Tempature less than 115 K and Class III gas giant</Description>
		<Detail>
			<Item>SurfaceTemperature</Item>
		</Detail>
	</Criteria>
	
	<!-- Class IV gas giant -->
	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="5403.108398">
			<Operation Operator="None">
				<FirstValue Type="EventData">MassEM</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class IV gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Mass greater than 5403.108398 EM and Class IV gas giant</Description>
		<Detail>
			<Item>MassEM</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="16.754765">
			<Operation Operator="None">
				<FirstValue Type="EventData">MassEM</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class IV gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Mass less than 16.754765 EM and Class IV gas giant</Description>
		<Detail>
			<Item>MassEM</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="78291304">
			<Operation Operator="None">
				<FirstValue Type="EventData">Radius</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class IV gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Radius greater than 78291.304 km and Class IV gas giant</Description>
		<Detail>
			<Item>Radius</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="17305224">
			<Operation Operator="None">
				<FirstValue Type="EventData">Radius</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class IV gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Radius less than 17305.224 km and Class IV gas giant</Description>
		<Detail>
			<Item>Radius</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="1450">
			<Operation Operator="None">
				<FirstValue Type="EventData">SurfaceTemperature</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class IV gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Surface Tempature greater than 1450 K and Class IV gas giant</Description>
		<Detail>
			<Item>SurfaceTemperature</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="800">
			<Operation Operator="None">
				<FirstValue Type="EventData">SurfaceTemperature</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class IV gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Surface Tempature less than 800 K and Class IV gas giant</Description>
		<Detail>
			<Item>SurfaceTemperature</Item>
		</Detail>
	</Criteria>
	
	<!-- Class V gas giant -->
	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="13063.395508">
			<Operation Operator="None">
				<FirstValue Type="EventData">MassEM</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class V gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Mass greater than 13063.395508 EM and Class V gas giant</Description>
		<Detail>
			<Item>MassEM</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="32.504833">
			<Operation Operator="None">
				<FirstValue Type="EventData">MassEM</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class V gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Mass less than 32.504833 EM and Class V gas giant</Description>
		<Detail>
			<Item>MassEM</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="77806056">
			<Operation Operator="None">
				<FirstValue Type="EventData">Radius</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class V gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Radius greater than 77806.056 km and Class V gas giant</Description>
		<Detail>
			<Item>Radius</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="20016274">
			<Operation Operator="None">
				<FirstValue Type="EventData">Radius</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class V gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Radius less than 20016.274 km and Class V gas giant</Description>
		<Detail>
			<Item>Radius</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="13713">
			<Operation Operator="None">
				<FirstValue Type="EventData">SurfaceTemperature</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class V gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Surface Tempature greater than 13713 K and Class V gas giant</Description>
		<Detail>
			<Item>SurfaceTemperature</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="1400">
			<Operation Operator="None">
				<FirstValue Type="EventData">SurfaceTemperature</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Sudarsky class V gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Surface Tempature less than 1400 K and Class V gas giant</Description>
		<Detail>
			<Item>SurfaceTemperature</Item>
		</Detail>
	</Criteria>
	
	<!-- Helium-rich gas giant -->
	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="4764.864258">
			<Operation Operator="None">
				<FirstValue Type="EventData">MassEM</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Helium rich gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Mass greater than 4764.864258 EM and Helium-rich gas giant</Description>
		<Detail>
			<Item>MassEM</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="1.028593">
			<Operation Operator="None">
				<FirstValue Type="EventData">MassEM</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Helium rich gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Mass less than 1.028593 EM and Helium-rich gas giant</Description>
		<Detail>
			<Item>MassEM</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="77743440">
			<Operation Operator="None">
				<FirstValue Type="EventData">Radius</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Helium rich gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Radius greater than 77743.44 km and Helium-rich gas giant</Description>
		<Detail>
			<Item>Radius</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="9557561">
			<Operation Operator="None">
				<FirstValue Type="EventData">Radius</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Helium rich gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Radius less than 9557.561 km and Helium-rich gas giant</Description>
		<Detail>
			<Item>Radius</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="7787">
			<Operation Operator="None">
				<FirstValue Type="EventData">SurfaceTemperature</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Helium rich gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Surface Tempature greater than 7787 K and Helium-rich gas giant</Description>
		<Detail>
			<Item>SurfaceTemperature</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="1">
			<Operation Operator="None">
				<FirstValue Type="EventData">SurfaceTemperature</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Helium rich gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Surface Tempature less than 1 K and Helium-rich gas giant</Description>
		<Detail>
			<Item>SurfaceTemperature</Item>
		</Detail>
	</Criteria>
	
	<!-- Helium-rich gas giant -->
	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="5781.101074">
			<Operation Operator="None">
				<FirstValue Type="EventData">MassEM</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Helium gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Mass greater than 5781.101074 EM and Helium-rich gas giant</Description>
		<Detail>
			<Item>MassEM</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="9.003934">
			<Operation Operator="None">
				<FirstValue Type="EventData">MassEM</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Helium gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Mass less than 9.003934 EM and Helium-rich gas giant</Description>
		<Detail>
			<Item>MassEM</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="75900720">
			<Operation Operator="None">
				<FirstValue Type="EventData">Radius</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Helium gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Radius greater than 75900.72 km and Helium-rich gas giant</Description>
		<Detail>
			<Item>Radius</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="16762012">
			<Operation Operator="None">
				<FirstValue Type="EventData">Radius</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Helium gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Radius less than 16762.012 km and Helium-rich gas giant</Description>
		<Detail>
			<Item>Radius</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Greater" Value="1701">
			<Operation Operator="None">
				<FirstValue Type="EventData">SurfaceTemperature</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Helium gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Surface Tempature greater than 1701 K and Helium-rich gas giant</Description>
		<Detail>
			<Item>SurfaceTemperature</Item>
		</Detail>
	</Criteria>

	<Criteria Comparator="And">
		<Criteria Comparator="Less" Value="53">
			<Operation Operator="None">
				<FirstValue Type="EventData">SurfaceTemperature</FirstValue>
			</Operation>
		</Criteria>
		<Criteria Comparator="Greater" Value="0">
			<Operation Operator="None">
				<FirstValue Type="EventData">PlanetClass:Helium gas giant</FirstValue>
			</Operation>
		</Criteria>
		<Description>Record breaker: Surface Tempature less than 53 K and Helium-rich gas giant</Description>
		<Detail>
			<Item>SurfaceTemperature</Item>
		</Detail>
	</Criteria>
	 
</ObservatoryCriteria>
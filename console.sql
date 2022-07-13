CREATE DATABASE TEST;
USE TEST;
CREATE TABLE session(
    id char(36),
    equipmentactivityid char(36),
    startutc timestamp,
    endutc timestamp,
    duration float,
    areaacres float,
    areahectares float,
    notes text(65535),
    updateutc timestamp
);
CREATE TABLE sessionasset(
    id bigint,
    sessionid char(36),
    assetid bigint,
    asset varchar(100),
    duration float,
    areaacres float,
    areahectares float,
    unitcost float,
    chargebyarea boolean,
    totalcost numeric,
    updateutc timestamp
);
CREATE TABLE sessioncoverage(
    sessionid char(36),
    geometry geometry,
    timeutc timestamp,
    `values` text(65535),
    updateutc timestamp
);
CREATE TABLE sessionharvest(
    id bigint,
    sessionid char(36),
    mastercommodityid int,
    mastercommodity varchar(100),
    quantity float,
    quantityunitofmeasureid int,
    quantityunitofmeasure varchar(20),
    areaacres float,
    areahectares float,
    moisture float,
    unitprice float,
    totalincome numeric,
    updateutc timestamp
);
CREATE TABLE sessionimplement(
    id bigint,
    sessionid char(36),
    implementid bigint,
    implement varchar(100),
    areaacres float,
    areahectares float,
    unitcost float,
    totalcost numeric,
    updateutc timestamp
);
CREATE TABLE sessionoperator(
    id bigint,
    sessionid char(36),
    operatorid bigint,
    operatorfirstname varchar(100),
    operatorlastname varchar(100),
    duration float,
    unitcost float,
    totalcost numeric,
    updateutc timestamp
);
CREATE TABLE sessiontankmix(
    id bigint,
    sessionid char(36),
    materialid bigint,
    material varchar(100),
    quantity float,
    quantityunitofmeasureid int,
    quantityunitofmeasure varchar(20),
    rateperacre float,
    rateperhectare float,
    rateunitofmeasureid int,
    rateunitofmeasure varchar(20),
    updateutc timestamp
);
CREATE TABLE sessioncondition(
    id bigint,
    sessionid char(36),
    growthstage varchar(100),
    skyconditions varchar(100),
    temperature float,
    humidity float,
    winddirection float,
    windspeed float,
    windgustspeed float,
    soilconditions varchar(100),
    soiltype varchar(100),
    appmethod varchar(100),
    recordedutc timestamp,
    updateutc timestamp
);
CREATE TABLE sessionmaterial(
    id bigint,
    sessionid char(36),
    materialid bigint,
    material varchar(100),
    quantity float,
    quantityunitofmeasureid int,
    quantityunitofmeasure varchar(20),
    basequantity float,
    basequantityunitofmeasureid int,
    basequantityunitofmeasure varchar(20),
    rateperacre float,
    rateperhectare float,
    rateunitofmeasureid int,
    rateunitofmeasure varchar(20),
    baserateperacre float,
    baserateperhectare float,
    baserateunitofmeasureid int,
    baserateunitofmeasure varchar(20),
    appliedacres float,
    appliedhectares float,
    unitcost float,
    totalcost numeric,
    updateutc timestamp
);
CREATE TABLE implement(
    id bigint,
    organizationid bigint,
    organizationname varchar(200),
    `name` varchar(100),
    unitcost float,
    operationtypeid int,
    operationtype varchar(100),
    suboperationtypeid int,
    suboperationtype varchar(100),
    isdeleted boolean,
    updateutc timestamp
);
CREATE TABLE asset(
    id bigint,
    organizationid bigint,
    organizationname varchar(200),
    assettypeid int,
    assettype varchar(100),
    `name` varchar(100),
    makecode varchar(5),
    make varchar(400),
    modelid int,
    model varchar(400),
    serialnumber varchar(50),
    manufactureyear int,
    vin varchar(100),
    unitcost float,
    chargebyarea boolean,
    isdeleted boolean,
    updateutc timestamp
);
CREATE TABLE assettype(
    id int,
    name varchar(100),
    isdeleted int,
    updateutc timestamp
);
CREATE TABLE assetlocationhistory(
    id char(36),
    assetid char(36),
    deviceid char(36),
    `point` geometry,
    gpslatitude float,
    gpslongitude float,
    speed float,
    heading float,
    generatedutc timestamp,
    swathwidth float,
    applicationwidth float,
    autoguidanceenabled boolean,
    implementengaged boolean,
    offlinedistance float,
    gpsquality int,
    operator varchar(200),
    highquality boolean,
    hidden boolean,
    targetfield varchar(200),
    implementname varchar(200),
    autoguidancestate int,
    fieldname varchar(200),
    fielduuid char(36),
    taskname varchar(200),
    taskoperation varchar(200),
    taskstate varchar(200),
    taskuuid char(36),
    guidancelinename varchar(200),
    guidancelineuuid char(36),
    updateutc timestamp
);
CREATE TABLE plantschedule(
    id int,
    organizationid bigint,
    organizationname varchar(200),
    cropyear int,
    deliverystart timestamp,
    deliveryend timestamp,
    croptypeid int,
    croptype varchar(100),
    cropdescription varchar(200),
    daystoharvest smallint,
    requiredamount numeric,
    requiredunit varchar(20),
    yield numeric,
    iscalculated boolean,
    updateutc timestamp
);
CREATE TABLE plantscheduledetail(
    id int,
    plantscheduleid int,
    fieldid int,
    fieldcropyear int,
    fieldname varchar(100),
    cropdescription varchar(200),
    wetdate timestamp,
    harvestdate timestamp,
    compostdate timestamp,
    projected numeric,
    quantitytotal numeric,
    quantityrequired numeric,
    yield numeric,
    comments varchar(2000),
    updateutc timestamp
);
CREATE TABLE requiredcommodity(
    id int,
    organizationid bigint,
    organizationname varchar(200),
    cropyear int,
    seasonweek int,
    harvestdate timestamp,
    croptypeid int,
    croptype varchar(100),
    cropdescription varchar(200),
    commoditytype varchar(200),
    customerid int,
    customername varchar(200),
    amount numeric,
    amountunit varchar(20),
    updateutc timestamp
);
CREATE TABLE commoditycustomer(
    id int,
    buyername varchar(200),
    contactfirstname varchar(100),
    contactlastname varchar(100),
    address varchar(400),
    address2 varchar(300),
    city varchar(200),
    provincestate varchar(40),
    postal varchar(100),
    countryid int,
    countryname varchar(300),
    email varchar(300),
    workphone varchar(100),
    cellphone varchar(100),
    fax varchar(100),
    notes text(65535),
    updateutc timestamp
);
CREATE TABLE commoditycontract(
    id int,
    organizationid bigint,
    organizationname varchar(200),
    cropyear int,
    contractdate timestamp,
    contracttypeid int,
    contracttype varchar(200),
    contractname varchar(500),
    contractnumber varchar(100),
    buyerid int,
    buyername varchar(200),
    volume numeric,
    volumeunit varchar(20),
    price numeric,
    basis numeric,
    deliveryterms varchar(1000),
    deliverystartdate timestamp,
    deliveryenddate timestamp,
    deliverylocation varchar(100),
    croptypeid int,
    croptype varchar(100),
    cropdescription varchar(100),
    cropvariety varchar(100),
    commoditydescription varchar(200),
    updateutc timestamp
);
CREATE TABLE bintransaction(
    id int,
    organizationid bigint,
    organizationname varchar(200),
    sourcetype varchar(100),
    sourcetypeid int,
    sourcecropyear int,
    sourcetypename varchar(500),
    destinationtype varchar(100),
    destinationtypeid int,
    destinationtypename varchar(500),
    transactiondate timestamp,
    croptypeid int,
    croptype varchar(100),
    volume numeric,
    volumeunit varchar(1000),
    netvolume numeric,
    netvolumeunit varchar(20),
    truck varchar(200),
    ticketnumber varchar(200),
    contactid int,
    contactname varchar(1), #Уточнить почему так мало байт
    crewnumber varchar(200),
    transactionunittypeid int,
    transactionunittype varchar(200),
    numberofbeds numeric,
    numberofpallets int,
    transactionenddate timestamp,
    mapcolor varchar(20),
    islocked boolean,
    updateutc timestamp
);
CREATE TABLE unitofmeasure(
    id int,
    `name` varchar(20),
    isdeleted int,
    updateutc timestamp
);
CREATE TABLE material(
    id bigint,
    `name` varchar(100),
    materialtypeid int,
    materialtype varchar(100),
    materialsubtypeid int,
    materialsubtype varchar(300),
    materialformid int,
    materialform varchar(100),
    purchaseunitofmeasureid int,
    purchaseunitofmeasure varchar(20),
    targetrate float,
    appliedunitofmeasureid int,
    appliedunitofmeasure varchar(20),
    unitcost float,
    density float,
    densityunit varchar(20),
    percentnitrogen float,
    percentphosphorus float,
    percentpotassium float,
    percentsulfur float,
    percentmagnesium float,
    percentcalcium float,
    percentchloride float,
    percentboron float,
    percentcopper float,
    percentiron float,
    percentmanganese float,
    percentzinc float,
    percentmolybdenum float,
    updateutc timestamp
);
CREATE TABLE materialform(
    id int,
    `name` varchar(100),
    isdeleted int,
    updateutc timestamp
);
CREATE TABLE materialexpense(
    id int,
    materialid bigint,
    materialname varchar(100),
    invoicenumber varchar(40),
    expensedate timestamp,
    purchasefrom varchar(200),
    unitsize numeric,
    quantity numeric,
    quantityunit varchar(100),
    priceperunit numeric,
    taxes numeric,
    totalinvoiced numeric,
    notes varchar(2000),
    updateutc timestamp
);
CREATE TABLE materialtype(
    id int,
    `name` varchar(100),
    isdeleted int,
    updateutc timestamp
);
CREATE TABLE materialsubtype(
    id int,
    materialtypeid int,
    `code` varchar(2),
    `name` varchar(300),
    isdeleted int,
    updateutc timestamp
);
CREATE TABLE equipmentactivity(
    id char(36),
    organizationid bigint,
    organizationname varchar(200),
    fieldid int,
    fieldcropyear int,
    fieldname varchar(100),
    taskname varchar(100),
    operationtypeid int,
    operationtype varchar(100),
    suboperationtypeid int,
    suboperationtype varchar(100),
    isverified boolean,
    operationgroupid char(36),
    startutc timestamp,
    endutc timestamp,
    acres float,
    hectares float,
    duration float,
    assetsummary text(65535),
    implementsummary text(65535),
    materialsummary text(65535),
    tankmixsummary text(65535),
    conditionsummary text(65535),
    operatorsummary text(65535),
    harvestsummary  text(65535),
    updateutc timestamp
);
CREATE TABLE productevent(
    id int,
    fieldactivityid char(36),
    startdate timestamp,
    enddate timestamp,
    productapplicationtype varchar(100),
    sprayvolume numeric,
    sprayvolumeunit varchar(20),
    weather varchar(200),
    temperature varchar(20),
    temperatureunit varchar(8000),
    windspeed varchar(20),
    windspeedunit varchar(20),
    winddirection varchar(20),
    sensitivearea varchar(6),
    sensitiveareadescription varchar(200),
    applicator varchar(1000),
    applicatorlicense varchar(1000),
    updateutc timestamp
);
CREATE TABLE producteventmaterial(
    id int,
    producteventid int,
    materialid bigint,
    materialname varchar(300),
    materialsubtypeid int,
    materialsubtype varchar(300),
    registrationnumber varchar(100),
    manufacturer varchar(200),
    appliedacres numeric,
    appliedhectares numeric,
    applicationrate float,
    applicationrateunit varchar(50),
    applicationcropstage varchar(510),
    comments varchar(1000),
    updateutc timestamp
);
CREATE TABLE observationtype(
    id int,
    `name` varchar(200),
    sortorder int,
    isdeleted boolean,
    updateutc timestamp
);
CREATE TABLE observationtypeoption(
    id int,
    observationtypeid int,
    observationtype varchar(200),
    `name` varchar(200),
    color varchar(20),
    sortorder int,
    isdeleted boolean
);
CREATE TABLE observationresponse(
    id bigint,
    permanentcropid bigint,
    observationtypeid int,
    observationtype varchar(200),
    observationtypeoptionid int,
    observationtypeoption varchar(200),
    `date` timestamp,
    loginid int,
    firstname varchar(300),
    lastname varchar(300),
    updateutc timestamp
);
CREATE TABLE croprootstock(
    id int,
    croptypeid int,
    croptype varchar(100),
    `name` varchar(200),
    sortorder int,
    isdeleted boolean,
    updateutc timestamp
);
CREATE TABLE cropvarietyclone(
    id int,
    cropvarietyid int,
    cropvariety varchar(200),
    `name` varchar(200),
    sortorder int,
    isdeleted boolean,
    updateutc timestamp
);
CREATE TABLE croptype(
    id int,
    `name` varchar(100),
    isdeleted int,
    updateutc timestamp
);
CREATE TABLE permanentcrop(
    id bigint,
    organizationid bigint,
    organizationname varchar(200),
    fieldid int,
    fieldname varchar(100),
    yearplanted int,
    vinenumber int,
    vinecode varchar(100),
    `row` int,
    `point` geometry,
    gpslatitude float,
    gpslongitude float,
    gpselevation float,
    croptypeid int,
    croptype varchar(100),
    cropdescriptionid int,
    cropdescription varchar(200),
    cropvarietyid int,
    cropvariety varchar(200),
    croprootstockid int,
    croprootstock varchar(200),
    cropvarietycloneid int,
    cropvarietyclone varchar(200),
    retireddate timestamp,
    updateutc timestamp
);
CREATE TABLE processor(
    id int,
    `name` varchar(300),
    address varchar(300),
    city varchar(200),
    stateprovince varchar(20),
    zippostalcode varchar(20),
    country varchar(20),
    phone varchar(40),
    fax varchar(40),
    website varchar(400),
    contactname varchar(400),
    contactphone varchar(40),
    contactemail varchar(500),
    notes varchar(1000),
    updateutc timestamp
);
CREATE TABLE processorplant(
    id int,
    processorid int,
    `name` varchar(300),
    address varchar(300),
    city varchar(200),
    stateprovince varchar(20),
    zippostalcode varchar(20),
    country varchar(20),
    phone varchar(40),
    fax varchar(40),
    website varchar(400),
    contactname varchar(400),
    contactphone varchar(40),
    contactemail varchar(500),
    bulletinhtml text(65535),
    bulletinupdated timestamp,
    isdeleted boolean,
    updateutc timestamp
);
CREATE TABLE processorplantcontract(
    id int,
    processorplantid int,
    `name` varchar(300),
    varietynumber varchar(30),
    isdeleted boolean,
    updateutc timestamp
);
CREATE TABLE fieldscouter(
    id int,
    userid int,
    userfirst varchar(100),
    userlast varchar(100),
    contactid int,
    contactfirst varchar(100),
    contactlast varchar(100),
    cropyear int,
    datescouted timestamp,
    croptypeid int,
    croptype varchar(100),
    cropstage varchar(200),
    cropappearance varchar(40),
    weather varchar(200),
    airtemperature numeric,
    airtemperatureunit varchar(20),
    windspeed numeric,
    windspeedunit varchar(20),
    winddirection varchar(20),
    humidity numeric,
    seedingdepth varchar(200),
    plantstand varchar(500),
    cropheight numeric,
    plantuniformity varchar(40),
    plantdepth varchar(500),
    plantfruitdevelopment varchar(300),
    plantexpectedgrade varchar(100),
    plantexpectedyield numeric,
    plantexpectedyieldunit varchar(100),
    rootdevelopment varchar(40),
    rootexudates varchar(40),
    rootmycorrhiza varchar(40),
    rootdowngrowth varchar(40),
    rootnodules varchar(40),
    insectdamageaboveground varchar(40),
    insectdamageabovegroundcomments varchar(1000),
    insectdamagebelowground varchar(40),
    insectdamagebelowgroundcomments varchar(1000),
    comments text(65535),
    nutrientcomments text(65535),
    soilmoisturecomments text(65535),
    weedcomments text(65535),
    recsuggesteddate timestamp,
    recexpirydate timestamp,
    rectimingcomment varchar(300),
    recapplicationtype varchar(50),
    recpreharvestinterval varchar(20),
    recpreharvestintervalunit varchar(20),
    recreentryinterval varchar(20),
    recreentryintervalunit varchar(20),
    recapplicator varchar(100),
    recsprayvolume numeric,
    recsprayvolumeunit varchar(20),
    rectanksize numeric,
    recrestrictions varchar(2000),
    recapplicationcomments varchar(2000),
    recapplicationcostperacre numeric,
    recproductcostperacre numeric,
    rectotalacres numeric,
    rectotalhectares numeric,
    rectotalacresapplied numeric,
    rectotalhectaresapplied numeric,
    recproductcosttotal numeric,
    rectotalcost numeric,
    recadvisorname varchar(200),
    recadvisorlicence varchar(300),
    updateutc timestamp
);
CREATE TABLE fieldscouterrecommendation(
    id int,
    fieldscouterid int,
    product varchar(300),
    rate float,
    rateunit varchar(50),
    stage varchar(510),
    comments varchar(1000),
    costperacre numeric,
    costperunit numeric,
    costunit varchar(20),
    totalmaterial numeric,
    targetpest varchar(200),
    phivalue varchar(1000),
    phivalueunit varchar(1000),
    reihours numeric,
    updateutc timestamp
);
CREATE TABLE fieldscouterdisease(
    id int,
    fieldscouterid int,
    diseasename varchar(200),
    rating varchar(40),
    comments varchar(2000),
    updateutc timestamp
);
CREATE TABLE fieldscouternematode(
    id int,
    fieldscouterid int,
    nematodename varchar(200),
    rating varchar(100),
    comments varchar(200),
    updateutc timestamp
);
CREATE TABLE fieldscouterweed(
    id int,
    fieldscouterid int,
    weedname varchar(100),
    rating varchar(50),
    comments varchar(1000),
    growthstage varchar(200),
    updateutc timestamp
);
CREATE TABLE fieldscoutersoil(
    id int,
    fieldscouterid int,
    samplemethod varchar(400),
    temperature numeric,
    temperatureunit varchar(2),
    samplelocation varchar(400),
    gpslat numeric,
    gpslong numeric,
    capacitypercent numeric,
    moisturegrade varchar(40),
    updateutc timestamp
);
CREATE TABLE fertilizerevent(
    id int,
    fieldactivityid char(36),
    applieddate timestamp,
    placementtypeid int,
    placementtype varchar(100),
    pass int,
    tank int,
    appliedacres numeric,
    appliedhectares numeric,
    rate numeric,
    rateunitid int,
    rateunit varchar(100),
    density numeric,
    poundsapplied float,
    placementtiming varchar(2000),
    fertilizertype varchar(100),
    appliedpercentnitrogen float,
    appliedpercentphosphorus float,
    appliedpercentpotassium float,
    appliedpercentsulfur float,
    appliedpercentmagnesium float,
    appliedpercentcalcium float,
    appliedpercentchloride float,
    appliedpercentboron float,
    appliedpercentcopper float,
    appliedpercentiron float,
    appliedpercentmanganese float,
    appliedpercentzinc float,
    appliedpercentmolybdenum float,
    costperarea numeric,
    costperareaunit varchar(4),
    blendfee numeric,
    deliveryfee numeric,
    applicatorcost numeric,
    updateutc timestamp
);
CREATE TABLE fertilizereventmaterial(
    id int,
    fertilizereventid int,
    materialid bigint,
    materialname varchar(200),
    price numeric,
    percentmaterialapplied float,
    density numeric,
    updateutc timestamp
);
CREATE TABLE placementtype(
    id int,
    `name` varchar(100),
    isdeleted int,
    updateutc timestamp
);
CREATE TABLE seedevent(
    id int,
    fieldactivityid char(36),
    materialid bigint,
    seeddate timestamp,
    appliedacres numeric,
    appliedhectares numeric,
    isprimary int,
    croptypeid int,
    croptype varchar(100),
    cropdescription varchar(300),
    cropvariety varchar(300),
    rate float,
    rateunitid int,
    rateunit varchar(100),
    comments varchar(2000),
    costperarea numeric,
    costareaunit varchar(4),
    costperunit numeric,
    costunit varchar(60),
    lotnumber varchar(100),
    certnum varchar(300),
    seededinto varchar(20),
    `source` varchar(400),
    vigor int,
    weight float,
    weightunit varchar(20),
    density float,
    densityunit varchar(20),
    germination int,
    germinationdate timestamp,
    plantingdepth numeric,
    plantingdepthunit varchar(20),
    rowspacing numeric,
    rowspacingunit varchar(20),
    seedspacing numeric,
    seedspacingunit varchar(20),
    seedissuedout numeric,
    seedissuedoutunit varchar(20),
    seedbeds smallint,
    islocked int,
    seedorder int,
    updateutc timestamp
);
CREATE TABLE harvestevent(
    id int,
    fieldactivityid char(36),
    harvestdate timestamp,
    acres numeric,
    hectares numeric,
    croptypeid int,
    croptype varchar(100),
    cropdescription varchar(200),
    cropvariety varchar(200),
    cropgrade varchar(100),
    yield numeric,
    yieldunit varchar(100),
    priceperunit numeric,
    totalyield numeric,
    totalyieldunit varchar(20),
    moisture int,
    beds numeric,
    comments varchar(1000),
    updateutc timestamp
);
CREATE TABLE farmevent(
    id int,
    fieldactivityid char(36),
    farmeventdate timestamp,
    eventtype varchar(500),
    `description` varchar(1000),
    comments varchar(6000),
    water numeric,
    waterunit varchar(20),
    `source` varchar(400),
    updateutc timestamp
);
CREATE TABLE fieldactivity(
    id char(36),
    organizationid bigint,
    organizationname varchar(200),
    fieldid int,
    fieldcropyear int,
    fieldname varchar(100),
    eventtypeid int,
    eventtype varchar(18),
    eventsubtype text(8000),
    `date` timestamp,
    product text(8000),
    identification varchar(400),
    rate float,
    rateunit varchar(100),
    acres numeric,
    hectares numeric,
    comments text(8000),
    costperarea numeric,
    costareaunit varchar(4),
    contactid int,
    contactfirstname varchar(100),
    contactlastname varchar(100),
    updateutc timestamp
);
CREATE TABLE eventtype(
    id int,
    `name` varchar(18),
    isdeleted int,
    updateutc timestamp
);
CREATE TABLE otherexpenseevent(
    id int,
    fieldactivityid char(36),
    `date` timestamp,
    expensetype varchar(40),
    acres numeric,
    hectares numeric,
    `description` varchar(300),
    comments varchar(300),
    costperarea numeric,
    costperareaunit varchar(4),
    hours numeric,
    costperhour numeric,
    updateutc timestamp
);
CREATE TABLE organization(
    id bigint,
    `name` varchar(200),
    adsreferenceid int,
    firstname varchar(100),
    lastname varchar(100),
    email varchar(300),
    address varchar(300),
    address2 varchar(300),
    city varchar(100),
    stateprovince varchar(100),
    zippostalcode varchar(100),
    country varchar(100),
    homephone varchar(100),
    workphone varchar(100),
    cellphone varchar(100),
    fax varchar(100),
    updateutc timestamp
);
CREATE TABLE field(
    id int,
    cropyear int,
    parentfieldid int,
    organizationid bigint,
    organizationname varchar(200),
    farmid int,
    farmname varchar(300),
    fieldname varchar(100),
    legallanddescription varchar(100),
    fieldtype varchar(8),
    fieldcropsequence smallint,
    state varchar(100),
    county varchar(100),
    acres numeric,
    hectares numeric,
    croptypeid int,
    croptype varchar(100),
    cropdescription varchar(200),
    cropvariety varchar(100),
    targetyield varchar(100),
    targetyieldunitid int,
    targetyieldunit varchar(100),
    actualyield float,
    actualyieldunitid int,
    actualyieldunit varchar(100),
    gpslatitude varchar(100),
    gpslongitude varchar(100),
    soiltype varchar(100),
    soiltexturepercentsand int,
    soiltexturepercentsilt int,
    soiltexturepercentclay int,
    irrigatedacres numeric,
    irrigatedhectares numeric,
    irrigationtype varchar(100),
    secondaryirrigationtype varchar(100),
    nonirrigatedacres numeric,
    nonirrigatedhectares numeric,
    gpmrating numeric,
    principalirrigator varchar(50),
    pumppressure numeric,
    pumppressureunitid int,
    pumppressureunit varchar(20),
    pumplift numeric,
    pumpliftunitid int,
    pumpliftunit varchar(20),
    fieldnotes text(65535),
    fsanumber varchar(200),
    processorfieldid varchar(40),
    processorid int,
    processor varchar(300),
    processorregionid int,
    processorregion varchar(300),
    processorcontracttypeid int,
    processorcontracttype varchar(336),
    processorcontractnumber varchar(40),
    updateutc timestamp
);
CREATE TABLE yieldunitofmeasure(
    id int,
    `code` varchar(100),
    `name` varchar(100),
    isdeleted int,
    updateutc timestamp
);
CREATE TABLE fieldscouterfield(
    id int,
    fieldscouterid int,
    fieldid int,
    fieldcropyear int,
    fieldname varchar(100),
    updateutc timestamp
);
CREATE TABLE farm(
    id int,
    organizationid bigint,
    organizationname varchar(200),
    farmname varchar(300),
    fsanumber varchar(300),
    updateutc timestamp
);
CREATE TABLE fieldboundary(
    id int,
    fieldid int,
    fieldcropyear int,
    boundary geometry,
    updateutc timestamp
);
CREATE TABLE fieldcropdate(
    id int,
    fieldid int,
    fieldcropyear int,
    fieldname varchar(100),
    cropdatetypeid int,
    cropdatetype varchar(200),
    `date` timestamp,
    updateutc timestamp
);
CREATE TABLE cropdatetype(
    id int,
    croptypeid int,
    croptype varchar(100),
    `name` varchar(200),
    isdeleted boolean,
    updateutc timestamp
);
CREATE TABLE soiltest(
    id int,
    fieldid int,
    fieldcropyear int,
    zoneid int,
    testnumber varchar(100),
    testdesc varchar(40),
    samplenumber varchar(100),
    reportnumber varchar(100),
    labnumber varchar(100),
    testdate timestamp,
    datereported timestamp,
    takenby varchar(100),
    labused varchar(100),
    depthid varchar(100),
    depthunit varchar(40),
    depthstart int,
    depthend int,
    organicmatter float,
    phosphorusp1 float,
    phosphorusp2 float,
    phosphorusp float,
    saturationp float,
    bicarb float,
    p1p2ratio float,
    potassium float,
    magnesium float,
    kmgratio float,
    calcium float,
    phsoil float,
    phbuffer float,
    sodium float,
    cec float,
    percentk float,
    percentmg float,
    percentca float,
    percenth float,
    percentna float,
    sulphur float,
    zinc float,
    manganese float,
    iron float,
    copper float,
    boron float,
    nitrates float,
    soluablesalts float,
    chloride float,
    aluminum float,
    nsratio float,
    mo float,
    nh4 float,
    bulkdensity float,
    basesaturation float,
    freelime float,
    phosphorusmehlichp float,
    quallime varchar(200),
    soiltypeid int,
    percentsand numeric,
    percentsilt numeric,
    percentclay numeric,
    wetweight numeric,
    dryweight numeric,
    labcomments varchar(500),
    percentmoisture numeric,
    urea numeric,
    testtypeid int,
    updateutc timestamp
);
CREATE TABLE soiltestdepth(
    id int,
    `name` varchar(100),
    startdepth int,
    enddepth int,
    depthunit varchar(40),
    sortorder int,
    isdeleted int,
    updateutc timestamp
);
CREATE TABLE soiltype(
    id int,
    `name` varchar(100),
    isdeleted int,
    updateutc timestamp
);
CREATE TABLE tissuetest(
    id int,
    fieldid int,
    fieldcropyear int,
    testdesc varchar(40),
    zoneid int,
    labid int,
    reportnumber varchar(100),
    labused varchar(100),
    labnumber varchar(1000),
    testdate timestamp,
    datereported timestamp,
    growthstage varchar(200),
    plantpart varchar(100),
    n float,
    nlow float,
    nhigh float,
    nn float,
    nnlow float,
    nnhigh float,
    s float,
    `slow` float,
    shigh float,
    p float,
    plow float,
    phigh float,
    k float,
    klow float,
    khigh float,
    mg float,
    mglow float,
    mghigh float,
    ca float,
    calow float,
    cahigh float,
    na float,
    nalow float,
    nahigh float,
    b float,
    blow float,
    bhigh float,
    zn float,
    znlow float,
    znhigh float,
    mn float,
    mnlow float,
    mnhigh float,
    fe float,
    felow float,
    fehigh float,
    cu float,
    culow float,
    cuhigh float,
    al float,
    allow float,
    alhigh float,
    cl float,
    cllow float,
    clhigh float,
    ns float,
    nsexpected float,
    nk float,
    nkexpected float,
    ps float,
    psexpected float,
    kmg float,
    kmgexpected float,
    kmn float,
    kmnexpected float,
    femn float,
    femnexpected float,
    cab float,
    cabexpected float,
    ratingn varchar(10),
    ratingn03n varchar(10),
    ratings varchar(10),
    ratingp varchar(10),
    ratingk varchar(10),
    ratingmg varchar(10),
    ratingca varchar(10),
    ratingna varchar(10),
    ratingb varchar(10),
    ratingzn varchar(10),
    ratingmn varchar(10),
    ratingfe varchar(10),
    ratingcu varchar(10),
    ratingal varchar(10),
    ratingcl varchar(10),
    sampleid varchar(200),
    notes varchar(2000),
    appearancedesc varchar(200),
    kca numeric,
    kcaexpected numeric,
    camg numeric,
    camgexpected numeric,
    cacu numeric,
    cacuexpected numeric,
    camn numeric,
    camnexpected numeric,
    cazn numeric,
    caznexpected numeric,
    mncu numeric,
    mncuexpected numeric,
    crop varchar(100),
    cropdesc varchar(200),
    analysis varchar(100),
    mo float,
    molow float,
    mohigh float,
    ratingmo varchar(10),
    updateutc timestamp
);
INSERT session(id)
VALUES (34),(38),(39);
INSERT sessioncoverage(sessionid)
VALUES (34),(38),(39);
SELECT * FROM sessioncoverage
JOIN session ON sessioncoverage.sessionid = session.id;
SELECT * FROM session
JOIN sessionoperator ON session.id = sessionoperator.sessionid;
SELECT * FROM organization
JOIN farm ON organization.id = farm.organizationid;
SELECT * FROM organization
JOIN fieldactivity ON organization.id = fieldactivity.organizationid;
SELECT * FROM placementtype
JOIN fertilizerevent ON placementtype.id = fertilizerevent.placementtypeid;
SELECT * FROM fertilizerevent
JOIN fertilizereventmaterial ON fertilizerevent.id = fertilizereventmaterial.fertilizereventid;
SELECT * FROM soiltype
JOIN soiltest ON soiltype.id = soiltest.soiltypeid;
SELECT * FROM soiltestdepth
JOIN soiltest ON soiltestdepth.id = soiltest.depthid;
SELECT * FROM eventtype
JOIN fieldactivity ON eventtype.id = fieldactivity.eventtypeid;
SELECT * FROM materialtype
JOIN materialsubtype ON materialtype.id = materialsubtype.materialtypeid;
SELECT * FROM asset
JOIN sessionasset ON asset.id = sessionasset.assetid;
SELECT * FROM implement
JOIN sessionimplement ON implement.id = sessionimplement.implementid;
SELECT * FROM plantschedule
JOIN plantscheduledetail ON plantschedule.id = plantscheduledetail.plantscheduleid;
SELECT * FROM organization
JOIN plantschedule ON organization.id = plantschedule.organizationid;
SELECT * FROM commoditycustomer
JOIN requiredcommodity ON commoditycustomer.id = requiredcommodity.customerid;
SELECT * FROM commoditycustomer
JOIN commoditycontract ON commoditycustomer.id = commoditycontract.buyerid;
SELECT * FROM fieldscouter
JOIN fieldscouterfield ON fieldscouter.id = fieldscouterfield.fieldscouterid;
SELECT * FROM fieldscouter
JOIN fieldscouterrecommendation ON fieldscouter.id = fieldscouterrecommendation.fieldscouterid;
SELECT * FROM fieldscouter
JOIN fieldscouterdisease ON fieldscouter.id = fieldscouterdisease.fieldscouterid;
SELECT * FROM fieldscouter
JOIN fieldscouternematode ON fieldscouter.id = fieldscouternematode.fieldscouterid;
SELECT * FROM fieldscouter
JOIN fieldscouterweed ON fieldscouter.id = fieldscouterweed.fieldscouterid;
SELECT * FROM fieldscouter
JOIN fieldscoutersoil ON fieldscouter.id = fieldscoutersoil.fieldscouterid;
SELECT * FROM processor
JOIN processorplant ON processor.id = processorplant.processorid;
SELECT * FROM processorplant
JOIN processorplantcontract ON processorplant.id = processorplantcontract.processorplantid;
SELECT * FROM permanentcrop
JOIN observationresponse ON permanentcrop.id = observationresponse.permanentcropid;
SELECT * FROM observationtypeoption
JOIN observationresponse ON observationtypeoption.id = observationresponse.observationtypeoptionid;
SELECT * FROM observationtype
JOIN observationresponse ON observationtype.id = observationresponse.observationtypeid;
SELECT * FROM croprootstock
JOIN permanentcrop ON croprootstock.id = permanentcrop.croprootstockid;
SELECT * FROM cropvarietyclone
JOIN permanentcrop ON cropvarietyclone.id = permanentcrop.cropvarietycloneid;
SELECT * FROM assettype
JOIN asset ON assettype.id = asset.assettypeid;
SELECT * FROM asset
JOIN assetlocationhistory ON asset.id = assetlocationhistory.assetid;
# where sessionid = 34
# drop database TEST
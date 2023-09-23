
-- VHDL netlist produced by program ldbanno, Version Diamond (64-bit) 3.12.0.240.2

-- ldbanno -n VHDL -o HalfAdder_HalfAdder_impl1_mapvho.vho -w -neg -gui HalfAdder_HalfAdder_impl1_map.ncd 
-- Netlist created on Thu Sep 21 20:18:11 2023
-- Netlist written on Thu Sep 21 20:18:12 2023
-- Design is for device LCMXO2-4000HC
-- Design is for package CSBGA132
-- Design is for performance grade 4

-- entity lut4
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity lut4 is
    port (A: in Std_logic; B: in Std_logic; C: in Std_logic; D: in Std_logic; 
          Z: out Std_logic);

    ATTRIBUTE Vital_Level0 OF lut4 : ENTITY IS TRUE;

  end lut4;

  architecture Structure of lut4 is
  begin
    INST10: ROM16X1A
      generic map (initval => X"8888")
      port map (AD0=>A, AD1=>B, AD2=>C, AD3=>D, DO0=>Z);
  end Structure;

-- entity gnd
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity gnd is
    port (PWR0: out Std_logic);

    ATTRIBUTE Vital_Level0 OF gnd : ENTITY IS TRUE;

  end gnd;

  architecture Structure of gnd is
  begin
    INST1: VLO
      port map (Z=>PWR0);
  end Structure;

-- entity lut40001
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity lut40001 is
    port (A: in Std_logic; B: in Std_logic; C: in Std_logic; D: in Std_logic; 
          Z: out Std_logic);

    ATTRIBUTE Vital_Level0 OF lut40001 : ENTITY IS TRUE;

  end lut40001;

  architecture Structure of lut40001 is
  begin
    INST10: ROM16X1A
      generic map (initval => X"6666")
      port map (AD0=>A, AD1=>B, AD2=>C, AD3=>D, DO0=>Z);
  end Structure;

-- entity SLICE_0
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity SLICE_0 is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "SLICE_0";

      tipd_B1  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_A1  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_B0  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_A0  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_B1_F1	 : VitalDelayType01 := (0 ns, 0 ns);
      tpd_A1_F1	 : VitalDelayType01 := (0 ns, 0 ns);
      tpd_B0_F0	 : VitalDelayType01 := (0 ns, 0 ns);
      tpd_A0_F0	 : VitalDelayType01 := (0 ns, 0 ns));

    port (B1: in Std_logic; A1: in Std_logic; B0: in Std_logic; 
          A0: in Std_logic; F0: out Std_logic; F1: out Std_logic);

    ATTRIBUTE Vital_Level0 OF SLICE_0 : ENTITY IS TRUE;

  end SLICE_0;

  architecture Structure of SLICE_0 is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal B1_ipd 	: std_logic := 'X';
    signal A1_ipd 	: std_logic := 'X';
    signal B0_ipd 	: std_logic := 'X';
    signal A0_ipd 	: std_logic := 'X';
    signal F0_out 	: std_logic := 'X';
    signal F1_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component lut4
      port (A: in Std_logic; B: in Std_logic; C: in Std_logic; D: in Std_logic; 
            Z: out Std_logic);
    end component;
    component gnd
      port (PWR0: out Std_logic);
    end component;
    component lut40001
      port (A: in Std_logic; B: in Std_logic; C: in Std_logic; D: in Std_logic; 
            Z: out Std_logic);
    end component;
  begin
    i26_2_lut: lut4
      port map (A=>A1_ipd, B=>B1_ipd, C=>GNDI, D=>GNDI, Z=>F1_out);
    DRIVEGND: gnd
      port map (PWR0=>GNDI);
    i45_2_lut: lut40001
      port map (A=>A0_ipd, B=>B0_ipd, C=>GNDI, D=>GNDI, Z=>F0_out);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(B1_ipd, B1, tipd_B1);
      VitalWireDelay(A1_ipd, A1, tipd_A1);
      VitalWireDelay(B0_ipd, B0, tipd_B0);
      VitalWireDelay(A0_ipd, A0, tipd_A0);
    END BLOCK;

    VitalBehavior : PROCESS (B1_ipd, A1_ipd, B0_ipd, A0_ipd, F0_out, F1_out)
    VARIABLE F0_zd         	: std_logic := 'X';
    VARIABLE F0_GlitchData 	: VitalGlitchDataType;
    VARIABLE F1_zd         	: std_logic := 'X';
    VARIABLE F1_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    F0_zd 	:= F0_out;
    F1_zd 	:= F1_out;

    VitalPathDelay01 (
      OutSignal => F0, OutSignalName => "F0", OutTemp => F0_zd,
      Paths      => (0 => (InputChangeTime => B0_ipd'last_event,
                           PathDelay => tpd_B0_F0,
                           PathCondition => TRUE),
                     1 => (InputChangeTime => A0_ipd'last_event,
                           PathDelay => tpd_A0_F0,
                           PathCondition => TRUE)),
      GlitchData => F0_GlitchData,
      Mode       => ondetect, XOn => XOn, MsgOn => MsgOn);
    VitalPathDelay01 (
      OutSignal => F1, OutSignalName => "F1", OutTemp => F1_zd,
      Paths      => (0 => (InputChangeTime => B1_ipd'last_event,
                           PathDelay => tpd_B1_F1,
                           PathCondition => TRUE),
                     1 => (InputChangeTime => A1_ipd'last_event,
                           PathDelay => tpd_A1_F1,
                           PathCondition => TRUE)),
      GlitchData => F1_GlitchData,
      Mode       => ondetect, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity xo2iobuf
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity xo2iobuf is
    port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);

    ATTRIBUTE Vital_Level0 OF xo2iobuf : ENTITY IS TRUE;

  end xo2iobuf;

  architecture Structure of xo2iobuf is
  begin
    INST5: OBZPD
      port map (I=>I, T=>T, O=>PAD);
  end Structure;

-- entity CoutB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity CoutB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "CoutB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_CoutS	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; CoutS: out Std_logic);

    ATTRIBUTE Vital_Level0 OF CoutB : ENTITY IS TRUE;

  end CoutB;

  architecture Structure of CoutB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal CoutS_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gnd
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    Cout_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>CoutS_out);
    DRIVEGND: gnd
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, CoutS_out)
    VARIABLE CoutS_zd         	: std_logic := 'X';
    VARIABLE CoutS_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    CoutS_zd 	:= CoutS_out;

    VitalPathDelay01 (
      OutSignal => CoutS, OutSignalName => "CoutS", OutTemp => CoutS_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_CoutS,
                           PathCondition => TRUE)),
      GlitchData => CoutS_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity SumB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity SumB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "SumB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_SumS	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; SumS: out Std_logic);

    ATTRIBUTE Vital_Level0 OF SumB : ENTITY IS TRUE;

  end SumB;

  architecture Structure of SumB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal SumS_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gnd
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    Sum_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>SumS_out);
    DRIVEGND: gnd
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, SumS_out)
    VARIABLE SumS_zd         	: std_logic := 'X';
    VARIABLE SumS_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    SumS_zd 	:= SumS_out;

    VitalPathDelay01 (
      OutSignal => SumS, OutSignalName => "SumS", OutTemp => SumS_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_SumS,
                           PathCondition => TRUE)),
      GlitchData => SumS_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity xo2iobuf0002
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity xo2iobuf0002 is
    port (Z: out Std_logic; PAD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF xo2iobuf0002 : ENTITY IS TRUE;

  end xo2iobuf0002;

  architecture Structure of xo2iobuf0002 is
  begin
    INST1: IBPD
      port map (I=>PAD, O=>Z);
  end Structure;

-- entity AB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity AB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "AB";

      tipd_AS  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_AS_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_AS 	: VitalDelayType := 0 ns;
      tpw_AS_posedge	: VitalDelayType := 0 ns;
      tpw_AS_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; AS: in Std_logic);

    ATTRIBUTE Vital_Level0 OF AB : ENTITY IS TRUE;

  end AB;

  architecture Structure of AB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal AS_ipd 	: std_logic := 'X';

    component xo2iobuf0002
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    A_pad: xo2iobuf0002
      port map (Z=>PADDI_out, PAD=>AS_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(AS_ipd, AS, tipd_AS);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, AS_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_AS_AS          	: x01 := '0';
    VARIABLE periodcheckinfo_AS	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => AS_ipd,
        TestSignalName => "AS",
        Period => tperiod_AS,
        PulseWidthHigh => tpw_AS_posedge,
        PulseWidthLow => tpw_AS_negedge,
        PeriodData => periodcheckinfo_AS,
        Violation => tviol_AS_AS,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => AS_ipd'last_event,
                           PathDelay => tpd_AS_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity BB0
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity BB0 is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "BB0";

      tipd_BS  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_BS_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_BS 	: VitalDelayType := 0 ns;
      tpw_BS_posedge	: VitalDelayType := 0 ns;
      tpw_BS_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; BS: in Std_logic);

    ATTRIBUTE Vital_Level0 OF BB0 : ENTITY IS TRUE;

  end BB0;

  architecture Structure of BB0 is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal BS_ipd 	: std_logic := 'X';

    component xo2iobuf0002
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    B_pad: xo2iobuf0002
      port map (Z=>PADDI_out, PAD=>BS_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(BS_ipd, BS, tipd_BS);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, BS_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_BS_BS          	: x01 := '0';
    VARIABLE periodcheckinfo_BS	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => BS_ipd,
        TestSignalName => "BS",
        Period => tperiod_BS,
        PulseWidthHigh => tpw_BS_posedge,
        PulseWidthLow => tpw_BS_negedge,
        PeriodData => periodcheckinfo_BS,
        Violation => tviol_BS_BS,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => BS_ipd'last_event,
                           PathDelay => tpd_BS_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity HalfAdder
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity HalfAdder is
    port (A: in Std_logic; B: in Std_logic; Cout: out Std_logic; 
          Sum: out Std_logic);



  end HalfAdder;

  architecture Structure of HalfAdder is
    signal B_c: Std_logic;
    signal A_c: Std_logic;
    signal Sum_c: Std_logic;
    signal Cout_c: Std_logic;
    signal VCCI: Std_logic;
    component SLICE_0
      port (B1: in Std_logic; A1: in Std_logic; B0: in Std_logic; 
            A0: in Std_logic; F0: out Std_logic; F1: out Std_logic);
    end component;
    component CoutB
      port (PADDO: in Std_logic; CoutS: out Std_logic);
    end component;
    component SumB
      port (PADDO: in Std_logic; SumS: out Std_logic);
    end component;
    component AB
      port (PADDI: out Std_logic; AS: in Std_logic);
    end component;
    component BB0
      port (PADDI: out Std_logic; BS: in Std_logic);
    end component;
  begin
    SLICE_0I: SLICE_0
      port map (B1=>B_c, A1=>A_c, B0=>A_c, A0=>B_c, F0=>Sum_c, F1=>Cout_c);
    CoutI: CoutB
      port map (PADDO=>Cout_c, CoutS=>Cout);
    SumI: SumB
      port map (PADDO=>Sum_c, SumS=>Sum);
    AI: AB
      port map (PADDI=>A_c, AS=>A);
    BI: BB0
      port map (PADDI=>B_c, BS=>B);
    VHI_INST: VHI
      port map (Z=>VCCI);
    PUR_INST: PUR
      port map (PUR=>VCCI);
    GSR_INST: GSR
      port map (GSR=>VCCI);
  end Structure;



  library IEEE, vital2000, MACHXO2;
  configuration Structure_CON of HalfAdder is
    for Structure
    end for;
  end Structure_CON;



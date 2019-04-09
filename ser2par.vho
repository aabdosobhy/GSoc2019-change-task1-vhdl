-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"

-- DATE "04/09/2019 20:01:16"

-- 
-- Device: Altera EP4CE6F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ser2par IS
    PORT (
	clk : IN std_logic;
	start : IN std_logic;
	serial_bit : IN std_logic;
	bit_slip : IN std_logic;
	word_size_select : IN std_logic_vector(1 DOWNTO 0);
	parallel_out : BUFFER std_logic_vector(11 DOWNTO 0)
	);
END ser2par;

-- Design Ports Information
-- parallel_out[0]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[1]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[2]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[3]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[4]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[5]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[6]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[7]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[8]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[9]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[10]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- parallel_out[11]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- serial_bit	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- word_size_select[1]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- word_size_select[0]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bit_slip	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ser2par IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_serial_bit : std_logic;
SIGNAL ww_bit_slip : std_logic;
SIGNAL ww_word_size_select : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_parallel_out : std_logic_vector(11 DOWNTO 0);
SIGNAL \start~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \parallel_out[0]~output_o\ : std_logic;
SIGNAL \parallel_out[1]~output_o\ : std_logic;
SIGNAL \parallel_out[2]~output_o\ : std_logic;
SIGNAL \parallel_out[3]~output_o\ : std_logic;
SIGNAL \parallel_out[4]~output_o\ : std_logic;
SIGNAL \parallel_out[5]~output_o\ : std_logic;
SIGNAL \parallel_out[6]~output_o\ : std_logic;
SIGNAL \parallel_out[7]~output_o\ : std_logic;
SIGNAL \parallel_out[8]~output_o\ : std_logic;
SIGNAL \parallel_out[9]~output_o\ : std_logic;
SIGNAL \parallel_out[10]~output_o\ : std_logic;
SIGNAL \parallel_out[11]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \serial_bit~input_o\ : std_logic;
SIGNAL \Serial_shift|temp[11]~feeder_combout\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \start~inputclkctrl_outclk\ : std_logic;
SIGNAL \Serial_shift|temp[10]~feeder_combout\ : std_logic;
SIGNAL \Serial_shift|temp[9]~feeder_combout\ : std_logic;
SIGNAL \Serial_shift|temp[8]~feeder_combout\ : std_logic;
SIGNAL \Serial_shift|temp[7]~feeder_combout\ : std_logic;
SIGNAL \Serial_shift|temp[6]~feeder_combout\ : std_logic;
SIGNAL \Serial_shift|temp[5]~feeder_combout\ : std_logic;
SIGNAL \Serial_shift|temp[4]~feeder_combout\ : std_logic;
SIGNAL \Serial_shift|temp[3]~feeder_combout\ : std_logic;
SIGNAL \Serial_shift|temp[2]~feeder_combout\ : std_logic;
SIGNAL \Serial_shift|temp[1]~feeder_combout\ : std_logic;
SIGNAL \word_size_select[1]~input_o\ : std_logic;
SIGNAL \word_size|q[1]~feeder_combout\ : std_logic;
SIGNAL \word_size_combination|q[0]~feeder_combout\ : std_logic;
SIGNAL \Serial_shift|LS4_Bs~0_combout\ : std_logic;
SIGNAL \finalData|q[0]~feeder_combout\ : std_logic;
SIGNAL \bit_slip~input_o\ : std_logic;
SIGNAL \bit_slip_reg|q~feeder_combout\ : std_logic;
SIGNAL \bit_slip_reg|q~q\ : std_logic;
SIGNAL \counter12|temp[7]~feeder_combout\ : std_logic;
SIGNAL \counter12|temp[6]~feeder_combout\ : std_logic;
SIGNAL \counter12|temp[5]~feeder_combout\ : std_logic;
SIGNAL \counter12|temp[4]~feeder_combout\ : std_logic;
SIGNAL \counter12|temp[3]~feeder_combout\ : std_logic;
SIGNAL \counter12|temp[2]~feeder_combout\ : std_logic;
SIGNAL \counter12|temp[1]~feeder_combout\ : std_logic;
SIGNAL \counter12|temp[0]~feeder_combout\ : std_logic;
SIGNAL \word_size_select[0]~input_o\ : std_logic;
SIGNAL \word_size|q[0]~feeder_combout\ : std_logic;
SIGNAL \counter9|temp[4]~feeder_combout\ : std_logic;
SIGNAL \counter9|temp[3]~feeder_combout\ : std_logic;
SIGNAL \counter9|temp[2]~feeder_combout\ : std_logic;
SIGNAL \counter9|temp[1]~feeder_combout\ : std_logic;
SIGNAL \counter9|temp[0]~feeder_combout\ : std_logic;
SIGNAL \counter11|temp[6]~feeder_combout\ : std_logic;
SIGNAL \counter11|temp[5]~feeder_combout\ : std_logic;
SIGNAL \counter11|temp[4]~feeder_combout\ : std_logic;
SIGNAL \counter11|temp[3]~feeder_combout\ : std_logic;
SIGNAL \counter11|temp[2]~feeder_combout\ : std_logic;
SIGNAL \counter11|temp[1]~feeder_combout\ : std_logic;
SIGNAL \counter11|temp[0]~feeder_combout\ : std_logic;
SIGNAL \start_save_reg|q~feeder_combout\ : std_logic;
SIGNAL \start_save_reg|q~q\ : std_logic;
SIGNAL \rep_c8~combout\ : std_logic;
SIGNAL \counter8|temp[2]~feeder_combout\ : std_logic;
SIGNAL \counter8|temp[1]~feeder_combout\ : std_logic;
SIGNAL \counter8|temp[0]~feeder_combout\ : std_logic;
SIGNAL \counter10|temp[5]~feeder_combout\ : std_logic;
SIGNAL \counter10|temp[4]~feeder_combout\ : std_logic;
SIGNAL \counter10|temp[3]~feeder_combout\ : std_logic;
SIGNAL \counter10|temp[2]~feeder_combout\ : std_logic;
SIGNAL \counter10|temp[1]~feeder_combout\ : std_logic;
SIGNAL \counter10|temp[0]~feeder_combout\ : std_logic;
SIGNAL \counter13|temp[8]~feeder_combout\ : std_logic;
SIGNAL \counter13|temp[7]~feeder_combout\ : std_logic;
SIGNAL \counter13|temp[6]~feeder_combout\ : std_logic;
SIGNAL \counter13|temp[5]~feeder_combout\ : std_logic;
SIGNAL \counter13|temp[4]~feeder_combout\ : std_logic;
SIGNAL \counter13|temp[3]~feeder_combout\ : std_logic;
SIGNAL \counter13|temp[2]~feeder_combout\ : std_logic;
SIGNAL \counter13|temp[1]~feeder_combout\ : std_logic;
SIGNAL \counter13|temp[0]~feeder_combout\ : std_logic;
SIGNAL \data_ready_pip2|q[0]~feeder_combout\ : std_logic;
SIGNAL \data_ready_i_p3~combout\ : std_logic;
SIGNAL \data_ready_pip3|q~q\ : std_logic;
SIGNAL \data_readyR|q~feeder_combout\ : std_logic;
SIGNAL \data_readyR|q~q\ : std_logic;
SIGNAL \Serial_shift|LS4_Bs~1_combout\ : std_logic;
SIGNAL \finalData|q[1]~feeder_combout\ : std_logic;
SIGNAL \Serial_shift|LS4_Bs~2_combout\ : std_logic;
SIGNAL \finalData|q[2]~feeder_combout\ : std_logic;
SIGNAL \Serial_shift|LS4_Bs~3_combout\ : std_logic;
SIGNAL \finalData|q[3]~feeder_combout\ : std_logic;
SIGNAL \finalData|q[4]~feeder_combout\ : std_logic;
SIGNAL \finalData|q[5]~feeder_combout\ : std_logic;
SIGNAL \finalData|q[6]~feeder_combout\ : std_logic;
SIGNAL \finalData|q[7]~feeder_combout\ : std_logic;
SIGNAL \finalData|q[8]~feeder_combout\ : std_logic;
SIGNAL \finalData|q[9]~feeder_combout\ : std_logic;
SIGNAL \finalData|q[10]~feeder_combout\ : std_logic;
SIGNAL \finalData|q[11]~feeder_combout\ : std_logic;
SIGNAL data_ready_i_p2 : std_logic_vector(1 DOWNTO 0);
SIGNAL \finalData|q\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \Serial_shift|LS4_Bs\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \data_ready_pip1|q\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Serial_shift|temp\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \word_size_combination|q\ : std_logic_vector(3 DOWNTO 0);
SIGNAL word_size_comb_i : std_logic_vector(3 DOWNTO 0);
SIGNAL \word_size|q\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \data_ready_pip2|q\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \counter10|temp\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \counter13|temp\ : std_logic_vector(8 DOWNTO 0);
SIGNAL data_ready_i_p1 : std_logic_vector(2 DOWNTO 0);
SIGNAL \counter9|temp\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \counter12|temp\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \counter8|temp\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \counter11|temp\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \repeat_count_pip2|q\ : std_logic_vector(5 DOWNTO 0);
SIGNAL rep_count_i_p2 : std_logic_vector(5 DOWNTO 0);
SIGNAL \repeat_count_pip1|q\ : std_logic_vector(5 DOWNTO 0);
SIGNAL rep_count_i_p1 : std_logic_vector(5 DOWNTO 0);
SIGNAL \ALT_INV_start~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_start~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_start <= start;
ww_serial_bit <= serial_bit;
ww_bit_slip <= bit_slip;
ww_word_size_select <= word_size_select;
parallel_out <= ww_parallel_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\start~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \start~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_start~inputclkctrl_outclk\ <= NOT \start~inputclkctrl_outclk\;
\ALT_INV_start~input_o\ <= NOT \start~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X25_Y24_N23
\parallel_out[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \finalData|q\(0),
	devoe => ww_devoe,
	o => \parallel_out[0]~output_o\);

-- Location: IOOBUF_X25_Y24_N2
\parallel_out[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \finalData|q\(1),
	devoe => ww_devoe,
	o => \parallel_out[1]~output_o\);

-- Location: IOOBUF_X25_Y24_N9
\parallel_out[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \finalData|q\(2),
	devoe => ww_devoe,
	o => \parallel_out[2]~output_o\);

-- Location: IOOBUF_X28_Y24_N23
\parallel_out[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \finalData|q\(3),
	devoe => ww_devoe,
	o => \parallel_out[3]~output_o\);

-- Location: IOOBUF_X23_Y24_N9
\parallel_out[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \finalData|q\(4),
	devoe => ww_devoe,
	o => \parallel_out[4]~output_o\);

-- Location: IOOBUF_X28_Y24_N2
\parallel_out[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \finalData|q\(5),
	devoe => ww_devoe,
	o => \parallel_out[5]~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\parallel_out[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \finalData|q\(6),
	devoe => ww_devoe,
	o => \parallel_out[6]~output_o\);

-- Location: IOOBUF_X21_Y24_N2
\parallel_out[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \finalData|q\(7),
	devoe => ww_devoe,
	o => \parallel_out[7]~output_o\);

-- Location: IOOBUF_X25_Y24_N16
\parallel_out[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \finalData|q\(8),
	devoe => ww_devoe,
	o => \parallel_out[8]~output_o\);

-- Location: IOOBUF_X30_Y24_N2
\parallel_out[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \finalData|q\(9),
	devoe => ww_devoe,
	o => \parallel_out[9]~output_o\);

-- Location: IOOBUF_X28_Y24_N9
\parallel_out[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \finalData|q\(10),
	devoe => ww_devoe,
	o => \parallel_out[10]~output_o\);

-- Location: IOOBUF_X21_Y24_N16
\parallel_out[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \finalData|q\(11),
	devoe => ww_devoe,
	o => \parallel_out[11]~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X28_Y24_N15
\serial_bit~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_serial_bit,
	o => \serial_bit~input_o\);

-- Location: LCCOMB_X26_Y20_N24
\Serial_shift|temp[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Serial_shift|temp[11]~feeder_combout\ = \serial_bit~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \serial_bit~input_o\,
	combout => \Serial_shift|temp[11]~feeder_combout\);

-- Location: IOIBUF_X0_Y11_N15
\start~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: CLKCTRL_G4
\start~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \start~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \start~inputclkctrl_outclk\);

-- Location: FF_X26_Y20_N25
\Serial_shift|temp[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Serial_shift|temp[11]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Serial_shift|temp\(11));

-- Location: LCCOMB_X26_Y20_N26
\Serial_shift|temp[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Serial_shift|temp[10]~feeder_combout\ = \Serial_shift|temp\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|temp\(11),
	combout => \Serial_shift|temp[10]~feeder_combout\);

-- Location: FF_X26_Y20_N27
\Serial_shift|temp[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Serial_shift|temp[10]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Serial_shift|temp\(10));

-- Location: LCCOMB_X26_Y20_N4
\Serial_shift|temp[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Serial_shift|temp[9]~feeder_combout\ = \Serial_shift|temp\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Serial_shift|temp\(10),
	combout => \Serial_shift|temp[9]~feeder_combout\);

-- Location: FF_X26_Y20_N5
\Serial_shift|temp[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Serial_shift|temp[9]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Serial_shift|temp\(9));

-- Location: LCCOMB_X26_Y20_N6
\Serial_shift|temp[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Serial_shift|temp[8]~feeder_combout\ = \Serial_shift|temp\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Serial_shift|temp\(9),
	combout => \Serial_shift|temp[8]~feeder_combout\);

-- Location: FF_X26_Y20_N7
\Serial_shift|temp[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Serial_shift|temp[8]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Serial_shift|temp\(8));

-- Location: LCCOMB_X26_Y20_N28
\Serial_shift|temp[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Serial_shift|temp[7]~feeder_combout\ = \Serial_shift|temp\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|temp\(8),
	combout => \Serial_shift|temp[7]~feeder_combout\);

-- Location: FF_X26_Y20_N29
\Serial_shift|temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Serial_shift|temp[7]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Serial_shift|temp\(7));

-- Location: LCCOMB_X25_Y20_N18
\Serial_shift|temp[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Serial_shift|temp[6]~feeder_combout\ = \Serial_shift|temp\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|temp\(7),
	combout => \Serial_shift|temp[6]~feeder_combout\);

-- Location: FF_X25_Y20_N19
\Serial_shift|temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Serial_shift|temp[6]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Serial_shift|temp\(6));

-- Location: LCCOMB_X25_Y20_N16
\Serial_shift|temp[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Serial_shift|temp[5]~feeder_combout\ = \Serial_shift|temp\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|temp\(6),
	combout => \Serial_shift|temp[5]~feeder_combout\);

-- Location: FF_X25_Y20_N17
\Serial_shift|temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Serial_shift|temp[5]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Serial_shift|temp\(5));

-- Location: LCCOMB_X25_Y20_N6
\Serial_shift|temp[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Serial_shift|temp[4]~feeder_combout\ = \Serial_shift|temp\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|temp\(5),
	combout => \Serial_shift|temp[4]~feeder_combout\);

-- Location: FF_X25_Y20_N7
\Serial_shift|temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Serial_shift|temp[4]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Serial_shift|temp\(4));

-- Location: LCCOMB_X24_Y20_N16
\Serial_shift|temp[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Serial_shift|temp[3]~feeder_combout\ = \Serial_shift|temp\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|temp\(4),
	combout => \Serial_shift|temp[3]~feeder_combout\);

-- Location: FF_X24_Y20_N17
\Serial_shift|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Serial_shift|temp[3]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Serial_shift|temp\(3));

-- Location: LCCOMB_X24_Y20_N6
\Serial_shift|temp[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Serial_shift|temp[2]~feeder_combout\ = \Serial_shift|temp\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|temp\(3),
	combout => \Serial_shift|temp[2]~feeder_combout\);

-- Location: FF_X24_Y20_N7
\Serial_shift|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Serial_shift|temp[2]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Serial_shift|temp\(2));

-- Location: LCCOMB_X23_Y20_N22
\Serial_shift|temp[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Serial_shift|temp[1]~feeder_combout\ = \Serial_shift|temp\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|temp\(2),
	combout => \Serial_shift|temp[1]~feeder_combout\);

-- Location: FF_X23_Y20_N23
\Serial_shift|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Serial_shift|temp[1]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Serial_shift|temp\(1));

-- Location: IOIBUF_X23_Y24_N22
\word_size_select[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_word_size_select(1),
	o => \word_size_select[1]~input_o\);

-- Location: LCCOMB_X23_Y20_N24
\word_size|q[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \word_size|q[1]~feeder_combout\ = \word_size_select[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \word_size_select[1]~input_o\,
	combout => \word_size|q[1]~feeder_combout\);

-- Location: FF_X23_Y20_N25
\word_size|q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \word_size|q[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \word_size|q\(1));

-- Location: LCCOMB_X23_Y20_N12
\word_size_combination|q[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \word_size_combination|q[0]~feeder_combout\ = \word_size|q\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \word_size|q\(1),
	combout => \word_size_combination|q[0]~feeder_combout\);

-- Location: FF_X23_Y20_N13
\word_size_combination|q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \word_size_combination|q[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \word_size_combination|q\(0));

-- Location: LCCOMB_X24_Y20_N8
\Serial_shift|LS4_Bs~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Serial_shift|LS4_Bs~0_combout\ = (\Serial_shift|temp\(1) & \word_size_combination|q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Serial_shift|temp\(1),
	datad => \word_size_combination|q\(0),
	combout => \Serial_shift|LS4_Bs~0_combout\);

-- Location: FF_X24_Y20_N9
\Serial_shift|LS4_Bs[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Serial_shift|LS4_Bs~0_combout\,
	ena => \ALT_INV_start~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Serial_shift|LS4_Bs\(0));

-- Location: LCCOMB_X25_Y20_N20
\finalData|q[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \finalData|q[0]~feeder_combout\ = \Serial_shift|LS4_Bs\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|LS4_Bs\(0),
	combout => \finalData|q[0]~feeder_combout\);

-- Location: IOIBUF_X23_Y24_N15
\bit_slip~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bit_slip,
	o => \bit_slip~input_o\);

-- Location: LCCOMB_X23_Y20_N28
\bit_slip_reg|q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \bit_slip_reg|q~feeder_combout\ = \bit_slip~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bit_slip~input_o\,
	combout => \bit_slip_reg|q~feeder_combout\);

-- Location: FF_X23_Y20_N29
\bit_slip_reg|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \bit_slip_reg|q~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bit_slip_reg|q~q\);

-- Location: LCCOMB_X23_Y20_N4
\rep_count_i_p1[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- rep_count_i_p1(1) = (\word_size_combination|q\(0) & !\bit_slip_reg|q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \word_size_combination|q\(0),
	datad => \bit_slip_reg|q~q\,
	combout => rep_count_i_p1(1));

-- Location: FF_X23_Y20_N5
\repeat_count_pip1|q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => rep_count_i_p1(1),
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \repeat_count_pip1|q\(1));

-- Location: LCCOMB_X23_Y20_N18
\rep_count_i_p2[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- rep_count_i_p2(1) = (\repeat_count_pip1|q\(1) & \data_ready_pip3|q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \repeat_count_pip1|q\(1),
	datad => \data_ready_pip3|q~q\,
	combout => rep_count_i_p2(1));

-- Location: FF_X23_Y20_N19
\repeat_count_pip2|q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => rep_count_i_p2(1),
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \repeat_count_pip2|q\(1));

-- Location: LCCOMB_X22_Y20_N20
\counter12|temp[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter12|temp[7]~feeder_combout\ = \repeat_count_pip2|q\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \repeat_count_pip2|q\(1),
	combout => \counter12|temp[7]~feeder_combout\);

-- Location: FF_X22_Y20_N21
\counter12|temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter12|temp[7]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter12|temp\(7));

-- Location: LCCOMB_X22_Y20_N0
\counter12|temp[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter12|temp[6]~feeder_combout\ = \counter12|temp\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter12|temp\(7),
	combout => \counter12|temp[6]~feeder_combout\);

-- Location: FF_X22_Y20_N1
\counter12|temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter12|temp[6]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter12|temp\(6));

-- Location: LCCOMB_X22_Y20_N16
\counter12|temp[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter12|temp[5]~feeder_combout\ = \counter12|temp\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter12|temp\(6),
	combout => \counter12|temp[5]~feeder_combout\);

-- Location: FF_X22_Y20_N17
\counter12|temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter12|temp[5]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter12|temp\(5));

-- Location: LCCOMB_X22_Y20_N18
\counter12|temp[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter12|temp[4]~feeder_combout\ = \counter12|temp\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter12|temp\(5),
	combout => \counter12|temp[4]~feeder_combout\);

-- Location: FF_X22_Y20_N19
\counter12|temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter12|temp[4]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter12|temp\(4));

-- Location: LCCOMB_X22_Y20_N12
\counter12|temp[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter12|temp[3]~feeder_combout\ = \counter12|temp\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter12|temp\(4),
	combout => \counter12|temp[3]~feeder_combout\);

-- Location: FF_X22_Y20_N13
\counter12|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter12|temp[3]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter12|temp\(3));

-- Location: LCCOMB_X22_Y20_N6
\counter12|temp[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter12|temp[2]~feeder_combout\ = \counter12|temp\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter12|temp\(3),
	combout => \counter12|temp[2]~feeder_combout\);

-- Location: FF_X22_Y20_N7
\counter12|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter12|temp[2]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter12|temp\(2));

-- Location: LCCOMB_X22_Y20_N14
\counter12|temp[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter12|temp[1]~feeder_combout\ = \counter12|temp\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter12|temp\(2),
	combout => \counter12|temp[1]~feeder_combout\);

-- Location: FF_X22_Y20_N15
\counter12|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter12|temp[1]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter12|temp\(1));

-- Location: LCCOMB_X23_Y20_N6
\counter12|temp[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter12|temp[0]~feeder_combout\ = \counter12|temp\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter12|temp\(1),
	combout => \counter12|temp[0]~feeder_combout\);

-- Location: FF_X23_Y20_N7
\counter12|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter12|temp[0]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter12|temp\(0));

-- Location: IOIBUF_X21_Y24_N8
\word_size_select[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_word_size_select(0),
	o => \word_size_select[0]~input_o\);

-- Location: LCCOMB_X23_Y20_N0
\word_size|q[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \word_size|q[0]~feeder_combout\ = \word_size_select[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \word_size_select[0]~input_o\,
	combout => \word_size|q[0]~feeder_combout\);

-- Location: FF_X23_Y20_N1
\word_size|q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \word_size|q[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \word_size|q\(0));

-- Location: LCCOMB_X24_Y20_N30
\word_size_comb_i[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- word_size_comb_i(2) = (!\word_size|q\(0) & !\word_size|q\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \word_size|q\(0),
	datad => \word_size|q\(1),
	combout => word_size_comb_i(2));

-- Location: FF_X24_Y20_N31
\word_size_combination|q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => word_size_comb_i(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \word_size_combination|q\(2));

-- Location: LCCOMB_X24_Y20_N22
\rep_count_i_p1[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- rep_count_i_p1(4) = (\word_size_combination|q\(2) & \bit_slip_reg|q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \word_size_combination|q\(2),
	datad => \bit_slip_reg|q~q\,
	combout => rep_count_i_p1(4));

-- Location: FF_X24_Y20_N23
\repeat_count_pip1|q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => rep_count_i_p1(4),
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \repeat_count_pip1|q\(4));

-- Location: LCCOMB_X24_Y20_N10
\rep_count_i_p2[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- rep_count_i_p2(4) = (\repeat_count_pip1|q\(4) & \data_ready_pip3|q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \repeat_count_pip1|q\(4),
	datad => \data_ready_pip3|q~q\,
	combout => rep_count_i_p2(4));

-- Location: FF_X24_Y20_N11
\repeat_count_pip2|q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => rep_count_i_p2(4),
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \repeat_count_pip2|q\(4));

-- Location: LCCOMB_X28_Y20_N12
\counter9|temp[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter9|temp[4]~feeder_combout\ = \repeat_count_pip2|q\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \repeat_count_pip2|q\(4),
	combout => \counter9|temp[4]~feeder_combout\);

-- Location: FF_X28_Y20_N13
\counter9|temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter9|temp[4]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter9|temp\(4));

-- Location: LCCOMB_X28_Y20_N22
\counter9|temp[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter9|temp[3]~feeder_combout\ = \counter9|temp\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter9|temp\(4),
	combout => \counter9|temp[3]~feeder_combout\);

-- Location: FF_X28_Y20_N23
\counter9|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter9|temp[3]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter9|temp\(3));

-- Location: LCCOMB_X28_Y20_N28
\counter9|temp[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter9|temp[2]~feeder_combout\ = \counter9|temp\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \counter9|temp\(3),
	combout => \counter9|temp[2]~feeder_combout\);

-- Location: FF_X28_Y20_N29
\counter9|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter9|temp[2]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter9|temp\(2));

-- Location: LCCOMB_X28_Y20_N18
\counter9|temp[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter9|temp[1]~feeder_combout\ = \counter9|temp\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter9|temp\(2),
	combout => \counter9|temp[1]~feeder_combout\);

-- Location: FF_X28_Y20_N19
\counter9|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter9|temp[1]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter9|temp\(1));

-- Location: LCCOMB_X28_Y20_N4
\counter9|temp[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter9|temp[0]~feeder_combout\ = \counter9|temp\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter9|temp\(1),
	combout => \counter9|temp[0]~feeder_combout\);

-- Location: FF_X28_Y20_N5
\counter9|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter9|temp[0]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter9|temp\(0));

-- Location: LCCOMB_X24_Y20_N18
\data_ready_i_p1[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- data_ready_i_p1(1) = (\counter12|temp\(0)) # (\counter9|temp\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \counter12|temp\(0),
	datad => \counter9|temp\(0),
	combout => data_ready_i_p1(1));

-- Location: FF_X24_Y20_N19
\data_ready_pip1|q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => data_ready_i_p1(1),
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_ready_pip1|q\(1));

-- Location: LCCOMB_X23_Y20_N8
\word_size_comb_i[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- word_size_comb_i(1) = (\word_size|q\(0) & !\word_size|q\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \word_size|q\(0),
	datad => \word_size|q\(1),
	combout => word_size_comb_i(1));

-- Location: FF_X23_Y20_N9
\word_size_combination|q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => word_size_comb_i(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \word_size_combination|q\(1));

-- Location: LCCOMB_X23_Y20_N16
\rep_count_i_p1[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- rep_count_i_p1(2) = (\word_size_combination|q\(1) & \bit_slip_reg|q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \word_size_combination|q\(1),
	datad => \bit_slip_reg|q~q\,
	combout => rep_count_i_p1(2));

-- Location: FF_X23_Y20_N17
\repeat_count_pip1|q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => rep_count_i_p1(2),
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \repeat_count_pip1|q\(2));

-- Location: LCCOMB_X24_Y20_N26
\rep_count_i_p2[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- rep_count_i_p2(2) = (\repeat_count_pip1|q\(2) & \data_ready_pip3|q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \repeat_count_pip1|q\(2),
	datad => \data_ready_pip3|q~q\,
	combout => rep_count_i_p2(2));

-- Location: FF_X24_Y20_N27
\repeat_count_pip2|q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => rep_count_i_p2(2),
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \repeat_count_pip2|q\(2));

-- Location: LCCOMB_X24_Y20_N28
\counter11|temp[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter11|temp[6]~feeder_combout\ = \repeat_count_pip2|q\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \repeat_count_pip2|q\(2),
	combout => \counter11|temp[6]~feeder_combout\);

-- Location: FF_X24_Y20_N29
\counter11|temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter11|temp[6]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter11|temp\(6));

-- Location: LCCOMB_X23_Y19_N10
\counter11|temp[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter11|temp[5]~feeder_combout\ = \counter11|temp\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter11|temp\(6),
	combout => \counter11|temp[5]~feeder_combout\);

-- Location: FF_X23_Y19_N11
\counter11|temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter11|temp[5]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter11|temp\(5));

-- Location: LCCOMB_X23_Y19_N20
\counter11|temp[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter11|temp[4]~feeder_combout\ = \counter11|temp\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter11|temp\(5),
	combout => \counter11|temp[4]~feeder_combout\);

-- Location: FF_X23_Y19_N21
\counter11|temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter11|temp[4]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter11|temp\(4));

-- Location: LCCOMB_X23_Y19_N22
\counter11|temp[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter11|temp[3]~feeder_combout\ = \counter11|temp\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter11|temp\(4),
	combout => \counter11|temp[3]~feeder_combout\);

-- Location: FF_X23_Y19_N23
\counter11|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter11|temp[3]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter11|temp\(3));

-- Location: LCCOMB_X23_Y19_N28
\counter11|temp[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter11|temp[2]~feeder_combout\ = \counter11|temp\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \counter11|temp\(3),
	combout => \counter11|temp[2]~feeder_combout\);

-- Location: FF_X23_Y19_N29
\counter11|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter11|temp[2]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter11|temp\(2));

-- Location: LCCOMB_X23_Y19_N12
\counter11|temp[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter11|temp[1]~feeder_combout\ = \counter11|temp\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter11|temp\(2),
	combout => \counter11|temp[1]~feeder_combout\);

-- Location: FF_X23_Y19_N13
\counter11|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter11|temp[1]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter11|temp\(1));

-- Location: LCCOMB_X23_Y19_N4
\counter11|temp[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter11|temp[0]~feeder_combout\ = \counter11|temp\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter11|temp\(1),
	combout => \counter11|temp[0]~feeder_combout\);

-- Location: FF_X23_Y19_N5
\counter11|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter11|temp[0]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter11|temp\(0));

-- Location: LCCOMB_X24_Y20_N4
\rep_count_i_p1[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- rep_count_i_p1(5) = (\word_size_combination|q\(2) & !\bit_slip_reg|q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \word_size_combination|q\(2),
	datad => \bit_slip_reg|q~q\,
	combout => rep_count_i_p1(5));

-- Location: FF_X24_Y20_N5
\repeat_count_pip1|q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => rep_count_i_p1(5),
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \repeat_count_pip1|q\(5));

-- Location: LCCOMB_X24_Y20_N0
\rep_count_i_p2[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- rep_count_i_p2(5) = (\repeat_count_pip1|q\(5) & \data_ready_pip3|q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \repeat_count_pip1|q\(5),
	datad => \data_ready_pip3|q~q\,
	combout => rep_count_i_p2(5));

-- Location: FF_X24_Y20_N1
\repeat_count_pip2|q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => rep_count_i_p2(5),
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \repeat_count_pip2|q\(5));

-- Location: LCCOMB_X22_Y20_N8
\start_save_reg|q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \start_save_reg|q~feeder_combout\ = \start~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \start~input_o\,
	combout => \start_save_reg|q~feeder_combout\);

-- Location: FF_X22_Y20_N9
\start_save_reg|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \start_save_reg|q~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \start_save_reg|q~q\);

-- Location: LCCOMB_X23_Y20_N20
rep_c8 : cycloneive_lcell_comb
-- Equation(s):
-- \rep_c8~combout\ = (\repeat_count_pip2|q\(5)) # (\start_save_reg|q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \repeat_count_pip2|q\(5),
	datad => \start_save_reg|q~q\,
	combout => \rep_c8~combout\);

-- Location: FF_X23_Y20_N21
\counter8|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \rep_c8~combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter8|temp\(3));

-- Location: LCCOMB_X23_Y19_N2
\counter8|temp[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter8|temp[2]~feeder_combout\ = \counter8|temp\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter8|temp\(3),
	combout => \counter8|temp[2]~feeder_combout\);

-- Location: FF_X23_Y19_N3
\counter8|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter8|temp[2]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter8|temp\(2));

-- Location: LCCOMB_X23_Y19_N6
\counter8|temp[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter8|temp[1]~feeder_combout\ = \counter8|temp\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter8|temp\(2),
	combout => \counter8|temp[1]~feeder_combout\);

-- Location: FF_X23_Y19_N7
\counter8|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter8|temp[1]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter8|temp\(1));

-- Location: LCCOMB_X23_Y19_N18
\counter8|temp[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter8|temp[0]~feeder_combout\ = \counter8|temp\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter8|temp\(1),
	combout => \counter8|temp[0]~feeder_combout\);

-- Location: FF_X23_Y19_N19
\counter8|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter8|temp[0]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter8|temp\(0));

-- Location: LCCOMB_X23_Y19_N0
\data_ready_i_p1[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- data_ready_i_p1(2) = (\counter11|temp\(0)) # (\counter8|temp\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \counter11|temp\(0),
	datad => \counter8|temp\(0),
	combout => data_ready_i_p1(2));

-- Location: FF_X23_Y19_N1
\data_ready_pip1|q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => data_ready_i_p1(2),
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_ready_pip1|q\(2));

-- Location: LCCOMB_X24_Y20_N20
\data_ready_i_p2[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- data_ready_i_p2(1) = (\data_ready_pip1|q\(1)) # (\data_ready_pip1|q\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_ready_pip1|q\(1),
	datad => \data_ready_pip1|q\(2),
	combout => data_ready_i_p2(1));

-- Location: FF_X24_Y20_N21
\data_ready_pip2|q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => data_ready_i_p2(1),
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_ready_pip2|q\(1));

-- Location: LCCOMB_X23_Y20_N10
\rep_count_i_p1[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- rep_count_i_p1(3) = (\word_size_combination|q\(1) & !\bit_slip_reg|q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \word_size_combination|q\(1),
	datad => \bit_slip_reg|q~q\,
	combout => rep_count_i_p1(3));

-- Location: FF_X23_Y20_N11
\repeat_count_pip1|q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => rep_count_i_p1(3),
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \repeat_count_pip1|q\(3));

-- Location: LCCOMB_X23_Y20_N26
\rep_count_i_p2[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- rep_count_i_p2(3) = (\repeat_count_pip1|q\(3) & \data_ready_pip3|q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \repeat_count_pip1|q\(3),
	datad => \data_ready_pip3|q~q\,
	combout => rep_count_i_p2(3));

-- Location: FF_X23_Y20_N27
\repeat_count_pip2|q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => rep_count_i_p2(3),
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \repeat_count_pip2|q\(3));

-- Location: LCCOMB_X22_Y20_N26
\counter10|temp[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter10|temp[5]~feeder_combout\ = \repeat_count_pip2|q\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \repeat_count_pip2|q\(3),
	combout => \counter10|temp[5]~feeder_combout\);

-- Location: FF_X22_Y20_N27
\counter10|temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter10|temp[5]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter10|temp\(5));

-- Location: LCCOMB_X21_Y20_N18
\counter10|temp[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter10|temp[4]~feeder_combout\ = \counter10|temp\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter10|temp\(5),
	combout => \counter10|temp[4]~feeder_combout\);

-- Location: FF_X21_Y20_N19
\counter10|temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter10|temp[4]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter10|temp\(4));

-- Location: LCCOMB_X21_Y20_N24
\counter10|temp[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter10|temp[3]~feeder_combout\ = \counter10|temp\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter10|temp\(4),
	combout => \counter10|temp[3]~feeder_combout\);

-- Location: FF_X21_Y20_N25
\counter10|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter10|temp[3]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter10|temp\(3));

-- Location: LCCOMB_X22_Y20_N4
\counter10|temp[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter10|temp[2]~feeder_combout\ = \counter10|temp\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter10|temp\(3),
	combout => \counter10|temp[2]~feeder_combout\);

-- Location: FF_X22_Y20_N5
\counter10|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter10|temp[2]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter10|temp\(2));

-- Location: LCCOMB_X22_Y20_N28
\counter10|temp[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter10|temp[1]~feeder_combout\ = \counter10|temp\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \counter10|temp\(2),
	combout => \counter10|temp[1]~feeder_combout\);

-- Location: FF_X22_Y20_N29
\counter10|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter10|temp[1]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter10|temp\(1));

-- Location: LCCOMB_X22_Y20_N22
\counter10|temp[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter10|temp[0]~feeder_combout\ = \counter10|temp\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter10|temp\(1),
	combout => \counter10|temp[0]~feeder_combout\);

-- Location: FF_X22_Y20_N23
\counter10|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter10|temp[0]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter10|temp\(0));

-- Location: LCCOMB_X23_Y20_N30
\rep_count_i_p1[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- rep_count_i_p1(0) = (\word_size_combination|q\(0) & \bit_slip_reg|q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \word_size_combination|q\(0),
	datad => \bit_slip_reg|q~q\,
	combout => rep_count_i_p1(0));

-- Location: FF_X23_Y20_N31
\repeat_count_pip1|q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => rep_count_i_p1(0),
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \repeat_count_pip1|q\(0));

-- Location: LCCOMB_X23_Y20_N2
\rep_count_i_p2[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- rep_count_i_p2(0) = (\repeat_count_pip1|q\(0) & \data_ready_pip3|q~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \repeat_count_pip1|q\(0),
	datad => \data_ready_pip3|q~q\,
	combout => rep_count_i_p2(0));

-- Location: FF_X23_Y20_N3
\repeat_count_pip2|q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => rep_count_i_p2(0),
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \repeat_count_pip2|q\(0));

-- Location: LCCOMB_X22_Y20_N10
\counter13|temp[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter13|temp[8]~feeder_combout\ = \repeat_count_pip2|q\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \repeat_count_pip2|q\(0),
	combout => \counter13|temp[8]~feeder_combout\);

-- Location: FF_X22_Y20_N11
\counter13|temp[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter13|temp[8]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter13|temp\(8));

-- Location: LCCOMB_X22_Y20_N2
\counter13|temp[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter13|temp[7]~feeder_combout\ = \counter13|temp\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter13|temp\(8),
	combout => \counter13|temp[7]~feeder_combout\);

-- Location: FF_X22_Y20_N3
\counter13|temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter13|temp[7]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter13|temp\(7));

-- Location: LCCOMB_X22_Y20_N30
\counter13|temp[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter13|temp[6]~feeder_combout\ = \counter13|temp\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter13|temp\(7),
	combout => \counter13|temp[6]~feeder_combout\);

-- Location: FF_X22_Y20_N31
\counter13|temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter13|temp[6]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter13|temp\(6));

-- Location: LCCOMB_X22_Y19_N2
\counter13|temp[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter13|temp[5]~feeder_combout\ = \counter13|temp\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \counter13|temp\(6),
	combout => \counter13|temp[5]~feeder_combout\);

-- Location: FF_X22_Y19_N3
\counter13|temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter13|temp[5]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter13|temp\(5));

-- Location: LCCOMB_X22_Y19_N12
\counter13|temp[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter13|temp[4]~feeder_combout\ = \counter13|temp\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter13|temp\(5),
	combout => \counter13|temp[4]~feeder_combout\);

-- Location: FF_X22_Y19_N13
\counter13|temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter13|temp[4]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter13|temp\(4));

-- Location: LCCOMB_X22_Y19_N18
\counter13|temp[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter13|temp[3]~feeder_combout\ = \counter13|temp\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter13|temp\(4),
	combout => \counter13|temp[3]~feeder_combout\);

-- Location: FF_X22_Y19_N19
\counter13|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter13|temp[3]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter13|temp\(3));

-- Location: LCCOMB_X22_Y19_N28
\counter13|temp[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter13|temp[2]~feeder_combout\ = \counter13|temp\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter13|temp\(3),
	combout => \counter13|temp[2]~feeder_combout\);

-- Location: FF_X22_Y19_N29
\counter13|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter13|temp[2]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter13|temp\(2));

-- Location: LCCOMB_X22_Y19_N10
\counter13|temp[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter13|temp[1]~feeder_combout\ = \counter13|temp\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter13|temp\(2),
	combout => \counter13|temp[1]~feeder_combout\);

-- Location: FF_X22_Y19_N11
\counter13|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter13|temp[1]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter13|temp\(1));

-- Location: LCCOMB_X22_Y19_N0
\counter13|temp[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter13|temp[0]~feeder_combout\ = \counter13|temp\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \counter13|temp\(1),
	combout => \counter13|temp[0]~feeder_combout\);

-- Location: FF_X22_Y19_N1
\counter13|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \counter13|temp[0]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter13|temp\(0));

-- Location: LCCOMB_X22_Y20_N24
\data_ready_i_p1[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- data_ready_i_p1(0) = (\counter10|temp\(0)) # (\counter13|temp\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \counter10|temp\(0),
	datad => \counter13|temp\(0),
	combout => data_ready_i_p1(0));

-- Location: FF_X22_Y20_N25
\data_ready_pip1|q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => data_ready_i_p1(0),
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_ready_pip1|q\(0));

-- Location: LCCOMB_X23_Y20_N14
\data_ready_pip2|q[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_ready_pip2|q[0]~feeder_combout\ = \data_ready_pip1|q\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_ready_pip1|q\(0),
	combout => \data_ready_pip2|q[0]~feeder_combout\);

-- Location: FF_X23_Y20_N15
\data_ready_pip2|q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \data_ready_pip2|q[0]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_ready_pip2|q\(0));

-- Location: LCCOMB_X24_Y20_N24
data_ready_i_p3 : cycloneive_lcell_comb
-- Equation(s):
-- \data_ready_i_p3~combout\ = (\data_ready_pip2|q\(1)) # (\data_ready_pip2|q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_ready_pip2|q\(1),
	datad => \data_ready_pip2|q\(0),
	combout => \data_ready_i_p3~combout\);

-- Location: FF_X24_Y20_N25
\data_ready_pip3|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \data_ready_i_p3~combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_ready_pip3|q~q\);

-- Location: LCCOMB_X25_Y20_N28
\data_readyR|q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_readyR|q~feeder_combout\ = \data_ready_pip3|q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data_ready_pip3|q~q\,
	combout => \data_readyR|q~feeder_combout\);

-- Location: FF_X25_Y20_N29
\data_readyR|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \data_readyR|q~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \data_readyR|q~q\);

-- Location: FF_X25_Y20_N21
\finalData|q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finalData|q[0]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	ena => \data_readyR|q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finalData|q\(0));

-- Location: LCCOMB_X24_Y20_N2
\Serial_shift|LS4_Bs~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Serial_shift|LS4_Bs~1_combout\ = (\Serial_shift|temp\(2) & \word_size_combination|q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Serial_shift|temp\(2),
	datad => \word_size_combination|q\(0),
	combout => \Serial_shift|LS4_Bs~1_combout\);

-- Location: FF_X24_Y20_N3
\Serial_shift|LS4_Bs[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Serial_shift|LS4_Bs~1_combout\,
	ena => \ALT_INV_start~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Serial_shift|LS4_Bs\(1));

-- Location: LCCOMB_X25_Y20_N2
\finalData|q[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \finalData|q[1]~feeder_combout\ = \Serial_shift|LS4_Bs\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|LS4_Bs\(1),
	combout => \finalData|q[1]~feeder_combout\);

-- Location: FF_X25_Y20_N3
\finalData|q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finalData|q[1]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	ena => \data_readyR|q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finalData|q\(1));

-- Location: LCCOMB_X24_Y20_N12
\Serial_shift|LS4_Bs~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Serial_shift|LS4_Bs~2_combout\ = (!\word_size_combination|q\(2) & \Serial_shift|temp\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \word_size_combination|q\(2),
	datad => \Serial_shift|temp\(3),
	combout => \Serial_shift|LS4_Bs~2_combout\);

-- Location: FF_X24_Y20_N13
\Serial_shift|LS4_Bs[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Serial_shift|LS4_Bs~2_combout\,
	ena => \ALT_INV_start~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Serial_shift|LS4_Bs\(2));

-- Location: LCCOMB_X25_Y20_N24
\finalData|q[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \finalData|q[2]~feeder_combout\ = \Serial_shift|LS4_Bs\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|LS4_Bs\(2),
	combout => \finalData|q[2]~feeder_combout\);

-- Location: FF_X25_Y20_N25
\finalData|q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finalData|q[2]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	ena => \data_readyR|q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finalData|q\(2));

-- Location: LCCOMB_X24_Y20_N14
\Serial_shift|LS4_Bs~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Serial_shift|LS4_Bs~3_combout\ = (!\word_size_combination|q\(2) & \Serial_shift|temp\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \word_size_combination|q\(2),
	datad => \Serial_shift|temp\(4),
	combout => \Serial_shift|LS4_Bs~3_combout\);

-- Location: FF_X24_Y20_N15
\Serial_shift|LS4_Bs[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Serial_shift|LS4_Bs~3_combout\,
	ena => \ALT_INV_start~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Serial_shift|LS4_Bs\(3));

-- Location: LCCOMB_X25_Y20_N30
\finalData|q[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \finalData|q[3]~feeder_combout\ = \Serial_shift|LS4_Bs\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|LS4_Bs\(3),
	combout => \finalData|q[3]~feeder_combout\);

-- Location: FF_X25_Y20_N31
\finalData|q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finalData|q[3]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	ena => \data_readyR|q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finalData|q\(3));

-- Location: LCCOMB_X25_Y20_N0
\finalData|q[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \finalData|q[4]~feeder_combout\ = \Serial_shift|temp\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|temp\(4),
	combout => \finalData|q[4]~feeder_combout\);

-- Location: FF_X25_Y20_N1
\finalData|q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finalData|q[4]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	ena => \data_readyR|q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finalData|q\(4));

-- Location: LCCOMB_X25_Y20_N26
\finalData|q[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \finalData|q[5]~feeder_combout\ = \Serial_shift|temp\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|temp\(5),
	combout => \finalData|q[5]~feeder_combout\);

-- Location: FF_X25_Y20_N27
\finalData|q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finalData|q[5]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	ena => \data_readyR|q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finalData|q\(5));

-- Location: LCCOMB_X25_Y20_N4
\finalData|q[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \finalData|q[6]~feeder_combout\ = \Serial_shift|temp\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|temp\(6),
	combout => \finalData|q[6]~feeder_combout\);

-- Location: FF_X25_Y20_N5
\finalData|q[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finalData|q[6]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	ena => \data_readyR|q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finalData|q\(6));

-- Location: LCCOMB_X25_Y20_N10
\finalData|q[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \finalData|q[7]~feeder_combout\ = \Serial_shift|temp\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|temp\(7),
	combout => \finalData|q[7]~feeder_combout\);

-- Location: FF_X25_Y20_N11
\finalData|q[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finalData|q[7]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	ena => \data_readyR|q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finalData|q\(7));

-- Location: LCCOMB_X25_Y20_N8
\finalData|q[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \finalData|q[8]~feeder_combout\ = \Serial_shift|temp\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|temp\(8),
	combout => \finalData|q[8]~feeder_combout\);

-- Location: FF_X25_Y20_N9
\finalData|q[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finalData|q[8]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	ena => \data_readyR|q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finalData|q\(8));

-- Location: LCCOMB_X25_Y20_N22
\finalData|q[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \finalData|q[9]~feeder_combout\ = \Serial_shift|temp\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|temp\(9),
	combout => \finalData|q[9]~feeder_combout\);

-- Location: FF_X25_Y20_N23
\finalData|q[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finalData|q[9]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	ena => \data_readyR|q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finalData|q\(9));

-- Location: LCCOMB_X25_Y20_N12
\finalData|q[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \finalData|q[10]~feeder_combout\ = \Serial_shift|temp\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|temp\(10),
	combout => \finalData|q[10]~feeder_combout\);

-- Location: FF_X25_Y20_N13
\finalData|q[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finalData|q[10]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	ena => \data_readyR|q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finalData|q\(10));

-- Location: LCCOMB_X25_Y20_N14
\finalData|q[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \finalData|q[11]~feeder_combout\ = \Serial_shift|temp\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Serial_shift|temp\(11),
	combout => \finalData|q[11]~feeder_combout\);

-- Location: FF_X25_Y20_N15
\finalData|q[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \finalData|q[11]~feeder_combout\,
	clrn => \ALT_INV_start~inputclkctrl_outclk\,
	ena => \data_readyR|q~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \finalData|q\(11));

ww_parallel_out(0) <= \parallel_out[0]~output_o\;

ww_parallel_out(1) <= \parallel_out[1]~output_o\;

ww_parallel_out(2) <= \parallel_out[2]~output_o\;

ww_parallel_out(3) <= \parallel_out[3]~output_o\;

ww_parallel_out(4) <= \parallel_out[4]~output_o\;

ww_parallel_out(5) <= \parallel_out[5]~output_o\;

ww_parallel_out(6) <= \parallel_out[6]~output_o\;

ww_parallel_out(7) <= \parallel_out[7]~output_o\;

ww_parallel_out(8) <= \parallel_out[8]~output_o\;

ww_parallel_out(9) <= \parallel_out[9]~output_o\;

ww_parallel_out(10) <= \parallel_out[10]~output_o\;

ww_parallel_out(11) <= \parallel_out[11]~output_o\;
END structure;



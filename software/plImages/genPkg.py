#!/usr/bin/python3
import os
import json

data = [
	{'id': 0, 'accelConfig': '0080000000', 'dm': '0081000000',
	 'slots':
         [{'name': 'aes128encdec_2RP',
           'bin': 'opendfx_shell_i_RP_0_AES128_inst_0_partial.bit.bin'},
         {'name': 'aes192encdec_2RP',
           'bin': 'opendfx_shell_i_RP_0_AES192_inst_0_partial.bit.bin'}, 
         {'name': 'FFT4_2RP',
           'bin': 'opendfx_shell_i_RP_0_FFT_4channel_inst_0_partial.bit.bin'}, 
         {'name': 'FIR_compiler_2RP',
           'bin': 'opendfx_shell_i_RP_0_FIR_compiler_inst_0_partial.bit.bin'}
         ]},

	{'id': 1, 'accelConfig': '0082000000', 'dm': '0083000000',
	 'slots':
         [{'name': 'aes128encdec_2RP',
           'bin': 'opendfx_shell_i_RP_1_AES128_inst_1_partial.bit.bin'},
         {'name': 'aes192encdec_2RP',
           'bin': 'opendfx_shell_i_RP_1_AES192_inst_1_partial.bit.bin'},  
         {'name': 'FFT4_2RP',
           'bin': 'opendfx_shell_i_RP_1_FFT_4channel_inst_1_partial.bit.bin'},
         {'name': 'FIR_compiler_2RP',
           'bin': 'opendfx_shell_i_RP_1_FIR_compiler_inst_1_partial.bit.bin'}
         ]},
       ]
mkdir firmware
RELEASE="./firmware/"
TMP="./tmp/"
BASE2RP="./"
DTC="../petalinux/xilinx-k26-starterkit-2022.1/images/linux/sdk/sysroots/x86_64-petalinux-linux/usr/bin/dtc"

def createAccelJson(accel, path=TMP):
	FILEPATH = path + "accel.json"
	print(FILEPATH)

	accelData = {"accel_type": "native",
		"accel_devices":[{
			"dev_name":"80000000.AccelConfig",
			"reg_base":"",
			"reg_size":"65536"
			},{
			"dev_name":"81000000.rm_comm_box",
			"reg_base":"",
			"reg_size":""
			},{
			"dev_name":"82000000.AccelConfig",
			"reg_base":"",
			"reg_size":"65536"
			},{
			"dev_name":"83000000.rm_comm_box",
			"reg_base":"",
			"reg_size":""
			}],
		"AccelHandshakeType": "streamDataFromTrg",
		"accel_metadata":{
    		}
	}
	if accel['name'] == 'aes128encdec_2RP':
		accelData["accel_metadata"] = {
						"fallback": {
							"Behaviour" : "FUN",
				           		"fallback_Lib" : "NONE"
        					},
        					"Input_Data_Block_Size" : "0x1000000",
        					"Output_Data_Block_Size":"0x1000000",
        					"Input_Channel_Count" : 2,
        					"Output_Channel_Count" : 1,
        					"Inter_RM":{
            						"Compatible" : "True",
            						"Address" : "0x10000000"
         					},
       						"Config_Buffer_Size" : "0x4000",
     				   		"Input_Buffer_Size" : "0x1000000",
   				     		"Output_Buffer_Size":"0x1000000",
   				     		"Throughput" : 10,
 				       		"DMA_type":"HLS_MULTICHANNEL_DMA",
			        		"Accel_Handshake_Type": "streamDataFromTrg"
    					}
	elif accel['name'] == 'aes192encdec_2RP':
		accelData["accel_metadata"] = {
						"fallback": {
							"Behaviour" : "FUN",
				           		"fallback_Lib" : "NONE"
        					},
        					"Input_Data_Block_Size" : "0x1000000",
        					"Output_Data_Block_Size": "0x1000000",
        					"Input_Channel_Count" : 2,
        					"Output_Channel_Count" : 1,
        					"Inter_RM":{
            						"Compatible" : "True",
            						"Address" : "0x10000000"
         					},
       						"Config_Buffer_Size" : "0x4000",
     				   		"Input_Buffer_Size" : "0x1000000",
   				     		"Output_Buffer_Size": "0x1000000",
   				     		"Throughput" : 10,
 				       		"DMA_type":"HLS_MULTICHANNEL_DMA",
			        		"Accel_Handshake_Type": "streamDataFromTrg"
    					}
	elif accel['name'] == 'FFT4_2RP':
		accelData["accel_metadata"] = {
						"fallback": {
							"Behaviour" : "FUN",
				           		"fallback_Lib" : "NONE"
        					},
        					"Input_Data_Block_Size" : "0x1000000",
        					"Output_Data_Block_Size":"0x1000000",
        					"Input_Channel_Count" : 6,
        					"Output_Channel_Count" : 1,
        					"Inter_RM":{
            						"Compatible" : "True",
            						"Address" : "0x10000000"
         					},
       						"Config_Buffer_Size" : "0x4000",
     				   		"Input_Buffer_Size" : "0x1000000",
   				     		"Output_Buffer_Size":"0x1000000",
   				     		"Throughput" : 10,
 				       		"DMA_type":"HLS_MULTICHANNEL_DMA",
			        		"Accel_Handshake_Type": "streamDataFromTrg"
    					}
	elif accel['name'] == 'FIR_compiler_2RP':
		accelData["accel_metadata"] = {
						"fallback": {
							"Behaviour" : "FUN",
				           		"fallback_Lib" : "NONE"
        					},
        					"Input_Data_Block_Size" : "0x1000000",
        					"Output_Data_Block_Size":"0x1000000",
        					"Input_Channel_Count" : 5,
        					"Output_Channel_Count" : 1,
        					"Inter_RM":{
            						"Compatible" : "True",
            						"Address" : "0x10000000"
         					},
       						"Config_Buffer_Size" : "0x4000",
     				   		"Input_Buffer_Size" : "0x1000000",
   				     		"Output_Buffer_Size":"0x1000000",
   				     		"Throughput" : 10,
 				       		"DMA_type":"HLS_MULTICHANNEL_DMA",
			        		"Accel_Handshake_Type": "streamDataFromTrg"
    					}
	filehandle = open(FILEPATH, 'w')
	filehandle.write(json.dumps(accelData, indent=2, sort_keys=True))
	filehandle.close()

def createDTBO(accel, path=TMP):
	FILEPATH = path + accel['bin'] + '_i.dtsi'
	print(FILEPATH)
	accelData = '''
'''.format(accel['id'], accel['bin'], accel['accelConfig'], accel['dm'])
	filehandle = open(FILEPATH, 'w')
	filehandle.write(accelData)
	filehandle.close()
	res = os.system(' '.join([DTC, '-I dts -O dtb', 
			'-o', TMP + accel['bin'] + '_i.dtbo', 
			'-@', TMP + accel['bin'] + '_i.dtsi']))
	res = os.system(' '.join([DTC, '-I dtb -O dts', 
			'-o', TMP + accel['bin'] + '_i.dtso', 
			'-@', TMP + accel['bin'] + '_i.dtbo']))

def parse(data):
	accels = []
	for slot in data:
		for accel in slot['slots']:
			acc = accel
			acc['id'] = slot['id']
			acc['accelConfig'] = slot['accelConfig']
			acc['dm'] = slot['dm']
			accels.append(acc)
	return accels

def package(accel, releasedir = RELEASE, tmpdir = TMP):
	createAccelJson(accel)
	createDTBO(accel)
	res = os.system(' '.join(['cp', BASE2RP + accel['bin'], TMP + accel['bin']]))
	DIR = accel['name'] + '/' + accel['name'] + '_slot' + str(accel['id'])
	print(DIR)
	res = os.system(' '.join(['mkdir', '-p', RELEASE + DIR]))
	res = os.system(' '.join(['cp', TMP + accel['bin'], RELEASE + DIR + '/' + accel['bin']]))
	res = os.system(' '.join(['cp', TMP + accel['bin'] + '_i.dtbo', RELEASE + DIR ]))
	res = os.system(' '.join(['cp', TMP + accel['bin'] + '_i.dtso', RELEASE + DIR ]))
	res = os.system(' '.join(['cp', TMP + 'accel.json', RELEASE + DIR]))
	pass

res = os.system(' '.join(['rm', '-rf', TMP]))
res = os.system(' '.join(['mkdir', '-p', RELEASE]))
res = os.system(' '.join(['mkdir', '-p', TMP]))
res = os.system(' '.join(['cp', BASE2RP + 'opendfx_shell_wrapper.bit.bin', RELEASE]))
res = os.system(' '.join(['cp', BASE2RP + 'pl.dtbo', RELEASE]))
res = os.system(' '.join(['cp', BASE2RP + 'pl.dtsi', RELEASE]))
res = os.system(' '.join(['cp', BASE2RP + 'shell.json', RELEASE]))
accels = parse(data)
for accel in accels:
	package(accel)

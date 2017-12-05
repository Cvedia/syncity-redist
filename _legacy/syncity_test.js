// (c) z3n - R1V1@170730 - www.overflow.biz - rodrigo.orph@gmail.com

var net = require('net'),
		
		syncity = {
			_benchmark: false,
			_locked: false,
			_callback_data: undefined,
			_delay: 250,
			
			conn: new net.Socket(),
			queue: [],
			
			write_data: function(cmd, callback){
				if (syncity._locked) {
					syncity.queue.push([cmd, callback]);
					return;
				}
				
				syncity._locked = true;
				setTimeout(function(){
					syncity._benchmark = Date.now();
					console.log('>>>', cmd);
					syncity._callback_data = callback;
					syncity.conn.write(cmd + '\n');
				}, syncity._delay);
			},
			
			run_queue: function(){
				if (syncity.queue.length > 0) {
					var x = syncity.queue.shift();
					syncity.write_data(x[0], x[1]);
				}
			},
			
			init: function(params, callback){
				syncity.conn
					.on('close', function(){
						console.log('Connection closed');
						process.exit(0);
					})
					.on('timeout', function(){
						console.log('Connection timeout');
						process.exit(1);
					})
					.on('drain', function(){
						console.log('Buffer drained');
					})
					.on('data', function(buf){
						syncity._locked = false;
						try { syncity._callback_data(); } catch (z) {};
						console.log('<<< ' + buf.toString().replace('\n', '').replace('\r', '') + ' ' + (Date.now() - syncity._benchmark) + 'ms');
						
						syncity.run_queue();
					})
					.on('end', function(){
						console.log('Connection gracefully closed');
						process.exit(0);
					})
					.on('error', function(err){
						console.log('Connection error:', err);
						process.exit(1);
					})
					.connect(params, function(){
						console.log('Connected');
						syncity.run_queue();
						try { callback(); } catch (z) {}
					});
			}
		},
		
		car_pos = [ 1, 1, 1 ],
		
		// random rotation and position
		run_test1 = function(){
			car_pos[0] += Math.random();
			car_pos[1] += Math.random();
			car_pos[2] += Math.random();
			
			if (car_pos[0] > 10)
				car_pos[0] = 0;
			if (car_pos[1] > 10)
				car_pos[1] = 0;
			if (car_pos[2] > 10)
				car_pos[2] = 0;
			
			var rot = parseInt(Math.random() * 359) + ' ' + parseInt(Math.random() * 359) + ' ' + parseInt(Math.random() * 359);
			
			// syncity.write_data('OBJECT mycar POSITION ' + car_pos.join(' '));
			syncity.write_data('CVEDIA PUSH CAMERA Front AS source');
			syncity.write_data('CAMERA Front MOVE ' + car_pos.join(' '));
			syncity.write_data('CAMERA Front ROTATE ' + rot);
			
			syncity.write_data('CVEDIA PUSH CAMERA Segmentation AS ground');
			syncity.write_data('CAMERA Front MOVE ' + car_pos.join(' '));
			syncity.write_data('CAMERA Segmentation ROTATE ' + rot);
			
			syncity.write_data('CVEDIA STORE', run_test1);
		},
		
		// spin on y axis in 5 degrees
		run_test2 = function(){
			syncity._delay = 0;
			car_pos[1] += 5;
			
			if (car_pos[1] > 360)
				car_pos = [ 1 , 1,  1 ];
				// return process.exit(0);
			
			var rot = car_pos.join(' ');
			syncity.write_data('CVEDIA PUSH CAMERA Front AS source');
			syncity.write_data('CAMERA Front ROTATE ' + rot);
			
			syncity.write_data('CVEDIA STORE', run_test2);
		},
		
		// spin on y axis in 5 degrees, on car bumper, reseting on edges
		run_test3 = function(){
			syncity._delay = 0;
			car_pos[1] += 5;
			
			if (car_pos[1] > 90 && car_pos[1] < 270)
				car_pos = [ 1 , 270,  1 ];
			if (car_pos[1] > 360)
				car_pos = [ 1 , 1,  1 ];
				// return process.exit(0);
			
			var rot = car_pos.join(' ');
			syncity.write_data('CVEDIA PUSH CAMERA Front AS source');
			syncity.write_data('CAMERA Front ROTATE ' + rot);
			setTimeout(function(){
				syncity.write_data('CVEDIA STORE', run_test3);
			}, 100);
		},
		
		// spin on y axis in 5 degrees, on car bumper, reseting on edges
		run_test4 = function(){
			syncity._delay = 0;
			car_pos[1] += 5;
			
			if (car_pos[1] > 90 && car_pos[1] < 270)
				car_pos = [ 1 , 270,  1 ];
			if (car_pos[1] > 360)
				car_pos = [ 1 , 1,  1 ];
				// return process.exit(0);
			
			var rot = car_pos.join(' ');
			syncity.write_data('CVEDIA PUSH CAMERA Segmentation AS ground');
			syncity.write_data('CAMERA Segmentation ROTATE ' + rot);
			syncity.write_data('CVEDIA STORE', run_test4);
		},
		
		// simple segmentation extract
		run_test5 = function(){
			syncity._delay = 0;
			
			syncity.write_data('CVEDIA PUSH CAMERA Segmentation AS ground');
			syncity.write_data('CVEDIA STORE', run_test5);
		},
		
		// simple front camera extract
		run_test6 = function(){
			syncity._delay = 0;
			
			syncity.write_data('CVEDIA PUSH CAMERA Front AS source');
			syncity.write_data('CVEDIA STORE', run_test6);
		};

// init commands
/*
syncity.queue.push(
	// [ 'OBJECT CREATE mycar car1', undefined ],
	[ 'CVEDIA PUSH CAMERA Front AS source', undefined ],
	[ 'CVEDIA PUSH CAMERA Segmentation AS ground', undefined ]
);
*/

// connect to server
syncity.init({
	host: '192.168.1.75',
	port: 10200
}, function(){
	if (typeof process.argv[2] != 'undefined') {
		eval('run_test' + parseInt(process.argv[2]) + '()');
	} else {
		run_test6();
	}
});

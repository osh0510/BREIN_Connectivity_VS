<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="ReaderEngin/txtReader14.js"></script>
<script type="text/javascript" src="js/three.js"></script>
<script type="text/javascript" src="js/three.min.js"></script>
<script type="text/javascript" src="js/OrbitControls.js"></script>
<script type="text/javascript" src="js/OBJLoader.js"></script>

</head>
<body>
	<script>
		var container;
		var camera, controls, scene, renderer;
		var lighting, ambient, keyLight, fillLight, backLight;
		const fileLoader = new THREE.FileLoader();
		const objLoader1 = new THREE.OBJLoader();

		function colormap() {
			var visual_first = performance.now(); //시작시간 체크(단위 ms)

			var random_array = [];
			var max_first = 5;
			var min_first = 0;
			var min;

			/* 	var random_first = performance.now();     //시작시간 체크(단위 ms) */

			lhc_array_len = lhc_array.length;

			for (var i = 0; i < lhc_array_len; i++) { //lh_c길이 만큼 난수 생성 
				 random_array[i] = Math.floor(Math.random()* (max_first - min_first + 1))+ min_first; 
				if (random_array[i] != 0) { // 0이 min이 안되도록.
					if (!min) { // min이 없을때. 처음 값 
						min = random_array[i];
					}
					if (min > random_array[i]) {
						min = random_array[i];
					}
				}
			} // ((0~1 사이 소숫값 X 6) + 0) = ?.? 			 

			var max = Math.max.apply(null, random_array);
			
		

			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 노말리제이션 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

			var nor_a = [];
			for (var i = 0; i < lhc_array_len; i++) {
				if(random_array[i] != 0) {
					if(random_array[i] != 1){
					nor_a[i] = Math.round(((random_array[i] - min) / (max - min)) * jetcolor_array.length);
					}else{
						nor_a[i] = 0; 
					}
				} else {
					nor_a[i] = null; // 랜덤이 0일 경우 (초기 컬러) !다시확인 
				}
			}

			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 컬러매칭 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
			

			col_map = [];
			
			nor_a_len = nor_a.length;

			for (var i = 0; i < nor_a_len; i++) {
				col_map[i] = [];
				if (nor_a[i] != null) {
					if (nor_a[i] != 0) {
						col_map[i] = jetcolor_array[nor_a[i] - 1];
					} else {
						col_map[i] = jetcolor_array[0];
					}
				}else{
					col_map[i][0] = 1;
					col_map[i][1] = 1;
					col_map[i][2] = 1;
					}
			}

			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ lh_c 매칭 와 컬러와 묶음■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

			lhc_color = [];
			lhc_array_len = lhc_array.length;
			
			for (var i = 0; i < lhc_array_len; i++) {
				lhc_color[i] = [ lhc_array[i][4], col_map[i][0], col_map[i][1], col_map[i][2] ];
			}

			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ label 매칭 => indexcolor테이블 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/

			lhlabel_array_len = lhlabel_array.length;

			final_vertices = [];
			
			lhc_color_len = lhc_color.length;

			for (var i = 0; i < lhlabel_array_len; i++) {
				final_vertices[i] = [];
				a = 0;
				for (var j = 0; j < lhc_color_len; j++) {

					if (lhlabel_array[i][0] == lhc_color[j][0]) {
						final_vertices[i][0] = lhc_color[j][1];
						final_vertices[i][1] = lhc_color[j][2];
						final_vertices[i][2] = lhc_color[j][3];
						a = 2;
					}
				}
				if (a != 2) {
					final_vertices[i][0] = 1;
					final_vertices[i][1] = 1;
					final_vertices[i][2] = 1;
				}
			}

			/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■파일 로드■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */

			objLoader1.setPath('assets/');

			var Viewerfile= "lhmess.obj";
			
			loadObj('objmesh', Viewerfile, addPlaneToSceneSOAnswer);

			function loadObj(objName, objurl, onLoadfunc) {

				fileLoader.setPath('assets/');
				fileLoader.load(objurl, function(onLoadContent) { //로더
					var mesh = objLoader1.parse(onLoadContent);
					onLoadfunc(mesh); //콜백 
				});
			}

			function addPlaneToSceneSOAnswer(mesh) {

				var frontMaterial = new THREE.MeshLambertMaterial({
					color : 0xffffff,
					side : THREE.FrontSide
				});

				var geometry = new THREE.Geometry()
						.fromBufferGeometry(mesh.children[0].geometry); // 기하학 생성 
				var length = geometry.faces.length;

				/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■faces 매칭 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */

				var faces_start = obj_array.length - geometry.faces.length;
				obj_array_len = obj_array.length;
				
				for (var i = faces_start; i < obj_array_len; i++) {
					vertices_index1 = obj_array[i][1];
					vertices_index2 = obj_array[i][2];
					vertices_index3 = obj_array[i][3];

					if (final_vertices[vertices_index2 - 1] != null) {

						face1 = geometry.faces[i - faces_start];
						face1.color.setRGB(1, 1, 1);
						face1.color.setRGB(final_vertices[vertices_index2 - 1][0],final_vertices[vertices_index2 - 1][1],final_vertices[vertices_index2 - 1][2]);
					}
				}

				mesh = new THREE.Mesh(geometry, new THREE.MeshLambertMaterial({
					vertexColors : THREE.FaceColors
				}));
				mesh.scale.set(0.01, 0.01, 0.01); // 스케일
				scene.add(mesh);

				camera = new THREE.PerspectiveCamera(45, window.innerWidth
						/ window.innerHeight, 0.1, 100);
				camera.position.x = 0;
				camera.position.y = 0;
				camera.position.z = 2;

				controls = new THREE.OrbitControls(camera, renderer.domElement);
				controls.enableDamping = true;
				controls.dampingFactor = 0.1;
				controls.enableZoom = true;

				var visual_end = performance.now();
				alert("faces color 가시화 속도" + (visual_end - visual_first) + 'ms');
			init();
			animate();
			}

		}
		function init() {

			container = document.createElement('div');
			document.body.appendChild(container);

			/* Scene */

			scene = new THREE.Scene();
			scene.background = new THREE.Color(0xffffff);
			/*조명*/
			/*ambient = new THREE.AmbientLight(0xffffff, 0.8); */

			/* 포인트 광원을 흰색으로 만들고 나서 입방체의 윗면과 앞면에 빛이 비치도록 */
			var pointLight = new THREE.PointLight(0xffffff);
			pointLight.position.set(20, 20, 20);
			var pointLight1 = new THREE.PointLight(0xffffff);
			pointLight1.position.set(-20, -20, -20);
			scene.add(pointLight);
			scene.add(pointLight1);

			/* Renderer */
			renderer = new THREE.WebGLRenderer();

			/*읽기 전용 현재 디스플레이 장치 상의 물리적인 픽셀의 비율을 반환*/
			renderer.setPixelRatio(window.devicePixelRatio);

			/*뷰어 사이즈 설정*/
			renderer.setSize(window.innerWidth, window.innerHeight);
			container.appendChild(renderer.domElement);

			/* 창크기 조절 */
			window.addEventListener('resize', onWindowResize);

		}

		/*창크기에 맞게 변경*/
		function onWindowResize() {
			camera.aspect = window.innerWidth / window.innerHeight;

			/*카메라 투영 행렬을 업데이트*/
			camera.updateProjectionMatrix();

			renderer.setSize(window.innerWidth, window.innerHeight);
		}

		/*화면시각변화*/
		function animate() {
			requestAnimationFrame(animate);
			controls.update();
			render();
		}

		function render() {
			renderer.render(scene, camera);
		}

		window.onload = Engin();
	</script>
</body>

</html>
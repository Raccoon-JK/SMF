function makeDragEvent() {
	const leftboxes = document.querySelectorAll('.leftbox');

	// leftbox NodeList가 빈 경우 예외처리
	if (!leftboxes.length) {
		return;
	}

	leftboxes.forEach((leftbox) => {
		const images = leftbox.querySelectorAll('.deco');

		// images NodeList가 빈 경우 예외처리
		if (!images.length) {
			return;
		}

		images.forEach((image) => {
			let isDragging = false;
			// 현재 마우스 포인트 좌표
			let currentX;
			let currentY;
			// 드래그시작할때 이미지 초기 좌표
			let initialX;
			let initialY;
			// 이미지가 xy 축으로 이동한 거리 
			let xOffset = 0;
			let yOffset = 0;

			// 마우스 누르면 드래그 시작
			image.addEventListener('mousedown', dragStart);
			document.addEventListener('mouseup', dragEnd);
			document.addEventListener('mousemove', drag);

			function dragStart(e) {
				initialX = e.clientX - xOffset;
				initialY = e.clientY - yOffset;
				// 마우스포인터가 위치한 x y

				// 드래그 앤 드롭한 이미지가 leftbox 안에 있을 때만 아이콘을 표시
				if (e.currentTarget === image && image.parentNode.classList.contains('leftbox')) {
					isDragging = true;
					image.style.cursor = 'grabbing';
				}
			}

			function dragEnd(e) {
				if (isDragging) {
					isDragging = false;
					image.style.cursor = 'grab';

					initialX = currentX;
					initialY = currentY;
				}
			}

			function drag(e) {
				if (isDragging) {
					e.preventDefault();

					currentX = e.clientX - initialX;
					currentY = e.clientY - initialY;

					// 현재 좌표값이 leftbox 안에 있도록 제한
					const box = image.parentNode.getBoundingClientRect();
					const minX = box.left - box.left;
					const maxX = box.right - (box.left + image.offsetWidth);
					const minY = box.top - box.top;
					const maxY = box.bottom - (box.top + image.offsetHeight);
					currentX = Math.min(Math.max(currentX, minX), maxX);
					currentY = Math.min(Math.max(currentY, minY), maxY);

					xOffset = e.clientX - initialX;
					yOffset = e.clientY - initialY;

					setTranslate(currentX, currentY, image);
				}
			}

			// 이미지 위치 조정
			function setTranslate(xPos, yPos, el) {
				el.style.left = xPos + "px";
				el.style.top = yPos + "px";
			}
		});
	});
}


function makeCopyDragEvent() {
	let leftboxes = document.querySelectorAll('.leftbox');
	const rightboxes = document.querySelectorAll('.rightbox');

	rightboxes.forEach((rightbox) => {
		const images = rightbox.querySelectorAll('.deco');
		images.forEach((image) => {
			image.addEventListener('dragstart', startDrag, false);
		});
	});

	leftboxes.forEach((leftbox) => {
		leftbox.addEventListener('dragenter', (e) => {
			e.preventDefault();
		}, false);
		leftbox.addEventListener('dragover', (e) => {
			e.preventDefault();
		}, false);
		leftbox.addEventListener('drop', (e) => {
			e.preventDefault();
			dropped(e);
		}, false);
	});

	makeDragEvent();
}

function startDrag(e) {
	e.dataTransfer.setData('text/plain', e.target.id);
}

function dropped(e) {

	var data = e.dataTransfer.getData('text/plain');

	var newImage = document.createElement('img');
	newImage.id = data;
	newImage.className = 'deco';
	newImage.src = document.getElementById(data).src;

	var leftbox = document.querySelector('#' + e.currentTarget.id);

	// leftbox가 null인 경우 return
	if (!leftbox) {
		return;
	}

	// 이미지를 교체
	if (leftbox.tagName == "SECTION") {
		// 드랍된 이미지가 부모가 container4 이면
		if (data.startsWith("img") && document.getElementById(data).parentNode.parentNode.classList.contains("container4")) {
			// 이미지를 좌우반전시킴
			var flippedImage = newImage.cloneNode(true);
			newImage.style.transform = "scaleX(-1)";
			flippedImage.style.transform = "scaleX(-1)";

			// 합쳐진 이미지 생성
			var mergedImage = document.createElement('canvas');
			mergedImage.width = 600;
			mergedImage.height = 300;
			var ctx = mergedImage.getContext('2d');

			// 이미지를 합쳐 그림
			ctx.drawImage(newImage, 200, 0, 200, 200);
			ctx.save(); // 현재 상태 저장
			ctx.translate(0, 0); // 좌표 이동
			ctx.scale(-1, 1); // 좌우반전
			ctx.drawImage(flippedImage, -200, 0, 200, 200);
			ctx.restore(); // 이전 상태 복구

			// 합쳐진 이미지를 새로운 img 엘리먼트로 만들어서 leftbox에 추가
			var newMergedImage = document.createElement('img');
			newMergedImage.id = "mergedImage";
			newMergedImage.className = 'deco';
			newMergedImage.src = mergedImage.toDataURL();
			leftbox.appendChild(newMergedImage);

			newMergedImage.style.display = "inline";

		} else {
			// 일반적인 이미지 추가
			leftbox.appendChild(newImage);
		}
	}
	makeDragEvent();

	// 아이콘 생성 함수
	function createResizeIcon(image) {
		var iconSize = 100;
		var iconRight = -100;

		var resizeIcon = document.createElement('img');
		resizeIcon.src = '/SMF_Project/resources/dressroom/image/size-guide.png';
		resizeIcon.style.width = iconSize + 'px';
		resizeIcon.style.height = iconSize + 'px';
		resizeIcon.style.right = iconRight + 'px';
		resizeIcon.style.cursor = 'nwse-resize';
		image.parentNode.appendChild(resizeIcon);

		// 이미지 크기 조절 이벤트 등록
		var isResizing = false;
		var currentX;
		var currentY;
		var initialX;
		var initialY;
		var xOffset = 0;
		var yOffset = 0;

		resizeIcon.addEventListener('mousedown', resizeStart);
		document.addEventListener('mouseup', resizeEnd);
		document.addEventListener('mousemove', resize);

		function resizeStart(e) {
			initialX = e.clientX;
			initialY = e.clientY;
			isResizing = true;
		}

		function resizeEnd(e) {
			initialX = currentX;
			initialY = currentY;
			isResizing = false;
		}

		function resize(e) {
			if (isResizing) {
				e.preventDefault();

				currentX = e.clientX;
				currentY = e.clientY;

				var width = image.offsetWidth + currentX - initialX;
				var height = image.offsetHeight + currentY - initialY;

				// 비율 계산
				var ratio = Math.min(width / image.naturalWidth, height / image.naturalHeight);
				width = image.naturalWidth * ratio;
				height = image.naturalHeight * ratio;

				if (width > 0 && height > 0) {
					image.style.width = width + 'px';
					image.style.height = height + 'px';
				}

				initialX = currentX;
				initialY = currentY;
			}
		}
		// 아이콘 삭제
		IconRemoveEvent(resizeIcon, image);
	}

	// 아이콘 생성
	var images = document.querySelectorAll('.deco');
	images.forEach(function(image) {
		image.addEventListener('click', function(e) {
			e.stopPropagation();
			if (image.parentNode.classList.contains('leftbox')) { // leftbox 자식인 경우에만 실행
				createResizeIcon(image);
				createRotateIcon(image);
				createDeleteIcon(image);
			}
		});
	});

	function createRotateIcon(image) {
		var iconSize = 100;
		var iconTop = 100;
		var iconRight = -100;

		var rotateIcon = document.createElement('img');
		rotateIcon.src = '/SMF_Project/resources/dressroom/image/rotate-guide4.png';
		rotateIcon.style.width = iconSize + 'px';
		rotateIcon.style.height = iconSize + 'px';
		rotateIcon.style.top = iconTop + 'px';
		rotateIcon.style.right = iconRight + 'px';
		rotateIcon.style.cursor = 'pointer';
		image.parentNode.appendChild(rotateIcon);

		var angle = 0;

		rotateIcon.addEventListener("click", function() {
			angle += 15;
			updateTransform();
		});

		function updateTransform() {
			var transform = "rotate(" + angle + "deg)";
			image.style.transform = transform;
		}

		IconRemoveEvent(rotateIcon, image);

	}

	function createDeleteIcon(image) {
		var iconSize = 100;
		var iconTop = 200;
		var iconRight = -100;

		var deleteIcon = document.createElement('img');
		deleteIcon.src = '/SMF_Project/resources/dressroom/image/delete-guide.png';
		deleteIcon.style.width = iconSize + 'px';
		deleteIcon.style.height = iconSize + 'px';
		deleteIcon.style.top = iconTop + 'px';
		deleteIcon.style.right = iconRight + 'px';
		deleteIcon.style.cursor = 'pointer';
		image.parentNode.appendChild(deleteIcon);

		deleteIcon.addEventListener("click", function() {
			image.remove();
			// updateTransform();
		});

		IconRemoveEvent(deleteIcon, image);

	}

	function IconRemoveEvent(icon, image) {
		document.addEventListener('click', function(e) {
			var targetElement = e.target;
			var clickedOnIcon = false;

			while (targetElement !== null) {
				if (targetElement === icon) {
					clickedOnIcon = true;
					break;
				}
				targetElement = targetElement.parentElement;
			}

			if (!clickedOnIcon) {
				if (icon.parentNode !== null) {
					icon.parentNode.removeChild(icon);
				}
			}
		});
	}

}

window.addEventListener('load', makeCopyDragEvent);

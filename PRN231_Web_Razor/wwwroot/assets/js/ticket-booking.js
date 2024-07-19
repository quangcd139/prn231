

$(document).ready(function () {
    var currentGfgStep, nextGfgStep, previousGfgStep;
    var opacity;
    var current = 1;
    var steps = $("fieldset").length;

    setProgressBar(current);

    $(".next-step").click(function () {

        currentGfgStep = $(this).parent();
        nextGfgStep = $(this).parent().next();

        $("#progressbar li").eq($("fieldset")
            .index(nextGfgStep)).addClass("active");

        nextGfgStep.show();
        currentGfgStep.animate({
            opacity: 0
        }, {
            step: function (now) {
                opacity = 1 - now;

                currentGfgStep.css({
                    'display': 'none',
                    'position': 'relative'
                });
                nextGfgStep.css({
                    'opacity': opacity
                });
            },
            duration: 500
        });
        setProgressBar(++current);
    });

    $(".previous-step").click(function () {

        currentGfgStep = $(this).parent();
        previousGfgStep = $(this).parent().prev();

        $("#progressbar li").eq($("fieldset")
            .index(currentGfgStep)).removeClass("active");

        previousGfgStep.show();

        currentGfgStep.animate({
            opacity: 0
        }, {
            step: function (now) {
                opacity = 1 - now;

                currentGfgStep.css({
                    'display': 'none',
                    'position': 'relative'
                });
                previousGfgStep.css({
                    'opacity': opacity
                });
            },
            duration: 500
        });
        setProgressBar(--current);
    });

    function setProgressBar(currentStep) {
        var percent = parseFloat(100 / steps) * current;
        percent = percent.toFixed();
        $(".progress-bar")
            .css("width", percent + "%")
    }
});



$("#showtime-btn123").click(async function () {
    var buildingId = buildingIdSelected;
    var filmCalenderId = filmCalenderIdSelected;
    var roomId = roomIdSelected;
    var filmId = document.getElementById("filmId1");

    console.log(buildingId + " " + filmId);

    try {
        var response = await fetch("http:localhost:5000/api/SeatBooking/getSeatMap/" + buildingId + "/" + filmCalenderId + "/" + roomId, {
            method: 'GET'
        });

        if (!response.ok) {
            throw new Error('Not Found');
        }

        var responseData = await response.json();
        //localStorage.setItem('responseData', JSON.stringify(responseData));
        document.getElementById("seat-sel-iframe").src = `seat_selection/seat_sel.html?seatData=${responseData.seatMap}cach${responseData.soldSeats}`;
    } catch (error) {
        console.error('There has been a problem with your fetch operation:', error);
    }

})

function generateRandomDigit() {
    var code = ""
    for (let i = 0; i < 8; i++) {
        code += Math.floor(Math.random() * 10).toString();
    }
    return code;
}
var barCode = generateRandomDigit();

JsBarcode("#barcode", barCode, {
    width: 4,
    height: 40,
    displayValue: true
});

$("#seat_choosing139").click(async function () {
    var buildingId = buildingIdSelected;
    var filmId = filmCalenderIdSelected;
    var roomId = roomIdSelected;
    var storedSeat = localStorage.getItem('selectedSeat');
    var seatArray = storedSeat.split(",");
    console.log("storedSeat: " + seatArray);

    var userId = document.getElementById("userId").value;
    console.log(userId);
    const myHeaders = new Headers();
    myHeaders.append("accept", "*/*");
    myHeaders.append("Content-Type", "application/json;odata.metadata=minimal;odata.streaming=true");

    const raw = `
        {
          "lot": ${seatArray},
          "price": 10,
          "userId": ${userId},
          "filmCalenderId": ${filmId},
          "roomId": ${roomId},
          "buildingId": ${buildingId},
          "barCode": "${barCode}"
        }`;

    console.log(raw);
    const requestOptions = {
        method: "POST",
        headers: myHeaders,
        body: raw,
        redirect: "follow"
    };

    var id123 = await fetch("http://localhost:5000/api/OrderDetail/create", requestOptions)
        .then((response) => response.text())
        .catch((error) => console.error(error));


    console.log("SeatBooking: " + id123);

    var responseDetail = await fetch("http://localhost:5000/api/SeatBooking/GetDetail/" + id123, {
        method: 'GET'
    })
        .then((response) => response.json())
        //.then((data) => console.log(data[0]))
        .catch((err) => console.log(err))

    var bookingData = responseDetail[0];
    console.log(responseDetail[0].buildingName);
    console.log(responseDetail[0].movieImage);
    loadDataToTiket(bookingData, storedSeat);

})
function loadDataToTiket(responseDetail, storedSeat) {

    var seatArray = storedSeat.split(",");
    $("#buildingName").text(responseDetail.buildingName);
    $("#movieImg").attr("src", responseDetail.movieImage); // Use .attr for image source
    $("#roomName").text(responseDetail.roomName);
    $("#movieName").text(responseDetail.movieName);
    $("#seat").text(storedSeat);
    $("#seatPrice").text("Total:" + responseDetail.price * seatArray.length); // Format price
    $("#dateBooking").text(responseDetail.dateBooking); // Set actual date
    $("#timeDuration").text(responseDetail.startTime + " to " + responseDetail.endTime);
}

$("#confirm-btn").click(async function () {
    var buildingId = buildingIdSelected
    console.log(buildingId)
    var filmId = document.getElementById("filmId1").value;
    console.log("filmId fozen: " + filmId)
    // Call your API here using AJAX
    var responseData = await fetch("http://localhost:5000/api/Room/getShowtime1/" + buildingId + "/" + filmId, {
        method: 'GET'
    })
        .then((response) => response.json())
        //.then((data) => console.log(data[0]))
        .catch((err) => console.log(err))

    loadDataToShowTime(responseData)
})


function loadDataToShowTime(responseData) {
    var innerText = ``;
    var innerShowTime = document.getElementById("showTime");

    for (let i = 0; i <= responseData.length; i++) {
        var time = ``;
        let currentData = responseData[i];
        if (currentData == null) {
            console.warn(`responseData[${i}] bị undefined hoặc null`);
            continue; // Bỏ qua phần tử này và tiếp tục với phần tử tiếp theo
        }
        let filmCalenders = currentData.filmCalenders;
        console.log(filmCalenders);

        if (filmCalenders != null && Array.isArray(filmCalenders)) {
            for (let j = 0; j < filmCalenders.length; j++) {
                let filmCalendar = filmCalenders[j];
                time += `<button class="screen-time" onclick="GetShowTimeID(${filmCalendar.id},${filmCalendar.roomId}, event)">
                 `+ filmCalendar.startTime + " to " + filmCalendar.endTime + `</button>`;


            }

        }
        innerText += `<li class="time-li">
                                    <div class="screens">
                                        `+ responseData[i].roomName + `
                                    </div>
                                    <div class="time-btn">
                                        `+ time + `
                                    </div>
                                </li>`;

    }

    innerShowTime.innerHTML = innerText;
}

async function dateChange(event) {
    const selectedDate = event.target.value
    var filmId = document.getElementById("filmId1").value;
    const selectedDate1 = new Date(event.target.value);
    const currentDate = new Date();
    currentDate.setHours(0, 0, 0, 0);  // Reset time to midnight for comparison

    if (selectedDate1 < currentDate) {
        alert("Không chọn ngày trong quá khứ");
        return;
    }

    console.log('Ngày được chọn:', selectedDate);

    var buildingId = buildingIdSelected;
    // Ví dụ: Gọi API với ngày được chọn
    var buildingId = buildingIdSelected
    console.log(buildingId)
    // Call your API here using AJAX
    var responseData = await fetch("http://localhost:5000/api/Room/getShowtime/" + buildingId + "/" + selectedDate + "/" + filmId, {
        method: 'GET'
    })
        .then((response) => response.json())
        //.then((data) => console.log(data[0]))
        .catch((err) => console.log(err))

    loadDataToShowTime(responseData)
}


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DERM Detect</title>
    <link rel="stylesheet" href="css/main.css?21">
    <link rel="stylesheet" href="css/popup.css?6">
    <link rel="stylesheet" href="css/input.css?2">

    <script src="js/functions.js?1"></script>
    <script src="js/index.js?13" defer></script>
    <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsJcP3lhpz8_BASV-vQ7MQdCg_Ywlas5I&callback=console.debug&libraries=maps,marker&v=beta"></script>
</head>
<body>
    
    <div class="outer-container">

        <?php include 'components/startpage.php' ?>

        <div class="header">
            <h1 class="derm-detect-title">Derm Detect</h1>
            <div class="links">
                <a class="derm-button" href="#instructions">Instructions</a>
                <a class="derm-button" href="#skinInfo">Lesion Info</a>
                <a class="derm-button" href="#education">Educational Content</a>
                <a class="derm-button" href="#disclaimer">Disclaimer</a>
                <a class="derm-button" href="#map">Hospitals</a>
            </div>
        </div>

        <?php include 'components/instructions.php' ?>
        <?php include 'components/educational-content.php' ?>
        <?php include 'components/skin-info.php' ?>
        <?php include 'components/results.php' ?>
        <?php include 'components/map.php' ?>
        <?php include 'components/disclaimer.php' ?>

    </div>

    <?php include 'components/results-overlay.php' ?>
    <?php include 'components/upload-overlay.php' ?>

    <div class="side-menu">

        <div class="side-header">
            <h1>Hospitals Near You</h1>
            <div class="close-button" onclick="closeSidePane()">
                <img src="close.png" alt="">
            </div>
        </div>

        <div>

            <a class="hospital-container" target="_blank" href="https://www.google.com/maps?q=Near+East+University+Hospital,+Yakın+Doğu+Üniversitesi+Hastanesi&hl=en-US&gl=us&entry=gps&lucs=,47071704,47069508,47084304&g_ep=CAISDDYuOTYuMS4zMDU4MBgAIKzfASobLDQ3MDcxNzA0LDQ3MDY5NTA4LDQ3MDg0MzA0QgJUUg%3D%3D&g_st=ia">
                <div class="details">
                    <h3>Near East Univeristy Hospital</h3>
                    <div class="address">Yakın Doğu Üniversitesi Hastanesi</div>
                    <div class="phone-number">+90 392 444 0535</div>
                </div>
                <div class="link-icon">
                    <img src="go-to.png" alt="">
                </div>
            </a>

            <a class="hospital-container" target="_blank" href="https://www.google.com/maps/place/Lefko%C5%9Fa+Genel+Hastanesi/data=!4m7!3m6!1s0x14de19a48ffbb495:0x41ef4c33b8d6a6a8!8m2!3d35.1275781!4d33.3766184!16s%2Fg%2F1hxrq7ntq!19sChIJlbT7j6QZ3hQRqKbWuDNM70E?authuser=0&hl=tr&rclk=1">
                <div class="details">
                    <h3>Lefkoşa Genel Hastanesi</h3>
                    <div class="address">Devlet Hastanesi, Lemesou</div>
                    <div class="phone-number">+90 22 603 000</div>
                </div>
                <div class="link-icon">
                    <img src="go-to.png" alt="">
                </div>
            </a>

            <a class="hospital-container" target="_blank" href="https://www.google.com/maps/place/Cyprus+Life+Hastanesi/data=!4m7!3m6!1s0x14de1129b42e6929:0x9954b47c1d81401b!8m2!3d35.2097077!4d33.3406359!16s%2Fg%2F1tfj5q3p!19sChIJKWkutCkR3hQRG0CBHXy0VJk?authuser=0&hl=tr&rclk=1">
                <div class="details">
                    <h3>Cyprus Life Hastanesi</h3>
                    <div class="address">Hastane Ragıp Kenan Sk8, Lefkoşa 99010</div>
                    <div class="phone-number">+90 392 225 5570</div>
                </div>
                <div class="link-icon">
                    <img src="go-to.png" alt="">
                </div>
            </a>

            <a class="hospital-container" target="_blank" href="https://www.google.com/maps?q=Kolan+British+Hospital,+Old+Kyrenia+Road,+Atatürk+Cd+No:13,+Gönyeli+99150&ftid=0x14de105aaaaaaaab:0x3d1d7ce379e20829&hl=en-US&gl=us&entry=gps&lucs=,47071704,47069508,47084304&g_ep=CAISDDYuOTYuMS4zMDU4MBgAIKzfASobLDQ3MDcxNzA0LDQ3MDY5NTA4LDQ3MDg0MzA0QgJUUg%3D%3D&g_st=ia">
                <div class="details">
                    <h3>Kolan British Hospital</h3>
                    <div class="address">Old Kyrenia Road, Atatürk Cd No.13, Gönyeli 99150</div>
                    <div class="phone-number">+90 392 680 8080</div>
                </div>
                <div class="link-icon">
                    <img src="go-to.png" alt="">
                </div>
            </a>
        </div>
    </div>
    
</body>
</html>
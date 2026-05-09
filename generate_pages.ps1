$cssAppend = @"

/* Premium Animations & Layouts */
.parallax-bg {
    background-attachment: fixed !important;
    background-position: center !important;
    background-size: cover !important;
    position: relative;
    padding-top: 200px;
    padding-bottom: 120px;
}
.parallax-bg::before {
    content: '';
    position: absolute;
    inset: 0;
    background: linear-gradient(to bottom, rgba(7,18,29,0.8), var(--bg-deep));
}
.z-1 { z-index: 1; position: relative; }

.hover-tilt { transition: transform 0.5s cubic-bezier(0.4, 0, 0.2, 1) !important; }
.hover-tilt:hover { transform: translateY(-12px) rotate(1deg) scale(1.02) !important; }

.text-stroke {
    -webkit-text-stroke: 1px var(--glass-border);
    color: transparent;
}
[data-theme="light"] .text-stroke {
    -webkit-text-stroke: 1px rgba(15,23,42,0.3);
}

.scrolling-wrapper {
    display: flex;
    flex-wrap: nowrap;
    overflow-x: auto;
    padding-bottom: 1rem;
    -webkit-overflow-scrolling: touch;
}
.scrolling-card {
    flex: 0 0 auto;
    min-width: 350px;
    margin-right: 1.5rem;
}
.scrolling-wrapper::-webkit-scrollbar {
    height: 8px;
}
.scrolling-wrapper::-webkit-scrollbar-thumb {
    background: var(--accent);
    border-radius: 10px;
}
"@

$cssPath = "assets/css/style.css"
if ((Get-Content $cssPath -Raw) -notmatch "Premium Animations & Layouts") {
    Add-Content -Path $cssPath -Value $cssAppend
}

$index = Get-Content "index.html" -Raw

$headerRegex = '(?s)(<!DOCTYPE html>.*?<!-- Offcanvas Menu for Mobile -->.*?</div>\s*</div>)'
$index -match $headerRegex | Out-Null
$header = $matches[1]

$footerRegex = '(?s)(<footer.*)'
$index -match $footerRegex | Out-Null
$footer = $matches[1]

function Build-Page ($file, $title, $heroImg, $titleText, $subtitle, $content) {
    $activeNav = $header -replace 'class="nav-link active"', 'class="nav-link"'
    $activeNav = $activeNav -replace "href=`"$file`"", "class=`"nav-link active`" href=`"$file`""
    $activeNav = $activeNav -replace "<title>.*?</title>", "<title>$title | BlueWake Adventures</title>"
    
    $hero = @"
    <section class="parallax-bg text-center" style="background-image: url('$heroImg');">
        <div class="container-custom z-1 reveal">
            <h1 class="display-1 fw-bold text-white mb-4">$titleText</h1>
            <p class="lead text-white-50 mb-5 mx-auto col-lg-6">$subtitle</p>
        </div>
    </section>
"@

    $fullHtml = $activeNav + "`r`n`r`n" + $hero + "`r`n" + $content + "`r`n`r`n" + $footer
    Set-Content $file $fullHtml
}

# --- HOME 2 ---
$contentHome2 = @"
    <!-- Section 1 -->
    <section class="py-5">
        <div class="container-custom py-5">
            <div class="row align-items-center g-5">
                <div class="col-lg-6 reveal">
                    <h2 class="display-3 mb-4">Master The <span class="text-accent">Currents.</span></h2>
                    <p class="text-muted lead">Alternative home portal. A more streamlined, aggressive approach to ocean navigation.</p>
                </div>
                <div class="col-lg-6 reveal">
                    <img src="https://images.unsplash.com/photo-1544239649-403926830c2c?q=80&w=800" class="img-fluid rounded-5 shadow-2-strong hover-tilt" alt="Currents">
                </div>
            </div>
        </div>
    </section>
    
    <!-- Section 2 -->
    <section class="py-5 bg-card">
        <div class="container-custom py-5 text-center reveal">
            <h2 class="text-stroke display-1 mb-5">PREMIUM FLEET</h2>
            <div class="row g-4">
                <div class="col-md-4 hover-tilt">
                    <div class="glass-panel p-5 h-100">
                        <i class="bi bi-compass text-accent fs-1"></i>
                        <h4 class="mt-4">Pro Navigation</h4>
                        <p class="text-muted small mt-3">High-end peddle systems for zero-wake movement.</p>
                    </div>
                </div>
                <div class="col-md-4 hover-tilt">
                    <div class="glass-panel p-5 h-100 border-accent" style="transform:scale(1.05);">
                        <i class="bi bi-water text-accent fs-1"></i>
                        <h4 class="mt-4">Stablized Hull</h4>
                        <p class="text-muted small mt-3">Stand and cast with absolute confidence.</p>
                    </div>
                </div>
                <div class="col-md-4 hover-tilt">
                    <div class="glass-panel p-5 h-100">
                        <i class="bi bi-lightning text-accent fs-1"></i>
                        <h4 class="mt-4">Carbon Tech</h4>
                        <p class="text-muted small mt-3">Rods and rigs designed for saltwater chaos.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Section 3 -->
    <section class="py-5">
        <div class="container-custom py-5 text-center reveal">
            <div class="row g-4">
                <div class="col-6 col-md-3">
                    <h2 class="display-3 fw-bold text-accent">10+</h2>
                    <p class="text-muted">Years Experience</p>
                </div>
                <div class="col-6 col-md-3">
                    <h2 class="display-3 fw-bold text-accent">500+</h2>
                    <p class="text-muted">Trips Completed</p>
                </div>
                <div class="col-6 col-md-3">
                    <h2 class="display-3 fw-bold text-accent">15</h2>
                    <p class="text-muted">Secret Spots</p>
                </div>
                <div class="col-6 col-md-3">
                    <h2 class="display-3 fw-bold text-accent"></h2>
                    <p class="text-muted">Adrenaline</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Section 4 -->
    <section class="py-5 mb-5 text-center">
        <div class="glass-panel mx-auto p-5 hover-tilt reveal" style="max-width: 800px;">
            <h2>The Ocean simplified.</h2>
            <a href="book-now.html" class="btn-marine px-5 py-3 mt-4">Secure Your Spot</a>
        </div>
    </section>
"@
Build-Page "home-2.html" "Home Alternative" "https://images.unsplash.com/photo-1544526226-d4568090ffb8?q=80&w=1600" "The Edge of <br><span class='text-accent'>Nowhere.</span>" "Discover the alternative way to experience the marine wild. Stealth, luxury, and pure adrenaline." $contentHome2

# --- BOOK NOW ---
$contentBookNow = @"
    <!-- Section 1 -->
    <section class="py-5" style="margin-top: -80px; position:relative; z-index:2;">
        <div class="container-custom reveal">
            <div class="glass-panel p-5 mx-auto hover-tilt border-accent" style="max-width: 900px;">
                <h3 class="mb-4">Reservation Inquiry</h3>
                <form class="row g-4">
                    <div class="col-md-6">
                        <label class="form-label small text-muted">FIRST NAME</label>
                        <input type="text" class="form-control bg-transparent border-secondary p-3">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label small text-muted">LAST NAME</label>
                        <input type="text" class="form-control bg-transparent border-secondary p-3">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label small text-muted">DATE</label>
                        <input type="date" class="form-control bg-transparent border-secondary text-muted p-3">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label small text-muted">EXPEDITION</label>
                        <select class="form-control bg-transparent border-secondary text-muted p-3">
                            <option value="solo" class="text-dark">Solo Quest</option>
                            <option value="duo" class="text-dark">Duo Adventure</option>
                            <option value="vip" class="text-dark">VIP Elite</option>
                        </select>
                    </div>
                    <div class="col-12 text-center mt-5">
                        <button type="button" class="btn-marine px-5 py-3 w-100">CONFIRM INQUIRY</button>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <!-- Section 2 -->
    <section class="py-5 mt-4">
        <div class="container-custom reveal">
            <h2 class="mb-5 text-center">Booking <span class="text-accent">Protocol.</span></h2>
            <div class="row g-4 text-center">
                <div class="col-md-4">
                    <div class="glass-panel p-4 h-100 hover-tilt">
                        <h1 class="text-stroke display-1">01</h1>
                        <h5>Request Dates</h5>
                        <p class="text-muted small">Submit your ideal window.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="glass-panel p-4 h-100 border-accent hover-tilt">
                        <h1 class="text-stroke display-1 text-accent">02</h1>
                        <h5>Consultation</h5>
                        <p class="text-muted small">We coordinate tide constraints.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="glass-panel p-4 h-100 hover-tilt">
                        <h1 class="text-stroke display-1">03</h1>
                        <h5>Launch</h5>
                        <p class="text-muted small">Meet at the docks before sunrise.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Section 3 -->
    <section class="py-5 bg-card mt-5">
        <div class="container-custom py-5 reveal hover-tilt">
            <div class="row align-items-center">
                <div class="col-lg-7">
                    <h2 class="mb-4">Weather & <span class="text-accent">Cancellation</span></h2>
                    <p class="text-muted">The ocean dictates our schedule. If conditions are unsafe (high winds, lightning, extreme tides), trips are fully refunded or rescheduled. No questions asked. Safety and success go hand-in-hand.</p>
                </div>
                <div class="col-lg-5 text-center">
                    <i class="bi bi-cloud-lightning-rain display-1 text-accent opacity-50"></i>
                </div>
            </div>
        </div>
    </section>

    <!-- Section 4 -->
    <section class="py-5 mb-5">
        <div class="container-custom text-center reveal">
            <p class="lead text-muted">Questions about gear capabilities or accessibility?</p>
            <a href="contact.html" class="btn btn-outline-light rounded-pill px-4 mt-3">Visit our FAQ / Contact</a>
        </div>
    </section>
"@
Build-Page "book-now.html" "Book Now" "https://images.unsplash.com/photo-1510006851064-e6056cd0e3a8?q=80&w=1600" "Secure Your <span class='text-accent'>Spot.</span>" "Elite availability is strictly limited. Submit your expedition inquiry below." $contentBookNow

# --- SERVICES ---
$contentServices = @"
    <!-- Section 1 -->
    <section class="py-5 mb-5">
        <div class="container-custom py-5">
            <div class="row align-items-center g-5 reveal">
                <div class="col-lg-6">
                    <div class="glass-panel p-5 hover-tilt border-accent">
                        <h4 class="text-accent mb-3">01 / BACKWATER SNOOK</h4>
                        <h2>The Mangrove Maze</h2>
                        <p class="text-muted mt-3">8-hour intense precision casting deep in the mangrove root systems. Requires high skill and absolute silence.</p>
                        <ul class="list-unstyled mt-4">
                            <li><i class="bi bi-check text-accent me-2"></i> Intermediate to Expert</li>
                            <li><i class="bi bi-check text-accent me-2"></i> Artificial Lure Only</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6">
                    <img src="https://images.unsplash.com/photo-1544526226-d4568090ffb8?q=80&w=800" class="img-fluid rounded-5 shadow-lg hover-tilt" alt="Mangrove">
                </div>
            </div>
        </div>
    </section>

    <!-- Section 2 -->
    <section class="py-5 bg-card">
        <div class="container-custom py-5">
            <div class="row align-items-center g-5 flex-row-reverse reveal">
                <div class="col-lg-6">
                    <div class="glass-panel p-5 hover-tilt">
                        <h4 class="text-accent mb-3">02 / TARPON RUN</h4>
                        <h2>The Silver King</h2>
                        <p class="text-muted mt-3">Intercept the migration. Heavy tackle kayak fishing where you become the bobber.</p>
                        <ul class="list-unstyled mt-4">
                            <li><i class="bi bi-check text-accent me-2"></i> Seasonal Only (May-July)</li>
                            <li><i class="bi bi-check text-accent me-2"></i> Live Bait Rigging</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6">
                    <img src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=800" class="img-fluid rounded-5 shadow-lg hover-tilt" alt="Ocean">
                </div>
            </div>
        </div>
    </section>

    <!-- Section 3 -->
    <section class="py-5 mt-5">
        <div class="container-custom reveal">
            <h2 class="text-center mb-5">Base <span class="text-accent">Hardware.</span></h2>
            <div class="scrolling-wrapper">
                <div class="scrolling-card glass-panel p-4 text-center hover-tilt border-accent">
                    <i class="bi bi-droplet text-accent fs-1"></i>
                    <h5 class="mt-3">Hobie Pro Angler 14</h5>
                </div>
                <div class="scrolling-card glass-panel p-4 text-center hover-tilt">
                    <i class="bi bi-vinyl text-accent fs-1"></i>
                    <h5 class="mt-3">Shimano Stradic Reels</h5>
                </div>
                <div class="scrolling-card glass-panel p-4 text-center hover-tilt">
                    <i class="bi bi-bullseye text-accent fs-1"></i>
                    <h5 class="mt-3">St. Croix Carbon Rods</h5>
                </div>
                <div class="scrolling-card glass-panel p-4 text-center hover-tilt">
                    <i class="bi bi-hdd-network text-accent fs-1"></i>
                    <h5 class="mt-3">Garmin Fishfinders</h5>
                </div>
            </div>
        </div>
    </section>

    <!-- Section 4 -->
    <section class="py-5 text-center mt-5 mb-5 reveal glass-panel mx-auto p-5 hover-tilt" style="max-width:900px;">
        <h3 class="mb-4">"Hands down the most intense topwater strike I've ever recorded."</h3>
        <p class="text-muted">- Captain Jack, Coastal Weekly</p>
    </section>
"@
Build-Page "services.html" "Services" "https://images.unsplash.com/photo-1493630656093-4e3ad03c7349?q=80&w=1600" "Premium <span class='text-accent'>Charters.</span>" "Designed for the obsessed. We provide everything but the luck." $contentServices

# --- GALLERY ---
$contentGallery = @"
    <!-- Section 1 -->
    <section class="py-5">
        <div class="container-custom py-5 reveal">
            <div class="row g-4">
                <div class="col-lg-4 col-sm-6 hover-tilt">
                    <div class="glass-panel p-2 h-100">
                        <img src="https://images.unsplash.com/photo-1544239649-403926830c2c?q=80&w=600" class="img-fluid rounded-4 w-100" style="object-fit:cover; height:400px;">
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6 hover-tilt" style="transform:translateY(30px);">
                    <div class="glass-panel p-2 h-100 border-accent">
                        <img src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=600" class="img-fluid rounded-4 w-100" style="object-fit:cover; height:300px;">
                        <h5 class="text-center mt-4 mb-3">Dawn Launch</h5>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6 hover-tilt">
                    <div class="glass-panel p-2 h-100">
                        <img src="https://images.unsplash.com/photo-1544526226-d4568090ffb8?q=80&w=600" class="img-fluid rounded-4 w-100" style="object-fit:cover; height:500px;">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Section 2 -->
    <section class="py-5 my-5 parallax-bg" style="background-image: url('https://images.unsplash.com/photo-1493630656093-4e3ad03c7349?q=80&w=1600'); padding: 200px 0;">
        <div class="container-custom z-1 text-center reveal hover-tilt">
            <h2 class="display-3 fw-bold text-white">Capture The <span class="text-accent">Apex.</span></h2>
        </div>
    </section>

    <!-- Section 3 -->
    <section class="py-5 bg-card">
        <div class="container-custom py-5 reveal">
            <h2 class="mb-5">Trophy <span class="text-accent">Room.</span></h2>
            <div class="scrolling-wrapper">
                <div class="scrolling-card hover-tilt">
                    <img src="https://images.unsplash.com/photo-1537151608828-ea2b097ce1c5?q=80&w=400" class="rounded-5 w-100 shadow-lg border border-secondary p-1">
                </div>
                <div class="scrolling-card hover-tilt">
                    <img src="https://images.unsplash.com/photo-1510006851064-e6056cd0e3a8?q=80&w=400" class="rounded-5 w-100 shadow-lg border border-secondary p-1">
                </div>
                <div class="scrolling-card hover-tilt">
                    <img src="https://images.unsplash.com/photo-1558133544-7738f615fb2f?q=80&w=400" class="rounded-5 w-100 shadow-lg border border-secondary p-1">
                </div>
                <div class="scrolling-card hover-tilt">
                    <img src="https://images.unsplash.com/photo-1544239649-403926830c2c?q=80&w=400" class="rounded-5 w-100 shadow-lg border border-secondary p-1">
                </div>
            </div>
        </div>
    </section>

    <!-- Section 4 -->
    <section class="py-5 text-center mt-5 mb-5 reveal">
        <h4 class="text-muted">Follow our daily expeditions</h4>
        <a href="#" class="btn btn-outline-light rounded-pill px-5 mt-3"><i class="bi bi-instagram me-2 text-accent"></i>@bluewake_adv</a>
    </section>
"@
Build-Page "gallery.html" "Gallery" "https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=1600" "Visual <span class='text-accent'>Evidence.</span>" "A curated portfolio of the battles won and the ones that got away." $contentGallery

# --- ABOUT ---
$contentAbout = @"
    <!-- Section 1 -->
    <section class="py-5 mt-5">
        <div class="container-custom reveal">
            <div class="row align-items-center g-5">
                <div class="col-lg-6">
                    <h1 class="display-3 mb-4">Born in the <span class="text-accent">Current.</span></h1>
                    <p class="lead text-muted mb-4">BlueWake started as a single kayak and a passion for silence. Today, we are the premier provider of luxury paddle expeditions.</p>
                </div>
                <div class="col-lg-6">
                    <div class="glass-panel p-5 hover-tilt border-accent text-center shadow-lg">
                        <i class="bi bi-droplet-half display-1 text-accent"></i>
                        <h3 class="mt-4">Our Mission</h3>
                        <p class="text-muted mt-3">To provide elite access to untouched marine environments without leaving a trace.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Section 2 -->
    <section class="py-5 bg-card mt-5">
        <div class="container-custom py-5 reveal">
            <h2 class="text-center mb-5">The <span class="text-accent">Guides.</span></h2>
            <div class="row g-4 justify-content-center">
                <div class="col-md-5 hover-tilt">
                    <div class="glass-panel d-flex align-items-center p-4 h-100">
                        <img src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=100&h=100&fit=crop" class="rounded-circle shadow-lg me-4 border border-accent p-1">
                        <div>
                            <h4>Capt. Miller</h4>
                            <p class="text-accent small mb-0">Lead Saltwater Guide</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 hover-tilt">
                    <div class="glass-panel d-flex align-items-center p-4 h-100 border-accent">
                        <img src="https://images.unsplash.com/photo-1544526226-d4568090ffb8?w=100&h=100&fit=crop" class="rounded-circle shadow-lg me-4 border border-white p-1">
                        <div>
                            <h4>Capt. Davis</h4>
                            <p class="text-accent small mb-0">Fly Fishing Specialist</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Section 3 -->
    <section class="py-5 my-5 parallax-bg" style="background-image: url('https://images.unsplash.com/photo-1493630656093-4e3ad03c7349?q=80&w=1600'); padding: 200px 0;">
        <div class="container-custom z-1 text-center reveal glass-panel mx-auto p-5 hover-tilt" style="max-width:800px;">
            <h2 class="display-4 fw-bold text-gradient mb-4">Zero Emission. Unlimited Range.</h2>
            <p class="lead text-muted mx-auto">We believe in protecting what we hunt. A portion of all proceeds goes directly to coastal mangrove restoration projects across Florida.</p>
        </div>
    </section>

    <!-- Section 4 -->
    <section class="py-5 text-center mb-5 reveal">
        <h4 class="mb-5 text-muted">AS FEATURED IN</h4>
        <div class="d-flex justify-content-center gap-5 flex-wrap opacity-50">
            <h2 class="text-stroke display-4 hover-tilt">COASTAL MAG</h2>
            <h2 class="text-stroke display-4 hover-tilt">ANGLER ELITE</h2>
            <h2 class="text-stroke display-4 hover-tilt">FL SPORTSMAN</h2>
        </div>
    </section>
"@
Build-Page "about.html" "About Us" "https://images.unsplash.com/photo-1558133544-7738f615fb2f?q=80&w=1600" "Story of the <span class='text-accent'>Wake.</span>" "We aren't just anglers. We are stewards of the shallow waters." $contentAbout

# --- CONTACT ---
$contentContact = @"
    <!-- Section 1 -->
    <section class="py-5 mt-5">
        <div class="container-custom reveal">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="glass-panel p-5 text-center hover-tilt h-100">
                        <i class="bi bi-geo-alt display-4 text-accent"></i>
                        <h4 class="mt-4">Headquarters</h4>
                        <p class="text-muted mt-3">123 Coastal Drive<br>Melbourne Beach, FL</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="glass-panel p-5 text-center hover-tilt h-100 border-accent" style="transform:scale(1.05);">
                        <i class="bi bi-telephone display-4 text-accent"></i>
                        <h4 class="mt-4">Direct Line</h4>
                        <p class="text-muted mt-3">+1 (321) 555-WAKE<br>Mon-Sun 6AM - 8PM</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="glass-panel p-5 text-center hover-tilt h-100">
                        <i class="bi bi-envelope display-4 text-accent"></i>
                        <h4 class="mt-4">Comms</h4>
                        <p class="text-muted mt-3">adventure@bluewake.com<br>Response under 24hrs</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Section 2 -->
    <section class="py-5 bg-card mt-5">
        <div class="container-custom py-5 reveal">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="glass-panel p-5 hover-tilt">
                        <h3 class="mb-4">Send a Message</h3>
                        <form class="row g-4">
                            <div class="col-md-6">
                                <label class="form-label small text-muted">NAME</label>
                                <input type="text" class="form-control bg-transparent border-secondary p-3">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small text-muted">EMAIL</label>
                                <input type="email" class="form-control bg-transparent border-secondary p-3">
                            </div>
                            <div class="col-12">
                                <label class="form-label small text-muted">MESSAGE</label>
                                <textarea class="form-control bg-transparent border-secondary p-3" rows="5"></textarea>
                            </div>
                            <div class="col-12">
                                <button type="button" class="btn-marine w-100 py-3 mt-3">Transmit Request</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Section 3 -->
    <section class="py-5 my-5 parallax-bg" style="background-image: url('https://images.unsplash.com/photo-1544526226-d4568090ffb8?q=80&w=1600'); padding: 200px 0;">
        <div class="container-custom z-1 text-center reveal hover-tilt">
            <h2 class="display-3 fw-bold text-white mb-4">Basecamp Coordinates</h2>
            <p class="lead text-white-50 mx-auto bg-dark p-4 rounded-4" style="max-width:800px; --bs-bg-opacity: .5;">Launch points vary based on tide and wind velocity. Exact encrypted launch coordinates are transmitted securely 48 hours prior to your scheduled expedition.</p>
        </div>
    </section>

    <!-- Section 4 -->
    <section class="py-5 text-center mb-5 reveal">
        <h4 class="text-muted mb-3">For Media & Corporate Charters</h4>
        <a href="#" class="btn btn-outline-light rounded-pill px-5 py-3">media@bluewake.com</a>
    </section>
"@
Build-Page "contact.html" "Contact" "https://images.unsplash.com/photo-1537151608828-ea2b097ce1c5?q=80&w=1600" "Establish <span class='text-accent'>Contact.</span>" "Have questions about gear, tides, or custom charters? We are ready." $contentContact

Write-Output "DONE"

document.addEventListener('DOMContentLoaded', () => {
    const wall = document.getElementById('circle-wall');
    if (!wall) return;

    const { Engine, World, Bodies, Body } = Matter;

    const wallW = wall.clientWidth;
    const wallH = wall.clientHeight;

    const engine = Engine.create({ gravity: { x: 0, y: 0 } });
    const world = engine.world;

    // --- DESIGN PHILOSOPHY (from asymmetry articles): ---
    // "Varied sizes create visual weight" — different radii are INTENTIONAL
    // "Color as focal point" — orange circles are SCATTERED among decorative ones
    // "Motion should be slow" — hover expansion is gentle and deliberate

    // All circles defined in ONE array, INTERLEAVED (nav mixed with decorative)
    // This prevents nav circles from clustering together
    const circleDefinitions = [
        { radius: 48, isNav: true, label: 'Asymm\nJDK', href: 'https://jdk.asymm.systems' },
        { radius: 32, isNav: false },
        { radius: 44, isNav: true, label: 'Dial\nEngine', href: 'https://dial-lang.dev' },
        { radius: 26, isNav: false },
        { radius: 52, isNav: false },
        { radius: 38, isNav: true, label: 'Research', href: '/research/bss-survey-2026.html' },
        { radius: 22, isNav: false },
        { radius: 34, isNav: true, label: 'News', href: '/news.html' },
        { radius: 40, isNav: false },
        { radius: 30, isNav: true, label: 'About', href: '/about.html' },
        { radius: 46, isNav: false },
        { radius: 20, isNav: false },
    ];

    const allCircles = [];
    const centerX = wallW * 0.5;
    const centerY = wallH * 0.45;

    // Place circles in a spiral pattern from center outward — guarantees interleaving
    circleDefinitions.forEach((def, i) => {
        const angle = i * 0.85 + 0.5; // Golden-ish angle spread
        const ringDist = 15 + i * 12;  // Spiral outward gradually
        const x = centerX + Math.cos(angle) * ringDist;
        const y = centerY + Math.sin(angle) * ringDist;

        const body = Bodies.circle(x, y, def.radius, {
            restitution: 0.2,
            friction: 0.1,
            frictionAir: 0.25,
            label: 'circle-' + i
        });
        World.add(world, body);

        let el;
        if (def.isNav) {
            el = document.createElement('a');
            el.href = def.href;
            if (def.href.startsWith('http')) { el.target = '_blank'; el.rel = 'noopener'; }
            el.className = 'physics-circle nav-circle';
            el.innerHTML = '<span class="circle-label">' + def.label.replace('\n', '<br>') + '</span>';
        } else {
            el = document.createElement('div');
            el.className = 'physics-circle';
        }

        el.style.width = def.radius * 2 + 'px';
        el.style.height = def.radius * 2 + 'px';
        wall.appendChild(el);

        allCircles.push({
            body, el,
            baseRadius: def.radius,
            currentRadius: def.radius,
            isNav: def.isNav,
            isHovered: false
        });
    });

    // Boundary walls
    const thickness = 60;
    const bWalls = [
        Bodies.rectangle(wallW / 2, -thickness / 2, wallW, thickness, { isStatic: true }),
        Bodies.rectangle(wallW / 2, wallH + thickness / 2, wallW, thickness, { isStatic: true }),
        Bodies.rectangle(-thickness / 2, wallH / 2, thickness, wallH, { isStatic: true }),
        Bodies.rectangle(wallW + thickness / 2, wallH / 2, thickness, wallH, { isStatic: true }),
    ];
    World.add(world, bWalls);

    // --- HOVER: use JS mousemove on the wall container instead of per-element mouseenter ---
    // This completely eliminates edge-flicker because we calculate distance from cursor to body center
    let hoveredCircle = null;

    wall.style.pointerEvents = 'auto';

    wall.addEventListener('mousemove', (e) => {
        const rect = wall.getBoundingClientRect();
        const mx = e.clientX - rect.left;
        const my = e.clientY - rect.top;

        let closest = null;
        let closestDist = Infinity;

        // Find the closest NAV circle to the cursor
        allCircles.forEach(c => {
            if (!c.isNav) return;
            const dx = mx - c.body.position.x;
            const dy = my - c.body.position.y;
            const dist = Math.sqrt(dx * dx + dy * dy);
            // Only consider if cursor is within the circle's radius (with some padding)
            if (dist < c.currentRadius + 5 && dist < closestDist) {
                closestDist = dist;
                closest = c;
            }
        });

        if (closest !== hoveredCircle) {
            // Un-hover previous
            if (hoveredCircle && hoveredCircle.isHovered) {
                const scale = hoveredCircle.baseRadius / hoveredCircle.currentRadius;
                Body.scale(hoveredCircle.body, scale, scale);
                hoveredCircle.currentRadius = hoveredCircle.baseRadius;
                hoveredCircle.el.style.width = hoveredCircle.baseRadius * 2 + 'px';
                hoveredCircle.el.style.height = hoveredCircle.baseRadius * 2 + 'px';
                hoveredCircle.el.classList.remove('is-expanded');
                hoveredCircle.isHovered = false;
            }

            // Hover new
            if (closest) {
                const scaleFactor = 1.35;
                const newRadius = closest.baseRadius * scaleFactor;
                const bodyScale = newRadius / closest.currentRadius;
                Body.scale(closest.body, bodyScale, bodyScale);
                closest.currentRadius = newRadius;
                closest.el.style.width = newRadius * 2 + 'px';
                closest.el.style.height = newRadius * 2 + 'px';
                closest.el.classList.add('is-expanded');
                closest.isHovered = true;
            }

            hoveredCircle = closest;
        }
    });

    wall.addEventListener('mouseleave', () => {
        if (hoveredCircle && hoveredCircle.isHovered) {
            const scale = hoveredCircle.baseRadius / hoveredCircle.currentRadius;
            Body.scale(hoveredCircle.body, scale, scale);
            hoveredCircle.currentRadius = hoveredCircle.baseRadius;
            hoveredCircle.el.style.width = hoveredCircle.baseRadius * 2 + 'px';
            hoveredCircle.el.style.height = hoveredCircle.baseRadius * 2 + 'px';
            hoveredCircle.el.classList.remove('is-expanded');
            hoveredCircle.isHovered = false;
            hoveredCircle = null;
        }
    });

    // Allow clicking through to the link
    wall.addEventListener('click', (e) => {
        const rect = wall.getBoundingClientRect();
        const mx = e.clientX - rect.left;
        const my = e.clientY - rect.top;

        allCircles.forEach(c => {
            if (!c.isNav) return;
            const dx = mx - c.body.position.x;
            const dy = my - c.body.position.y;
            const dist = Math.sqrt(dx * dx + dy * dy);
            if (dist < c.currentRadius) {
                window.open(c.el.href, c.el.target || '_self');
            }
        });
    });

    // --- RENDER LOOP with gentle cluster attraction ---
    function render() {
        // Gentle spring pull toward cluster center
        allCircles.forEach(c => {
            const dx = centerX - c.body.position.x;
            const dy = centerY - c.body.position.y;
            const dist = Math.sqrt(dx * dx + dy * dy) || 1;

            // Only apply force if meaningfully far from center
            if (dist > 5) {
                const strength = 0.000012 * dist;
                Body.applyForce(c.body, c.body.position, {
                    x: (dx / dist) * strength,
                    y: (dy / dist) * strength
                });
            }

            // Freeze bodies that are barely moving (prevents micro-jitter)
            const vx = c.body.velocity.x;
            const vy = c.body.velocity.y;
            const speed = Math.sqrt(vx * vx + vy * vy);
            if (speed < 0.15 && !c.isHovered) {
                Body.setVelocity(c.body, { x: 0, y: 0 });
            }
        });

        Engine.update(engine, 1000 / 60);

        // Sync DOM to physics — round to whole pixels
        allCircles.forEach(c => {
            const r = c.currentRadius;
            c.el.style.left = Math.round(c.body.position.x - r) + 'px';
            c.el.style.top = Math.round(c.body.position.y - r) + 'px';
        });

        requestAnimationFrame(render);
    }

    render();
});

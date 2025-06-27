#!/bin/bash

# Create placeholder files for documentation
echo "Generating placeholder files for documentation..."

# Ensure the output directory exists
mkdir -p assets/docs

# Function to create a placeholder file with description
create_placeholder() {
    local filename=$1
    local text=$2
    local width=$3
    local height=$4
    
    echo "Creating $filename ($width x $height)..."
    echo "PLACEHOLDER IMAGE: $text ($width x $height)" > "assets/docs/$filename"
    # Create a minimal PNG file (1x1 pixel) to avoid LaTeX errors
    echo -ne "\x89\x50\x4E\x47\x0D\x0A\x1A\x0A\x00\x00\x00\x0D\x49\x48\x44\x52\x00\x00\x00\x01\x00\x00\x00\x01\x08\x06\x00\x00\x00\x1F\x15\xC4\x89\x00\x00\x00\x0A\x49\x44\x41\x54\x78\x9C\x63\x00\x01\x00\x00\x05\x00\x01\x0D\x0A\x2D\xB4\x00\x00\x00\x00\x49\x45\x4E\x44\xAE\x42\x60\x82" > "assets/docs/$filename"
}

# Create university logo placeholder if it doesn't exist
if [ ! -f "assets/docs/university_logo.png" ]; then
    create_placeholder "university_logo.png" "University Logo" 400 400
fi

# Create architecture diagram
create_placeholder "SayNote_architecture.png" "SayNote Architecture Diagram" 1200 800

# Create design tool placeholders
create_placeholder "figma_design_system.png" "SayNote Design System in Figma" 1200 800
create_placeholder "illustrator_assets.png" "SayNote Visual Assets in Adobe Illustrator" 1200 800
create_placeholder "supabase_dashboard.png" "Supabase Dashboard for SayNote" 1200 800

# Create technology logos
create_placeholder "logo_react.png" "React Logo" 200 200
create_placeholder "logo_nextjs.png" "Next.js Logo" 200 200
create_placeholder "logo_tailwindcss.png" "TailwindCSS Logo" 200 200
create_placeholder "logo_blocknote.png" "BlockNote Logo" 200 200
create_placeholder "logo_supabase.png" "Supabase Logo" 200 200
create_placeholder "logo_reactnative.png" "React Native Logo" 200 200
create_placeholder "logo_expo.png" "Expo Logo" 200 200
create_placeholder "logo_gemini.png" "Gemini API Logo" 200 200
create_placeholder "logo_figma.png" "Figma Logo" 200 200
create_placeholder "logo_illustrator.png" "Adobe Illustrator Logo" 200 200
create_placeholder "logo_vscode.png" "Visual Studio Code Logo" 200 200
create_placeholder "logo_github.png" "GitHub Logo" 200 200
create_placeholder "logo_vercel.png" "Vercel Logo" 200 200
create_placeholder "logo_jest.png" "Jest Logo" 200 200
create_placeholder "logo_cypress.png" "Cypress Logo" 200 200

# Create additional logos from reference files
create_placeholder "logo_photoshop.png" "Adobe Photoshop Logo" 200 200
create_placeholder "logo_aftereffects.png" "Adobe After Effects Logo" 200 200
create_placeholder "logo_digitalocean.png" "Digital Ocean Logo" 200 200
create_placeholder "logo_nginx.png" "Nginx Logo" 200 200
create_placeholder "logo_typescript.png" "TypeScript Logo" 200 200
create_placeholder "logo_zod.png" "Zod Logo" 200 200
create_placeholder "logo_prisma.png" "Prisma Logo" 200 200

# Create placeholders for web interface screenshots
create_placeholder "technologies-frontend.png" "Frontend Technologies (React, Next.js, TailwindCSS, BlockNote)" 800 400
create_placeholder "web-landing-page.png" "SayNote Landing Page" 1200 800
create_placeholder "web-login-page.png" "SayNote Login Page" 800 600
create_placeholder "web-signup-page.png" "SayNote Signup Page" 800 600
create_placeholder "web-dashboard.png" "SayNote Dashboard" 1200 800
create_placeholder "web-editor.png" "SayNote Note Editor" 1200 800
create_placeholder "web-voice-commands.png" "SayNote Voice Command Panel" 1000 600
create_placeholder "web-settings.png" "SayNote Settings Page" 1000 600
create_placeholder "web-search.png" "SayNote Search Function" 1000 600

# Create placeholders for mobile interface screenshots
create_placeholder "technologies-mobile.png" "Mobile Technologies (Expo, React Native)" 800 400
create_placeholder "mobile-welcome.png" "SayNote Mobile Welcome Screen" 400 800
create_placeholder "mobile-login.png" "SayNote Mobile Login Screen" 400 800
create_placeholder "mobile-signup.png" "SayNote Mobile Signup Screen" 400 800
create_placeholder "mobile-home.png" "SayNote Mobile Home Screen" 400 800
create_placeholder "mobile-editor.png" "SayNote Mobile Editor" 400 800
create_placeholder "mobile-voice-input.png" "SayNote Mobile Voice Input" 400 800
create_placeholder "mobile-search.png" "SayNote Mobile Search" 400 800
create_placeholder "mobile-profile.png" "SayNote Mobile Profile" 400 800
create_placeholder "mobile-appointments.png" "SayNote Mobile Appointments" 400 800

# Create placeholders for diagrams
create_placeholder "gemini-api-diagram.png" "Gemini API Integration Diagram" 1000 600
create_placeholder "voice-commands-flow.png" "Voice Commands Processing Flow" 1000 600

echo "Placeholder files generation complete!" 
-- ============================================================
-- FINTH BRAND OS — KEYNOTE AUTOMATION SCRIPT
-- Creates a branded Keynote presentation from structured content
-- Called by CoWork when generating a presentation
--
-- Usage: Pass slide data as a JSON-like structure
-- The script opens brand-template.key and populates slides
-- using the master layouts defined in keynote-masters.md
-- ============================================================

-- CONFIGURATION — Update these paths and layout names
-- after confirming your Keynote master layout names

property templatePath : (POSIX path of (path to home folder)) & "Library/Mobile Documents/com~apple~CloudDocs/CoWork_Projects/FINTH/02_Design_System/brand-template.key"

-- ⚠️ UPDATE THESE with your actual master layout names from keynote-masters.md
property layoutTitle : "Title Slide"
property layoutSection : "Section Header"
property layoutContent : "Content"
property layoutContentImage : "Content + Image"
property layoutFullImage : "Full Image"
property layoutData : "Data"
property layoutQuote : "Quote"
property layoutClosing : "Closing"

-- ============================================================
-- MAIN HANDLER
-- Called with a list of slide records
-- Each record: {layout:string, title:string, body:string}
-- ============================================================

on createPresentation(slideList, outputPath)
	
	-- Open the brand template
	set templateFile to POSIX file templatePath
	
	tell application "Keynote"
		open templateFile
		set theDoc to front document
		
		-- Delete all existing slides except the first
		-- (Keynote requires at least one slide)
		set slideCount to count of slides of theDoc
		if slideCount > 1 then
			repeat with i from slideCount to 2 by -1
				delete slide i of theDoc
			end repeat
		end if
		
		-- Build slides from the list
		set isFirst to true
		repeat with slideData in slideList
			
			set theLayout to layout of slideData
			set theTitle to title of slideData
			set theBody to body of slideData
			
			if isFirst then
				-- Use the existing first slide
				set theSlide to slide 1 of theDoc
				set isFirst to false
			else
				-- Add a new slide
				set theSlide to (make new slide at end of theDoc)
			end if
			
			-- Apply master layout
			tell theSlide
				try
					set base layout to master slide theLayout of theDoc
				on error
					-- Layout not found — use default
					log "Layout not found: " & theLayout & " — using default"
				end try
				
				-- Set title if text placeholder exists
				try
					set object text of text item 1 to theTitle
				end try
				
				-- Set body if second text placeholder exists
				try
					if theBody is not "" then
						set object text of text item 2 to theBody
					end if
				end try
			end tell
			
		end repeat
		
		-- Save to output path
		export theDoc as Keynote format to POSIX file outputPath
		
		close theDoc saving no
		
	end tell
	
	return "Presentation created: " & outputPath
	
end createPresentation

-- ============================================================
-- EXAMPLE CALL (for testing)
-- Uncomment and run directly in Script Editor to test
-- ============================================================

(*
set testSlides to {
	{layout:"Title Slide", title:"JÄÄDE Water — Thailand Market Entry", body:"FINTH Presentation — April 2026"},
	{layout:"Section Header", title:"Market Opportunity", body:""},
	{layout:"Content", title:"Why Thailand, why now", body:"Thailand's premium bottled water market is growing at 25.44% CAGR. Import volumes surged 22.82% from 2023 to 2024. The Nordic quality signal is underexploited in this market."},
	{layout:"Closing", title:"Next steps", body:""}
}

set outputPath to (POSIX path of (path to desktop)) & "JÄÄDE-Presentation-Test.key"

createPresentation(testSlides, outputPath)
*)

-- ============================================================
-- finth_keynote_builder.scpt
-- AppleScript for CoWork → Keynote automation
-- Builds a FINTH-branded Keynote presentation from structured content
-- ============================================================
-- USAGE: Called by CoWork. Pass slide content as a delimited string.
-- TEMPLATE: Always uses brand-template.key from 02_Design_System/
-- ============================================================

-- Configuration
set brandOSPath to (path to home folder as string) & "Library:Mobile Documents:com~apple~CloudDocs:CoWork_Projects:FINTH:"
set templatePath to brandOSPath & "02_Design_System:brand-template.key"
set outputPath to brandOSPath & "05_Output_Archive:"

-- Open the brand template
tell application "Keynote"
  -- Open template
  set templateFile to POSIX file (POSIX path of templatePath)
  
  -- Check template exists
  try
    open templateFile
  on error
    display dialog "Brand template not found. Please ensure brand-template.key exists in 02_Design_System/" buttons {"OK"} default button "OK"
    return
  end try
  
  -- Get the active document (the template we just opened)
  set theDoc to front document
  
  -- --------------------------------------------------------
  -- ADD YOUR SLIDE CONTENT BELOW
  -- Replace the placeholder content with CoWork-generated content
  -- --------------------------------------------------------
  
  -- Example: Set title on slide 1
  -- tell slide 1 of theDoc
  --   tell text item 1
  --     set object text to "Your Presentation Title"
  --   end tell
  -- end tell
  
  -- Save the output
  set outputFileName to (current date) as string
  -- Clean filename
  set outputFilePath to outputPath & "presentation.key"
  
  save theDoc in POSIX file (POSIX path of (outputPath as alias)) with replacing
  
  display dialog "Presentation saved to 05_Output_Archive/" buttons {"OK"} default button "OK"
end tell

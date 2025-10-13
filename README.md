==== SCOPE ====

This repository aims to provide a workflow by which a Linux host can download Garmin G1000 updates to an SD card.
Because the Garmin updater utility is Windows/Mac only, virtualization is used.

==== HOW TO USE: ====

./download_updater.sh

./mksdcard.sh

vagrant up

./viewer.sh

==== ADDITIONAL NOTES =====
TERMINOLOGY:

Garmin refers to the left screen as the MFD, and right screen as the PFD.

Garmin refers to the top card as the "Naviation Database Update" card, and the bottom card as the "Supplemental" card. 

Source: https://static.garmin.com/pumac/190-03103-00_b.pdf

The Navigation Database Update cards contain:
-- Navigation Database Update**
-- Checklists
-- Flight Data Logging***


The Supplemental cards contain:
-- Basemap
-- Obstacle
-- Terrain
-- Charts*
-- SafeTaxi
-- Airport Directory

*Garmin claims (source: https://support.garmin.com/en-US/?faq=VUCWYNO2y933It6oYEy0R7) that this item can be omitted for the PFD.
**The G1000 WILL update its navigation database from either card. However, Garmin discourages this practice as it may cause "mismatch errors" (https://support.garmin.com/en-US/?faq=HN8hNfmiYd7cMxrga5TEd5).
*** MFD only. Source: https://static.garmin.com/pumac/190-00498-08_0A_Web.pdf

NOTES:

The Supplemental cards are accessed in-flight and must remain inserted. The Navigation Database Update card data is copied over to internal G1000 memory during an update.
They need not remain inserted after completion of the update. It can remain inserted to allow for other use.

Garmin sells TSO cards for the "Supplemental Data Card". Garmin claims that "TSO cards are necessary [...] where navigation data cards must remain in the device during flight."
Example: https://sarasotaavionics.com/avionics/garmin-8gb-datacard-blank
I am not aware of any guidance as to the extent that this is legally binding, or merely a recommendation.

Garmin asserts that flight data logging consumes about 1MB per flight hour. 

PARTS: 

Top Card (2GB):   
PART: 3247-SE02TLNFX-1D000-3-ND
MFG : DELKIN DEVICES, INC. / SE02TLNFX-1D000-3

Bottom Card (4GB):
PART:: 1282-AF4GSD3A-WAAXX-ND
MFG : ATP ELECTRONICS, INC. / AF4GSD3A-WAAXX

Both are available from Digikey. Other types of cards may work -- in my case, they did not. Various information exists online about the maximum size of supported cards.

UPDATING:

The official Garmin updater utility is Windows only. I was unable to get it running through Wine. OS-level emulation through qemu/KVM works fine. 
This uses vagrant with libvirt to spin up a Windows VM with the G1000 tools installed. This avoids any need to interact with the Windows OS. 



curl -o garmin.exe https://static.garmincdn.com/apps/fly/files/desktop/win/electron/channels/2024/garminAvnDbManagerSetup_25.4.8.exe
vagrant up
#vagrant --debug upload updater.exe
#ssh -i /home/ak/.vagrant.d/insecure_private_key -p 22 vagrant@192.168.122.85 "C:\Users\vagrant\Documents\garminAvnDbManagerSetup_25.4.8.exe /S"

virt-viewer --attach


 

https://support.garmin.com/en-US/?faq=HN8hNfmiYd7cMxrga5TEd5


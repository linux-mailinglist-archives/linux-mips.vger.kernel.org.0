Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB462FFA59
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 03:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbhAVCXV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Jan 2021 21:23:21 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:46372 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbhAVCXT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 Jan 2021 21:23:19 -0500
X-Greylist: delayed 449 seconds by postgrey-1.27 at vger.kernel.org; Thu, 21 Jan 2021 21:23:18 EST
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 2EBB39200B4; Fri, 22 Jan 2021 03:15:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 2B4529200B3;
        Fri, 22 Jan 2021 03:15:07 +0100 (CET)
Date:   Fri, 22 Jan 2021 03:15:07 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     linux-kernel@vger.kernel.org
cc:     linux-mips@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Update my e-mail address throughout
Message-ID: <alpine.DEB.2.21.2101220142550.35623@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I find linux-mips.org too unreliable to rely on, so move to a place
I have proper control over.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi,

 My address is now <macro@orcam.me.uk>.  Please apply.

  Maciej
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEgfGIKCQicRu6B1jhJOnOXtp7XhMFAmAKKWIACgkQJOnOXtp7
XhMOuQ/+IaTFVmbQ5/NIn9z6qosTxclne8x1q6aUhnvA6yZYd/e06bFF5UWL3wRf
V9pPpYTGynJtzeZ9G7DjfRumuMsewA0f6tTGpR75MhM8jjga/5lhWIpETK7mfyBC
k3LOFdV7gAHqY3OtDKcmGDlRd8mcQYv2DdM+FLArK1tY+Fg2QJc/BGv4t9Jq9Gnl
rC+bAsvMftc+WVgMoMdsZ2yImJZWX2bVnUDgNi2+sWvqnv5jN43MtlqLnmFBq66Y
vwWZ1B3mxXTnS8GTd6v3VwHge+qRQCS0cGIqFHBK/VDHizVCJ9lqjva30Y2N+L4H
YyZUyxWJFDB4RoMcln8W7fN8wBrJolRRfUCYCMR80DuxvRg8Lf3DEVtmi54kV0kl
A/csM/MOBv2H3I4vbynmbDFTumrmDTjRphhf3lDOCJSFIAZ+QxyEUK9T2l90U3H/
DvwYOLZ+i5hsoeoxbtlzhtimFdFlSTG0+uYTYnorR/A3wnOUiTeDS5UpNAvGpXBa
x6u1z0NtVeyBh7A5qkt0545p0MIFYEdEwVsAg6iIILPS8CFcaK/r2djqTwrc3aKP
O3kynqdgyY5DW/3E14YZBWcUpzJHgkW1zOycEbT54rwmrsbfmDRvWNxqIK5VCEKR
dtpL1wEvwZftAtNfTfWEnmd/JJeYKnGUToscyfG+4fQWFH2L1fg=
=ak03
-----END PGP SIGNATURE-----
---
 .mailmap    |  1 +
 MAINTAINERS | 12 ++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/.mailmap b/.mailmap
index b1ab0129c7d6..96147588676f 100644
--- a/.mailmap
+++ b/.mailmap
@@ -202,6 +202,7 @@ Li Yang <leoyang.li@nxp.com> <leoli@freescale.com>
 Li Yang <leoyang.li@nxp.com> <leo@zh-kernel.org>
 Lukasz Luba <lukasz.luba@arm.com> <l.luba@partner.samsung.com>
 Maciej W. Rozycki <macro@mips.com> <macro@imgtec.com>
+Maciej W. Rozycki <macro@orcam.me.uk> <macro@linux-mips.org>
 Marcin Nowakowski <marcin.nowakowski@mips.com> <marcin.nowakowski@imgtec.com>
 Marc Zyngier <maz@kernel.org> <marc.zyngier@arm.com>
 Mark Brown <broonie@sirena.org.uk>
diff --git a/MAINTAINERS b/MAINTAINERS
index f79ec98bbb29..ab6f5ba1f0ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4936,7 +4936,7 @@ F:	Documentation/networking/decnet.rst
 F:	net/decnet/
 
 DECSTATION PLATFORM SUPPORT
-M:	"Maciej W. Rozycki" <macro@linux-mips.org>
+M:	"Maciej W. Rozycki" <macro@orcam.me.uk>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
 W:	http://www.linux-mips.org/wiki/DECstation
@@ -4945,12 +4945,12 @@ F:	arch/mips/include/asm/dec/
 F:	arch/mips/include/asm/mach-dec/
 
 DEFXX FDDI NETWORK DRIVER
-M:	"Maciej W. Rozycki" <macro@linux-mips.org>
+M:	"Maciej W. Rozycki" <macro@orcam.me.uk>
 S:	Maintained
 F:	drivers/net/fddi/defxx.*
 
 DEFZA FDDI NETWORK DRIVER
-M:	"Maciej W. Rozycki" <macro@linux-mips.org>
+M:	"Maciej W. Rozycki" <macro@orcam.me.uk>
 S:	Maintained
 F:	drivers/net/fddi/defza.*
 
@@ -6221,7 +6221,7 @@ F:	include/linux/dim.h
 F:	lib/dim/
 
 DZ DECSTATION DZ11 SERIAL DRIVER
-M:	"Maciej W. Rozycki" <macro@linux-mips.org>
+M:	"Maciej W. Rozycki" <macro@orcam.me.uk>
 S:	Maintained
 F:	drivers/tty/serial/dz.*
 
@@ -18107,7 +18107,7 @@ F:	Documentation/networking/tuntap.rst
 F:	arch/um/os-Linux/drivers/
 
 TURBOCHANNEL SUBSYSTEM
-M:	"Maciej W. Rozycki" <macro@linux-mips.org>
+M:	"Maciej W. Rozycki" <macro@orcam.me.uk>
 M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
@@ -19740,7 +19740,7 @@ F:	Documentation/admin-guide/blockdev/zram.rst
 F:	drivers/block/zram/
 
 ZS DECSTATION Z85C30 SERIAL DRIVER
-M:	"Maciej W. Rozycki" <macro@linux-mips.org>
+M:	"Maciej W. Rozycki" <macro@orcam.me.uk>
 S:	Maintained
 F:	drivers/tty/serial/zs.*
 
-- 
2.11.0

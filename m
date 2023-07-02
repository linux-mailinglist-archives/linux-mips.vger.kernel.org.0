Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE5F744BEA
	for <lists+linux-mips@lfdr.de>; Sun,  2 Jul 2023 02:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjGBASD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Jul 2023 20:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjGBASC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Jul 2023 20:18:02 -0400
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8F0B2
        for <linux-mips@vger.kernel.org>; Sat,  1 Jul 2023 17:18:00 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id FkmrqsnIYPm6CFkmtqpD12; Sun, 02 Jul 2023 02:17:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1688257079; bh=3KkCu185G3ZQm3DEAyBLDCiqHHgacxJIMSCHKu0iSJk=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=KQ+G7nlrx/bM40xiPhWPmDy81TBkiQB6RzN2fLXaFXx2Fyl4Ug0IXlnEXkaop9XLY
         CJu90gFrjWoMqdmCFNEYQ6N50YXtdIZo8ZM1HeNrOwEWm2v4wj3a0rvWmY6kJ7MoMY
         m9xbiO9IzCGFjYlLL7XTi50Z1UlHrH/F4GHYfQhpc/QzFNM9a0f11TaD6zLCbDU6Ca
         44DnekckCXEG87kihNj6CppHYN2x6GfAtV+nCSVhZyHS68ewIhwk6NZA3snqtNqZsE
         qcSBUAhnzjESXx2qJYPs9NVgNq7U8n/VFWFzH0Va/z0H5/9HagXbCl24ydttLoHUfs
         ArbO/nI0ElkSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1688257079; bh=3KkCu185G3ZQm3DEAyBLDCiqHHgacxJIMSCHKu0iSJk=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=KQ+G7nlrx/bM40xiPhWPmDy81TBkiQB6RzN2fLXaFXx2Fyl4Ug0IXlnEXkaop9XLY
         CJu90gFrjWoMqdmCFNEYQ6N50YXtdIZo8ZM1HeNrOwEWm2v4wj3a0rvWmY6kJ7MoMY
         m9xbiO9IzCGFjYlLL7XTi50Z1UlHrH/F4GHYfQhpc/QzFNM9a0f11TaD6zLCbDU6Ca
         44DnekckCXEG87kihNj6CppHYN2x6GfAtV+nCSVhZyHS68ewIhwk6NZA3snqtNqZsE
         qcSBUAhnzjESXx2qJYPs9NVgNq7U8n/VFWFzH0Va/z0H5/9HagXbCl24ydttLoHUfs
         ArbO/nI0ElkSg==
Date:   Sun, 2 Jul 2023 02:17:57 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v2 3/3] usb: dwc3: Add SPDX header and copyright
Message-ID: <ZKDCNeS+Pi3h08Pc@lenoch>
References: <ZKDBiY6TKdDKIFK+@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKDBiY6TKdDKIFK+@lenoch>
X-CMAE-Envelope: MS4wfIAna0uwwLijKGj4cA4Wl0P6kku77D86pxk63eiH+HfiVpIzSWlMkhxZO8tAZvCMarPCyd5l7qEtzKozXrR5puYaQSNU6K8wb/YMGS8sVVF85oDJrqOF
 19bIOhYDnRo6RWfgZvAGzho0AKqqAlkPWmx5Xup65l5yQeKpCDESHY5cC7xkwm90yKXOax1lPImwnp7Pnpt47/oa6AC22RoG5EoVsF/BaZk4HsR9sHnmM5LR
 5ClHvMtCOgYyFKKvESrNucGT2UqAyMfY5+e7nFiJ/KDEWExig3JUfSU8w3movX+W95U03+trMMboIECqm0Q4xpmafPMKeNrwOpbEVv77pPs9Y2td4h35LNEu
 yUv5tY0p
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

As driver is rewritten and David no longer works for Marvell (Cavium),
I'm to blame for breakage.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 CHANGES:
 -v2: None

 drivers/usb/dwc3/dwc3-octeon.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 668f6d3490b1..01c43b2c0ac9 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -1,11 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * XHCI HCD glue for Cavium Octeon III SOCs.
+ * DWC3 glue for Cavium Octeon III SOCs.
  *
  * Copyright (C) 2010-2017 Cavium Networks
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
+ * Copyright (C) 2023 Ladislav Michl <ladis@linux-mips.org>
  */
 
 #include <linux/bitfield.h>
@@ -548,6 +546,6 @@ static struct platform_driver dwc3_octeon_driver = {
 module_platform_driver(dwc3_octeon_driver);
 
 MODULE_ALIAS("platform:dwc3-octeon");
-MODULE_AUTHOR("David Daney <david.daney@cavium.com>");
+MODULE_AUTHOR("Ladislav Michl <ladis@linux-mips.org>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("DesignWare USB3 OCTEON III Glue Layer");
-- 
2.39.2


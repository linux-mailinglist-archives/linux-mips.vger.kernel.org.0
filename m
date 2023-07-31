Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDA87691DA
	for <lists+linux-mips@lfdr.de>; Mon, 31 Jul 2023 11:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbjGaJd5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 05:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjGaJd5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 05:33:57 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E792211A
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 02:33:55 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id QPHlq0muLv5uIQPHmqCucJ; Mon, 31 Jul 2023 11:33:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690796034; bh=p8BAX+z5tyX+vrhH+vr3OPQKUiBENZsKmQLHx64s87M=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=fN2Q0CYaxde7NSd/hEnjOppkcnVAt4qRVFjyg1DVS7qIGHgp59qrsc7lwswg2wdTc
         pmELR/mwWpaYpqVsoCG+huvUeXl6y3teHhyCz1jnFyuX3DySOfK82LGlHQ+FbDZM/X
         dprtagk4hwQ6Y2epkaIAV+lonZRyZ5SAxbSEVNbFhNLTuSxIhiDqw0A1we7x+c8/OY
         yUQv96f114dQ5Iz/7EnrwPzZTMRm9h4E9woWvPaJEyhxlti5IK/GGrGSfR3LdUEQYO
         7c2kzBdb5DSEXBzEV07UPuUGvfcJ/0AhMJlXewZxb+6p82ffFAPIspKjTVHNxCYHtt
         Knl5gkUOdMW3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690796034; bh=p8BAX+z5tyX+vrhH+vr3OPQKUiBENZsKmQLHx64s87M=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=fN2Q0CYaxde7NSd/hEnjOppkcnVAt4qRVFjyg1DVS7qIGHgp59qrsc7lwswg2wdTc
         pmELR/mwWpaYpqVsoCG+huvUeXl6y3teHhyCz1jnFyuX3DySOfK82LGlHQ+FbDZM/X
         dprtagk4hwQ6Y2epkaIAV+lonZRyZ5SAxbSEVNbFhNLTuSxIhiDqw0A1we7x+c8/OY
         yUQv96f114dQ5Iz/7EnrwPzZTMRm9h4E9woWvPaJEyhxlti5IK/GGrGSfR3LdUEQYO
         7c2kzBdb5DSEXBzEV07UPuUGvfcJ/0AhMJlXewZxb+6p82ffFAPIspKjTVHNxCYHtt
         Knl5gkUOdMW3w==
Date:   Mon, 31 Jul 2023 11:33:53 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v5 7/7] usb: dwc3: dwc3-octeon: Add SPDX header and copyright
Message-ID: <ZMeAAYx6Z3hlQBNQ@lenoch>
References: <ZMd/HzISn0mPsNWt@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZMd/HzISn0mPsNWt@lenoch>
X-CMAE-Envelope: MS4wfCN0FotF9j3o28CTfKr2i3BdJ+umd/S1pdcLejQsmY33tmwbYTfg1ADDfiA1w73jWZmK5ioXlT3ixhxwixfvKSl7TvarauCM5gXW/Vus86EpmfQmImtT
 HSBfBU/z00n8Q9A4+eKufZQSU/CrHr03tr/plnm/OX77M+qPSwSBa5NK4f58BeX1/AGyNqut29kvqRMYlTMZw2xdVrOZ7gfwY4g96m8ejK3oCXr4k/wXmIjX
 lY2AsJEDxykncJXtbcErAcxAE5x325r/2s1uscLz/UGIE5GUKogYJq7mIEg+WpJFDHP8XuHl9nqtYgw2Jyh7vEFpwSgaBr6N+CiFasqqiX5rDFHaOnTEw2nV
 aBimIDki
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

Assign copyright to indicate driver rewrite is done for RACOM s.r.o.
As David no longer works for Marvell (Cavium), I'm to blame for breakage.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 CHANGES:
 - v2: None
 - v3: None
 - v4: Assign copyring to RACOM s.r.o., Mírová 1283, Nové Mìsto na Moravì
 - v5: None

 drivers/usb/dwc3/dwc3-octeon.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index d578110f7afb..6f47262a117a 100644
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
+ * Copyright (C) 2023 RACOM s.r.o.
  */
 
 #include <linux/bitfield.h>
@@ -537,6 +535,6 @@ static struct platform_driver dwc3_octeon_driver = {
 module_platform_driver(dwc3_octeon_driver);
 
 MODULE_ALIAS("platform:dwc3-octeon");
-MODULE_AUTHOR("David Daney <david.daney@cavium.com>");
+MODULE_AUTHOR("Ladislav Michl <ladis@linux-mips.org>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("DesignWare USB3 OCTEON III Glue Layer");
-- 
2.39.2


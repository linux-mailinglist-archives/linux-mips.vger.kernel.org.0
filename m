Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0858E754F01
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jul 2023 16:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjGPOST (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Jul 2023 10:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjGPOSS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Jul 2023 10:18:18 -0400
Received: from h2.cmg2.smtp.forpsi.com (h2.cmg2.smtp.forpsi.com [81.2.195.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755C1BA
        for <linux-mips@vger.kernel.org>; Sun, 16 Jul 2023 07:18:17 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id L2ZiqGIwyv5uIL2Zjqf7bX; Sun, 16 Jul 2023 16:18:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689517095; bh=qdO2VOuc14sUkO6Zp+yxVTT9prZLp83cSci1HnsSQuo=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=hpq6GmZtwJOTTnmJf+qnRmJmoYZH4/poKRX0SetUv03iuWpcUH3g1C1stphXjGJF2
         5FqiS10SE3/xwo7D5wKeRt7imNMkvsF1qqP0uwCyEQckCR0jlYVpxO10s+trcpmhX5
         366KL4lbPsvex7n6yTKiOxFNHfm4CYcS5pC4QZ/hbk2qEb6Tf42u+BuBQ/SSsn6JKo
         YV6MpfmodXeFyD4ZEi/ey63Jd0ORBdvxQXfCXsB0c05+M23yKmFmsjxtT7TpD+mbuD
         95B3/J3tJ3XSGb8OIxg5kWtQzX3/OU3OlBfoQlPFSK3WhpuSf6LJIYBVf5OPYnZa8h
         O/8dZtcPnF1HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689517095; bh=qdO2VOuc14sUkO6Zp+yxVTT9prZLp83cSci1HnsSQuo=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=hpq6GmZtwJOTTnmJf+qnRmJmoYZH4/poKRX0SetUv03iuWpcUH3g1C1stphXjGJF2
         5FqiS10SE3/xwo7D5wKeRt7imNMkvsF1qqP0uwCyEQckCR0jlYVpxO10s+trcpmhX5
         366KL4lbPsvex7n6yTKiOxFNHfm4CYcS5pC4QZ/hbk2qEb6Tf42u+BuBQ/SSsn6JKo
         YV6MpfmodXeFyD4ZEi/ey63Jd0ORBdvxQXfCXsB0c05+M23yKmFmsjxtT7TpD+mbuD
         95B3/J3tJ3XSGb8OIxg5kWtQzX3/OU3OlBfoQlPFSK3WhpuSf6LJIYBVf5OPYnZa8h
         O/8dZtcPnF1HA==
Date:   Sun, 16 Jul 2023 16:18:14 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 6/6] usb: dwc3: dwc3-octeon: Add SPDX header and copyright
Message-ID: <ZLP8JtXnFEWQBM22@lenoch>
References: <ZLP7CSUm095ADtdw@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZLP7CSUm095ADtdw@lenoch>
X-CMAE-Envelope: MS4wfKcGgF/V+a04bA69L8vLH3n4OMYWqA7A71apVZStSQL9tApjZP13X1QHh+LqmcKAIqOFuy7ik0vZrkn5C/oVejx/sDeFzLTsk7/u0vIRoFR5ieXZbCVV
 kbXY6esu3kKgvuTvDVhlNfx6g/p7qqVJq6VXdTjy4q1MxM9aBbAI4i+9tFnEabG/AtwdDDKZzpRJF7i+a5gGMRMM8zL3b1lStdQZ1n/JPB/y5irlaQ3/mIY+
 caQIPsyLACcxKQ0Vush+eW7tvDAcPvdWe2PnIMmDMAyxDestPyEMIiDAm7/bd0VemL0WQX1FcbRNavG6dP5oV4l9TF840OowIoMohAGvH0zoYVLev7vlf/kU
 BdxqPWt9
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

 drivers/usb/dwc3/dwc3-octeon.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 9116df7def86..122f062d2822 100644
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


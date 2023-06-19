Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67E04735E4A
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jun 2023 22:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjFSUQ0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jun 2023 16:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjFSUQZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jun 2023 16:16:25 -0400
Received: from h2.cmg2.smtp.forpsi.com (h2.cmg2.smtp.forpsi.com [81.2.195.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBBA5130
        for <linux-mips@vger.kernel.org>; Mon, 19 Jun 2023 13:16:24 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id BLITqArwFv5uIBLIUqiBcT; Mon, 19 Jun 2023 22:16:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205783; bh=K9MvvSB44/NAwPzUv3A6w1ipANWPhZ+J7Fw+3w/YxmQ=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=Yds0iDJ00rtqBvolFxDm5ZgtaEJAm9dg0cmkkc5d+lbDmFSvTMpq8mzbbFKErYbo2
         VHbYYi874uV/dvXjn/MhjN5X4mjOVm103PtJZlx4L1u/a0kce6BXXhNld+NLUYY0l9
         QnelYh4Q84k4d8lVdBzLMQBg2YjZb4S2Dmnb+v/bZEDDdS/UWt3jTRIuQ7tZ1XLxck
         4+xtbuz2OYq2a0XCDHjhnp1c0Eg2Pi1pvNPNeGXqNekMmQlAck2FPwjrIFPREWudr5
         1D933UCPJQPTGzOeCRakXZlmAHkb0gu+aex7gRYHe/OIOktuTi9ZGic4EaTRWj5Vls
         6jDofvnGORPAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205783; bh=K9MvvSB44/NAwPzUv3A6w1ipANWPhZ+J7Fw+3w/YxmQ=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=Yds0iDJ00rtqBvolFxDm5ZgtaEJAm9dg0cmkkc5d+lbDmFSvTMpq8mzbbFKErYbo2
         VHbYYi874uV/dvXjn/MhjN5X4mjOVm103PtJZlx4L1u/a0kce6BXXhNld+NLUYY0l9
         QnelYh4Q84k4d8lVdBzLMQBg2YjZb4S2Dmnb+v/bZEDDdS/UWt3jTRIuQ7tZ1XLxck
         4+xtbuz2OYq2a0XCDHjhnp1c0Eg2Pi1pvNPNeGXqNekMmQlAck2FPwjrIFPREWudr5
         1D933UCPJQPTGzOeCRakXZlmAHkb0gu+aex7gRYHe/OIOktuTi9ZGic4EaTRWj5Vls
         6jDofvnGORPAw==
Date:   Mon, 19 Jun 2023 22:16:21 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH 11/11] usb: dwc3: Add SPDX header and copyright
Message-ID: <ZJC3lfCKcr4QkMJh@lenoch>
References: <ZJC165p0Mj4jHcBh@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJC165p0Mj4jHcBh@lenoch>
X-CMAE-Envelope: MS4wfKT14AIUFGIofVKyXtsTGI8XNvGTl/IpaMKz8UMtyAjwgqfKS4Ll2tsH7X8iJFLOzv0LhOvUBDwDp1gt32zIWI4kOWMEmUe4oj5hUpmHj/0Gtccj7S8I
 3v/09Nve7DZFXSZ2SiijodI9L79YjHOi4p64o0XPjhQ0mDdWoPhF2LyYhfExhuRIP2owghzOEiezjCuu8GjeMbdtkj5OQp1Vh51YtPLF1scGV5N/dB98qQ/5
 5rXFfyZN+Nk+wSwFxuEQ7Q==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 drivers/usb/dwc3/dwc3-octeon.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 4ad2d8887cf0..1776bbaf28c0 100644
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
@@ -542,6 +540,6 @@ static struct platform_driver dwc3_octeon_driver = {
 module_platform_driver(dwc3_octeon_driver);
 
 MODULE_ALIAS("platform:dwc3-octeon");
-MODULE_AUTHOR("David Daney <david.daney@cavium.com>");
+MODULE_AUTHOR("Ladislav Michl <ladis@linux-mips.org>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("DesignWare USB3 OCTEON III Glue Layer");
-- 
2.39.2


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE36753359
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jul 2023 09:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235151AbjGNHmO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Jul 2023 03:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234935AbjGNHmN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Jul 2023 03:42:13 -0400
Received: from h1.cmg1.smtp.forpsi.com (h1.cmg1.smtp.forpsi.com [81.2.195.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E24C1718
        for <linux-mips@vger.kernel.org>; Fri, 14 Jul 2023 00:42:12 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id KDRFqpiTvPm6CKDRGqEenA; Fri, 14 Jul 2023 09:42:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689320530; bh=Wik1bIdPe3q7DhV5S+iyipYlX/lbjb3sCoG/zgJhiXc=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=OSN5cGydMutZVl2xz2m/+eMbNxQYeOJ+d3Fi1TV+k9SvcOH69VgCrpSMvZdhoezVw
         9NvkNtP9XOqjNVIICd3tF0ErLQMjE5CPW9s7mEsGKfGsaYhAJKYMKWGTtKLXIqJEbD
         agJzRUmFoc1p7SoVEMZiISao9ql8XPMJoXExaFW3rIxMJQTH96kT2yp9YwO9XjGNtx
         1zPBiyR6aA4yxqCExXC2DmAzv5gKgol07d3arY5hjo7UK/8zwC0l/svUnz0u+hCdVl
         xg01LWLo5v7JkrBF3s7ofoK3FvDYI3yjNYx6Ugip6CoxFI9PnbQ1pRayIDwo5GISLf
         hahY+YNvSQtFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689320530; bh=Wik1bIdPe3q7DhV5S+iyipYlX/lbjb3sCoG/zgJhiXc=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=OSN5cGydMutZVl2xz2m/+eMbNxQYeOJ+d3Fi1TV+k9SvcOH69VgCrpSMvZdhoezVw
         9NvkNtP9XOqjNVIICd3tF0ErLQMjE5CPW9s7mEsGKfGsaYhAJKYMKWGTtKLXIqJEbD
         agJzRUmFoc1p7SoVEMZiISao9ql8XPMJoXExaFW3rIxMJQTH96kT2yp9YwO9XjGNtx
         1zPBiyR6aA4yxqCExXC2DmAzv5gKgol07d3arY5hjo7UK/8zwC0l/svUnz0u+hCdVl
         xg01LWLo5v7JkrBF3s7ofoK3FvDYI3yjNYx6Ugip6CoxFI9PnbQ1pRayIDwo5GISLf
         hahY+YNvSQtFQ==
Date:   Fri, 14 Jul 2023 09:41:58 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v3 3/3] usb: dwc3: Add SPDX header and copyright
Message-ID: <ZLD8RkrgU/A9pZMf@lenoch>
References: <ZLD7RHvE4eRPoqKN@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLD7RHvE4eRPoqKN@lenoch>
X-CMAE-Envelope: MS4wfJaJnmKMgR8CG/95pdWVzQoSa1sBJQqodCbf2Q4YU/fo0kCIOw3Gw2CIiQDbZ6OSTGhVtWRlxV8K+hj3cWvmF7w5WxMKRSPNEx4Vp+aEj/AX8CuRza5/
 9Ljjwg7D2/l0q6y+AtNAINyLK0HuUQ9QMyv1QgP+LuiUmhjEsJkOWd3C0KLyIti6Apul1sbXeoYhIP50aVvSd6msHImt7c/aWL07S8vd1PYCfxeecCQcoxDq
 hrIPA2UZKdFJ+AqOby00BBmMwpjJI4U4C/iY43sCoPf92TisC6bo/TJsUd+QlYFj0PYdVhsCthrBEkIHWR0pYD+0/dH5bfJVYghkjct9/+MDb7TS/R8W2sHJ
 vjBtrY/8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
 - v2: None
 - v3: None

 drivers/usb/dwc3/dwc3-octeon.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index dd47498f4efb..a68d568b11a9 100644
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
@@ -536,6 +534,6 @@ static struct platform_driver dwc3_octeon_driver = {
 module_platform_driver(dwc3_octeon_driver);
 
 MODULE_ALIAS("platform:dwc3-octeon");
-MODULE_AUTHOR("David Daney <david.daney@cavium.com>");
+MODULE_AUTHOR("Ladislav Michl <ladis@linux-mips.org>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("DesignWare USB3 OCTEON III Glue Layer");
-- 
2.39.2


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E78D18C2B9
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2020 23:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgCSWFq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Mar 2020 18:05:46 -0400
Received: from gateway34.websitewelcome.com ([192.185.149.72]:44669 "EHLO
        gateway34.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727228AbgCSWFp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Mar 2020 18:05:45 -0400
X-Greylist: delayed 1259 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Mar 2020 18:05:45 EDT
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway34.websitewelcome.com (Postfix) with ESMTP id 6AB7B353B27
        for <linux-mips@vger.kernel.org>; Thu, 19 Mar 2020 16:44:40 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id F2y0jCJl3EfyqF2y0jCMcU; Thu, 19 Mar 2020 16:44:40 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rvKTM03PKBD4rMVOBpgFlCJei7WPad311c1nI9gxtyQ=; b=Xo6BChLNWQ1YhB5ODRYOrSi5ST
        tgWrySx5tFEofNzelqxIoUdj5ENY8HcQdav1AL3OCx0FFy57Ht9votQfVSjmgSaFXCm7nYvIltpVc
        TeEmQOkzYa8hTWm7sQensxTIE4rzNCRBVAPecAWOZKcocA0TdQglN/Rffh7GJfZNHyO4P5hMaJM03
        Y8yy7pUAlpw+TZmXO1mApT67iYYqujpoHXAmMNdw/3Q3VPSVqchEUM9/MhfraUmtPHpJ3Ud4+Ip7C
        myLUJWuZ6crCr/ITni3HTkJ1pK1OXTgm8BBo4RTmq5okGkCXKevRMBQ1FLu7bPx3zZkqRq60coQj+
        a7Vsu9lg==;
Received: from cablelink-189-218-116-241.hosts.intercable.net ([189.218.116.241]:53384 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1jF2xy-001kPP-Qa; Thu, 19 Mar 2020 16:44:38 -0500
Date:   Thu, 19 Mar 2020 16:44:38 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] irqchip: irq-bcm7038-l1: Replace zero-length array
 with flexible-array member
Message-ID: <20200319214438.GA21123@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.218.116.241
X-Source-L: No
X-Exim-ID: 1jF2xy-001kPP-Qa
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-189-218-116-241.hosts.intercable.net (embeddedor) [189.218.116.241]:53384
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 56
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/irqchip/irq-bcm7038-l1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index cbf01afcd2a6..eb9bce93cd05 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -50,7 +50,7 @@ struct bcm7038_l1_chip {
 
 struct bcm7038_l1_cpu {
 	void __iomem		*map_base;
-	u32			mask_cache[0];
+	u32			mask_cache[];
 };
 
 /*
-- 
2.23.0


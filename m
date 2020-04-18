Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503871AEA95
	for <lists+linux-mips@lfdr.de>; Sat, 18 Apr 2020 09:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgDRHwe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 18 Apr 2020 03:52:34 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2407 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725892AbgDRHwe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 18 Apr 2020 03:52:34 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 4B2E5256B0E51BA05C59;
        Sat, 18 Apr 2020 15:52:32 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Sat, 18 Apr 2020
 15:52:21 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <tsbogend@alpha.franken.de>, <afzal.mohd.ma@gmail.com>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH] MIPS: Netlogic: remove unneeded semicolon in fmn_message_handler()
Date:   Sat, 18 Apr 2020 16:18:34 +0800
Message-ID: <20200418081834.41152-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix the following coccicheck warning:

arch/mips/netlogic/xlr/fmn.c:106:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 arch/mips/netlogic/xlr/fmn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/netlogic/xlr/fmn.c b/arch/mips/netlogic/xlr/fmn.c
index d7db1533889a..f90303f31967 100644
--- a/arch/mips/netlogic/xlr/fmn.c
+++ b/arch/mips/netlogic/xlr/fmn.c
@@ -103,7 +103,7 @@ static irqreturn_t fmn_message_handler(int irq, void *data)
 				mflags = nlm_cop2_enable_irqsave();
 			}
 		}
-	};
+	}
 	/* Enable message ring intr, to any thread in core */
 	nlm_fmn_setup_intr(irq, (1 << nlm_threads_per_core) - 1);
 	nlm_cop2_disable_irqrestore(mflags);
-- 
2.21.1


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C69E1C71F0
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 15:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgEFNnx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 09:43:53 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:59270 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728794AbgEFNnw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 6 May 2020 09:43:52 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id A131CA0DF2C0F0C7F7E7;
        Wed,  6 May 2020 21:43:50 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 21:43:45 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <tsbogend@alpha.franken.de>, <tglx@linutronix.de>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] MIPS: CFE: Remove dead code in cfe_getfwinfo()
Date:   Wed, 6 May 2020 21:43:07 +0800
Message-ID: <20200506134307.32722-1-yanaijie@huawei.com>
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

This code has been marked dead since the beginning of the git history.
Seems no need to keep it now.

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 arch/mips/fw/cfe/cfe_api.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/mips/fw/cfe/cfe_api.c b/arch/mips/fw/cfe/cfe_api.c
index c020b29f561c..0c9c97ab291e 100644
--- a/arch/mips/fw/cfe/cfe_api.c
+++ b/arch/mips/fw/cfe/cfe_api.c
@@ -243,11 +243,6 @@ int cfe_getfwinfo(cfe_fwinfo_t * info)
 	info->fwi_bootarea_pa = xiocb.plist.xiocb_fwinfo.fwi_bootarea_pa;
 	info->fwi_bootarea_size =
 	    xiocb.plist.xiocb_fwinfo.fwi_bootarea_size;
-#if 0
-	info->fwi_reserved1 = xiocb.plist.xiocb_fwinfo.fwi_reserved1;
-	info->fwi_reserved2 = xiocb.plist.xiocb_fwinfo.fwi_reserved2;
-	info->fwi_reserved3 = xiocb.plist.xiocb_fwinfo.fwi_reserved3;
-#endif
 
 	return 0;
 }
-- 
2.21.1


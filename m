Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433891C71F2
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 15:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgEFNoF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 09:44:05 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:48494 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726218AbgEFNoF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 6 May 2020 09:44:05 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 060CB89C0AE97CCD2E89;
        Wed,  6 May 2020 21:44:03 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 21:43:53 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <tsbogend@alpha.franken.de>, <yanaijie@huawei.com>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] MIPS: Octeon: Remove dead code in __cvmx_helper_npi_probe()
Date:   Wed, 6 May 2020 21:43:15 +0800
Message-ID: <20200506134315.32810-1-yanaijie@huawei.com>
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

This code has been marked dead for more than 10 years. Seems no need to
keep it now.

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 arch/mips/cavium-octeon/executive/cvmx-helper-npi.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper-npi.c b/arch/mips/cavium-octeon/executive/cvmx-helper-npi.c
index cc94cfa545b4..cb210d2ef0c4 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper-npi.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper-npi.c
@@ -59,18 +59,6 @@ int __cvmx_helper_npi_probe(int interface)
 		 && !OCTEON_IS_MODEL(OCTEON_CN52XX_PASS1_X))
 		/* The packet engines didn't exist before pass 2 */
 		return 4;
-#if 0
-	/*
-	 * Technically CN30XX, CN31XX, and CN50XX contain packet
-	 * engines, but nobody ever uses them. Since this is the case,
-	 * we disable them here.
-	 */
-	else if (OCTEON_IS_MODEL(OCTEON_CN31XX)
-		 || OCTEON_IS_MODEL(OCTEON_CN50XX))
-		return 2;
-	else if (OCTEON_IS_MODEL(OCTEON_CN30XX))
-		return 1;
-#endif
 #endif
 	return 0;
 }
-- 
2.21.1


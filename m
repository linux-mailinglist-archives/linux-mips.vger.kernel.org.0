Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 745F01C71EE
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 15:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728770AbgEFNnu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 09:43:50 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:59162 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728248AbgEFNnr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 6 May 2020 09:43:47 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id D9F70D5D8D679C911836;
        Wed,  6 May 2020 21:43:42 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 21:43:37 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <tsbogend@alpha.franken.de>, <tglx@linutronix.de>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] MIPS: Lasat: Remove dead code in lasat.h
Date:   Wed, 6 May 2020 21:42:58 +0800
Message-ID: <20200506134258.32634-1-yanaijie@huawei.com>
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
 arch/mips/include/asm/lasat/lasat.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/mips/include/asm/lasat/lasat.h b/arch/mips/include/asm/lasat/lasat.h
index 483be606960d..7659818f6553 100644
--- a/arch/mips/include/asm/lasat/lasat.h
+++ b/arch/mips/include/asm/lasat/lasat.h
@@ -121,11 +121,6 @@ struct lasat_eeprom_struct_pre7 {
 #define LASAT_BMID_SAFEPIPE5000		5
 #define LASAT_BMID_SAFEPIPE7000		6
 #define LASAT_BMID_SAFEPIPE1000		7
-#if 0
-#define LASAT_BMID_SAFEPIPE30		7
-#define LASAT_BMID_SAFEPIPE5100		8
-#define LASAT_BMID_SAFEPIPE7100		9
-#endif
 #define LASAT_BMID_UNKNOWN		0xf
 #define LASAT_MAX_BMID_NAMES		9   /* no larger than 15! */
 
-- 
2.21.1


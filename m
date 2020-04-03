Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70F7119D44D
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2020 11:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390704AbgDCJtZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Apr 2020 05:49:25 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:12613 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727882AbgDCJtZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 3 Apr 2020 05:49:25 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id EDB786EDEE7FA0446243;
        Fri,  3 Apr 2020 17:49:12 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Fri, 3 Apr 2020
 17:49:05 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <tsbogend@alpha.franken.de>, <yuehaibing@huawei.com>
CC:     <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <ralf@linux-mips.org>
Subject: [PATCH v2] MIPS: TXx9: Fix Kconfig warnings
Date:   Fri, 3 Apr 2020 17:49:04 +0800
Message-ID: <20200403094904.37072-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20200403094228.12304-1-yuehaibing@huawei.com>
References: <20200403094228.12304-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.223.234]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If TTY and SND is not n, we got this warnings:

WARNING: unmet direct dependencies detected for HAS_TXX9_SERIAL
  Depends on [n]: TTY [=n] && HAS_IOMEM [=y]
  Selected by [y]:
  - SOC_TX3927 [=y]

WARNING: unmet direct dependencies detected for HAS_TXX9_SERIAL
  Depends on [n]: TTY [=n] && HAS_IOMEM [=y]
  Selected by [y]:
  - SOC_TX4938 [=y]

Only dependencies is enabled, they can be enabled, so
use 'imply' instead of 'select' to fix this.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: fix patch title
---
 arch/mips/txx9/Kconfig | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/mips/txx9/Kconfig b/arch/mips/txx9/Kconfig
index 9a22a182b7a4..85c4c121c71f 100644
--- a/arch/mips/txx9/Kconfig
+++ b/arch/mips/txx9/Kconfig
@@ -58,7 +58,7 @@ config TOSHIBA_RBTX4939
 config SOC_TX3927
 	bool
 	select CEVT_TXX9
-	select HAS_TXX9_SERIAL
+	imply HAS_TXX9_SERIAL
 	select HAVE_PCI
 	select IRQ_TXX9
 	select GPIO_TXX9
@@ -66,30 +66,30 @@ config SOC_TX3927
 config SOC_TX4927
 	bool
 	select CEVT_TXX9
-	select HAS_TXX9_SERIAL
+	imply HAS_TXX9_SERIAL
 	select HAVE_PCI
 	select IRQ_TXX9
 	select PCI_TX4927
 	select GPIO_TXX9
-	select HAS_TXX9_ACLC
+	imply HAS_TXX9_ACLC
 
 config SOC_TX4938
 	bool
 	select CEVT_TXX9
-	select HAS_TXX9_SERIAL
+	imply HAS_TXX9_SERIAL
 	select HAVE_PCI
 	select IRQ_TXX9
 	select PCI_TX4927
 	select GPIO_TXX9
-	select HAS_TXX9_ACLC
+	imply HAS_TXX9_ACLC
 
 config SOC_TX4939
 	bool
 	select CEVT_TXX9
-	select HAS_TXX9_SERIAL
+	imply HAS_TXX9_SERIAL
 	select HAVE_PCI
 	select PCI_TX4927
-	select HAS_TXX9_ACLC
+	imply HAS_TXX9_ACLC
 
 config TXX9_7SEGLED
 	bool
-- 
2.17.1



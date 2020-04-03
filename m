Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEFF119D42D
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2020 11:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbgDCJnF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Apr 2020 05:43:05 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:51062 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727792AbgDCJnF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 3 Apr 2020 05:43:05 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id C0777C3174682B76FCA6;
        Fri,  3 Apr 2020 17:42:59 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 3 Apr 2020
 17:42:52 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <tsbogend@alpha.franken.de>, <yuehaibing@huawei.com>
CC:     <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <ralf@linux-mips.org>
Subject: [PATCH] MIPS: TXx9::x Fix Kconfig warnings:
Date:   Fri, 3 Apr 2020 17:42:28 +0800
Message-ID: <20200403094228.12304-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
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



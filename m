Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65FF21324E
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jul 2020 05:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgGCDrd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Jul 2020 23:47:33 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:40130 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726119AbgGCDrc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 2 Jul 2020 23:47:32 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 1D72AB6B2675B41DFFB0;
        Fri,  3 Jul 2020 11:47:30 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Fri, 3 Jul 2020 11:47:23 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Hulk Robot <hulkci@huawei.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-mips@vger.kernel.org>
Subject: [PATCH -next] MIPS: Loongson64: Make acpi_registers_setup() static
Date:   Fri, 3 Jul 2020 11:57:36 +0800
Message-ID: <20200703035736.6803-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

sparse report build warning as follows:

drivers/platform/mips/rs780e-acpi.c:72:6: warning:
 symbol 'acpi_registers_setup' was not declared. Should it be static?

And function acpi_registers_setup() is not used outside of this file,
so marks it static.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/platform/mips/rs780e-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mips/rs780e-acpi.c b/drivers/platform/mips/rs780e-acpi.c
index e5a643b78ac9..bb0e8ae0eefd 100644
--- a/drivers/platform/mips/rs780e-acpi.c
+++ b/drivers/platform/mips/rs780e-acpi.c
@@ -69,7 +69,7 @@ static void acpi_hw_clear_status(void)
 	outl(inl(ACPI_GPE0_BLK), ACPI_GPE0_BLK);
 }
 
-void acpi_registers_setup(void)
+static void acpi_registers_setup(void)
 {
 	u32 value;
 


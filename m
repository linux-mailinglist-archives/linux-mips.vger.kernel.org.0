Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C6C1C71E7
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 15:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgEFNnj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 09:43:39 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3826 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726529AbgEFNnj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 6 May 2020 09:43:39 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id DDA8859BBBF4A8403685;
        Wed,  6 May 2020 21:43:37 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 21:43:28 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <tsbogend@alpha.franken.de>, <yanaijie@huawei.com>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] MIPS: Remove dead code in pci.h
Date:   Wed, 6 May 2020 21:42:50 +0800
Message-ID: <20200506134250.32550-1-yanaijie@huawei.com>
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
 arch/mips/include/asm/mach-rc32434/pci.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/include/asm/mach-rc32434/pci.h b/arch/mips/include/asm/mach-rc32434/pci.h
index 6f40d1515580..9a6eefd12757 100644
--- a/arch/mips/include/asm/mach-rc32434/pci.h
+++ b/arch/mips/include/asm/mach-rc32434/pci.h
@@ -319,9 +319,6 @@ struct pci_msu {
 #define PCIM_H_EA		0x3
 #define PCIM_H_IA_FIX		0x4
 #define PCIM_H_IA_RR		0x5
-#if 0
-#define PCI_ADDR_START		0x13000000
-#endif
 
 #define PCI_ADDR_START		0x50000000
 
-- 
2.21.1


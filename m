Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C4E1E9117
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 14:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728915AbgE3MMl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 08:12:41 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:34818 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726974AbgE3MMi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 30 May 2020 08:12:38 -0400
Received: from localhost.localdomain (unknown [142.147.94.151])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id B513F2049E;
        Sat, 30 May 2020 12:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590840758; bh=BZDmVeLAL/9NfTcfEUMMIQVENfqhtSTJnHjQ/WoS1A0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lwCw5CG2l+fMtoykWL3nwusVZZrxf1+JHiw/B4FSv+aWUrLsFCC57Clm2LCNcfmvm
         K4hVWh4JWLtHxRzbO63hss3CooF/eTgq2oQx5Re79iSB+2/DW071bt9VMhlzudCgt+
         t97VeNcRiH95V8xlQ3Z10Lm5uF+VVVFLbh7QGD6Ab5aQJvJdS7c7i725wyTheq1ucX
         I1LcT+QBdH+du3VB+xjpl2f85PO9JGF7B/JSq9ZH6ZTWbWOkGS9lUey9lyJ+9tDwuy
         I4884E9XkzYdQfzoHe25f/bvVSRCdpP2ywvGX8GsHFZifCD/aUUQto++CeDvRyQJ2z
         BKN3XP0Ag8Alw==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 1/2] irqchip: loongson-pci-msi: Fix a typo in Kconfig
Date:   Sat, 30 May 2020 20:11:12 +0800
Message-Id: <20200530121113.1797678-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200530121113.1797678-1-jiaxun.yang@flygoat.com>
References: <20200530121113.1797678-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

PCH MSI driver's tittle was wrong.
My stupid mistake.

Fixes: cca8fbff2585 ("irqchip: Add Loongson PCH MSI controller")
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 0b6b826dd843..a444f15a1f57 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -550,7 +550,7 @@ config LOONGSON_PCH_PIC
 	  Support for the Loongson PCH PIC Controller.
 
 config LOONGSON_PCH_MSI
-	bool "Loongson PCH PIC Controller"
+	bool "Loongson PCH MSI Controller"
 	depends on MACH_LOONGSON64 || COMPILE_TEST
 	depends on PCI
 	default MACH_LOONGSON64
-- 
2.27.0.rc0


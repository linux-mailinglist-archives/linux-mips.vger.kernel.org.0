Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 938741E9116
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 14:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbgE3MMl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 08:12:41 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:34832 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgE3MMl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 30 May 2020 08:12:41 -0400
Received: from localhost.localdomain (unknown [142.147.94.151])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 104382049F;
        Sat, 30 May 2020 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590840760; bh=RhxbuWVF5/BR2ngcqWUZOZr7VrX7V9c6h1vaBiVfIZM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OrxsZdnkrNOCiBM2XgWbxvVUMJmwCqQteyoPfGNIhaXFWby8ubXFwDcOt85p4FH37
         VKo7SvPM7fDGxQW8qIT0w5vT4UFTNvdBaZUHlbwv+X6euK1Da/BNSrWuo0hTXk5fXA
         YOUNbBmm8fm/my8HBa9IMLuzoinFH5sxgj5Ael6Nulb78ljeFZfDtjRwT2xL4zT8zs
         Wuk8L2ayMpExGCOJ4R/dG+a+HoqI7hmN8kxYGN+lZTiGuEoojfZMi3RxxDJklCQ7eV
         1E1WuQQXhpL8zEt77l41Czt9kr5ay2ab7W8qgqrib9Vi30uAOxdPVOU3Oiz7MClonD
         DwoIGBG/Cvn6A==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        kbuild test robot <lkp@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 2/2] irqchip: loongson-*: Fix COMPILE_TEST
Date:   Sat, 30 May 2020 20:11:13 +0800
Message-Id: <20200530121113.1797678-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200530121113.1797678-1-jiaxun.yang@flygoat.com>
References: <20200530121113.1797678-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

spurious_interrupt helper only exists on MIPS and x86,
so define a dummy function on other architectures to fix
COMPILE_TEST.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/irq-loongson-htpic.c   | 4 ++++
 drivers/irqchip/irq-loongson-htvec.c   | 4 ++++
 drivers/irqchip/irq-loongson-liointc.c | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/irqchip/irq-loongson-htpic.c b/drivers/irqchip/irq-loongson-htpic.c
index dd018c22ea83..7f38fdb2cb43 100644
--- a/drivers/irqchip/irq-loongson-htpic.c
+++ b/drivers/irqchip/irq-loongson-htpic.c
@@ -26,6 +26,10 @@ struct loongson_htpic {
 
 static struct loongson_htpic *htpic;
 
+#if !defined(CONFIG_MIPS) && !defined(CONFIG_X86)
+static inline void spurious_interrupt(void) { }
+#endif
+
 static void htpic_irq_dispatch(struct irq_desc *desc)
 {
 	struct loongson_htpic *priv = irq_desc_get_handler_data(desc);
diff --git a/drivers/irqchip/irq-loongson-htvec.c b/drivers/irqchip/irq-loongson-htvec.c
index 1ece9337c78d..03c3973d7525 100644
--- a/drivers/irqchip/irq-loongson-htvec.c
+++ b/drivers/irqchip/irq-loongson-htvec.c
@@ -33,6 +33,10 @@ struct htvec {
 	raw_spinlock_t		htvec_lock;
 };
 
+#if !defined(CONFIG_MIPS) && !defined(CONFIG_X86)
+static inline void spurious_interrupt(void) { }
+#endif
+
 static void htvec_irq_dispatch(struct irq_desc *desc)
 {
 	int i;
diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
index 63b61474a0cc..e31744e2d800 100644
--- a/drivers/irqchip/irq-loongson-liointc.c
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -46,6 +46,10 @@ struct liointc_priv {
 	bool				has_lpc_irq_errata;
 };
 
+#if !defined(CONFIG_MIPS) && !defined(CONFIG_X86)
+static inline void spurious_interrupt(void) { }
+#endif
+
 static void liointc_chained_handle_irq(struct irq_desc *desc)
 {
 	struct liointc_handler_data *handler = irq_desc_get_handler_data(desc);
-- 
2.27.0.rc0


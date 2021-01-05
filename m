Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B922EA383
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jan 2021 04:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbhAEC5u (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 21:57:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:59634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728001AbhAEC5u (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 21:57:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D4F422581;
        Tue,  5 Jan 2021 02:57:08 +0000 (UTC)
From:   Huacai Chen <chenhuacai@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] irqchip/loongson-liointc: Fix build warnings
Date:   Tue,  5 Jan 2021 10:56:51 +0800
Message-Id: <20210105025651.772024-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Huacai Chen <chenhuacai@kernel.org>

Fix build warnings as below:

>> drivers/irqchip/irq-loongson-liointc.c:134:12: warning: no previous prototype for 'liointc_of_init' [-Wmissing-prototypes]
     134 | int __init liointc_of_init(struct device_node *node,
         |            ^~~~~~~~~~~~~~~

Fixes: dbb152267908c4b2c3639492a94 ("irqchip: Add driver for Loongson I/O Local Interrupt Controller")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
---
 drivers/irqchip/irq-loongson-liointc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
index 9ed1bc473663..09b91b81851c 100644
--- a/drivers/irqchip/irq-loongson-liointc.c
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -142,8 +142,8 @@ static void liointc_resume(struct irq_chip_generic *gc)
 
 static const char * const parent_names[] = {"int0", "int1", "int2", "int3"};
 
-int __init liointc_of_init(struct device_node *node,
-				struct device_node *parent)
+static int __init liointc_of_init(struct device_node *node,
+				  struct device_node *parent)
 {
 	struct irq_chip_generic *gc;
 	struct irq_domain *domain;
-- 
2.27.0


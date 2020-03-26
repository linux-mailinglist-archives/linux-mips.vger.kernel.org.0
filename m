Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF703193760
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 05:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgCZEts (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 00:49:48 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17955 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725775AbgCZEtr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 00:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585198133;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=l2PNpR2Rc6LMbAWYXl8TckJ3AJ68KwDurPM44WgWOeQ=;
        b=JktAJCvfbErbaXFiovxaNBK1nkVnA/v8QmlERPL5f4nE/J0LBVIusx9+rYAecu7W
        mMZlfGsaO1mhB3nedStqoCwWyHD3gVrLomDwltPx09oTwa6Jjo6OAsc1nDQpo8zIraV
        wyR9z3b36PLOpiQOwSUG2uW92Sp0oZcL19WxDjiY=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585198130690885.1881599862174; Thu, 26 Mar 2020 12:48:50 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, gch981213@gmail.com,
        linux-mediatek@lists.infradead.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <20200326044804.382981-1-jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] MIPS: Kill MIPS_GIC_IRQ_BASE
Date:   Thu, 26 Mar 2020 12:48:03 +0800
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It never got used by any driver.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/mach-generic/irq.h   | 6 ------
 arch/mips/include/asm/mach-ralink/mt7621.h | 2 --
 2 files changed, 8 deletions(-)

diff --git a/arch/mips/include/asm/mach-generic/irq.h b/arch/mips/include/a=
sm/mach-generic/irq.h
index be546a0f65fa..72ac2c202c55 100644
--- a/arch/mips/include/asm/mach-generic/irq.h
+++ b/arch/mips/include/asm/mach-generic/irq.h
@@ -36,10 +36,4 @@
=20
 #endif /* CONFIG_IRQ_MIPS_CPU */
=20
-#ifdef CONFIG_MIPS_GIC
-#ifndef MIPS_GIC_IRQ_BASE
-#define MIPS_GIC_IRQ_BASE (MIPS_CPU_IRQ_BASE + 8)
-#endif
-#endif /* CONFIG_MIPS_GIC */
-
 #endif /* __ASM_MACH_GENERIC_IRQ_H */
diff --git a/arch/mips/include/asm/mach-ralink/mt7621.h b/arch/mips/include=
/asm/mach-ralink/mt7621.h
index 65483a4681ab..e1af1ba50bd8 100644
--- a/arch/mips/include/asm/mach-ralink/mt7621.h
+++ b/arch/mips/include/asm/mach-ralink/mt7621.h
@@ -31,6 +31,4 @@
 #define MT7621_CHIP_NAME0=09=090x3637544D
 #define MT7621_CHIP_NAME1=09=090x20203132
=20
-#define MIPS_GIC_IRQ_BASE           (MIPS_CPU_IRQ_BASE + 8)
-
 #endif
--=20
2.26.0.rc2



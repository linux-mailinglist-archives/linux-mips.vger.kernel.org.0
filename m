Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAC7193872
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 07:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgCZGSU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 02:18:20 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17979 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726279AbgCZGSU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 02:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585203478;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=l2PNpR2Rc6LMbAWYXl8TckJ3AJ68KwDurPM44WgWOeQ=;
        b=AKwgTMxQlYub8N2+TlZ9lw7p3EFxnBF4IWxVqrA7vE1stlEJfkpptKbSmo4Om2KC
        +ecGg0Z71EnX9+v2EErw165CVC7Zi/l7H3lTJEKg6/ydNDwabSn7spp5mZ7jW/U26ET
        xnS63t8UtgaiS9iE1/4+o3FsALcl5/Ihiw6otCd8=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585203478099799.9761018699264; Thu, 26 Mar 2020 14:17:58 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, maz@kernel.org, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <20200326061704.387483-3-jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] MIPS: Kill MIPS_GIC_IRQ_BASE
Date:   Thu, 26 Mar 2020 14:16:58 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200326061704.387483-1-jiaxun.yang@flygoat.com>
References: <20200326061704.387483-1-jiaxun.yang@flygoat.com>
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



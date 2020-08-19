Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFF02494D3
	for <lists+linux-mips@lfdr.de>; Wed, 19 Aug 2020 08:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgHSGIH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Aug 2020 02:08:07 -0400
Received: from [115.28.160.31] ([115.28.160.31]:58470 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726342AbgHSGIG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 19 Aug 2020 02:08:06 -0400
Received: from ld50.lan (unknown [101.86.2.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 61C946009E;
        Wed, 19 Aug 2020 14:07:56 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1597817276; bh=5tysBzYBSrZnp2wpVyQBRFtQHA+TG3okAJTsfAX+h5M=;
        h=From:To:Cc:Subject:Date:From;
        b=JVtAxN42quHBsGgYO76476LgnqQ5u9yDMQb+E/bMqs89Gh/m/a4bHTM8VBcMcNOtX
         oCNtoA8MfHV/KHVqMTNvxiHQEmif+AgGR4sj01Bx64XQaawUAkSv8UK/XhN6fKr5S9
         8KZ6v3+/hb81HmUoUWI2Es/AGn/j6aeBXlyNl4IY=
From:   WANG Xuerui <git@xen0n.name>
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     WANG Xuerui <git@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Youling Tang <tangyouling@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Loongson64: Remove unnecessary inclusion of boot_param.h
Date:   Wed, 19 Aug 2020 14:07:22 +0800
Message-Id: <20200819060722.2267677-1-git@xen0n.name>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The couple of #includes are unused by now; remove to prevent namespace
pollution.

This fixes e.g. build of dm_thin, which has a VIRTUAL symbol that
conflicted with the newly-introduced one in mach-loongson64/boot_param.h.

Fixes: 39c1485c8baa ("MIPS: KVM: Add kvm guest support for Loongson-3")
Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/mips/include/asm/mach-loongson64/irq.h    | 2 --
 arch/mips/include/asm/mach-loongson64/mmzone.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/irq.h b/arch/mips/include/asm/mach-loongson64/irq.h
index f5e362f79701..bf2480923154 100644
--- a/arch/mips/include/asm/mach-loongson64/irq.h
+++ b/arch/mips/include/asm/mach-loongson64/irq.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_MACH_LOONGSON64_IRQ_H_
 #define __ASM_MACH_LOONGSON64_IRQ_H_
 
-#include <boot_param.h>
-
 /* cpu core interrupt numbers */
 #define NR_IRQS_LEGACY		16
 #define NR_MIPS_CPU_IRQS	8
diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h b/arch/mips/include/asm/mach-loongson64/mmzone.h
index 3a25dbd3b3e9..5eaca4fe3f92 100644
--- a/arch/mips/include/asm/mach-loongson64/mmzone.h
+++ b/arch/mips/include/asm/mach-loongson64/mmzone.h
@@ -9,7 +9,6 @@
 #ifndef _ASM_MACH_LOONGSON64_MMZONE_H
 #define _ASM_MACH_LOONGSON64_MMZONE_H
 
-#include <boot_param.h>
 #define NODE_ADDRSPACE_SHIFT 44
 #define NODE0_ADDRSPACE_OFFSET 0x000000000000UL
 #define NODE1_ADDRSPACE_OFFSET 0x100000000000UL
-- 
2.25.1


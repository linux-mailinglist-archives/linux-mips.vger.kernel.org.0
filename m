Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29689166EDC
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2020 06:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgBUFP1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Feb 2020 00:15:27 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17858 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726018AbgBUFP1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Feb 2020 00:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582262057;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=utHjWgS/9MgbWFbTCvxGYRCRLUfEMYG7F22NuP75MMk=;
        b=FXZ5VPrpIDkc90msEBKP9ng5ic5PuYRKNeBvW7emxr9G3irqpYysIDFYPWFCrAU9
        rsOVgSQUHPoS+YtKiXLbFbw9TBiVb+6wcBUkglvT3plFk1lJ1hZ04DMgYGT46OeIRoY
        NK5evtCxdVS0CrFHfHm9hD+iOX8t5F0N4UjuP9oc=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1582262055106303.98857959372856; Fri, 21 Feb 2020 13:14:15 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20200221050942.507775-11-jiaxun.yang@flygoat.com>
Subject: [PATCH v4 10/10] MIPS: Loongson64: Move MIPS_CPU_IRQ_BASE
Date:   Fri, 21 Feb 2020 13:09:25 +0800
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200221050942.507775-1-jiaxun.yang@flygoat.com>
References: <20200221050942.507775-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

To prevent CPU IRQ collide with PCH IRQ, we move down
CPU IRQ BASE to 16.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/mach-loongson64/irq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-loongson64/irq.h b/arch/mips/includ=
e/asm/mach-loongson64/irq.h
index 12208119aac0..1ce2e0bbe305 100644
--- a/arch/mips/include/asm/mach-loongson64/irq.h
+++ b/arch/mips/include/asm/mach-loongson64/irq.h
@@ -5,7 +5,7 @@
 #include <boot_param.h>
=20
 /* cpu core interrupt numbers */
-#define MIPS_CPU_IRQ_BASE 56
+#define MIPS_CPU_IRQ_BASE 16
=20
 #include_next <irq.h>
 #endif /* __ASM_MACH_LOONGSON64_IRQ_H_ */
--=20
2.25.0



Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942BF395240
	for <lists+linux-mips@lfdr.de>; Sun, 30 May 2021 19:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhE3RUP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 May 2021 13:20:15 -0400
Received: from aposti.net ([89.234.176.197]:37756 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229848AbhE3RUO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 30 May 2021 13:20:14 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, list@opendingux.net,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/8] MIPS: cpu-probe: Fix FPU detection on Ingenic JZ4760(B)
Date:   Sun, 30 May 2021 18:17:57 +0100
Message-Id: <20210530171802.23649-4-paul@crapouillou.net>
In-Reply-To: <20210530171802.23649-1-paul@crapouillou.net>
References: <20210530171802.23649-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ingenic JZ4760 and JZ4760B do have a FPU, but the config registers don't
report it. Force the FPU detection in case the processor ID match the
JZ4760(B) one.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/kernel/cpu-probe.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 0ef240adefb5..630fcb4cb30e 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1840,6 +1840,11 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 		 */
 		case PRID_COMP_INGENIC_D0:
 			c->isa_level &= ~MIPS_CPU_ISA_M32R2;
+
+			/* FPU is not properly detected on JZ4760(B). */
+			if (c->processor_id == 0x2ed0024f)
+				c->options |= MIPS_CPU_FPU;
+
 			fallthrough;
 
 		/*
-- 
2.30.2


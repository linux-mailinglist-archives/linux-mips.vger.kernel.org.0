Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7D3723AB3A
	for <lists+linux-mips@lfdr.de>; Mon,  3 Aug 2020 19:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgHCRCC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Aug 2020 13:02:02 -0400
Received: from crapouillou.net ([89.234.176.41]:37402 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbgHCRCC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 3 Aug 2020 13:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1596474105; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HsSiK/iP2Z8wNA3WZjj2oyWIawn/wFbX512gnecYHF4=;
        b=GiVfyGLzI03FhTrkQWTcwC8BRUkJhYOfH+llYA5bHky/AQgWI0rr/uLECIskq1ViIw43cQ
        wQi3BDD77Flpm5lCIbCPJTKLDviyrdJeb9vUDcMOI/XbZfy0DkMTaUW5eJwcWdQjz4d25X
        ZrGgneHEdvwLucIFNfbdJ2mBHDxP7EE=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 02/13] MIPS: cpu-probe: Mark XBurst CPU as having vtagged caches
Date:   Mon,  3 Aug 2020 19:01:13 +0200
Message-Id: <20200803170124.231110-3-paul@crapouillou.net>
In-Reply-To: <20200803170124.231110-1-paul@crapouillou.net>
References: <20200803170124.231110-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

XBurst CPUs present in Ingenic SoCs have virtually tagged caches,
according to the <cpu-features-override.h> header.

Add that information to cpu_probe_ingenic().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/kernel/cpu-probe.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index a18f3611fa5e..a07e66a6e063 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -2125,6 +2125,9 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 	c->options &= ~MIPS_CPU_COUNTER;
 	BUG_ON(!__builtin_constant_p(cpu_has_counter) || cpu_has_counter);
 
+	/* XBurst has virtually tagged icache */
+	c->icache.flags |= MIPS_CACHE_VTAG;
+
 	switch (c->processor_id & PRID_IMP_MASK) {
 
 	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA */
-- 
2.27.0


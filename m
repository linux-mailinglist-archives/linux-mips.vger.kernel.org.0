Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6184082E4
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 04:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236880AbhIMCm6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Sep 2021 22:42:58 -0400
Received: from out0.migadu.com ([94.23.1.103]:65057 "EHLO out0.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235364AbhIMCm5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Sep 2021 22:42:57 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1631500901;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=x0Sspr/wtk2oDBAV83VaVrH2+W4twjaOOFjo9kb2iLY=;
        b=CgjbcDy1EAaHuz6Remv3YZT1pdfWrTFvGj4tNwL58rRocslPF7SiXOqcUI5kaMexEUriUh
        74gQVYWH+OMGfDbHZETXQYbhAyGpcUX520PbAJv8WhS3OjMq0oKT5mcmPb8qOeHNu+b6Pd
        Tw6N2UNOlMQVwl3mt5ekRaScsDW++L4=
From:   Jackie Liu <liu.yun@linux.dev>
To:     tsbogend@alpha.franken.de
Cc:     chenhc@lemote.com, linux-mips@vger.kernel.org, liu.yun@linux.dev
Subject: [PATCH] MIPS: loongson64: make LOONGSON64 depends on MIPS_FP_SUPPORT
Date:   Mon, 13 Sep 2021 10:41:13 +0800
Message-Id: <20210913024113.220893-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jackie Liu <liuyun01@kylinos.cn>

mach/loongson64 fails to build when the FPU support is disabled:

arch/mips/loongson64/cop2-ex.c:45:15: error: implicit declaration of function ‘__is_fpu_owner’; did you mean ‘is_fpu_owner’? [-Werror=implicit-function-declaration]
arch/mips/loongson64/cop2-ex.c:98:30: error: ‘struct thread_struct’ has no member named ‘fpu’
arch/mips/loongson64/cop2-ex.c:99:30: error: ‘struct thread_struct’ has no member named ‘fpu’
arch/mips/loongson64/cop2-ex.c:131:43: error: ‘struct thread_struct’ has no member named ‘fpu’
arch/mips/loongson64/cop2-ex.c:137:38: error: ‘struct thread_struct’ has no member named ‘fpu’
arch/mips/loongson64/cop2-ex.c:203:30: error: ‘struct thread_struct’ has no member named ‘fpu’
arch/mips/loongson64/cop2-ex.c:219:30: error: ‘struct thread_struct’ has no member named ‘fpu’
arch/mips/loongson64/cop2-ex.c:283:38: error: ‘struct thread_struct’ has no member named ‘fpu’
arch/mips/loongson64/cop2-ex.c:301:38: error: ‘struct thread_struct’ has no member named ‘fpu’

Fixes: ef2f826c8f2f ("MIPS: Loongson-3: Enable the COP2 usage")
Reported-by: k2ci robot <kernel-bot@kylinos.cn>
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 24e374266fdc..1164c32fd87b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -487,6 +487,7 @@ config MACH_LOONGSON64
 	select ISA
 	select I8259
 	select IRQ_MIPS_CPU
+	select MIPS_FP_SUPPORT
 	select NO_EXCEPT_FILL
 	select NR_CPUS_DEFAULT_64
 	select USE_GENERIC_EARLY_PRINTK_8250
-- 
2.25.1


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E574021556A
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2020 12:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbgGFKUH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Jul 2020 06:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728578AbgGFKUG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Jul 2020 06:20:06 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2905C061794
        for <linux-mips@vger.kernel.org>; Mon,  6 Jul 2020 03:20:06 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ch3so1646955pjb.5
        for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2020 03:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=Nu6E+nPmcerIySA/9M+cbWILbb6Sa6liFtBABkBWJNY=;
        b=L1lCtZ0ttof7Ncfq049zmqcGn4xiY9wow84rtrW2IEYAulpLhjI4D++7MH/xCWUm0X
         mXud0H705ctRSJmvVXsg7nbEEAFd4w+lQMVOUyRObW9CFa1+kGD0u2Aa2AQy9OOJt7xU
         7vj5exe4aJDiTSINqH+kTvlvLfjA9GoA+TO+N4JagSV1aYVzKk56rjHWpK2tXB7Fk8CI
         FKM1BOJcRmcNBxBUVUVEVqXyXL9G01V+lzm4WD7yRgbFHp43OWgd3ORZ8hDL1rJYoxUO
         pmaBn3CdmSH/imSh4T+T1g4TU8idpa8SiglqvuY0CUirB6p/5L7wUbdh6+/Z7yK3yce2
         4Tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=Nu6E+nPmcerIySA/9M+cbWILbb6Sa6liFtBABkBWJNY=;
        b=I1UcaA3e4XCQpH44+1KSA7fzXsb5qTOQ4rDM2+SujPad5JFlcyT6B/TlsCNFF5mtlU
         vSsPFroo9bs8zrEZ3qvEwriceoey0LE0tnPRe8VRRpXWYtc7hguCafA2M79nldU+dMCz
         X2f8KALbJuuJLlTqeLBT0G8aSqIQ5NpYH3NbMhABuyraoadBnjkBC1MS5QXEUWP6Xvfi
         DwTK39Xaa1uLgw2QFqp1UkmhanaDxCuO3Vp1Ul8VtjZL8cjeiI0cpkO6OOL64FkbPmMO
         GMPe/Yl615iDZ93Iit4bmQ4BeheAwi1bKS7/W99Haz0O13WmA/y+7oNV5dSa8V+AZGrH
         Tnug==
X-Gm-Message-State: AOAM532ieMMfnjin9pc4sB8W99e8BVRY+De0E3WxdAXCpBnHw/VEYVzq
        ZuAip3+krdYjH2OLihI1T1zHsHz0CA5j1A==
X-Google-Smtp-Source: ABdhPJysZ3P2qU0CADX6NThVcbOcwnLpC4N2NMYoQWpL4cB3sukX+1Cn9iBhnTNXbxmpFvEDQb8LuQ==
X-Received: by 2002:a17:90a:a393:: with SMTP id x19mr23148876pjp.24.1594030806430;
        Mon, 06 Jul 2020 03:20:06 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id n15sm18782082pgs.25.2020.07.06.03.20.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jul 2020 03:20:05 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH] MIPS: Loongson64: Adjust IRQ layout
Date:   Mon,  6 Jul 2020 18:21:56 +0800
Message-Id: <1594030916-7520-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adjust IRQ layout in order to use IRQ resources more efficiently, which
is done by adjusting NR_IRQS and MIPS_CPU_IRQ_BASE.

Before this patch:
0~15:    ISA/LPC IRQs;
16~55:   Dynamic IRQs;
56~63:   MIPS CPU IRQs;
64~127:  PCH IRQs;
128~255: Dynamic IRQs.

After this patch:
0~15:    ISA/LPC IRQs;
16~23:   MIPS CPU IRQs;
24~87:   PCH IRQs;
88~280:  Dynamic IRQs.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/mach-loongson64/irq.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-loongson64/irq.h b/arch/mips/include/asm/mach-loongson64/irq.h
index d41dc4a..f5e362f7 100644
--- a/arch/mips/include/asm/mach-loongson64/irq.h
+++ b/arch/mips/include/asm/mach-loongson64/irq.h
@@ -5,7 +5,11 @@
 #include <boot_param.h>
 
 /* cpu core interrupt numbers */
-#define MIPS_CPU_IRQ_BASE 56
+#define NR_IRQS_LEGACY		16
+#define NR_MIPS_CPU_IRQS	8
+#define NR_IRQS			(NR_IRQS_LEGACY + NR_MIPS_CPU_IRQS + 256)
+
+#define MIPS_CPU_IRQ_BASE 	NR_IRQS_LEGACY
 
 #include <asm/mach-generic/irq.h>
 
-- 
2.7.0


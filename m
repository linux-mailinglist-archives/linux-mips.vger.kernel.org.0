Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23994242325
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 02:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgHLAQZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Aug 2020 20:16:25 -0400
Received: from crapouillou.net ([89.234.176.41]:52184 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726143AbgHLAQZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Aug 2020 20:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1597191327; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q8FTq5Tj2gtOY+WE1KJeQiURWsuOR0nzqJFeX9k5+H8=;
        b=lYfiL9+axA/JJ4TIr5qFQVrTu6wmTE57Cm4mi8qihopGEoHesQJyD+JbDodBveHbDPluB2
        gwPn8MfgGCTmW/yQwg2YIqqkcJ25WOeDg2776ZyZ+01MPt+Im4gEhE81/UjmnLRtwKZ1X4
        ANVfgPiDHaWGOYcL6wD7UDMVEOMEwXs=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 09/13] MIPS: generic: Increase NR_IRQS to 256
Date:   Wed, 12 Aug 2020 02:15:06 +0200
Message-Id: <20200812001510.460382-10-paul@crapouillou.net>
In-Reply-To: <20200812001510.460382-1-paul@crapouillou.net>
References: <20200812001510.460382-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

128 IRQs is not enough to support Ingenic SoCs.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: No change

 arch/mips/include/asm/mach-generic/irq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-generic/irq.h b/arch/mips/include/asm/mach-generic/irq.h
index 72ac2c202c55..079889ced4f3 100644
--- a/arch/mips/include/asm/mach-generic/irq.h
+++ b/arch/mips/include/asm/mach-generic/irq.h
@@ -9,7 +9,7 @@
 #define __ASM_MACH_GENERIC_IRQ_H
 
 #ifndef NR_IRQS
-#define NR_IRQS 128
+#define NR_IRQS 256
 #endif
 
 #ifdef CONFIG_I8259
-- 
2.28.0


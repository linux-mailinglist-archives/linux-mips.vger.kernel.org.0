Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A01628C173
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 21:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388712AbgJLT1v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 15:27:51 -0400
Received: from aposti.net ([89.234.176.197]:47666 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387797AbgJLT1v (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Oct 2020 15:27:51 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] MIPS: ingenic: Remove CPU_SUPPORTS_HUGEPAGES
Date:   Mon, 12 Oct 2020 21:27:39 +0200
Message-Id: <20201012192739.49259-1-paul@crapouillou.net>
In-Reply-To: <20201012143319.GA24291@roeck-us.net>
References: <20201012143319.GA24291@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

While it is true that Ingenic SoCs support huge pages, we cannot use
them yet as PTEs don't have any single bit that is free. Right now,
having that symbol only causes build errors, so remove it until the
situation with PTEs is resolved.

Fixes: f0f4a753079c ("MIPS: generic: Add support for Ingenic SoCs")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f52fa211a4cf..29bad5bd3e70 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -103,7 +103,6 @@ config MACH_INGENIC
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_SUPPORTS_ZBOOT
-	select CPU_SUPPORTS_HUGEPAGES
 	select DMA_NONCOHERENT
 	select IRQ_MIPS_CPU
 	select PINCTRL
-- 
2.28.0


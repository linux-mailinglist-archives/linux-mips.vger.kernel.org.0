Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32E0569E64
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2019 23:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730249AbfGOVkP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jul 2019 17:40:15 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:34402 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730156AbfGOVkP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jul 2019 17:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1563226813; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=FswRZqgN/pvd1iwzddhHBmlf5FX0AHTot/eT8dI7keU=;
        b=jn+8EzXVNZMIYKWPAYf2H5irN0X3fraihSEH+bzKqqk6FsMRFZRe9M0X/Mm3viPitnyWrj
        hlBhhEFYQSe9r4wyynCknqW/TxRPFMbiInu53uA4FdfklHrU07XDnYNqLvBiklZO7J5sNC
        so0TqQ5wNG0Ze/iCIZ7lsZLTIzKgtnA=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Daniel Silsby <dansilsby@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/5] MIPS: Disallow CPU_SUPPORTS_HUGEPAGES for XPA,EVA
Date:   Mon, 15 Jul 2019 17:39:59 -0400
Message-Id: <20190715214003.9714-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Daniel Silsby <dansilsby@gmail.com>

In preparation for 32-bit MIPS huge page support.

EVA,XPA are extended-addressing modes for 32-bit MIPS systems. Because
huge pages aren't currently supported in 32-bit MIPS, this doesn't take
any features away from EVA,XPA-enabled systems. However, the soon-to-
come 32-bit MIPS huge page support doesn't yet support them.

This also disables CPU_SUPPORTS_HUGEPAGES for the small number of 32-bit
MIPS CPUs from Alchemy/Netlogic that support a custom 36-bit extended
addressing. It's unknown if they even support huge pages in hardware.

Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d50fafd7bf3a..ff5f1314241e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2110,6 +2110,7 @@ config CPU_SUPPORTS_ADDRWINCFG
 	bool
 config CPU_SUPPORTS_HUGEPAGES
 	bool
+	depends on !(32BIT && (ARCH_PHYS_ADDR_T_64BIT || EVA))
 config CPU_SUPPORTS_UNCACHED_ACCELERATED
 	bool
 config MIPS_PGD_C0_CONTEXT
-- 
2.21.0.593.g511ec345e18


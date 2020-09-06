Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 410AF25F030
	for <lists+linux-mips@lfdr.de>; Sun,  6 Sep 2020 21:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgIFTbK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Sep 2020 15:31:10 -0400
Received: from crapouillou.net ([89.234.176.41]:35962 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726623AbgIFTbJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Sep 2020 15:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599420593; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=viIORF8Kv7UoWDBGuWiALFFOnDG7m8sFSAbvGMqgqT8=;
        b=dSXFxICYtoq+t8Gh7ldBNfgw8i7V1+ehxMA9uLcczy18249r4k0FFBTMOHyP5UTXCNdhMj
        kdHsm1hy0uqTOoQu4u7P/yWth5Kl3ZycYRrZ8Ia2J5WfOBmlrhNG+TsiU4ShMT5F7LL/ZU
        TzpW0TA6ucCyFkl1hODAQa6qm3k8jBg=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 09/15] MIPS: generic: Add support for zboot
Date:   Sun,  6 Sep 2020 21:29:29 +0200
Message-Id: <20200906192935.107086-10-paul@crapouillou.net>
In-Reply-To: <20200906192935.107086-1-paul@crapouillou.net>
References: <20200906192935.107086-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There is no reason we can't create compressed kernels here, so select
the option SYS_SUPPORTS_ZBOOT.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2-v3: No change

 arch/mips/Kconfig          | 1 +
 arch/mips/generic/Platform | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0c9270ee9081..795b33ad4e64 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -141,6 +141,7 @@ config MIPS_GENERIC_KERNEL
 	select SYS_SUPPORTS_MULTITHREADING
 	select SYS_SUPPORTS_RELOCATABLE
 	select SYS_SUPPORTS_SMARTMIPS
+	select SYS_SUPPORTS_ZBOOT
 	select UHI_BOOT
 	select USB_EHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
 	select USB_EHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index 53c33cb72974..4cefecf7d14b 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -10,6 +10,7 @@
 
 cflags-$(CONFIG_MIPS_GENERIC)	+= -I$(srctree)/arch/mips/include/asm/mach-generic
 load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
+zload-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff81000000
 all-$(CONFIG_MIPS_GENERIC)	:= vmlinux.gz.itb
 
 its-y					:= vmlinux.its.S
-- 
2.28.0


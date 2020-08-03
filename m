Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F64823AB46
	for <lists+linux-mips@lfdr.de>; Mon,  3 Aug 2020 19:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgHCRCs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Aug 2020 13:02:48 -0400
Received: from crapouillou.net ([89.234.176.41]:38056 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbgHCRCr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 3 Aug 2020 13:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1596474110; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7KNiftixgyRiIezBs72MKs1WHt6Oieux7wZqrVeJH7w=;
        b=q5GDdSDfeiHFMrp8NNY7CxBj5P6uyOPXFh6okbY1oOSTE/1Nn1XEWap+hayqM3ELMKK+VC
        oPA0kQwEPA1ggXCCSOYZyAIz8oZesE8b9WVHk9tsGR/Q7lVY0rg4z8baNCfWpyp8LOtGTK
        nO+nCb0Ss0rU5yxlujIzmtueU2r36Ys=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 08/13] MIPS: generic: Add support for zboot
Date:   Mon,  3 Aug 2020 19:01:19 +0200
Message-Id: <20200803170124.231110-9-paul@crapouillou.net>
In-Reply-To: <20200803170124.231110-1-paul@crapouillou.net>
References: <20200803170124.231110-1-paul@crapouillou.net>
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
 arch/mips/Kconfig          | 1 +
 arch/mips/generic/Platform | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 17878c37fc84..0206d86dab7f 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -142,6 +142,7 @@ config MIPS_GENERIC_KERNEL
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
2.27.0


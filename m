Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65133326D10
	for <lists+linux-mips@lfdr.de>; Sat, 27 Feb 2021 13:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhB0Mdf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Feb 2021 07:33:35 -0500
Received: from mail.zx2c4.com ([104.131.123.232]:48494 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229946AbhB0Mdf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 27 Feb 2021 07:33:35 -0500
X-Greylist: delayed 398 seconds by postgrey-1.27 at vger.kernel.org; Sat, 27 Feb 2021 07:33:34 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1614428772;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Ry9CguLjSJN7rtJ7Hd6Rr3nL04/AvoiTOVx4rEJ21ko=;
        b=URHv/HGpZCNCeT9v0Xb+hk3oGa/hUU4metdTP7iFC0LoZVhxkBbDzpbBE6uUpB9mlBcEsl
        pHk/Xhrh3+ZFstBRXYo3L3C2muKVTYtzTAZsIhDjG5bNOuZpNKTN5qk7xtRpRkG5YX+ekm
        kpebwYGo27ADsXRKm1aq2rRSTDgkZlY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4d9fd2bb (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
        Sat, 27 Feb 2021 12:26:11 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        George Cherian <gcherian@marvell.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] MIPS: select CPU_MIPS64 for remaining MIPS64 CPUs
Date:   Sat, 27 Feb 2021 13:26:05 +0100
Message-Id: <20210227122605.2680138-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The CPU_MIPS64 and CPU_MIPS32 variables are supposed to be able to
distinguish broadly between 64-bit and 32-bit MIPS CPUs. However, they
weren't selected by the specialty CPUs, Octeon and Loongson, which meant
it was possible to hit a weird state of:

    MIPS=y, CONFIG_64BIT=y, CPU_MIPS64=n

This commit rectifies the issue by having CPU_MIPS64 be selected when
the missing Octeon or Loongson models are selected.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: George Cherian <gcherian@marvell.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d89efba3d8a4..3e0e8f1d2e82 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2118,7 +2118,7 @@ config CPU_MIPS32
 config CPU_MIPS64
 	bool
 	default y if CPU_MIPS64_R1 || CPU_MIPS64_R2 || CPU_MIPS64_R5 || \
-		     CPU_MIPS64_R6
+		     CPU_MIPS64_R6 || CPU_LOONGSON64 || CPU_CAVIUM_OCTEON
 
 #
 # These indicate the revision of the architecture
-- 
2.30.1


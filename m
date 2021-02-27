Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097B5326F84
	for <lists+linux-mips@lfdr.de>; Sun, 28 Feb 2021 00:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhB0XD3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Feb 2021 18:03:29 -0500
Received: from mail.zx2c4.com ([104.131.123.232]:38756 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230001AbhB0XD2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 27 Feb 2021 18:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1614466964;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q+dYPdLA1nRflfyP+m0tpTzYzbtgeZrAnmID+z1FW1Q=;
        b=SQtyQRvK5JbbollqfgMLNhh31oZuOErwWUi2zdyuGzqRL5oyURR7Qo85m8QTIdiQT+M9qJ
        Pa3fovc4Cge5PQ52kbLl5Tje6cJf/7yaQ2qNH8qI/MVS5MrbUes7fRlRR2GZKp0U2Xs/DS
        CzKkR7D3VMfOy1vGU+y2Ej/LOut08Vs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ffe02072 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
        Sat, 27 Feb 2021 23:02:44 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        "Maciej W . Rozycki" <macro@orcam.me.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        George Cherian <gcherian@marvell.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2] MIPS: select CPU_MIPS64 for remaining MIPS64 CPUs
Date:   Sun, 28 Feb 2021 00:02:36 +0100
Message-Id: <20210227230236.3234498-1-Jason@zx2c4.com>
In-Reply-To: <CAHmME9ohOsdAwGaqCQZKDynNoC2k=14g9VSFP2mTUA7txf_Ssw@mail.gmail.com>
References: <CAHmME9ohOsdAwGaqCQZKDynNoC2k=14g9VSFP2mTUA7txf_Ssw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CPU_MIPS64 is supposed to be selected for CPUs that implement a revision
of the MIPS64 ISA. While it contains the generic ones, it forgot about
Octeon and Loongson in its list, which are indeed MIPS64 processors.
This commit adds these missing CPUs to the auto-selection list.

Cc: Maciej W. Rozycki <macro@orcam.me.uk>
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


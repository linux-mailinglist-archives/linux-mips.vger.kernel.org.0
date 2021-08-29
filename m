Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 882423FAB84
	for <lists+linux-mips@lfdr.de>; Sun, 29 Aug 2021 14:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235294AbhH2Mzi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 Aug 2021 08:55:38 -0400
Received: from mengyan1223.wang ([89.208.246.23]:50802 "EHLO mengyan1223.wang"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235271AbhH2Mzh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 29 Aug 2021 08:55:37 -0400
X-Greylist: delayed 330 seconds by postgrey-1.27 at vger.kernel.org; Sun, 29 Aug 2021 08:55:35 EDT
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
        (Client did not present a certificate)
        (Authenticated sender: xry111@mengyan1223.wang)
        by mengyan1223.wang (Postfix) with ESMTPSA id 6DEEE65A34;
        Sun, 29 Aug 2021 08:49:11 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mengyan1223.wang;
        s=mail; t=1630241352;
        bh=4VT7HsleXnyApJ065hiHgYH7fPmSKGhjsjtBFnJBnfM=;
        h=Subject:From:To:Cc:Date:From;
        b=D2ZrwHnGztEQHojfa7/y/m3YPEfHzW2H1+IATuHJsWw/0wb5cQmgdE5QxZTFlMZ2O
         Jtx0IXiQkh9lJ+ThDLXZZhe7/vyw+xD/84B8dKxUeG1VurVafV02pCdfBMzDNHekjD
         jjIpMsgXGcJFe8AlTs5BQYfpaE3KX1qv81Rx4vYeDDwnpjig0wtgnQVvN7gpI0d5e7
         Vj6deJSVJZxf63lvyLDr8yRauR/RBCNVkV0bMh90uvBVs3R4dfLhN3ftOwjrEVINV5
         sUR26iZKn+Sg6w5uWOeuWsBJBt9H088uFckgvwo1HAsMOrgMKWhb/oLPSPSPeWIEgy
         m8JFF6H/oYEjQ==
Message-ID: <0b7c9431efb12c2d957fcc53ec8f0743725d61b3.camel@mengyan1223.wang>
Subject: [PATCH] mips: remove reference to "newer Loongson-3"
From:   Xi Ruoyao <xry111@mengyan1223.wang>
To:     linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
Date:   Sun, 29 Aug 2021 20:49:09 +0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Newest Loongson-3 processors have moved to use LoongArch architecture.
Sadly, the LL/SC issue is still existing on both latest Loongson-3
processors using MIPS64 (Loongson-3A4000) and LoongArch
(Loongson-3A5000).

As it's very unlikely there will be new Loongson-3 processors using
MIPS64, let's stop people from false hoping.

Signed-off-by: Xi Ruoyao <xry111@mengyan1223.wang>
Cc: Huacai Chen <chenhuacai@kernel.org>
---

Huacai: how's the status of LL/SC issue on Loongson-2K?  If
the issue exists on it as well, we can just force
CPU_LOONGSON3_WORKAROUNDS when CONFIG_CPU_LOONGSON64 and
CONFIG_SMP are both selected.

 arch/mips/Kconfig | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6dfb27d531dd..ff5f344a371e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1433,19 +1433,14 @@ config LOONGSON3_ENHANCEMENT
 	  new Loongson-3 machines only, please say 'Y' here.
 
 config CPU_LOONGSON3_WORKAROUNDS
-	bool "Old Loongson-3 LLSC Workarounds"
+	bool "Loongson-3 LLSC Workarounds"
 	default y if SMP
 	depends on CPU_LOONGSON64
 	help
 	  Loongson-3 processors have the llsc issues which require workarounds.
 	  Without workarounds the system may hang unexpectedly.
 
-	  Newer Loongson-3 will fix these issues and no workarounds are needed.
-	  The workarounds have no significant side effect on them but may
-	  decrease the performance of the system so this option should be
-	  disabled unless the kernel is intended to be run on old systems.
-
-	  If unsure, please say Y.
+	  Say Y, unless you know what you are doing.
 
 config CPU_LOONGSON3_CPUCFG_EMULATION
 	bool "Emulate the CPUCFG instruction on older Loongson cores"
-- 
2.33.0



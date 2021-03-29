Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61F2334D01D
	for <lists+linux-mips@lfdr.de>; Mon, 29 Mar 2021 14:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhC2Mcu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Mar 2021 08:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbhC2Mc2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Mar 2021 08:32:28 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A09C061574
        for <linux-mips@vger.kernel.org>; Mon, 29 Mar 2021 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=D2TJPlo2OHltmofm98E9gZJltjlJbGBrIhNtsQI8lhU=; b=kcbOyjCpPXSR15U73BPECXGTtc
        cvP2hBnsmYtgewk4P5tKgvOIZumieMVse374pPHwBEn+IA9/fSpsaQj3KVYuddkKetDuHJu8/2G0g
        Bj1ubZIo3i2Szt/4N+hR9PfXjyCSqQc5+NATgqrPLL4Xv4eAlQd4YSRJjWMgS2iHjTboL7LNRQD59
        QlZdPLcMet41vdt0eanydWH6zObYZDWNWKdO+TdoStN2eXOqX4cWxMxvLPaSmTnWnw4wO334uyHEw
        EgZrLACiuMcPUCMMEiNEFj+yfbIDHsx5ky496YfDoHI+dW31kC2je73TIe38W3EpT7XKtuUP0c9AZ
        9O9mdJdA==;
Received: from 97-173-191-90.dyn.estpak.ee ([90.191.173.97] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1lQr4A-0008VV-QC; Mon, 29 Mar 2021 15:32:23 +0300
Received: by ubuntu (sSMTP sendmail emulation); Mon, 29 Mar 2021 15:32:17 +0300
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     sandberg@mailfence.com
Cc:     f.fainelli@gmail.com, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, trivial@kernel.org
Subject: [PATCH v3 1/1] MIPS: kernel: setup.c: fix compilation error
Date:   Mon, 29 Mar 2021 15:31:36 +0300
Message-Id: <20210329123136.3717-2-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329123136.3717-1-sandberg@mailfence.com>
References: <20210326134158.268164-1-sandberg@mailfence.com>
 <20210329123136.3717-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.173.97
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

With ath79_defconfig enabling CONFIG_MIPS_ELF_APPENDED_DTB gives a
compilation error. This patch fixes it.

Build log:
...
  CC      kernel/locking/percpu-rwsem.o
../arch/mips/kernel/setup.c:46:39: error: conflicting types for
'__appended_dtb'
 const char __section(".appended_dtb") __appended_dtb[0x100000];
                                       ^~~~~~~~~~~~~~
In file included from ../arch/mips/kernel/setup.c:34:
../arch/mips/include/asm/bootinfo.h:118:13: note: previous declaration
of '__appended_dtb' was here
 extern char __appended_dtb[];
             ^~~~~~~~~~~~~~
  CC      fs/attr.o
make[4]: *** [../scripts/Makefile.build:271: arch/mips/kernel/setup.o]
 Error 1
...

Root cause seems to be:
Fixes: b83ba0b9df56 ("MIPS: of: Introduce helper function to get DTB")

Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Tested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: trivial@kernel.org
---
 arch/mips/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 279be0153f8b..23a140327a0b 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -43,7 +43,7 @@
 #include <asm/prom.h>
 
 #ifdef CONFIG_MIPS_ELF_APPENDED_DTB
-const char __section(".appended_dtb") __appended_dtb[0x100000];
+char __section(".appended_dtb") __appended_dtb[0x100000];
 #endif /* CONFIG_MIPS_ELF_APPENDED_DTB */
 
 struct cpuinfo_mips cpu_data[NR_CPUS] __read_mostly;
-- 
2.25.1


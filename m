Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE68D34A854
	for <lists+linux-mips@lfdr.de>; Fri, 26 Mar 2021 14:44:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbhCZNoF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Mar 2021 09:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbhCZNnu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 26 Mar 2021 09:43:50 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB8F6C0613B1
        for <linux-mips@vger.kernel.org>; Fri, 26 Mar 2021 06:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=+PWFOY20tJDgWd9J5NDfLGT0pY3SBgm8+NCY/mgM8zs=; b=zbTsjG+Z6tfn0nYNDlacK1y1Pk
        peN6WGEsIrP02S6wZ7yRxO5vwzYqqlFArpYPiA5pnszY8vu7NojmXZ2izEsgl3f14rKggnhNBn7xF
        n1Ks+M9iD5o1TGTUJt5mloc7tPvTS0ZzFrjDIofZFlJudIh6Fix9dJNdldMs0eth03AFI1Mim9UuU
        0SLmaL0IsiO/FSkAlZadXr8JMONI6eHk0S9MJ2sw9oAczmkI//dJCdEhV+MxRD9/ll9ep4mvccQx6
        YhM/RsmMTfHKlpocNl/O4G9feJaVsyQm/uLxaukX2mVaO1GKEsOj6Lm1lTEOowxenuyQDcSNDtabK
        +mx/afUg==;
Received: from 97-173-191-90.dyn.estpak.ee ([90.191.173.97] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1lPmka-0008Ry-TW; Fri, 26 Mar 2021 15:43:45 +0200
Received: by ubuntu (sSMTP sendmail emulation); Fri, 26 Mar 2021 15:43:45 +0200
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        Mauri Sandberg <sandberg@mailfence.com>
Subject: [PATCH 1/1] MIPS: kernel: setup.c: fix compilation error
Date:   Fri, 26 Mar 2021 15:41:58 +0200
Message-Id: <20210326134158.268164-2-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326134158.268164-1-sandberg@mailfence.com>
References: <20210326134158.268164-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.173.97
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Developing against mips/mips-next I get a compilation error.
With the attached patch compilation succeeds.

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
make[3]: *** [../scripts/Makefile.build:514: arch/mips/kernel] Error 2
make[2]: *** [/home/ubuntu/git/linux/Makefile:1849: arch/mips] Error 2
make[2]: *** Waiting for unfinished jobs....
...

Root cause seems to be:
commit b83ba0b9df56 ("MIPS: of: Introduce helper function to get DTB")

Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
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


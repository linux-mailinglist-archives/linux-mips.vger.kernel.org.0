Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED2848A32E
	for <lists+linux-mips@lfdr.de>; Mon, 10 Jan 2022 23:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241522AbiAJWsx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Jan 2022 17:48:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241114AbiAJWsx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 Jan 2022 17:48:53 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9A9C06173F
        for <linux-mips@vger.kernel.org>; Mon, 10 Jan 2022 14:48:52 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id x6so49798587lfa.5
        for <linux-mips@vger.kernel.org>; Mon, 10 Jan 2022 14:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+xeifoUkWFTCfsCxyebM1z99nTIlkDjdcY667ebGhr0=;
        b=bA6Of3QR/l34jgB3XN18pfWfYSWRuad2hUTGD0Zlzev8rBq3Nu2Z5lIlQSDJ9BSQqk
         ITWUfYNGcA+w5pruCx8UxMybrv1DQnK9SjdWRXGMVwsisv1cORGs1w3pnFXD7xvHFoS3
         W1FvYDmrh4sR6fg00z6C/sjIuJNJOENNAm0/mTn5K7o9ADnrJLprFAax+zZMMSccezcE
         gXWSpC2SBuRXXR2IvY+lNo53uG2x7kLCe8aBohDFevPP9j1mxDthIKWLjrSzP7aCqHr0
         P7h/dygGznq3TQjZmo8zeYRcgu01QMmc3P0wn33zVtN4zJf/aM21ELZXdl7g1Pb9SOBE
         k5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+xeifoUkWFTCfsCxyebM1z99nTIlkDjdcY667ebGhr0=;
        b=JKsfvPxo4eY0Ac97dWC9c7NqHhqYmXli8/fHRrhcXx/MWdQZZrV4j6jwHXnWijZgFc
         q1k0g5X+o8UqaDqfKGwDZ/+qKO5FXoidlR0Giz5h16+82Xlc9RPDwrWrvRNU9wmbaXEv
         bzerPjKFz0e6m4deTHLfWbPqO1o5/qpxdZILtE1pCb2kJDdBBt+pNqR6iW5Z6OLGquFi
         qhBZosMvsLnSl03orme2eOGjrtNyBmJ+2bGVeeTJFg8rkIcRyNzs1Q8yGgbl4hvBNtoi
         o/SN/mabBQg6Am0kpf/QimNygKWaE3PJC6X/r3sT9QsKODi0lafRUl9K0X7yGLq6VuDb
         eT5g==
X-Gm-Message-State: AOAM533aEuXpBZ6cVcmNvdsUxOdLVdwpZDTZFWZsgUjx8c2igusRWKZ2
        1C+covoQAALCC8+RTKH+1A3/AYnDMfU=
X-Google-Smtp-Source: ABdhPJy5puzgvxincpYl+1XzgqbGHR0wFRrWBrIsAjZfe28UVK0IknhggWFemFWRg/++IF8Zt+X94g==
X-Received: by 2002:ac2:4a9e:: with SMTP id l30mr1351378lfp.608.1641854931146;
        Mon, 10 Jan 2022 14:48:51 -0800 (PST)
Received: from rafiki.local ([2001:470:71:330:af19:dcf:6d1d:d05c])
        by smtp.gmail.com with ESMTPSA id k10sm1139057ljg.48.2022.01.10.14.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 14:48:50 -0800 (PST)
From:   Lech Perczak <lech.perczak@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     Lech Perczak <lech.perczak@gmail.com>,
        John Crispin <john@phrozen.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] MIPS: ath79: drop _machine_restart again
Date:   Mon, 10 Jan 2022 23:48:44 +0100
Message-Id: <20220110224844.2329275-1-lech.perczak@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 81424d0ad0d4 ("MIPS: ath79: Use the reset controller to restart
OF machines") removed setup of _machine_restart on OF machines to use
reset handler in reset controller driver.
While removing remnants of non-OF machines in commit 3a77e0d75eed
("MIPS: ath79: drop machfiles"), this was introduced again, making it
impossible to use additional restart handlers registered through device
tree. Drop setting _machine_restart altogether, and ath79_restart
function, which is no longer used after this.

Fixes: 3a77e0d75eed ("MIPS: ath79: drop machfiles")
Cc: John Crispin <john@phrozen.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Lech Perczak <lech.perczak@gmail.com>
---

Side note: a lot of code, that was previously encompassed by
"if (mips_machtype != ATH79_MACH_GENERIC_OF) {...} " seems to be
unnecessary at the time of dropping the non-OF machine definitions.
However it was retained for some reason, and I see a lot of references
to it by the drivers. OTOH, OF part of ath79 platform - basically whole ath79
target of OpenWrt works well without this code in 19.07 release, using 4.14.y
tree, on which the bug I'm fixing here is absent as well.

I tested this change on several devices:
TP-Link TL-WDR4300, TP-Link Archer C7v2, Meraki MR18 using OF,
and on ZTE MF286 - using OF as well - which is the very reason I discovered
this issue, as it requires registration of  gpio-restart handler,
ineffective due to this issue.

 arch/mips/ath79/setup.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index 891f495c4c3c..0ac435fe2dc9 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -34,15 +34,6 @@
 
 static char ath79_sys_type[ATH79_SYS_TYPE_LEN];
 
-static void ath79_restart(char *command)
-{
-	local_irq_disable();
-	ath79_device_reset_set(AR71XX_RESET_FULL_CHIP);
-	for (;;)
-		if (cpu_wait)
-			cpu_wait();
-}
-
 static void ath79_halt(void)
 {
 	while (1)
@@ -234,7 +225,6 @@ void __init plat_mem_setup(void)
 
 	detect_memory_region(0, ATH79_MEM_SIZE_MIN, ATH79_MEM_SIZE_MAX);
 
-	_machine_restart = ath79_restart;
 	_machine_halt = ath79_halt;
 	pm_power_off = ath79_halt;
 }
-- 
2.30.2


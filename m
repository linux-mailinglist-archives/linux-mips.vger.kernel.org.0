Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2881332AF6B
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 04:27:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236960AbhCCAUg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Mar 2021 19:20:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381078AbhCBEUa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Mar 2021 23:20:30 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E76C061756;
        Mon,  1 Mar 2021 20:19:46 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id l2so13053091pgb.1;
        Mon, 01 Mar 2021 20:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ygpumBoGjcJPpkOrRtRnwo2svO0zz3+ZRmAmaq7w9/4=;
        b=ddnplYiySQgFy4fjExd3GlUYK8UxyFRNV8CriQ47JYNi0i2wvNMAQ0UOwuTNWu3Oj4
         pBRwzKQTEYPNaXakFhmSK+fGpV3t2giPQ5MbnLME2ZHZFBgwJX5Wj5qS5o6pJDhryf0Q
         9uYUD6USOw8ItWO0HaPQvophDEB1rZBRmBMBYVGAXJnrWGrxVX0YBT1BgKuhHYpyZS4g
         gLoA7p4/zw2Hn60LwCF9hGq5xTZJkl5ODHrEBWKvI03E++1d3ttS/EzPDqhvhccWi6TU
         /xC+F6yzd2zDNt7QCP6OYsmFj8MfRebMElScBnep9jwX6F0aTeS7PZ0wko7zw9IXB0LD
         AEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ygpumBoGjcJPpkOrRtRnwo2svO0zz3+ZRmAmaq7w9/4=;
        b=Xo6fIDOiuk7ixX5Zc0GTlX2xbj1pFfUK7xJ6ARehUNzVr8xIGPuqjsq8pv6tpMoyNJ
         EtASWUG5PzMqymk91xVW+3+iICUIRQ4guZYEDty9FPnXYAVqnaZOpsMz7xYK3Hy9LZTR
         TecdRtULu7XrQnancwA5l9F0cOjbuZUPRHGMrLJFTBesiF6xvPXwyfVLVsbT7mCbJIIJ
         U9XtQo8dcFM5vgLHyNnhZOCQ8ZeLsAP7k226jyqlTqhfTXaKq4iucHZWfeuL2RwI1tCn
         FkLwrF7NTmIwN4Ma8b+rKDeUBze74TBVcFFgM1wLTg1se81VUWTghTAo+CSbtOVYWlEF
         HGHw==
X-Gm-Message-State: AOAM531zpbdyO1cE7Qcu/7qzZroi4o0Z3CPP0JlXxtkxMnXLw9OWwRb6
        KImS5j1Vd1xGRoycOahN4HsY4upqbv4=
X-Google-Smtp-Source: ABdhPJxeYGndjRbxs7qyJCzcsYIKmkjKDNlzyb7+7kVsPSbhP/3N2CTua9HAIbQuRHOKPqI5HbV8wQ==
X-Received: by 2002:a63:4e26:: with SMTP id c38mr16616807pgb.81.1614658785561;
        Mon, 01 Mar 2021 20:19:45 -0800 (PST)
Received: from stbirv-lnx-3.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 1sm6701316pfh.90.2021.03.01.20.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 20:19:45 -0800 (PST)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     rppt@kernel.org, fancer.lancer@gmail.com, guro@fb.com,
        akpm@linux-foundation.org, paul@crapouillou.net,
        Florian Fainelli <f.fainelli@gmail.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM BMIPS MIPS
        ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: BMIPS: Reserve exception base to prevent corruption
Date:   Mon,  1 Mar 2021 20:19:38 -0800
Message-Id: <20210302041940.3663823-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301092241.i7dxo7zbg3ar55d6@mobilestation>
References: <20210301092241.i7dxo7zbg3ar55d6@mobilestation>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BMIPS is one of the few platforms that do change the exception base.
After commit 2dcb39645441 ("memblock: do not start bottom-up allocations
with kernel_end") we started seeing BMIPS boards fail to boot with the
built-in FDT being corrupted.

Before the cited commit, early allocations would be in the [kernel_end,
RAM_END] range, but after commit they would be within [RAM_START +
PAGE_SIZE, RAM_END].

The custom exception base handler that is installed by
bmips_ebase_setup() done for BMIPS5000 CPUs ends-up trampling on the
memory region allocated by unflatten_and_copy_device_tree() thus
corrupting the FDT used by the kernel.

To fix this, we need to perform an early reservation of the custom
exception that is going to be installed and this needs to happen at
plat_mem_setup() time to ensure that unflatten_and_copy_device_tree()
finds a space that is suitable, away from reserved memory.

Huge thanks to Serget for analysing and proposing a solution to this
issue.

Fixes: Fixes: 2dcb39645441 ("memblock: do not start bottom-up allocations with kernel_end")
Debugged-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reported-by: Kamal Dasu <kdasu.kdev@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Thomas,

This is intended as a stop-gap solution for 5.12-rc1 and to be picked up
by the stable team for 5.11. We should find a safer way to avoid these
problems for 5.13 maybe.

 arch/mips/bmips/setup.c       | 22 ++++++++++++++++++++++
 arch/mips/include/asm/traps.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 31bcfa4e08b9..0088bd45b892 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -149,6 +149,26 @@ void __init plat_time_init(void)
 	mips_hpt_frequency = freq;
 }
 
+static void __init bmips_ebase_reserve(void)
+{
+	phys_addr_t base, size = VECTORSPACING * 64;
+
+	switch (current_cpu_type()) {
+	default:
+	case CPU_BMIPS4350:
+		return;
+	case CPU_BMIPS3300:
+	case CPU_BMIPS4380:
+		base = 0x0400;
+		break;
+	case CPU_BMIPS5000:
+		base = 0x1000;
+		break;
+	}
+
+	memblock_reserve(base, size);
+}
+
 void __init plat_mem_setup(void)
 {
 	void *dtb;
@@ -169,6 +189,8 @@ void __init plat_mem_setup(void)
 
 	__dt_setup_arch(dtb);
 
+	bmips_ebase_reserve();
+
 	for (q = bmips_quirk_list; q->quirk_fn; q++) {
 		if (of_flat_dt_is_compatible(of_get_flat_dt_root(),
 					     q->compatible)) {
diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
index 6aa8f126a43d..0ba6bb7f9618 100644
--- a/arch/mips/include/asm/traps.h
+++ b/arch/mips/include/asm/traps.h
@@ -14,6 +14,8 @@
 #define MIPS_BE_FIXUP	1		/* return to the fixup code */
 #define MIPS_BE_FATAL	2		/* treat as an unrecoverable error */
 
+#define VECTORSPACING 0x100	/* for EI/VI mode */
+
 extern void (*board_be_init)(void);
 extern int (*board_be_handler)(struct pt_regs *regs, int is_fixup);
 
-- 
2.25.1


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB614447D67
	for <lists+linux-mips@lfdr.de>; Mon,  8 Nov 2021 11:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238591AbhKHKPo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Nov 2021 05:15:44 -0500
Received: from mail.skyhub.de ([5.9.137.197]:38490 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238590AbhKHKPT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Nov 2021 05:15:19 -0500
Received: from zn.tnic (p200300ec2f33110088892b77bd117736.dip0.t-ipconnect.de [IPv6:2003:ec:2f33:1100:8889:2b77:bd11:7736])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 49F0D1EC051E;
        Mon,  8 Nov 2021 11:12:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1636366354;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W2s1EFGhMHOcEo9LzjHqnnIb+mRIarXEJi4J0LQuZus=;
        b=VCNqWqJNOWaitZO2qCzD3LymvaAh2t0ad8vRceZSeK/Kt2VuJq8ukeHRQx/sgjqraI9G1e
        nhL1bSKkIiqztS6M/h+wv91BTxSBUVp4+gMBVwkus0vYA3FBAsYL+cQcyu3kJRU6VY4CJu
        gZvaJBTO18frzy7OzZUy0GEWpQpbb/M=
From:   Borislav Petkov <bp@alien8.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     linux-mips@vger.kernel.org
Subject: [PATCH v0 33/42] mips: Check notifier registration return value
Date:   Mon,  8 Nov 2021 11:11:48 +0100
Message-Id: <20211108101157.15189-34-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211108101157.15189-1-bp@alien8.de>
References: <20211108101157.15189-1-bp@alien8.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

Avoid homegrown notifier registration checks.

No functional changes.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/kernel/relocate.c     | 6 ++++--
 arch/mips/sgi-ip22/ip22-reset.c | 4 +++-
 arch/mips/sgi-ip32/ip32-reset.c | 4 +++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index 56b51de2dc51..d577654242da 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -459,8 +459,10 @@ static struct notifier_block kernel_location_notifier = {
 
 static int __init register_kernel_offset_dumper(void)
 {
-	atomic_notifier_chain_register(&panic_notifier_list,
-				       &kernel_location_notifier);
+	if (atomic_notifier_chain_register(&panic_notifier_list,
+					   &kernel_location_notifier))
+		pr_warn("Kernel location notifier already registered\n");
+
 	return 0;
 }
 __initcall(register_kernel_offset_dumper);
diff --git a/arch/mips/sgi-ip22/ip22-reset.c b/arch/mips/sgi-ip22/ip22-reset.c
index 9028dbbb45dd..841fd31cac03 100644
--- a/arch/mips/sgi-ip22/ip22-reset.c
+++ b/arch/mips/sgi-ip22/ip22-reset.c
@@ -196,7 +196,9 @@ static int __init reboot_setup(void)
 	}
 
 	timer_setup(&blink_timer, blink_timeout, 0);
-	atomic_notifier_chain_register(&panic_notifier_list, &panic_block);
+
+	if (atomic_notifier_chain_register(&panic_notifier_list, &panic_block))
+		pr_warn("Panic notifier already registered\n");
 
 	return 0;
 }
diff --git a/arch/mips/sgi-ip32/ip32-reset.c b/arch/mips/sgi-ip32/ip32-reset.c
index 18d1c115cd53..bdad9213f81b 100644
--- a/arch/mips/sgi-ip32/ip32-reset.c
+++ b/arch/mips/sgi-ip32/ip32-reset.c
@@ -145,7 +145,9 @@ static __init int ip32_reboot_setup(void)
 	pm_power_off = ip32_machine_halt;
 
 	timer_setup(&blink_timer, blink_timeout, 0);
-	atomic_notifier_chain_register(&panic_notifier_list, &panic_block);
+
+	if (atomic_notifier_chain_register(&panic_notifier_list, &panic_block))
+		pr_warn("Panic notifier already registered\n");
 
 	return 0;
 }
-- 
2.29.2


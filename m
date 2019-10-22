Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D91BE0861
	for <lists+linux-mips@lfdr.de>; Tue, 22 Oct 2019 18:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388761AbfJVQNW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Oct 2019 12:13:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:59768 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732188AbfJVQNW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Oct 2019 12:13:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id BE56BB384;
        Tue, 22 Oct 2019 16:13:20 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] MIPS: SGI-IP27: move registering of smp ops into IP27 specific code
Date:   Tue, 22 Oct 2019 18:13:12 +0200
Message-Id: <20191022161315.4194-2-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191022161315.4194-1-tbogendoerfer@suse.de>
References: <20191022161315.4194-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Calling register_smp_ops() in plat_mem_setup() is still early enough.
So by doing this we could remove the ugly #ifdef CONFIG_SGI_IP27 in
fw/arc/init.c.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/fw/arc/init.c          | 7 -------
 arch/mips/sgi-ip27/ip27-common.h | 1 +
 arch/mips/sgi-ip27/ip27-init.c   | 2 ++
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/mips/fw/arc/init.c b/arch/mips/fw/arc/init.c
index 7b663455de6b..4ac6466a8872 100644
--- a/arch/mips/fw/arc/init.c
+++ b/arch/mips/fw/arc/init.c
@@ -54,11 +54,4 @@ void __init prom_init(void)
 	ArcRead(0, &c, 1, &cnt);
 	ArcEnterInteractiveMode();
 #endif
-#ifdef CONFIG_SGI_IP27
-	{
-		extern const struct plat_smp_ops ip27_smp_ops;
-
-		register_smp_ops(&ip27_smp_ops);
-	}
-#endif
 }
diff --git a/arch/mips/sgi-ip27/ip27-common.h b/arch/mips/sgi-ip27/ip27-common.h
index e9e9f1dc8c20..3ffbcf9bfd41 100644
--- a/arch/mips/sgi-ip27/ip27-common.h
+++ b/arch/mips/sgi-ip27/ip27-common.h
@@ -5,5 +5,6 @@
 
 extern void ip27_reboot_setup(void);
 extern void hub_rt_clock_event_init(void);
+extern const struct plat_smp_ops ip27_smp_ops;
 
 #endif /* __IP27_COMMON_H */
diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index f48e2b3990f6..d160fb219d6d 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -120,6 +120,8 @@ void __init plat_mem_setup(void)
 	u64 p, e, n_mode;
 	nasid_t nid;
 
+	register_smp_ops(&ip27_smp_ops);
+
 	ip27_reboot_setup();
 
 	/*
-- 
2.16.4


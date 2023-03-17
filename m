Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA6126BE675
	for <lists+linux-mips@lfdr.de>; Fri, 17 Mar 2023 11:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjCQKUQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Mar 2023 06:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjCQKUN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Mar 2023 06:20:13 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D53A3A8C6D;
        Fri, 17 Mar 2023 03:20:11 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id m35so2981539wms.4;
        Fri, 17 Mar 2023 03:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679048410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2zyx3U3AXPDRFjYOKBt3zCYzGwvMHjuxaFvhcNGMYw=;
        b=K3QDrLd9/AHTE97KGupZsihjvv1DcPrg2e5kH4N0u/ThdjpSlxk4PJnJ9/W85XPSVY
         zfpR2A/7EoOEyo9550zL4/vmpfYl5lHM165L/lkqA7Wk5e/nBD9VnONeb+Ez793paFFp
         RxLrZ8g8vsw5NIz3niUCWkssoP2pnhKziF9soVnCQVqJa9NU+K+eBXiQWjYeXVVpf8Ea
         AoOekpaWai5FbM4COmKJ/BDQtrJNRfInvBhVWCCkHFy1S5u62UdueveL3+51NeXMtdqz
         SetdI7WF1tRyDt+Xg/KfChDi8C0UaNruqs4LXxNzfsB61BFNwRFhSKOZM1Upw0RCaBBt
         0+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679048410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2zyx3U3AXPDRFjYOKBt3zCYzGwvMHjuxaFvhcNGMYw=;
        b=ssmBiLA9DVCYeyC8re6arEIfPSvf12+ZaR/lSBvPJ7neJBPgX28RJgfWLbi9OusC5u
         wmSMBZ0qVjMyrcS6sYaOGQ56OxGeHkV1AoCPChp4/4gaWQJmyqY+2oPTGkA2+m0074uL
         T2+QW0Lur1M2SHucj+0efX80LEnRxP5vm9AM4eyLIlJ2QQxjgZXugBUhCrbZGXiEP9eB
         SdMQGSWQD8CGXoT5XdlsjsoVz1OD3eTQ473h9hoEzJJHt8iaev/cbakU+sXJp47LAOm+
         Z9lFp48X9PYKCMLnIpv9R7wDOZEuVUsFbSt+cWYjYhe/2pk81hq/6GoqwRg49d5RCGYg
         0yJQ==
X-Gm-Message-State: AO0yUKXr0uvEyGo9igqtrAKEBKNPRe53kAqRy0B/zeh/7tt0qOu9YtUj
        YMatgtK4nm//OUHE/4+7hlAo/t4+V2+khw==
X-Google-Smtp-Source: AK7set+XbAcnblyGYtZEQ3m/zbT8wd4QB6ZZhQIf//mcWDT47T1rsYpCDodIx9M1dCI0qTfC6sZw7w==
X-Received: by 2002:a05:600c:540a:b0:3ea:e582:48dd with SMTP id he10-20020a05600c540a00b003eae58248ddmr24486119wmb.34.1679048409764;
        Fri, 17 Mar 2023 03:20:09 -0700 (PDT)
Received: from atlantis.lan (255.red-79-146-124.dynamicip.rima-tde.net. [79.146.124.255])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c234100b003e00c453447sm7336512wmq.48.2023.03.17.03.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 03:20:09 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3] mips: bmips: BCM6358: disable RAC flush for TP1
Date:   Fri, 17 Mar 2023 11:20:04 +0100
Message-Id: <20230317102004.235879-1-noltari@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316180518.783613-1-noltari@gmail.com>
References: <20230316180518.783613-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

RAC flush causes kernel panics on BCM6358 with EHCI/OHCI when booting from TP1:
[    3.881739] usb 1-1: new high-speed USB device number 2 using ehci-platform
[    3.895011] Reserved instruction in kernel code[#1]:
[    3.900113] CPU: 0 PID: 1 Comm: init Not tainted 5.10.16 #0
[    3.905829] $ 0   : 00000000 10008700 00000000 77d94060
[    3.911238] $ 4   : 7fd1f088 00000000 81431cac 81431ca0
[    3.916641] $ 8   : 00000000 ffffefff 8075cd34 00000000
[    3.922043] $12   : 806f8d40 f3e812b7 00000000 000d9aaa
[    3.927446] $16   : 7fd1f068 7fd1f080 7ff559b8 81428470
[    3.932848] $20   : 00000000 00000000 55590000 77d70000
[    3.938251] $24   : 00000018 00000010
[    3.943655] $28   : 81430000 81431e60 81431f28 800157fc
[    3.949058] Hi    : 00000000
[    3.952013] Lo    : 00000000
[    3.955019] epc   : 80015808 setup_sigcontext+0x54/0x24c
[    3.960464] ra    : 800157fc setup_sigcontext+0x48/0x24c
[    3.965913] Status: 10008703	KERNEL EXL IE
[    3.970216] Cause : 00800028 (ExcCode 0a)
[    3.974340] PrId  : 0002a010 (Broadcom BMIPS4350)
[    3.979170] Modules linked in: ohci_platform ohci_hcd fsl_mph_dr_of ehci_platform ehci_fsl ehci_hcd gpio_button_hotplug usbcore nls_base usb_common
[    3.992907] Process init (pid: 1, threadinfo=(ptrval), task=(ptrval), tls=77e22ec8)
[    4.000776] Stack : 81431ef4 7fd1f080 81431f28 81428470 7fd1f068 81431edc 7ff559b8 81428470
[    4.009467]         81431f28 7fd1f080 55590000 77d70000 77d5498c 80015c70 806f0000 8063ae74
[    4.018149]         08100002 81431f28 0000000a 08100002 81431f28 0000000a 77d6b418 00000003
[    4.026831]         ffffffff 80016414 80080734 81431ecc 81431ecc 00000001 00000000 04000000
[    4.035512]         77d54874 00000000 00000000 00000000 00000000 00000012 00000002 00000000
[    4.044196]         ...
[    4.046706] Call Trace:
[    4.049238] [<80015808>] setup_sigcontext+0x54/0x24c
[    4.054356] [<80015c70>] setup_frame+0xdc/0x124
[    4.059015] [<80016414>] do_notify_resume+0x1dc/0x288
[    4.064207] [<80011b50>] work_notifysig+0x10/0x18
[    4.069036]
[    4.070538] Code: 8fc300b4  00001025  26240008 <ac820000> ac830004  3c048063  0c0228aa  24846a00  26240010
[    4.080686]
[    4.082517] ---[ end trace 22a8edb41f5f983b ]---
[    4.087374] Kernel panic - not syncing: Fatal exception
[    4.092753] Rebooting in 1 seconds..

Because the bootloader (CFE) is not initializing the Read-ahead cache properly
on the second thread (TP1). Since the RAC was not initialized properly, we
should avoid flushing it at the risk of corrupting the instruction stream as
seen in the trace above.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v3: add changes suggested by Florian:
   - Switch to a bool and remove unneeded initialization.
   - Remove if from bcm6358_quirks().
   - Improve commit description and bcm6358_quirks() comment.
 v2: check if we're running on TP1 and invert logic.

 arch/mips/bmips/dma.c   | 5 +++++
 arch/mips/bmips/setup.c | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/mips/bmips/dma.c b/arch/mips/bmips/dma.c
index 33788668cbdb..3779e7855bd7 100644
--- a/arch/mips/bmips/dma.c
+++ b/arch/mips/bmips/dma.c
@@ -5,6 +5,8 @@
 #include <asm/bmips.h>
 #include <asm/io.h>
 
+bool bmips_rac_flush_disable;
+
 void arch_sync_dma_for_cpu_all(void)
 {
 	void __iomem *cbr = BMIPS_GET_CBR();
@@ -15,6 +17,9 @@ void arch_sync_dma_for_cpu_all(void)
 	    boot_cpu_type() != CPU_BMIPS4380)
 		return;
 
+	if (unlikely(bmips_rac_flush_disable))
+		return;
+
 	/* Flush stale data out of the readahead cache */
 	cfg = __raw_readl(cbr + BMIPS_RAC_CONFIG);
 	__raw_writel(cfg | 0x100, cbr + BMIPS_RAC_CONFIG);
diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index e95b3f78e7cd..549a6392a3d2 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -35,6 +35,8 @@
 #define REG_BCM6328_OTP		((void __iomem *)CKSEG1ADDR(0x1000062c))
 #define BCM6328_TP1_DISABLED	BIT(9)
 
+extern bool bmips_rac_flush_disable;
+
 static const unsigned long kbase = VMLINUX_LOAD_ADDRESS & 0xfff00000;
 
 struct bmips_quirk {
@@ -104,6 +106,12 @@ static void bcm6358_quirks(void)
 	 * disable SMP for now
 	 */
 	bmips_smp_enabled = 0;
+
+	/*
+	 * RAC flush causes kernel panics on BCM6358 when booting from TP1
+	 * because the bootloader is not initializing it properly.
+	 */
+	bmips_rac_flush_disable = !!(read_c0_brcm_cmt_local() & (1 << 31));
 }
 
 static void bcm6368_quirks(void)
-- 
2.30.2


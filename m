Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA36E6BD7BE
	for <lists+linux-mips@lfdr.de>; Thu, 16 Mar 2023 19:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbjCPSF1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Mar 2023 14:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjCPSF0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Mar 2023 14:05:26 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99464EE9;
        Thu, 16 Mar 2023 11:05:24 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id q16so2347632wrw.2;
        Thu, 16 Mar 2023 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678989923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl1TqVgsmx65NezJ3aymjwsgc3S+FgnOyb7d8QaYUh8=;
        b=Jv4Xt/5P5QpmUglqe4zUtm4LYcNsajzB0OwBrCsfMdvUttpSsqypafmDRoUEWLL8jJ
         gOLuNO0fX5HTNv4cS7D0eB89a39mvnnsKzdsLPxbfgbdGlFUG3+Mkp355yFXvuGSRoRY
         zIoTGqnM5dmVWtllIC7o+3eUzb9LTZJexEJKchWj+WZN+ftSwGGOP6eAVVhPBScgPH2P
         qAAQ5z3oPluN9jl3T0kZKewSX6RKLEZNu1T4uaOuGrxeENmd0V4TcIlT4rc/4xAsaxHL
         Ujj/S40Et/zSsytNOUafSHU7ikyZHVtvrl2Bkd3fLGP5d52MDyUeU9XeTmUk40kE3Wnw
         qjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678989923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bl1TqVgsmx65NezJ3aymjwsgc3S+FgnOyb7d8QaYUh8=;
        b=VomlxCiE8C++BYhOAXVOrkM0ispXjg1Y1w6q65wVePkOW4kkKmicW/js+KlbxDFNe8
         CnOcRhYKtFT5cUCIN7c8fw0zy9yYEfRGk77R+xCaQIl4oAAojVOPpeO0DRaxFU5rpZIC
         JNKf1oBhG0gX6YFa5kSg5uHcdIWPxMAM7LARPWYqyb+H5xSqfTf5xyMHZ1Yi55h9j81o
         tEO27gL5qxu5B8hFEBLcD7A1RXVvDFaoAQywUNSb0ZfYfPBzIgXQpziJtiywMRNCpNxS
         NyoyqV7ozJk71YAgacvlGvQfqkeONVfyH8lzWmKdL9IqUW7xj+scGT5WRIB0o2To3XUE
         /5xQ==
X-Gm-Message-State: AO0yUKXBOmTtNSNUaZzeQYrbN6nIWWXs4JsuFuWYzC9zLOqUeGzImw00
        CtSQggWq63mUdj1HUEi5ojWPONHVq3ZQM4XQ
X-Google-Smtp-Source: AK7set+OT04rg9bmqswOceUthbpnjYLf4jS6+XJhouUHV2D2WpPHleFDdAMV6AZ8WX665/dcjHEpNA==
X-Received: by 2002:a5d:55d0:0:b0:2c7:6a6c:c71e with SMTP id i16-20020a5d55d0000000b002c76a6cc71emr4511941wrw.70.1678989923165;
        Thu, 16 Mar 2023 11:05:23 -0700 (PDT)
Received: from atlantis.lan (255.red-79-146-124.dynamicip.rima-tde.net. [79.146.124.255])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d65cb000000b002c55de1c72bsm29437wrw.62.2023.03.16.11.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 11:05:22 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2] mips: bmips: BCM6358: disable arch_sync_dma_for_cpu_all() for TP1
Date:   Thu, 16 Mar 2023 19:05:18 +0100
Message-Id: <20230316180518.783613-1-noltari@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230310121306.4632-1-noltari@gmail.com>
References: <20230310121306.4632-1-noltari@gmail.com>
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

arch_sync_dma_for_cpu_all() causes kernel panics on BCM6358 with EHCI/OHCI:
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

This only happens when booting from TP1 instead of TP0.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: check if we're running on TP1 and invert logic.

 arch/mips/bmips/dma.c   | 5 +++++
 arch/mips/bmips/setup.c | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/mips/bmips/dma.c b/arch/mips/bmips/dma.c
index 33788668cbdb..2e470ef8d30f 100644
--- a/arch/mips/bmips/dma.c
+++ b/arch/mips/bmips/dma.c
@@ -5,11 +5,16 @@
 #include <asm/bmips.h>
 #include <asm/io.h>
 
+int bmips_dma_sync_disable = 0;
+
 void arch_sync_dma_for_cpu_all(void)
 {
 	void __iomem *cbr = BMIPS_GET_CBR();
 	u32 cfg;
 
+	if (bmips_dma_sync_disable)
+		return;
+
 	if (boot_cpu_type() != CPU_BMIPS3300 &&
 	    boot_cpu_type() != CPU_BMIPS4350 &&
 	    boot_cpu_type() != CPU_BMIPS4380)
diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index e95b3f78e7cd..15543e8d5b0c 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -35,6 +35,8 @@
 #define REG_BCM6328_OTP		((void __iomem *)CKSEG1ADDR(0x1000062c))
 #define BCM6328_TP1_DISABLED	BIT(9)
 
+extern int bmips_dma_sync_disable;
+
 static const unsigned long kbase = VMLINUX_LOAD_ADDRESS & 0xfff00000;
 
 struct bmips_quirk {
@@ -104,6 +106,13 @@ static void bcm6358_quirks(void)
 	 * disable SMP for now
 	 */
 	bmips_smp_enabled = 0;
+
+	/*
+	 * ARCH_HAS_SYNC_DMA_FOR_CPU_ALL causes kernel panics on BCM6358 when
+	 * booting from TP1
+	 */
+	if (read_c0_brcm_cmt_local() & (1 << 31))
+		bmips_dma_sync_disable = 1;
 }
 
 static void bcm6368_quirks(void)
-- 
2.30.2


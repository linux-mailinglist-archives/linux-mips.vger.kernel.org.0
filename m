Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC592FC44A
	for <lists+linux-mips@lfdr.de>; Wed, 20 Jan 2021 00:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395390AbhASOSK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Jan 2021 09:18:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732586AbhASJWb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Jan 2021 04:22:31 -0500
Received: from yawp.biot.com (yawp.biot.com [IPv6:2a01:4f8:10a:8e::fce2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5BD6C0613D6
        for <linux-mips@vger.kernel.org>; Tue, 19 Jan 2021 01:21:46 -0800 (PST)
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1l1nCq-00EDvw-VW
        for linux-mips@vger.kernel.org; Tue, 19 Jan 2021 10:21:45 +0100
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on yawp
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.4
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8] (helo=sumner.biot.com)
        by yawp.biot.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1l1nCR-00EDsI-KL; Tue, 19 Jan 2021 10:21:19 +0100
Received: from bert by sumner.biot.com with local (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1l1nCR-000mDQ-5z; Tue, 19 Jan 2021 10:21:19 +0100
From:   Bert Vermeulen <bert@biot.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>,
        John Crispin <john@phrozen.org>,
        Birger Koblitz <mail@birger-koblitz.de>
Cc:     Bert Vermeulen <bert@biot.com>
Subject: [PATCH v4 3/5] MIPS: Add Realtek RTL838x/RTL839x support as generic MIPS system
Date:   Tue, 19 Jan 2021 10:21:07 +0100
Message-Id: <20210119092109.185282-4-bert@biot.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119092109.185282-1-bert@biot.com>
References: <20210119092109.185282-1-bert@biot.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is just enough system to boot the kernel with earlycon working.

Signed-off-by: Bert Vermeulen <bert@biot.com>
Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 arch/mips/Kconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0a17bedf4f0d..0986d0c4405f 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -627,6 +627,27 @@ config RALINK
 	select ARCH_HAS_RESET_CONTROLLER
 	select RESET_CONTROLLER
 
+config MACH_REALTEK_RTL
+	bool "Realtek RTL838x/RTL839x based machines"
+	select MIPS_GENERIC
+	select DMA_NONCOHERENT
+	select IRQ_MIPS_CPU
+	select CSRC_R4K
+	select CEVT_R4K
+	select SYS_HAS_CPU_MIPS32_R1
+	select SYS_HAS_CPU_MIPS32_R2
+	select SYS_SUPPORTS_BIG_ENDIAN
+	select SYS_SUPPORTS_32BIT_KERNEL
+	select SYS_SUPPORTS_MIPS16
+	select SYS_SUPPORTS_MULTITHREADING
+	select SYS_SUPPORTS_VPE_LOADER
+	select SYS_HAS_EARLY_PRINTK
+	select SYS_HAS_EARLY_PRINTK_8250
+	select USE_GENERIC_EARLY_PRINTK_8250
+	select BOOT_RAW
+	select PINCTRL
+	select USE_OF
+
 config SGI_IP22
 	bool "SGI IP22 (Indy/Indigo2)"
 	select ARC_MEMORY
-- 
2.25.1


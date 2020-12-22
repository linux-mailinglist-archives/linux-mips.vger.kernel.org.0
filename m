Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB4502E0F69
	for <lists+linux-mips@lfdr.de>; Tue, 22 Dec 2020 21:35:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727245AbgLVUeH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Dec 2020 15:34:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgLVUeH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Dec 2020 15:34:07 -0500
Received: from yawp.biot.com (yawp.biot.com [IPv6:2a01:4f8:10a:8e::fce2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDDA8C0613D3
        for <linux-mips@vger.kernel.org>; Tue, 22 Dec 2020 12:33:26 -0800 (PST)
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kroLU-009H7L-0o
        for linux-mips@vger.kernel.org; Tue, 22 Dec 2020 21:33:24 +0100
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on yawp
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.4
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8] (helo=sumner.biot.com)
        by yawp.biot.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kroL3-009H6j-J2; Tue, 22 Dec 2020 21:32:57 +0100
Received: from bert by sumner.biot.com with local (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kroL3-006FNb-34; Tue, 22 Dec 2020 21:32:57 +0100
From:   Bert Vermeulen <bert@biot.com>
To:     Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org (open list:MIPS GENERIC PLATFORM),
        linux-kernel@vger.kernel.org (open list)
Cc:     Bert Vermeulen <bert@biot.com>
Subject: [PATCH] arch: mips: Remove unused BOARD_INGENIC Kconfig option
Date:   Tue, 22 Dec 2020 21:32:39 +0100
Message-Id: <20201222203239.1489040-1-bert@biot.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Board support depends on MACH_INGENIC, not BOARD_INGENIC.

Signed-off-by: Bert Vermeulen <bert@biot.com>
---
 arch/mips/generic/Kconfig | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/mips/generic/Kconfig b/arch/mips/generic/Kconfig
index 55d9aed7ced9..5216c850b7e2 100644
--- a/arch/mips/generic/Kconfig
+++ b/arch/mips/generic/Kconfig
@@ -73,12 +73,6 @@ config FIT_IMAGE_FDT_OCELOT
 	  from Microsemi in the FIT kernel image.
 	  This requires u-boot on the platform.
 
-config BOARD_INGENIC
-	bool "Support boards based on Ingenic SoCs"
-	select MACH_INGENIC_GENERIC
-	help
-	  Enable support for boards based on Ingenic SoCs.
-
 config VIRT_BOARD_RANCHU
 	bool "Support Ranchu platform for Android emulator"
 	help
-- 
2.25.1


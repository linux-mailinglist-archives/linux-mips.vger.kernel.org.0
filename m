Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 976675BBD62
	for <lists+linux-mips@lfdr.de>; Sun, 18 Sep 2022 12:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbiIRKNI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 18 Sep 2022 06:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiIRKNI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 18 Sep 2022 06:13:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC20192B8
        for <linux-mips@vger.kernel.org>; Sun, 18 Sep 2022 03:13:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B4A9FB80AF1
        for <linux-mips@vger.kernel.org>; Sun, 18 Sep 2022 10:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8D3C433D6;
        Sun, 18 Sep 2022 10:13:02 +0000 (UTC)
From:   Huacai Chen <chenhuacai@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/mips: Adjust Kconfig to keep consistency
Date:   Sun, 18 Sep 2022 18:12:06 +0800
Message-Id: <20220918101206.2381321-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Drop the "if MIPS" and "endif" drivers/platform/Kconfig. Instead add
a "depends on MIPS" to "menuconfig MIPS_PLATFORM_DEVICES" in drivers/
platform/mips/Kconfig, like all the other subdirs are doing.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/platform/Kconfig      | 2 --
 drivers/platform/mips/Kconfig | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index b437847b6237..8ddfe5ce153f 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -1,7 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-if MIPS
 source "drivers/platform/mips/Kconfig"
-endif
 
 source "drivers/platform/goldfish/Kconfig"
 
diff --git a/drivers/platform/mips/Kconfig b/drivers/platform/mips/Kconfig
index 6b51ad01f791..fb4ac4b08e89 100644
--- a/drivers/platform/mips/Kconfig
+++ b/drivers/platform/mips/Kconfig
@@ -6,6 +6,7 @@
 menuconfig MIPS_PLATFORM_DEVICES
 	bool "MIPS Platform Specific Device Drivers"
 	default y
+	depends on MIPS
 	help
 	  Say Y here to get to see options for device drivers of various
 	  MIPS platforms, including vendor-specific netbook/laptop/desktop
-- 
2.31.1


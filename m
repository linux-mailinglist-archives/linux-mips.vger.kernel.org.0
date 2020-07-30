Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE52233668
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jul 2020 18:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgG3QMw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jul 2020 12:12:52 -0400
Received: from crapouillou.net ([89.234.176.41]:47216 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbgG3QMw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Jul 2020 12:12:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1596125562; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L7c3BbdvXEeBcbyvPR7oP4kQXz+lCc1qTz+IvvC8fbM=;
        b=RjK2M9+tePUSy8nHG44j1gGEg0xZdqIhPqcJdOes4G7rhO08VvqP7T8YCn5pgIXvojtLMz
        d1lGzlX6MFSJ8iLyVMv4p5EFPgjWlcRmeFEfFik1KKtEOP+cEYx/5aaQW+eZ3NJC7ovdNw
        lu7IesRFhyz1JjnqAftprWHiqDApeQA=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/4] MIPS: ingenic: Use fw_passed_dtb even if CONFIG_BUILTIN_DTB
Date:   Thu, 30 Jul 2020 18:12:31 +0200
Message-Id: <20200730161233.61876-2-paul@crapouillou.net>
In-Reply-To: <20200730161233.61876-1-paul@crapouillou.net>
References: <20200730161233.61876-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The fw_passed_dtb is now properly initialized even when
CONFIG_BUILTIN_DTB is used, so there's no need to handle it in any
particular way here.

Note that the behaviour is slightly different, as the previous code used
the built-in Device Tree unconditionally, while now the built-in Device
Tree is only used when the bootloader did not provide one.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/jz4740/setup.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
index fc49601c2b96..d73c9b722bf3 100644
--- a/arch/mips/jz4740/setup.c
+++ b/arch/mips/jz4740/setup.c
@@ -67,13 +67,8 @@ static unsigned long __init get_board_mach_type(const void *fdt)
 
 void __init plat_mem_setup(void)
 {
+	void *dtb = (void *)fw_passed_dtb;
 	int offset;
-	void *dtb;
-
-	if (__dtb_start != __dtb_end)
-		dtb = __dtb_start;
-	else
-		dtb = (void *)fw_passed_dtb;
 
 	__dt_setup_arch(dtb);
 
-- 
2.27.0


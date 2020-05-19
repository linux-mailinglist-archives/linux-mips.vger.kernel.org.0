Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31FD51DA36C
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2020 23:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgESVWv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 May 2020 17:22:51 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:45418 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgESVWv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 May 2020 17:22:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1589923369; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=BuRPQBqHnjZ2+wIqE/yHBKVmb3SzIuf0bq1ICkMPZew=;
        b=HeLFYA5a41HFYXskbEK0HRM8TTD7Gyg9ER6f9v+a4zinKKcsM+cI6cItCFe/zPTz4Egpj9
        OzgxtmPapiH2Y6sncQixa16dwjgBmDtYv4hOmYR8/8LQ09mBMcJAJ4OnTj5shDh8JBP1C8
        XY3kg/Mgxe9rSiP2Umsd+XBhfQifhP4=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH] MIPS: ingenic: Add missing include
Date:   Tue, 19 May 2020 23:22:30 +0200
Message-Id: <20200519212230.313365-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add missing include which adds the prototype to plat_time_init().

Fixes: f932449c11da ("MIPS: ingenic: Drop obsolete code, merge the rest in setup.c")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reported-by: kbuild test robot <lkp@intel.com>
---
 arch/mips/jz4740/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
index 81428ddcaa97..c627fbd90892 100644
--- a/arch/mips/jz4740/setup.c
+++ b/arch/mips/jz4740/setup.c
@@ -20,6 +20,7 @@
 #include <asm/fw/fw.h>
 #include <asm/prom.h>
 #include <asm/reboot.h>
+#include <asm/time.h>
 
 #define JZ4740_EMC_BASE_ADDR 0x13010000
 
-- 
2.26.2


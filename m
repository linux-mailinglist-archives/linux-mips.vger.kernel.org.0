Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 342F1380A49
	for <lists+linux-mips@lfdr.de>; Fri, 14 May 2021 15:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbhENNTK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 May 2021 09:19:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:52146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230075AbhENNTJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 14 May 2021 09:19:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CC3A61451;
        Fri, 14 May 2021 13:17:56 +0000 (UTC)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] MIPS: ralink: of: fix build of rt2880_wdt watchdog module
Date:   Fri, 14 May 2021 09:17:50 -0400
Message-Id: <20210514131750.52867-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When rt2880_wdt watchdog driver is built as a module, the
rt_sysc_membase needs to be exported (it is being used via inlined
rt_sysc_r32):

  ERROR: modpost: "rt_sysc_membase" [drivers/watchdog/rt2880_wdt.ko] undefined!

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/mips/ralink/of.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/ralink/of.c b/arch/mips/ralink/of.c
index 0c5de07da097..b3ce706426c4 100644
--- a/arch/mips/ralink/of.c
+++ b/arch/mips/ralink/of.c
@@ -24,6 +24,8 @@
 #include "common.h"
 
 __iomem void *rt_sysc_membase;
+EXPORT_SYMBOL_GPL(rt_sysc_membase);
+
 __iomem void *rt_memc_membase;
 
 __iomem void *plat_of_remap_node(const char *node)
-- 
2.27.0


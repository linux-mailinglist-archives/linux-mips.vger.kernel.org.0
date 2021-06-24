Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC853B2568
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jun 2021 05:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhFXDY7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Jun 2021 23:24:59 -0400
Received: from lucky1.263xmail.com ([211.157.147.134]:49390 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbhFXDY7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Jun 2021 23:24:59 -0400
Received: from localhost (unknown [192.168.167.70])
        by lucky1.263xmail.com (Postfix) with ESMTP id 37938CEFC8;
        Thu, 24 Jun 2021 11:22:18 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.240.82.166])
        by smtp.263.net (postfix) whith ESMTP id P13447T140124964771584S1624504933892933_;
        Thu, 24 Jun 2021 11:22:18 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <2579a99a4ebe421840c505abf824e66b>
X-RL-SENDER: zhanglianjie@uniontech.com
X-SENDER: zhanglianjie@uniontech.com
X-LOGIN-NAME: zhanglianjie@uniontech.com
X-FST-TO: tsbogend@alpha.franken.de
X-RCPT-COUNT: 5
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   zhanglianjie <zhanglianjie@uniontech.com>
To:     tsbogend@alpha.franken.de
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        tangyouling@loongson.cn, zhanglianjie <zhanglianjie@uniontech.com>
Subject: [PATCH] mm: Fix the problem of mips architecture Oops
Date:   Thu, 24 Jun 2021 11:22:12 +0800
Message-Id: <20210624032212.24769-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The cause of the problem is as follows:
1. when cat /sys/devices/system/memory/memory0/valid_zones,
   test_pages_in_a_zone() will be called.
2. test_pages_in_a_zone() finds the zone according to stat_pfn = 0.
   The smallest pfn of the numa node in the mips architecture is 128,
   and the page corresponding to the previous 0~127 pfn is not
   initialized (page->flags is 0xFFFFFFFF)
3. The nid and zonenum obtained using page_zone(pfn_to_page(0)) are out
   of bounds in the corresponding array,
   &NODE_DATA(page_to_nid(page))->node_zones[page_zonenum(page)],
   access to the out-of-bounds zone member variables appear abnormal,
   resulting in Oops.
Therefore, it is necessary to keep the page between 0 and the minimum
pfn to prevent Oops from appearing.

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
---
 arch/mips/kernel/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 23a140327a0b..f1da2b2ba5e9 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -653,6 +653,8 @@ static void __init arch_mem_init(char **cmdline_p)
 	 */
 	memblock_set_current_limit(PFN_PHYS(max_low_pfn));

+	memblock_reserve(0, PAGE_SIZE * NODE_DATA(0)->node_start_pfn);
+
 	mips_reserve_vmcore();

 	mips_parse_crashkernel();
--
2.20.1




Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7C6317BD35
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 13:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbgCFMtU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 07:49:20 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:35734 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727366AbgCFMtU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Mar 2020 07:49:20 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id CB9728030793;
        Fri,  6 Mar 2020 12:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7kX8u0FVca63; Fri,  6 Mar 2020 15:49:18 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 20/22] mips: csrc-r4k: Decrease r4k-clocksource rating if CPU_FREQ enabled
Date:   Fri, 6 Mar 2020 15:47:03 +0300
In-Reply-To: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306124918.CB9728030793@mail.baikalelectronics.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Commit 07d69579e7fe ("MIPS: Don't register r4k sched clock when
CPUFREQ enabled") disabled the r4k-clock usage for scheduler ticks
counting due to the scheduler being non-tolerant for unstable
clocks sources. For the same reason the clock should be used
in the system clocksource framework only as a last resort if CPU
frequency may change.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 arch/mips/kernel/csrc-r4k.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/kernel/csrc-r4k.c b/arch/mips/kernel/csrc-r4k.c
index eed099f35bf1..78ffc105226c 100644
--- a/arch/mips/kernel/csrc-r4k.c
+++ b/arch/mips/kernel/csrc-r4k.c
@@ -71,7 +71,11 @@ int __init init_r4k_clocksource(void)
 		return -ENXIO;
 
 	/* Calculate a somewhat reasonable rating value */
+#ifndef CONFIG_CPU_FREQ
 	clocksource_mips.rating = 200 + mips_hpt_frequency / 10000000;
+#else
+	clocksource_mips.rating = 99;
+#endif
 
 	/*
 	 * R2 onwards makes the count accessible to user mode so it can be used
-- 
2.25.1


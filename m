Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB3210229B
	for <lists+linux-mips@lfdr.de>; Tue, 19 Nov 2019 12:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfKSLJG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Nov 2019 06:09:06 -0500
Received: from mx2.suse.de ([195.135.220.15]:53464 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725798AbfKSLJG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 19 Nov 2019 06:09:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6B7A7B487;
        Tue, 19 Nov 2019 11:09:04 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MIPS: SGI-IP27: Fix crash, when CPUs are disabled via nr_cpus parameter
Date:   Tue, 19 Nov 2019 12:08:56 +0100
Message-Id: <20191119110857.28540-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If number of CPUs are limited by the kernel commandline parameter nr_cpus
assignment of interrupts accourding to numa rules might not be possibe.
As a fallback use one of the online CPUs as interrupt destination.

Fixes: 69a07a41d908 ("MIPS: SGI-IP27: rework HUB interrupts")
Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/sgi-ip27/ip27-irq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/sgi-ip27/ip27-irq.c b/arch/mips/sgi-ip27/ip27-irq.c
index 5aef06e28a5b..c72ae330ea93 100644
--- a/arch/mips/sgi-ip27/ip27-irq.c
+++ b/arch/mips/sgi-ip27/ip27-irq.c
@@ -73,6 +73,9 @@ static void setup_hub_mask(struct hub_irq_data *hd, const struct cpumask *mask)
 	int cpu;
 
 	cpu = cpumask_first_and(mask, cpu_online_mask);
+	if (cpu >= nr_cpu_ids)
+		cpu = cpumask_any(cpu_online_mask);
+
 	nasid = cpu_to_node(cpu);
 	hd->cpu = cpu;
 	if (!cputoslice(cpu)) {
@@ -139,6 +142,7 @@ static int hub_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	/* use CPU connected to nearest hub */
 	hub = hub_data(info->nasid);
 	setup_hub_mask(hd, &hub->h_cpus);
+	info->nasid = cpu_to_node(hd->cpu);
 
 	/* Make sure it's not already pending when we connect it. */
 	REMOTE_HUB_CLR_INTR(info->nasid, swlevel);
-- 
2.16.4


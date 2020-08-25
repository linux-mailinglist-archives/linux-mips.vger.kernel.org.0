Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49044251507
	for <lists+linux-mips@lfdr.de>; Tue, 25 Aug 2020 11:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgHYJJU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Aug 2020 05:09:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:50066 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728808AbgHYJJO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Aug 2020 05:09:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5AFA0B035;
        Tue, 25 Aug 2020 09:09:43 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] MIPS: SGI-IP32: No need to include mc14818*.h
Date:   Tue, 25 Aug 2020 11:09:07 +0200
Message-Id: <20200825090907.66681-4-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200825090907.66681-1-tsbogend@alpha.franken.de>
References: <20200825090907.66681-1-tsbogend@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Nothing needs the includes in ip32-setup.c.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/sgi-ip32/ip32-setup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/sgi-ip32/ip32-setup.c b/arch/mips/sgi-ip32/ip32-setup.c
index 3abd1465ec02..8019dae1721a 100644
--- a/arch/mips/sgi-ip32/ip32-setup.c
+++ b/arch/mips/sgi-ip32/ip32-setup.c
@@ -12,12 +12,10 @@
 #include <linux/console.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
-#include <linux/mc146818rtc.h>
 #include <linux/param.h>
 #include <linux/sched.h>
 
 #include <asm/bootinfo.h>
-#include <asm/mc146818-time.h>
 #include <asm/mipsregs.h>
 #include <asm/mmu_context.h>
 #include <asm/sgialib.h>
-- 
2.16.4


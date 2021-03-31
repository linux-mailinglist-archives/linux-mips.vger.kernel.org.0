Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D1034FFC7
	for <lists+linux-mips@lfdr.de>; Wed, 31 Mar 2021 13:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235289AbhCaL4g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Mar 2021 07:56:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:51730 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235014AbhCaL4G (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 31 Mar 2021 07:56:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 167F7B1E0;
        Wed, 31 Mar 2021 11:56:05 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     hch@lst.de
Subject: [PATCH v2 1/4] MIPS: kernel: Remove not needed set_fs calls
Date:   Wed, 31 Mar 2021 13:55:58 +0200
Message-Id: <20210331115603.146159-2-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331115603.146159-1-tsbogend@alpha.franken.de>
References: <20210331115603.146159-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

flush_icache_range always does flush kernel address ranges, so no
need to do the set_fs dance.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/kernel/ftrace.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
index 666b9969c1bd..8c401e42301c 100644
--- a/arch/mips/kernel/ftrace.c
+++ b/arch/mips/kernel/ftrace.c
@@ -90,7 +90,6 @@ static int ftrace_modify_code_2(unsigned long ip, unsigned int new_code1,
 				unsigned int new_code2)
 {
 	int faulted;
-	mm_segment_t old_fs;
 
 	safe_store_code(new_code1, ip, faulted);
 	if (unlikely(faulted))
@@ -102,10 +101,7 @@ static int ftrace_modify_code_2(unsigned long ip, unsigned int new_code1,
 		return -EFAULT;
 
 	ip -= 4;
-	old_fs = get_fs();
-	set_fs(KERNEL_DS);
 	flush_icache_range(ip, ip + 8);
-	set_fs(old_fs);
 
 	return 0;
 }
@@ -114,7 +110,6 @@ static int ftrace_modify_code_2r(unsigned long ip, unsigned int new_code1,
 				 unsigned int new_code2)
 {
 	int faulted;
-	mm_segment_t old_fs;
 
 	ip += 4;
 	safe_store_code(new_code2, ip, faulted);
@@ -126,10 +121,7 @@ static int ftrace_modify_code_2r(unsigned long ip, unsigned int new_code1,
 	if (unlikely(faulted))
 		return -EFAULT;
 
-	old_fs = get_fs();
-	set_fs(KERNEL_DS);
 	flush_icache_range(ip, ip + 8);
-	set_fs(old_fs);
 
 	return 0;
 }
-- 
2.29.2


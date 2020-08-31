Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C821725829B
	for <lists+linux-mips@lfdr.de>; Mon, 31 Aug 2020 22:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbgHaU3e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Aug 2020 16:29:34 -0400
Received: from mx2.suse.de ([195.135.220.15]:38736 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726167AbgHaU3e (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 31 Aug 2020 16:29:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 84576AD39;
        Mon, 31 Aug 2020 20:29:32 +0000 (UTC)
From:   Davidlohr Bueso <dave@stgolabs.net>
To:     tsbogend@alpha.franken.de
Cc:     oleg@redhat.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dave@stgolabs.net,
        Davidlohr Bueso <dbueso@suse.de>
Subject: [PATCH] MIPS: Use rcu to lookup a task in mipsmt_sys_sched_setaffinity()
Date:   Mon, 31 Aug 2020 13:14:02 -0700
Message-Id: <20200831201402.2837-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The call simply looks up the corresponding task (without iterating
the tasklist), which is safe under rcu instead of the tasklist_lock.
In addition, the setaffinity counter part already does this.

Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
---
 arch/mips/kernel/mips-mt-fpaff.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/mips-mt-fpaff.c b/arch/mips/kernel/mips-mt-fpaff.c
index 1a08428eedcf..6c590ef27648 100644
--- a/arch/mips/kernel/mips-mt-fpaff.c
+++ b/arch/mips/kernel/mips-mt-fpaff.c
@@ -167,7 +167,7 @@ asmlinkage long mipsmt_sys_sched_getaffinity(pid_t pid, unsigned int len,
 		return -EINVAL;
 
 	get_online_cpus();
-	read_lock(&tasklist_lock);
+	rcu_read_lock();
 
 	retval = -ESRCH;
 	p = find_process_by_pid(pid);
@@ -181,7 +181,7 @@ asmlinkage long mipsmt_sys_sched_getaffinity(pid_t pid, unsigned int len,
 	cpumask_and(&mask, &allowed, cpu_active_mask);
 
 out_unlock:
-	read_unlock(&tasklist_lock);
+	rcu_read_unlock();
 	put_online_cpus();
 	if (retval)
 		return retval;
-- 
2.26.2


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8773F3DEFE2
	for <lists+linux-mips@lfdr.de>; Tue,  3 Aug 2021 16:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236483AbhHCORS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Aug 2021 10:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236488AbhHCORR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Aug 2021 10:17:17 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9747EC06175F;
        Tue,  3 Aug 2021 07:17:06 -0700 (PDT)
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1628000225;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=myV3fFPpmckxFi8iG+1Cz4HE7geihL0CQ+OBM5u9Dbk=;
        b=g2RGayE7tYJ78jHshfPZKWu5U5dR72hCbCO1rsQHagt9X7BHN68a8LUoBHtBq48oPWseii
        xv68Biasr4LjXE3GkNSkIoUD/rIh5GbfaJL9w1laDLWZzdSRV8B9+H32R3RWPCNPC9WA7h
        Xlvcs9eyUlwYCfjTRofzo/VUZHRe1UpcGy6nZHqUhfn0sbzhFqSS3yRBcj5CeB56QeQpgf
        XaxXqJjOx2+8eIDrCx1pTGazRBJTR+96a11/+KgImr4XdUtrQT0Mj0X8leV6+HmzvTPBnX
        Z9iLwn5xy5I8iXDdU0P/WCEa6eyBDSUxdzy4J//JxG7d4LswGV7NuCegCV5CPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1628000225;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=myV3fFPpmckxFi8iG+1Cz4HE7geihL0CQ+OBM5u9Dbk=;
        b=EOz/aqqRv+PoPnF3qErKabqMDj7hgItZeIjKJNOZHB4wZs6VB+l82ZuzfLyQ9emawL5PeM
        uz+dzyv6P9PsRsBA==
To:     linux-kernel@vger.kernel.org
Cc:     tglx@linutronix.de, Peter Zijlstra <peterz@infradead.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH 02/38] MIPS: Replace deprecated CPU-hotplug functions.
Date:   Tue,  3 Aug 2021 16:15:45 +0200
Message-Id: <20210803141621.780504-3-bigeasy@linutronix.de>
In-Reply-To: <20210803141621.780504-1-bigeasy@linutronix.de>
References: <20210803141621.780504-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The functions get_online_cpus() and put_online_cpus() have been
deprecated during the CPU hotplug rework. They map directly to
cpus_read_lock() and cpus_read_unlock().

Replace deprecated CPU-hotplug functions with the official version.
The behavior remains unchanged.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/mips/kernel/mips-mt-fpaff.c | 10 +++++-----
 arch/mips/kernel/process.c       |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/mips/kernel/mips-mt-fpaff.c b/arch/mips/kernel/mips-mt-fp=
aff.c
index 6c590ef276482..67e130d3f0385 100644
--- a/arch/mips/kernel/mips-mt-fpaff.c
+++ b/arch/mips/kernel/mips-mt-fpaff.c
@@ -76,13 +76,13 @@ asmlinkage long mipsmt_sys_sched_setaffinity(pid_t pid,=
 unsigned int len,
 	if (copy_from_user(&new_mask, user_mask_ptr, sizeof(new_mask)))
 		return -EFAULT;
=20
-	get_online_cpus();
+	cpus_read_lock();
 	rcu_read_lock();
=20
 	p =3D find_process_by_pid(pid);
 	if (!p) {
 		rcu_read_unlock();
-		put_online_cpus();
+		cpus_read_unlock();
 		return -ESRCH;
 	}
=20
@@ -147,7 +147,7 @@ asmlinkage long mipsmt_sys_sched_setaffinity(pid_t pid,=
 unsigned int len,
 	free_cpumask_var(cpus_allowed);
 out_put_task:
 	put_task_struct(p);
-	put_online_cpus();
+	cpus_read_unlock();
 	return retval;
 }
=20
@@ -166,7 +166,7 @@ asmlinkage long mipsmt_sys_sched_getaffinity(pid_t pid,=
 unsigned int len,
 	if (len < real_len)
 		return -EINVAL;
=20
-	get_online_cpus();
+	cpus_read_lock();
 	rcu_read_lock();
=20
 	retval =3D -ESRCH;
@@ -182,7 +182,7 @@ asmlinkage long mipsmt_sys_sched_getaffinity(pid_t pid,=
 unsigned int len,
=20
 out_unlock:
 	rcu_read_unlock();
-	put_online_cpus();
+	cpus_read_unlock();
 	if (retval)
 		return retval;
 	if (copy_to_user(user_mask_ptr, &mask, real_len))
diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 73c8e7990a973..95aa86fa60778 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -859,10 +859,10 @@ int mips_set_process_fp_mode(struct task_struct *task=
, unsigned int value)
 	 * scheduled in then it will already have picked up the new FP mode
 	 * whilst doing so.
 	 */
-	get_online_cpus();
+	cpus_read_lock();
 	for_each_cpu_and(cpu, &process_cpus, cpu_online_mask)
 		work_on_cpu(cpu, prepare_for_fp_mode_switch, NULL);
-	put_online_cpus();
+	cpus_read_unlock();
=20
 	return 0;
 }
--=20
2.32.0


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE76411FCC6
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2019 03:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbfLPCSb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Dec 2019 21:18:31 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47684 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726299AbfLPCSa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 15 Dec 2019 21:18:30 -0500
Received: from localhost.loongson.cn (unknown [10.40.23.36])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX9ZP6fZddEkLAA--.98S2;
        Mon, 16 Dec 2019 10:17:51 +0800 (CST)
From:   Guoyun Sun <sunguoyun@loongson.cn>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        David Howells <dhowells@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Guoyun Sun <sunguoyun@loongson.cn>
Subject: [PATCH V3] MIPS: Add get_thread_area syscall
Date:   Mon, 16 Dec 2019 10:17:51 +0800
Message-Id: <1576462671-7226-1-git-send-email-sunguoyun@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxX9ZP6fZddEkLAA--.98S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF17XryxXw48Cr17GrWDXFb_yoWrJF48pF
        WUAw1kKw4rury8Aa4fCF1kurWxJr1kXrWjgFZ7trZ8Z3W0qry5tr1Sga4rXFya9ryIkay0
        ga1F9ry5t3yvvF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        W8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
        McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7
        v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF
        7I0E8cxan2IY04v7MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
        WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
        67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
        IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
        IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
        C2KfnxnUUI43ZEXa7VUb0D73UUUUU==
X-CM-SenderInfo: 5vxqw3hr1x0qxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CRIU(https://criu.org/) tools will dump TLS(Thread Local Storage) by
get_thread_area during checkpoint and restore TLS by set_thread_area during
restore. without this syscall, criu restore will fail on MIPS platform
because a variable with GCC __thread will be invalid.

The following function will be called when criu restore

static inline void restore_tls(tls_t *ptls) {
        asm volatile(
                     "move $4, %0                                   \n"
                     "li $2,  "__stringify(__NR_set_thread_area)"  \n"
                     "syscall                                       \n"
                     :
                     : "r"(*ptls)
                     : "$4","$2","memory");

the *ptls can be obtained by get_thread_area on MIPS platform when criu
checkpoint. just like this:

static inline void arch_get_tls(tls_t *ptls)
{
	asm volatile(
		     "move $4, %0				    \n"
		     "li $2,  "__stringify(__NR_get_thread_area)"  \n"
		     "syscall					    \n"
		     :
		     : "r"(ptls)
		     : "$4","$2","memory");

}

Signed-off-by: Guoyun Sun <sunguoyun@loongson.cn>
---
 arch/mips/kernel/syscall.c                | 11 +++++++++++
 arch/mips/kernel/syscalls/syscall_n32.tbl |  2 ++
 arch/mips/kernel/syscalls/syscall_n64.tbl |  2 ++
 arch/mips/kernel/syscalls/syscall_o32.tbl |  2 ++
 4 files changed, 17 insertions(+)

diff --git a/arch/mips/kernel/syscall.c b/arch/mips/kernel/syscall.c
index c333e57..7ac78bf 100644
--- a/arch/mips/kernel/syscall.c
+++ b/arch/mips/kernel/syscall.c
@@ -27,6 +27,7 @@
 #include <linux/slab.h>
 #include <linux/elf.h>
 #include <linux/sched/task_stack.h>
+#include <linux/compat.h>
 
 #include <asm/asm.h>
 #include <asm/asm-eva.h>
@@ -94,6 +95,16 @@ SYSCALL_DEFINE1(set_thread_area, unsigned long, addr)
 	return 0;
 }
 
+SYSCALL_DEFINE1(get_thread_area, unsigned long __user *, u_info)
+{
+	struct thread_info *ti = task_thread_info(current);
+
+	if (in_compat_syscall())
+		return put_user(ti->tp_value, (__u32 *)u_info);
+
+	return put_user(ti->tp_value, u_info);
+}
+
 static inline int mips_atomic_set(unsigned long addr, unsigned long new)
 {
 	unsigned long old, tmp;
diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
index e7c5ab3..3aa4858 100644
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@ -341,6 +341,8 @@
 330	n32	statx				sys_statx
 331	n32	rseq				sys_rseq
 332	n32	io_pgetevents			compat_sys_io_pgetevents
+333	n32	get_thread_area			sys_get_thread_area
+
 # 333 through 402 are unassigned to sync up with generic numbers
 403	n32	clock_gettime64			sys_clock_gettime
 404	n32	clock_settime64			sys_clock_settime
diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/syscalls/syscall_n64.tbl
index 13cd665..14b6796 100644
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@ -337,6 +337,8 @@
 326	n64	statx				sys_statx
 327	n64	rseq				sys_rseq
 328	n64	io_pgetevents			sys_io_pgetevents
+329	n64	get_thread_area			sys_get_thread_area
+
 # 329 through 423 are reserved to sync up with other architectures
 424	n64	pidfd_send_signal		sys_pidfd_send_signal
 425	n64	io_uring_setup			sys_io_uring_setup
diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index 353539e..bb4e050 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -380,6 +380,8 @@
 366	o32	statx				sys_statx
 367	o32	rseq				sys_rseq
 368	o32	io_pgetevents			sys_io_pgetevents_time32	compat_sys_io_pgetevents
+369	o32	get_thread_area			sys_get_thread_area
+
 # room for arch specific calls
 393	o32	semget				sys_semget
 394	o32	semctl				sys_semctl			compat_sys_semctl
-- 
2.1.0


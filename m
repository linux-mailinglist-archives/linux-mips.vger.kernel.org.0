Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0061211DE29
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2019 07:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731762AbfLMGPq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Dec 2019 01:15:46 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40382 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731920AbfLMGPq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 13 Dec 2019 01:15:46 -0500
Received: from localhost.loongson.cn (unknown [10.40.23.36])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_xRpLPNdqFcKAA--.3S2;
        Fri, 13 Dec 2019 14:15:05 +0800 (CST)
From:   Guoyun Sun <sunguoyun@loongson.cn>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        David Howells <dhowells@redhat.com>,
        Firoz Khan <firoz.khan@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Guoyun Sun <sunguoyun@loongson.cn>
Subject: [PATCH] MIPS: Add get_thread_area syscall
Date:   Fri, 13 Dec 2019 14:15:05 +0800
Message-Id: <1576217705-2634-1-git-send-email-sunguoyun@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx_xRpLPNdqFcKAA--.3S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW5urykXw18Gr43KFW3ZFb_yoW5Cr17pF
        48Aw1kKr4rur18Aas3uF1kWrWxJr1DXw4jgF4kt398Z3WrXryrtr1Sgas8XF1a9ry2kay0
        gF4Fqry5tw4v9F7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUb0D73UUUUU==
X-CM-SenderInfo: 5vxqw3hr1x0qxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CRIU(https://criu.org/) tools will dump TLS(Thread Local Storage) by
get_thread_area during checkpoint and restore TLS by set_thread_area during
restore. without syscall get_thread_area, criu restore will fail on MIPS
platform.because a variable with GCC __thread is invalid.

The following function will be called when criu restore

static inline void restore_tls(tls_t *ptls) {
        asm volatile(
                     "move $4, %0                                   \n"
                     "li $2,  "__stringify(__NR_set_thread_area)"  \n"
                     "syscall                                       \n"
                     :
                     : "r"(*ptls)
                     : "$4","$2","memory");

With this patch, the *ptls can be obtained by get_thread_area on MIPS
platform when criu checkpoint. just like this:

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
 arch/mips/kernel/syscall.c                | 10 ++++++++++
 arch/mips/kernel/syscalls/syscall_n32.tbl |  1 +
 arch/mips/kernel/syscalls/syscall_n64.tbl |  1 +
 arch/mips/kernel/syscalls/syscall_o32.tbl |  1 +
 4 files changed, 13 insertions(+)

diff --git a/arch/mips/kernel/syscall.c b/arch/mips/kernel/syscall.c
index c333e57..20bf4c5 100644
--- a/arch/mips/kernel/syscall.c
+++ b/arch/mips/kernel/syscall.c
@@ -94,6 +94,16 @@ SYSCALL_DEFINE1(set_thread_area, unsigned long, addr)
 	return 0;
 }
 
+SYSCALL_DEFINE1(get_thread_area, unsigned long __user *, u_info)
+{
+	struct thread_info *ti = task_thread_info(current);
+
+	if (copy_to_user(u_info, &(ti->tp_value), sizeof(ti->tp_value)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static inline int mips_atomic_set(unsigned long addr, unsigned long new)
 {
 	unsigned long old, tmp;
diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
index e7c5ab3..7da83d0 100644
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@ -374,3 +374,4 @@
 433	n32	fspick				sys_fspick
 434	n32	pidfd_open			sys_pidfd_open
 435	n32	clone3				__sys_clone3
+436	n32	get_thread_area			sys_get_thread_area
diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/syscalls/syscall_n64.tbl
index 13cd665..4f04bf0 100644
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@ -350,3 +350,4 @@
 433	n64	fspick				sys_fspick
 434	n64	pidfd_open			sys_pidfd_open
 435	n64	clone3				__sys_clone3
+436	n64	get_thread_area			sys_get_thread_area
diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index 353539e..9d79abe 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -423,3 +423,4 @@
 433	o32	fspick				sys_fspick
 434	o32	pidfd_open			sys_pidfd_open
 435	o32	clone3				__sys_clone3
+436	o32	get_thread_area			sys_get_thread_area
-- 
2.1.0


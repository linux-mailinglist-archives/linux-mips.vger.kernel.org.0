Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC89411DF78
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2019 09:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbfLMIbK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Dec 2019 03:31:10 -0500
Received: from mail.loongson.cn ([114.242.206.163]:36384 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725980AbfLMIbK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 13 Dec 2019 03:31:10 -0500
Received: from localhost.loongson.cn (unknown [10.40.23.36])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxOtEqTPNdV2IKAA--.179S2;
        Fri, 13 Dec 2019 16:30:35 +0800 (CST)
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
Subject: [PATCH V2] MIPS: Add get_thread_area syscall
Date:   Fri, 13 Dec 2019 16:30:34 +0800
Message-Id: <1576225834-16389-1-git-send-email-sunguoyun@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxOtEqTPNdV2IKAA--.179S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW5urykXw18Gr43KFW3ZFb_yoW5tw47pr
        WUAw1kKw4rury8Aa4fWFykWrWxJr1kXrWjgFs7trZ5Z3W8Xry5tr1Sga4rXFya9ryIkay0
        qF4F9ry5t3yvvFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
        n2kIc2xKxwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUHnQUUUUUU=
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
 arch/mips/kernel/syscalls/syscall_n32.tbl |  2 ++
 arch/mips/kernel/syscalls/syscall_n64.tbl |  2 ++
 arch/mips/kernel/syscalls/syscall_o32.tbl |  2 ++
 4 files changed, 16 insertions(+)

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


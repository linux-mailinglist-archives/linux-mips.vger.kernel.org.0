Return-Path: <linux-mips+bounces-7410-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F956A0AF30
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2025 07:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64B763A1265
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2025 06:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94138231A33;
	Mon, 13 Jan 2025 06:17:03 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB34C230D38;
	Mon, 13 Jan 2025 06:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736749023; cv=none; b=VJDJnVGur2FygvkX0zPWiRWr6zSbsHfVIiI2kUnEaydybEYMKaIv89GqXlWtCn4QjlJYOBPy1l5a1feRlylxr+ScgMc0jm3lyBZLoYAZvlKtzcCYVyQgUSGfuYSHLABs+5hMUbWBkjNfSyVYxpSV9UiN95jB5I0SkvebK5RUNok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736749023; c=relaxed/simple;
	bh=GrH8gdZ33F2UygZx/IwvEcaO/oxMn+dxFx69riaFt78=;
	h=From:To:Cc:References:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type:Subject; b=KAf/zhYifMZECvqruNp8qSvtbbjvNuYXWl4VKKMGx91fChOg3bux/EdUwLXNuTmXVVHIvAZfqy2u8CMQMpYWY7y+rtToBiADU8wOYDjUzc6P7Rt8mN2Smkyo/ozRQdRdVIR5ReUlXn3HRPPxk8+CSSmAw+JR4Iy3mPxsnmZOjM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; arc=none smtp.client-ip=166.70.13.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in02.mta.xmission.com ([166.70.13.52]:46270)
	by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1tXDAM-000Zuw-Io; Sun, 12 Jan 2025 22:39:10 -0700
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:48892 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1tXDAL-004RGo-7j; Sun, 12 Jan 2025 22:39:10 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,  Arnd Bergmann <arnd@arndb.de>,
  Richard Henderson <richard.henderson@linaro.org>,  Matt Turner
 <mattst88@gmail.com>,  Kees Cook <kees@kernel.org>,  "Paul E. McKenney"
 <paulmck@kernel.org>,  linux-alpha@vger.kernel.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org,  Michael Cree <mcree@orcon.net.nz>,  Sam
 James <sam@gentoo.org>,  Geert Uytterhoeven <geert@linux-m68k.org>,
  Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,  Chris
 Hofstaedtler <zeha@debian.org>,  util-linux@vger.kernel.org,
  linux-mips@vger.kernel.org,  loongarch@lists.linux.dev
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>
	<24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
	<678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
	<bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
	<82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
	<cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
	<87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org>
	<2758fa70d237ff972b0c8d7114777dc4a20c8f3b.camel@physik.fu-berlin.de>
	<alpine.DEB.2.21.2501120146480.18889@angie.orcam.me.uk>
	<78f3ae1f68842a9d1af62caaac3929834ce6ecfa.camel@physik.fu-berlin.de>
Date: Sun, 12 Jan 2025 23:39:01 -0600
In-Reply-To: <78f3ae1f68842a9d1af62caaac3929834ce6ecfa.camel@physik.fu-berlin.de>
	(John Paul Adrian Glaubitz's message of "Sun, 12 Jan 2025 15:56:39
	+0100")
Message-ID: <87y0zfs26i.fsf_-_@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1tXDAL-004RGo-7j;;;mid=<87y0zfs26i.fsf_-_@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1/9OtitEyjluGDWnz1LKndqn62cBkz1tkc=
X-Spam-Level: *
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  0.7 XMSubLong Long Subject
	*  1.0 _Welcome_To_PayPal02 BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa04 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
	*  0.4 FVGT_m_MULTI_ODD Contains multiple odd letter combinations
X-Spam-DCC: XMission; sa04 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
X-Spam-Relay-Country: 
X-Spam-Timing: total 717 ms - load_scoreonly_sql: 0.16 (0.0%),
	signal_user_changed: 15 (2.0%), b_tie_ro: 12 (1.7%), parse: 2.4 (0.3%),
	 extract_message_metadata: 37 (5.2%), get_uri_detail_list: 6 (0.9%),
	tests_pri_-2000: 50 (7.0%), tests_pri_-1000: 3.8 (0.5%),
	tests_pri_-950: 1.46 (0.2%), tests_pri_-900: 1.17 (0.2%),
	tests_pri_-90: 69 (9.7%), check_bayes: 68 (9.5%), b_tokenize: 15
	(2.1%), b_tok_get_all: 14 (2.0%), b_comp_prob: 3.5 (0.5%),
	b_tok_touch_all: 32 (4.4%), b_finish: 0.80 (0.1%), tests_pri_0: 503
	(70.1%), check_dkim_signature: 1.12 (0.2%), check_dkim_adsp: 9 (1.3%),
	poll_dns_idle: 0.25 (0.0%), tests_pri_10: 4.2 (0.6%), tests_pri_500:
	24 (3.3%), rewrite_mail: 0.00 (0.0%)
Subject: [PATCH v2] alpha/elf: Fix misc/setarch test of util-linux by
 removing 32bit support
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: loongarch@lists.linux.dev, linux-mips@vger.kernel.org, util-linux@vger.kernel.org, zeha@debian.org, kernel@mkarcher.dialup.fu-berlin.de, geert@linux-m68k.org, sam@gentoo.org, mcree@orcon.net.nz, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, paulmck@kernel.org, kees@kernel.org, mattst88@gmail.com, richard.henderson@linaro.org, arnd@arndb.de, macro@orcam.me.uk, glaubitz@physik.fu-berlin.de
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out02.mta.xmission.com); SAEximRunCond expanded to false


Richard Henderson <richard.henderson@linaro.org> writes[1]:

> There was a Spec benchmark (I forget which) which was memory bound and ran
> twice as fast with 32-bit pointers.
>
> I copied the idea from DEC to the ELF abi, but never did all the other work
> to allow the toolchain to take advantage.
>
> Amusingly, a later Spec changed the benchmark data sets to not fit into a
> 32-bit address space, specifically because of this.
>
> I expect one could delete the ELF bit and personality and no one would
> notice. Not even the 10 remaining Alpha users.

In [2] it was pointed out that parts of setarch weren't working
properly on alpha because it has it's own SET_PERSONALITY
implementation.  In the discussion that followed Richard Henderson
pointed out that the 32bit pointer support for alpha was never
completed.

Fix this by removing alpha's 32bit pointer support.

As a bit of paranoia refuse to execute any alpha binaries that have
the EF_ALPHA_32BIT flag set.  Just in case someone somewhere has
binaries that try to use alpha's 32bit pointer support.

[1] https://lkml.kernel.org/r/CAFXwXrkgu=4Qn-v1PjnOR4SG0oUb9LSa0g6QXpBq4ttm52pJOQ@mail.gmail.com
[2] https://lkml.kernel.org/r/20250103140148.370368-1-glaubitz@physik.fu-berlin.de
v1: https://lkml.kernel.org/r/87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
---

Kees can you pick this one up?

 arch/alpha/include/asm/elf.h       |  6 +-----
 arch/alpha/include/asm/pgtable.h   |  2 +-
 arch/alpha/include/asm/processor.h |  8 ++------
 arch/alpha/kernel/osf_sys.c        | 11 ++---------
 4 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/arch/alpha/include/asm/elf.h b/arch/alpha/include/asm/elf.h
index 4d7c46f50382..50c82187e60e 100644
--- a/arch/alpha/include/asm/elf.h
+++ b/arch/alpha/include/asm/elf.h
@@ -74,7 +74,7 @@ typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
 /*
  * This is used to ensure we don't load something for the wrong architecture.
  */
-#define elf_check_arch(x) ((x)->e_machine == EM_ALPHA)
+#define elf_check_arch(x) (((x)->e_machine == EM_ALPHA) && !((x)->e_flags & EF_ALPHA_32BIT))
 
 /*
  * These are used to set parameters in the core dumps.
@@ -137,10 +137,6 @@ extern int dump_elf_task(elf_greg_t *dest, struct task_struct *task);
 	: amask (AMASK_CIX) ? "ev6" : "ev67");	\
 })
 
-#define SET_PERSONALITY(EX)					\
-	set_personality(((EX).e_flags & EF_ALPHA_32BIT)		\
-	   ? PER_LINUX_32BIT : PER_LINUX)
-
 extern int alpha_l1i_cacheshape;
 extern int alpha_l1d_cacheshape;
 extern int alpha_l2_cacheshape;
diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 635f0a5f5bbd..02e8817a8921 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -360,7 +360,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 
 extern void paging_init(void);
 
-/* We have our own get_unmapped_area to cope with ADDR_LIMIT_32BIT.  */
+/* We have our own get_unmapped_area */
 #define HAVE_ARCH_UNMAPPED_AREA
 
 #endif /* _ALPHA_PGTABLE_H */
diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/processor.h
index 55bb1c09fd39..5dce5518a211 100644
--- a/arch/alpha/include/asm/processor.h
+++ b/arch/alpha/include/asm/processor.h
@@ -8,23 +8,19 @@
 #ifndef __ASM_ALPHA_PROCESSOR_H
 #define __ASM_ALPHA_PROCESSOR_H
 
-#include <linux/personality.h>	/* for ADDR_LIMIT_32BIT */
-
 /*
  * We have a 42-bit user address space: 4TB user VM...
  */
 #define TASK_SIZE (0x40000000000UL)
 
-#define STACK_TOP \
-  (current->personality & ADDR_LIMIT_32BIT ? 0x80000000 : 0x00120000000UL)
+#define STACK_TOP (0x00120000000UL)
 
 #define STACK_TOP_MAX	0x00120000000UL
 
 /* This decides where the kernel will search for a free chunk of vm
  * space during mmap's.
  */
-#define TASK_UNMAPPED_BASE \
-  ((current->personality & ADDR_LIMIT_32BIT) ? 0x40000000 : TASK_SIZE / 2)
+#define TASK_UNMAPPED_BASE (TASK_SIZE / 2)
 
 /* This is dead.  Everything has been moved to thread_info.  */
 struct thread_struct { };
diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 86185021f75a..a08e8edef1a4 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1210,8 +1210,7 @@ SYSCALL_DEFINE1(old_adjtimex, struct timex32 __user *, txc_p)
 	return ret;
 }
 
-/* Get an address range which is currently unmapped.  Similar to the
-   generic version except that we know how to honor ADDR_LIMIT_32BIT.  */
+/* Get an address range which is currently unmapped. */
 
 static unsigned long
 arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
@@ -1230,13 +1229,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		       unsigned long len, unsigned long pgoff,
 		       unsigned long flags, vm_flags_t vm_flags)
 {
-	unsigned long limit;
-
-	/* "32 bit" actually means 31 bit, since pointers sign extend.  */
-	if (current->personality & ADDR_LIMIT_32BIT)
-		limit = 0x80000000;
-	else
-		limit = TASK_SIZE;
+	unsigned long limit = TASK_SIZE;
 
 	if (len > limit)
 		return -ENOMEM;
-- 
2.41.0



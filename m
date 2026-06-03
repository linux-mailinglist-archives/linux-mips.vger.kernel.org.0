Return-Path: <linux-mips+bounces-14862-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mTL1MuYdIGpywAAAu9opvQ
	(envelope-from <linux-mips+bounces-14862-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 03 Jun 2026 14:28:22 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7726377FD
	for <lists+linux-mips@lfdr.de>; Wed, 03 Jun 2026 14:28:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b=d5SmmfEf;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14862-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-14862-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1BA2308E06E
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jun 2026 12:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B6C46AF08;
	Wed,  3 Jun 2026 12:08:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C232346AF20;
	Wed,  3 Jun 2026 12:08:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488508; cv=none; b=svQ17K1kNmXcpvyUNLoD/b27ibhRVqkihb3HuMSPuqoDZUE7bTkylyQI1IkHN/AFiUQaCsXdu9yLUPr1EhZyasHihjy/L4RZ1ZN9qIPXRIgg21piXZbf8FF3lSDH1QVci9DkR0oZQplaindwjF52O8OMXa1wpt0ieHrUTBJ9qic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488508; c=relaxed/simple;
	bh=husHsBXts++6xfeVS4vQrdtk6eNs1v5BuuRy3CU7I4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfN/7gJRSODtsjrOHO7WN7R/jqnzHogS7rDqGGyZIzdXtUEuR8H88BQImzXu7Qn/t8H7CT48QNm4VMmPmHiEbJR90HpLMJe9uzYUKHIbbKbHklipczYYgA7aXdAOBranA8W4RAd+IZYnR2VHXyU3PrC/kd0w5U/7hmKZS+mXvXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=d5SmmfEf; arc=none smtp.client-ip=90.155.92.199
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BjZzErQAmk+oO+4E0XcjmiW9hmCrWCk9t8jkFgLyPC4=; b=d5SmmfEf7raSFzg4vFDuRz3coH
	z+67jG4KbJDEQovNpX0QBLbtbh5tdhne1+qs53r3XBtvymPRPtmo6uHSxh9oTTahgs8dAc3hjubVH
	TjxIyF2tByPYK1SNwdAus4bunqc+oiQhx3KaDikJD7OR0bH0zHwcXCFc9PxzwQo2USWMY6gaz+gax
	psOIEAn7ENGHGHDIPOHAfDrAgVYPG6MBJtugLGYM7rNY0SHSlYJY1ZLW248a62PrBMjvpfpPST3Ww
	bn+ca1kNG1zCTGcCom57PuIUIbLXrVuU18Xy917FFvYAMb+dhQxvJQYnGRos24DqYx2XD0xeX8VK0
	H/LTg4FA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUkOK-0000000C4nY-1pBX;
	Wed, 03 Jun 2026 12:08:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7A6863007A4; Wed, 03 Jun 2026 14:08:11 +0200 (CEST)
Date: Wed, 3 Jun 2026 14:08:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	virtualization@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
	kernel-team@meta.com, "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v6 5/7] locking: Add contended_release tracepoint to
 qspinlock
Message-ID: <20260603120811.GW3493090@noisy.programming.kicks-ass.net>
References: <cover.1777999826.git.d@ilvokhin.com>
 <5d7ea75ffe74a785e6b234ada9f23c6373d4b4c1.1777999826.git.d@ilvokhin.com>
 <20260513193342.GB2545104@noisy.programming.kicks-ass.net>
 <agXBb0ga_6HJrrnm@shell.ilvokhin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agXBb0ga_6HJrrnm@shell.ilvokhin.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14862-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:d@ilvokhin.com,m:mingo@redhat.com,m:will@kernel.org,m:boqun@kernel.org,m:longman@redhat.com,m:tsbogend@alpha.franken.de,m:jgross@suse.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:tglx@kernel.org,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:kernel-team@meta.com,m:paulmck@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER(0.00)[peterz@infradead.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,infradead.org:from_mime,infradead.org:dkim,noisy.programming.kicks-ass.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D7726377FD

On Thu, May 14, 2026 at 12:34:55PM +0000, Dmitry Ilvokhin wrote:

> Baseline, in best case scenario of least number of executed
> instructions.
> 
>     3e0:  endbr64                          ; 4 bytes (always executed)
>     3e4:  movb $0x0,(%rdi)                 ; 3 bytes (unlock,
>                                            ; always executed)
>     3e7:  decl %gs:__preempt_count         ; 7 bytes (always executed)
>     3ee:  je   3f5                         ; 2 bytes (always executed)
>     3f0:  jmp  __x86_return_thunk          ; 5 bytes (executed if above
>                                            ; je is not taken)
>                                            ; rest is not executed
>     3f5:  call __SCT__preempt_schedule     ; 5 bytes
>     3fa:  jmp  __x86_return_thunk          ; 5 bytes
> 
> Tracepoint (again same case of least number of executed instructions).
> 
>     bc0:  endbr64                          ; 4 bytes (always executed)
>     bc4:  xchg %ax,%ax                     ; 2 bytes (always executed, this is an
>                                            ; only addition on the execution path).
>     bc6:  movb $0x0,(%rdi)                 ; 3 bytes (unlock, always executed)
>     bc9:  decl %gs:__preempt_count         ; 7 bytes (always executed)
>     bd0:  je   bde                         ; 2 bytes (always executed)
>     bd2:  jmp  __x86_return_thunk          ; 5 bytes (executed if above
>                                            ; je is not taken)
>                                            ; rest is not executed
>     bd7:  call queued_spin_release_traced  ; 5 bytes
>     bdc:  jmp  bc9                         ; 2 bytes
>     bde:  call __SCT__preempt_schedule     ; 5 bytes
>     be3:  jmp  __x86_return_thunk          ; 5 bytes
> 

So I've been playing with this a bit, and it is all really sad.

Now, since pretty much everybody+dog will have PARAVIRT_SPINLOCK=y, the
'best' solution would be changing that paravirt call with a
static_call(), that actually shrinks the code by 1 byte.

And then this tracepoint nonsense can simply use a different unlock
function, just like paravirt.

0000 00000000000001d0 <_raw_spin_unlock>:
0000  1d0:	f3 0f 1e fa          	endbr64
0004  1d4:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 1da <_raw_spin_unlock+0xa>	1d6: R_X86_64_PC32	pv_ops_lock+0x4
000a  1da:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 1e1 <_raw_spin_unlock+0x11>	1dd: R_X86_64_PC32	__preempt_count-0x4
0011  1e1:	74 06                	je     1e9 <_raw_spin_unlock+0x19>
0013  1e3:	2e e9 00 00 00 00    	cs jmp 1e9 <_raw_spin_unlock+0x19>	1e5: R_X86_64_PLT32	__x86_return_thunk-0x4
0019  1e9:	e8 00 00 00 00       	call   1ee <_raw_spin_unlock+0x1e>	1ea: R_X86_64_PLT32	__SCT__preempt_schedule-0x4
001e  1ee:	2e e9 00 00 00 00    	cs jmp 1f4 <_raw_spin_unlock+0x24>	1f0: R_X86_64_PLT32	__x86_return_thunk-0x4


0000 00000000000001d0 <_raw_spin_unlock>:
0000  1d0:	f3 0f 1e fa          	endbr64
0004  1d4:	e8 00 00 00 00       	call   1d9 <_raw_spin_unlock+0x9>	1d5: R_X86_64_PLT32	__SCT__queued_spin_unlock-0x4
0009  1d9:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 1e0 <_raw_spin_unlock+0x10>	1dc: R_X86_64_PC32	__preempt_count-0x4
0010  1e0:	74 06                	je     1e8 <_raw_spin_unlock+0x18>
0012  1e2:	2e e9 00 00 00 00    	cs jmp 1e8 <_raw_spin_unlock+0x18>	1e4: R_X86_64_PLT32	__x86_return_thunk-0x4
0018  1e8:	e8 00 00 00 00       	call   1ed <_raw_spin_unlock+0x1d>	1e9: R_X86_64_PLT32	__SCT__preempt_schedule-0x4
001d  1ed:	2e e9 00 00 00 00    	cs jmp 1f3 <_raw_spin_unlock+0x23>	1ef: R_X86_64_PLT32	__x86_return_thunk-0x4


Something a little like so, which is completely untested, except to
build kernel/locking/spinlock.o (with clang-23).

Also, I think someone should go do some performance runs with
ARCH_INLINE_SPIN_* set for x86 just like for s390.

Of course, this is only x86 done, and it doesn't nicely tie in with
tracepoints, but it does give the sanest asm.

---
diff --git a/arch/x86/hyperv/hv_spinlock.c b/arch/x86/hyperv/hv_spinlock.c
index 210b494e4de0..6b4bdea18218 100644
--- a/arch/x86/hyperv/hv_spinlock.c
+++ b/arch/x86/hyperv/hv_spinlock.c
@@ -78,8 +78,8 @@ void __init hv_init_spinlocks(void)
 	pr_info("PV spinlocks enabled\n");
 
 	__pv_init_lock_hash();
-	pv_ops_lock.queued_spin_lock_slowpath = __pv_queued_spin_lock_slowpath;
-	pv_ops_lock.queued_spin_unlock = PV_CALLEE_SAVE(__pv_queued_spin_unlock);
+	static_call_update(queued_spin_lock_slowpath, __pv_queued_spin_lock_slowpath);
+	static_call_update(queued_spin_unlock, __raw_callee_save___pv_queued_spin_unlock);
 	pv_ops_lock.wait = hv_qlock_wait;
 	pv_ops_lock.kick = hv_qlock_kick;
 	pv_ops_lock.vcpu_is_preempted = PV_CALLEE_SAVE(hv_vcpu_is_preempted);
diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 1d506e5d6f46..52e7ce10df57 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -225,7 +225,6 @@
 #define X86_FEATURE_EPT_AD		( 8*32+17) /* "ept_ad" Intel Extended Page Table access-dirty bit */
 #define X86_FEATURE_VMCALL		( 8*32+18) /* Hypervisor supports the VMCALL instruction */
 #define X86_FEATURE_VMW_VMMCALL		( 8*32+19) /* VMware prefers VMMCALL hypercall instruction */
-#define X86_FEATURE_PVUNLOCK		( 8*32+20) /* PV unlock function */
 #define X86_FEATURE_VCPUPREEMPT		( 8*32+21) /* PV vcpu_is_preempted function */
 #define X86_FEATURE_TDX_GUEST		( 8*32+22) /* "tdx_guest" Intel Trust Domain Extensions Guest */
 
diff --git a/arch/x86/include/asm/paravirt-spinlock.h b/arch/x86/include/asm/paravirt-spinlock.h
index 7beffcb08ed6..553910f92906 100644
--- a/arch/x86/include/asm/paravirt-spinlock.h
+++ b/arch/x86/include/asm/paravirt-spinlock.h
@@ -3,6 +3,7 @@
 #define _ASM_X86_PARAVIRT_SPINLOCK_H
 
 #include <asm/paravirt_types.h>
+#include <linux/static_call_types.h>
 
 #ifdef CONFIG_SMP
 #include <asm/spinlock_types.h>
@@ -11,9 +12,6 @@
 struct qspinlock;
 
 struct pv_lock_ops {
-	void (*queued_spin_lock_slowpath)(struct qspinlock *lock, u32 val);
-	struct paravirt_callee_save queued_spin_unlock;
-
 	void (*wait)(u8 *ptr, u8 val);
 	void (*kick)(int cpu);
 
@@ -26,20 +24,23 @@ extern struct pv_lock_ops pv_ops_lock;
 extern void native_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
 extern void __pv_init_lock_hash(void);
 extern void __pv_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
+extern void __raw_callee_save___native_queued_spin_unlock(struct qspinlock *lock);
 extern void __raw_callee_save___pv_queued_spin_unlock(struct qspinlock *lock);
 extern bool nopvspin;
 
+DECLARE_STATIC_CALL(queued_spin_lock_slowpath, native_queued_spin_lock_slowpath);
+DECLARE_STATIC_CALL(queued_spin_unlock, __raw_callee_save___native_queued_spin_unlock);
+
 static __always_inline void pv_queued_spin_lock_slowpath(struct qspinlock *lock,
 							 u32 val)
 {
-	PVOP_VCALL2(pv_ops_lock, queued_spin_lock_slowpath, lock, val);
+	static_call(queued_spin_lock_slowpath)(lock, val);
 }
 
 static __always_inline void pv_queued_spin_unlock(struct qspinlock *lock)
 {
-	PVOP_ALT_VCALLEE1(pv_ops_lock, queued_spin_unlock, lock,
-			  "movb $0, (%%" _ASM_ARG1 ")",
-			  ALT_NOT(X86_FEATURE_PVUNLOCK));
+	__STATIC_CALL_MOD_ADDRESSABLE(queued_spin_unlock);
+	asm volatile ("call " STATIC_CALL_TRAMP_STR(queued_spin_unlock) : ASM_CALL_CONSTRAINT);
 }
 
 static __always_inline bool pv_vcpu_is_preempted(long cpu)
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 29226d112029..5908d9fd94bb 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -1135,9 +1135,8 @@ void __init kvm_spinlock_init(void)
 	pr_info("PV spinlocks enabled\n");
 
 	__pv_init_lock_hash();
-	pv_ops_lock.queued_spin_lock_slowpath = __pv_queued_spin_lock_slowpath;
-	pv_ops_lock.queued_spin_unlock =
-		PV_CALLEE_SAVE(__pv_queued_spin_unlock);
+	static_call_update(queued_spin_lock_slowpath, __pv_queued_spin_lock_slowpath);
+	static_call_update(queued_spin_unlock, __raw_callee_save___pv_queued_spin_unlock);
 	pv_ops_lock.wait = kvm_wait;
 	pv_ops_lock.kick = kvm_kick_cpu;
 
diff --git a/arch/x86/kernel/paravirt-spinlocks.c b/arch/x86/kernel/paravirt-spinlocks.c
index 95452444868f..28407304f123 100644
--- a/arch/x86/kernel/paravirt-spinlocks.c
+++ b/arch/x86/kernel/paravirt-spinlocks.c
@@ -25,9 +25,12 @@ __visible void __native_queued_spin_unlock(struct qspinlock *lock)
 }
 PV_CALLEE_SAVE_REGS_THUNK(__native_queued_spin_unlock);
 
+DEFINE_STATIC_CALL(queued_spin_lock_slowpath, native_queued_spin_lock_slowpath);
+DEFINE_STATIC_CALL(queued_spin_unlock, __raw_callee_save___native_queued_spin_unlock);
+
 bool pv_is_native_spin_unlock(void)
 {
-	return pv_ops_lock.queued_spin_unlock.func ==
+	return static_call_query(queued_spin_unlock) ==
 		__raw_callee_save___native_queued_spin_unlock;
 }
 
@@ -45,16 +48,11 @@ bool pv_is_native_vcpu_is_preempted(void)
 
 void __init paravirt_set_cap(void)
 {
-	if (!pv_is_native_spin_unlock())
-		setup_force_cpu_cap(X86_FEATURE_PVUNLOCK);
-
 	if (!pv_is_native_vcpu_is_preempted())
 		setup_force_cpu_cap(X86_FEATURE_VCPUPREEMPT);
 }
 
 struct pv_lock_ops pv_ops_lock = {
-	.queued_spin_lock_slowpath	= native_queued_spin_lock_slowpath,
-	.queued_spin_unlock		= PV_CALLEE_SAVE(__native_queued_spin_unlock),
 	.wait				= paravirt_nop,
 	.kick				= paravirt_nop,
 	.vcpu_is_preempted		= PV_CALLEE_SAVE(__native_vcpu_is_preempted),
diff --git a/arch/x86/kernel/static_call.c b/arch/x86/kernel/static_call.c
index 61592e41a6b1..1268b7dc93b1 100644
--- a/arch/x86/kernel/static_call.c
+++ b/arch/x86/kernel/static_call.c
@@ -3,6 +3,7 @@
 #include <linux/memory.h>
 #include <linux/bug.h>
 #include <asm/text-patching.h>
+#include <asm/paravirt-spinlock.h>
 
 enum insn_type {
 	CALL = 0, /* site call */
@@ -31,6 +32,15 @@ static const u8 retinsn[] = { RET_INSN_OPCODE, 0xcc, 0xcc, 0xcc, 0xcc };
  */
 static const u8 warninsn[] = { 0x67, 0x48, 0x0f, 0xb9, 0x3a };
 
+/*
+ * ds ds movb $0, (_ASM_ARG1)
+ */
+#ifdef CONFIG_64BIT
+static const u8 unlockinsn[] = { 0x3e, 0x3e, 0xc6, 0x07, 0x00 };
+#else
+static const u8 unlockinsn[] = { 0x3e, 0x3e, 0xc6, 0x00, 0x00 };
+#endif
+
 static u8 __is_Jcc(u8 *insn) /* Jcc.d32 */
 {
 	u8 ret = 0;
@@ -78,6 +88,10 @@ static void __ref __static_call_transform(void *insn, enum insn_type type,
 			emulate = code;
 			code = &warninsn;
 		}
+		if (func == &__raw_callee_save___native_queued_spin_unlock) {
+			emulate = code;
+			code = &unlockinsn;
+		}
 		break;
 
 	case NOP:
diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
index 83ac24ead289..f718e535ea7c 100644
--- a/arch/x86/xen/spinlock.c
+++ b/arch/x86/xen/spinlock.c
@@ -134,9 +134,8 @@ void __init xen_init_spinlocks(void)
 	printk(KERN_DEBUG "xen: PV spinlocks enabled\n");
 
 	__pv_init_lock_hash();
-	pv_ops_lock.queued_spin_lock_slowpath = __pv_queued_spin_lock_slowpath;
-	pv_ops_lock.queued_spin_unlock =
-		PV_CALLEE_SAVE(__pv_queued_spin_unlock);
+	static_call_update(queued_spin_lock_slowpath, __pv_queued_spin_lock_slowpath);
+	static_call_update(queued_spin_unlock, __raw_callee_save___pv_queued_spin_unlock);
 	pv_ops_lock.wait = xen_qlock_wait;
 	pv_ops_lock.kick = xen_qlock_kick;
 	pv_ops_lock.vcpu_is_preempted = PV_CALLEE_SAVE(xen_vcpu_stolen);
diff --git a/tools/arch/x86/include/asm/cpufeatures.h b/tools/arch/x86/include/asm/cpufeatures.h
index 86d17b195e79..61541f042f74 100644
--- a/tools/arch/x86/include/asm/cpufeatures.h
+++ b/tools/arch/x86/include/asm/cpufeatures.h
@@ -225,7 +225,6 @@
 #define X86_FEATURE_EPT_AD		( 8*32+17) /* "ept_ad" Intel Extended Page Table access-dirty bit */
 #define X86_FEATURE_VMCALL		( 8*32+18) /* Hypervisor supports the VMCALL instruction */
 #define X86_FEATURE_VMW_VMMCALL		( 8*32+19) /* VMware prefers VMMCALL hypercall instruction */
-#define X86_FEATURE_PVUNLOCK		( 8*32+20) /* PV unlock function */
 #define X86_FEATURE_VCPUPREEMPT		( 8*32+21) /* PV vcpu_is_preempted function */
 #define X86_FEATURE_TDX_GUEST		( 8*32+22) /* "tdx_guest" Intel Trust Domain Extensions Guest */
 


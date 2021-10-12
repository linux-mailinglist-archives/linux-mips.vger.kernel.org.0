Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C52042A87B
	for <lists+linux-mips@lfdr.de>; Tue, 12 Oct 2021 17:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237530AbhJLPmC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Oct 2021 11:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237462AbhJLPmB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 Oct 2021 11:42:01 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC989C061570;
        Tue, 12 Oct 2021 08:39:59 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1634053197;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Yq9pdM+pdjvFyxYq6vmMvIVLBnPdOuhx9oiz5uGo6UU=;
        b=xitHgukXgKA2MBj8PCjURdDGoMTZH/BxUY7N7QC4gA7vKPdxi7JltDNhcp6mYCeafKOIJE
        K4iRvrII0avJScGvUumRxPbtZPQt/6bXVggOfVop1/A332m71KVCBkOldJVWmRr9P2kVj3
        1uUWpfHdkjfSpDrOpXcn+X4/c0xeE95wGbqZY9wuqJf6vZzk0L2+4dxJrx5zxOBM3EpcAP
        9GOvR13XoCyTQtGUvVn+jCN9pejPewlu3GCEEIMwsOZcoz/enNJe4ZePT1lp8B2OzfpqVB
        yo0FhQmqhwDVUdxfw+OgWebMATFqE8nc7PspPOH6xYORVjMee9rGXBtlR27Zpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1634053197;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Yq9pdM+pdjvFyxYq6vmMvIVLBnPdOuhx9oiz5uGo6UU=;
        b=bCBuDgsB4Kz2NnLkDj2Oy10PeA5fq9vy2jLWrl8/AL4sSoo+OUTH5CyNQ9tozjT6WQEE/g
        YWWgUNvrQHHAOCDw==
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: Re: [GIT PULL] arm64 fixes for 5.15-rc5
In-Reply-To: <20211012140243.GA41546@C02TD0UTHF1T.local>
References: <YWCPyK+xotTgUMy/@arm.com>
 <CAHk-=whWZ4OxfKQwKVrRc-E9=w-ygKdVFn_HcAMW-DW8SgranQ@mail.gmail.com>
 <20211011104729.GB1421@C02TD0UTHF1T.local>
 <CAHk-=wjTAJwMJZ-6PPxvdtDmkL0=pfRF77nJ5qWw2vbiTzT4nQ@mail.gmail.com>
 <87czoacrfr.ffs@tglx> <20211012140243.GA41546@C02TD0UTHF1T.local>
Date:   Tue, 12 Oct 2021 17:39:56 +0200
Message-ID: <87mtneb6b7.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 12 2021 at 15:02, Mark Rutland wrote:
> On Tue, Oct 12, 2021 at 03:18:16PM +0200, Thomas Gleixner wrote:
>> On Mon, Oct 11 2021 at 12:54, Linus Torvalds wrote:
> I'm happy with this in principle. The only reason we didn't go down that
> route initially is because the callers are (typically) in the bowels of
> arch asm or platform code, they all need to be fixed in one go to avoid
> breaking anything, and it's a headache if we collide with any rework
> (e.g. MIPS moving to generic entry).

mips-next looks pretty empty vs. that.

>> > It really looks like there is a very tight connection between "uses
>> > handle_domain_irq()" and "uses handle_arch_irq/set_handle_irq()". No?
>> 
>> Looks like. That might conflict with the MIPS rework though. I don't
>> know how far that came already. Cc'ed the MIPS people.
>
> There's also a bunch of old platforms on arch/arm which have a
> hard-coded handler (so not using handle_arch_irq/set_handle_irq()) which
> calls handle_domain_irq() -- those can be fixed up.

If that turns out to be ugly, then somehting like the below might be
less horrible as a stop gap.

Thanks,

        tglx
---

--- a/arch/x86/xen/smp.c
+++ b/arch/x86/xen/smp.c
@@ -268,20 +268,16 @@ void xen_send_IPI_allbutself(int vector)
 
 static irqreturn_t xen_call_function_interrupt(int irq, void *dev_id)
 {
-	irq_enter();
 	generic_smp_call_function_interrupt();
 	inc_irq_stat(irq_call_count);
-	irq_exit();
 
 	return IRQ_HANDLED;
 }
 
 static irqreturn_t xen_call_function_single_interrupt(int irq, void *dev_id)
 {
-	irq_enter();
 	generic_smp_call_function_single_interrupt();
 	inc_irq_stat(irq_call_count);
-	irq_exit();
 
 	return IRQ_HANDLED;
 }
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -458,10 +458,8 @@ static void xen_pv_stop_other_cpus(int w
 
 static irqreturn_t xen_irq_work_interrupt(int irq, void *dev_id)
 {
-	irq_enter();
 	irq_work_run();
 	inc_irq_stat(apic_irq_work_irqs);
-	irq_exit();
 
 	return IRQ_HANDLED;
 }
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -33,6 +33,9 @@ config HOTPLUG_SMT
 config GENERIC_ENTRY
        bool
 
+config ARCH_ENTRY_RCU_CLEAN
+       bool
+
 config KPROBES
 	bool "Kprobes"
 	depends on MODULES
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -66,6 +66,7 @@ config X86
 	select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if (PGTABLE_LEVELS > 2) && (X86_64 || X86_PAE)
 	select ARCH_ENABLE_THP_MIGRATION if X86_64 && TRANSPARENT_HUGEPAGE
+	select ARCH_ENTRY_RCU_CLEAN
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_DEBUG_VIRTUAL
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -677,24 +677,13 @@ int generic_handle_domain_irq(struct irq
 EXPORT_SYMBOL_GPL(generic_handle_domain_irq);
 
 #ifdef CONFIG_HANDLE_DOMAIN_IRQ
-/**
- * handle_domain_irq - Invoke the handler for a HW irq belonging to a domain,
- *                     usually for a root interrupt controller
- * @domain:	The domain where to perform the lookup
- * @hwirq:	The HW irq number to convert to a logical one
- * @regs:	Register file coming from the low-level handling code
- *
- * Returns:	0 on success, or -EINVAL if conversion has failed
- */
-int handle_domain_irq(struct irq_domain *domain,
-		      unsigned int hwirq, struct pt_regs *regs)
+static int __handle_domain_irq(struct irq_domain *domain,
+			       unsigned int hwirq, struct pt_regs *regs)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
 	struct irq_desc *desc;
 	int ret = 0;
 
-	irq_enter();
-
 	/* The irqdomain code provides boundary checks */
 	desc = irq_resolve_mapping(domain, hwirq);
 	if (likely(desc))
@@ -702,12 +691,41 @@ int handle_domain_irq(struct irq_domain
 	else
 		ret = -EINVAL;
 
-	irq_exit();
 	set_irq_regs(old_regs);
 	return ret;
 }
 
 /**
+ * handle_domain_irq - Invoke the handler for a HW irq belonging to a domain,
+ *                     usually for a root interrupt controller
+ * @domain:	The domain where to perform the lookup
+ * @hwirq:	The HW irq number to convert to a logical one
+ * @regs:	Register file coming from the low-level handling code
+ *
+ * Returns:	0 on success, or -EINVAL if conversion has failed
+ */
+#ifdef CONFIG_ARCH_ENTRY_RCU_CLEAN
+int handle_domain_irq(struct irq_domain *domain,
+		      unsigned int hwirq, struct pt_regs *regs)
+{
+	__handle_domain_irq(domain, hwirq, regs);
+}
+#else
+int handle_domain_irq(struct irq_domain *domain,
+		      unsigned int hwirq, struct pt_regs *regs)
+{
+	/*
+	 * irq_enter()/exit() has to be done in low level
+	 * architecture code. Bandaid for not yet fixed
+	 * architectures.
+	 */
+	irq_enter();
+	__handle_domain_irq(domain, hwirq, regs);
+	irq_exit();
+}
+#endif
+
+/**
  * handle_domain_nmi - Invoke the handler for a HW irq belonging to a domain
  * @domain:	The domain where to perform the lookup
  * @hwirq:	The HW irq number to convert to a logical one
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -601,6 +601,7 @@ void irq_enter_rcu(void)
 	account_hardirq_enter(current);
 }
 
+#ifndef ARCH_ENTRY_RCU_CLEAN
 /**
  * irq_enter - Enter an interrupt context including RCU update
  */
@@ -609,6 +610,7 @@ void irq_enter(void)
 	rcu_irq_enter();
 	irq_enter_rcu();
 }
+#endif
 
 static inline void tick_irq_exit(void)
 {
@@ -650,6 +652,7 @@ void irq_exit_rcu(void)
 	lockdep_hardirq_exit();
 }
 
+#ifndef ARCH_ENTRY_RCU_CLEAN
 /**
  * irq_exit - Exit an interrupt context, update RCU and lockdep
  *
@@ -662,6 +665,7 @@ void irq_exit(void)
 	 /* must be last! */
 	lockdep_hardirq_exit();
 }
+#endif
 
 /*
  * This function must run with irqs disabled!

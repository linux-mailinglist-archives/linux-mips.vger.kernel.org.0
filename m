Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42D0019AA65
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2020 13:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732591AbgDALHY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Apr 2020 07:07:24 -0400
Received: from merlin.infradead.org ([205.233.59.134]:45598 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732363AbgDALHU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Apr 2020 07:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=4Dqol62wdMFQWr43+PFoe4L05khr2GFOWLbBuj2BrZY=; b=CJOJUGJUbylcX9ljnoFUQM8aok
        CFkJmums6o9KM90p3OTTH4wV0lUqpZt7d1YqpXOGs9TGwGPGAiSJDc4b2K6upOTHNpkF7KfIwY33r
        OoDE1MdAH3IS+42t3K+pkn+6ndv2+Yv2P6AA/DmxZQR74eabbbaeEH9hmlwx9g+U2XxAEU3INgaFs
        qHen1IgpzEVlcWfjxgs7OxTLXz4MjX3QiVSHhVx3/ctCz4fvSJaAgyzu41neVPd/4ZEHfC2gv3Cud
        MAD2R1rckS2pcFXw0ASFu22V3dI4hKh1JFpL7YoSWJDUQ2N453jCQN+T7Xg76beEQCp3hATrwBCRy
        x79X/Cpw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jJbCu-0002HM-PF; Wed, 01 Apr 2020 11:06:53 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 390B3307112;
        Wed,  1 Apr 2020 13:06:49 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 2A85629DB2526; Wed,  1 Apr 2020 13:06:49 +0200 (CEST)
Date:   Wed, 1 Apr 2020 13:06:49 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     John Mathew <john.mathew@unikie.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com
Subject: Re: [RFC PATCH 3/3] docs: scheduler: Add introduction to scheduler
 context-switch
Message-ID: <20200401110649.GB20713@hirez.programming.kicks-ass.net>
References: <20200401100029.1445-1-john.mathew@unikie.com>
 <20200401100029.1445-4-john.mathew@unikie.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401100029.1445-4-john.mathew@unikie.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 01, 2020 at 01:00:29PM +0300, John Mathew wrote:
> +Context switching, the switching from a running task to another, is handled by
> +the :c:func:`context_switch()` function defined in kernel/sched.c . It is called

Per my insitent complaints, :c:func: is now completely redundant,
anything with '()' on is now automagically treated as a function name.

If it's not readable in a text editor, it's broken.

> +by __schedule() when a new process has been selected to run.
> +
> + The execution flow is as follows:
> +
> +* Calls prepare_task_switch() to prepare both previous and new task by
> +  storing or changing some values in their task_struct.

This is wildly inacurate. Take for instance perf_event_task_sched_out(),
that doesn't just store or change a few values.

> +* Calls macro :c:macro:`arch_start_context_switch()`
> +  A facility to provide batching of the reload of page tables and  other process
> +  state with the actual context switch code for  paravirtualized guests.  By
> +  convention, only one of the batched  update (lazy) modes (CPU, MMU) should be
> +  active at any given time,  entry should never be nested, and entry and exits
> +  should always be  paired. This is for sanity of maintaining and reasoning about
> +  the kernel code.  In this case, the exit (end of the context switch) is  in
> +  architecture-specific code, and so doesn't need a generic definition.
> +
> +
> +* The next few steps consists of handling the transfer of real and anonymous
> +  address spaces between the switching tasks.  Four possible context switches are
> +
> +  - kernel task switching to another kernel task.
> +  - user task switching to a kernel task.
> +  - kernel task switching to user task,
> +  - user task switching to  user task.
> +
> +For a kernel task switching to kernel task :c:func:`enter_lazy_tlb()` is called
> +which is an architecture specific implementation to handle a context without an
> +mm. Architectures implement lazy tricks to minimize tlb flushes here.
> +Then the active address space from the previous task is borrowed (transferred)
> +to the next task. The active address space of the previous task is set to NULL.
> +
> +For a user task switching to kernel task it will have a real address space. This
> +address space is pinned by calling :c:func:`mmgrab()` . This makes sure that the
> +address space will not get freed even after the previous task exits.
> +
> +For a user task switching to user task the architecture specific
> +:c:func:`switch_mm_irqs_off()` or :c:func:`switch_mm()` functions. The main
> +functionality of this calls is to switch the address space between the
> +user space processes. This includes switching the page table pointers and
> +ensuring that the new address space has a valid ASID.

That's worded a bit odd; you need an ASID allocated to a process in
order for it to have an active address space.

> +For a kernel task switching to a user task, the active address space of the
> +kernel task is transferred to the user task and the active address space of the
> +kernel task is set to NULL.

That reads odd. The kernel to user transition switches away from
whatever address space the kernel task borrowed and to the address space
of the user task (of course hoping they're the same).

But we don't transfer anything to the user task, particularly kernel
threads don't have an address space to give.

> +
> +* Next the  :c:func:`prepare_lock_switch()` function is called for a lockdep
> +  release of the runqueue lock to handle the special case of the scheduler in which
> +  the runqueue lock will be released by the next task.
> +
> +* Then the architecture specific implementation of the :c:func:`switch_to()`
> +  function is called to switch the register state and the stack. This involves
> +  saving and restoring stack information and the processor registers and any other
> +  architecture-specific state that must be managed and restored on a per-process
> +  basis.
> +
> +* Calls finish_task_switch()  must be called after the context switch,
> +  paired with a prepare_task_switch() call before the context switch.It will
> +  reconcile locking set up by prepare_task_switch, and do any other
> +  architecture-specific cleanup actions.

You spend a lot of words on the prepare, but then ignore most of the
finish_task_switch() magic. That seems unbalanced.

> diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
> index 9772cf81fd96..289e06a68764 100644
> --- a/Documentation/scheduler/index.rst
> +++ b/Documentation/scheduler/index.rst

> +MIPS Context Switch
> +-------------------
> +
> +Context switch behavior specific to MIPS begins in the way :c:macro:`switch_to()`
> +macro is implemented. The main steps in the MIPS implementation of the macro are:
> +
> +* Handle the FPU affinity management feature . This feature is enabled by the
> +  :c:macro:`CONFIG_MIPS_MT_FPAFF` at build time The macro checks if the FPU was
> +  used in the most recent time slice. In case FPU was not used, the restriction of
> +  having to run on a cpu with FPU is removed.

Last time I looked at that gunk it was broken, presumably it still is.
In particular it is racy against userspace changing task affinity
itself.

> +* For the previous task, disable the fpu and clear the bit indicating the FPU was
> +  used in this quantum for the task.
> +* If fpu is enabled in the next task, check FCSR for any unmasked exceptions
> +  pending, clear them and send a signal.
> +* if MIPS DSP modules is enabled, save the dsp context of the previous task and
> +  restore the dsp context of the next task.
> +* If coprocessor 2 is present set the access allowed field of the coprocessor 2.
> +* if coprocessor 2 access allowed field was set in previous task, clear it.
> +* clear the the access allowed field of the coprocessor 2.
> +* clear the llbit on MIPS release 6 such that instruction eretnc can be used
> +  unconditionally when returning to userland in entry.S. LLbit is used to specify
> +  operation for instructions that provide atomic read-modify-write. LLbit is set
> +  when a linked load occurs and is tested by the conditional store. It is cleared,
> +  during other CPU operation, when a store to the location would no longer be
> +  atomic. In particular, it is cleared by exception return instructions.
> +  eretnc instruction enables to return from interrupt, exception, or error trap
> +  without clearing the LLbit.
> +* clear the global variable ll_bit used by mips exception handler.
> +* write the thread pointer to the mips userlocal register if the cpu supports
> +  this feature. This register is not interpreted by hardware and can be used to
> +  share data between privileged and unprivileged software.
> +* if hardware watchpoint feature is enabled during build the watchpoint registers
> +  are restored from the next task.
> +* Finally the mips processor specific implementation of the :c:func:`resume()`
> +  function is called. It restores the registers of the next task including the
> +  stack pointer. The implementation is in assembly::
> +
> +    arch/mips/kernel/r4k_switch.S

There's also octeon_switch.S r2300_switch.S

> diff --git a/Documentation/scheduler/x86-context-switch.rst b/Documentation/scheduler/x86-context-switch.rst
> new file mode 100644
> index 000000000000..ae7b2e09453a
> --- /dev/null
> +++ b/Documentation/scheduler/x86-context-switch.rst
> @@ -0,0 +1,59 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +X86 Context Switch
> +------------------
> +
> +The x86 architecture context switching logic is as follows.
> +After the switching of MM in the scheduler :c:func:`context_switch()` the call
> +to the x86 implementation of :c:macro:`switch_to()`
> +is made.  For x86 arch it is located at ::
> +
> +    arch/x86/include/asm/switch_to.h
> +
> +Since 4.9, switch_to() has been broken in to two parts: a :c:func:`prepare_switch_to()`
> +macro and the inline assembly portion of has been moved to an actual assembly
> +file ::
> +
> +    arch/x86/entry/entry_64.S

and entry_32.S

Although I suspect it will soon move to another file... it has no
business being in .entry.text

> +
> +* There is still a C portion of the switch which occurs via a jump in the middle
> +  of the assembly code. The source is located in arch/x86/kernel/process_64.c
> +  since 2.6.24

Uhm what? afaict there is no jmp in the middle. There is a jump at the
end, which is a tail-call optimization.

> +The main function of the prepare_switch_to() is to handle the case when stack
> +uses virtual memory. This is configured at build time and is mostly enable in
> +most modern distributions. This function accesses the stack pointer to prevent a
> +double fault.Switching to a stack that has top-level paging entry that is not
> +present in the current MM will result in a page fault which will be promoted to
> +double fault and the result is a panic. So it is necessary to probe the stack now
> +so that the vmalloc_fault can fix the page tables.
> +
> +The main steps of the inline assembly function __switch_to_asm() are:
> +
> +* store the callee saved registers to the old stack which will be switched away from.
> +* swaps the stack pointers between the old and the new task.
> +* move the stack canary value to the current cpu's interrupt stack.
> +* if return trampoline is enabled, overwrite all entries in the RSB on exiting
> +  a guest, to prevent malicious branch target predictions from affecting the host
> +  kernel.
> +* restore all registers from the new stack previously pushed in reverse order.
> +
> +The main steps of the c function :c:func:`__switch_to()` which the assembly code
> +jumps to is as follows:

Note that this is effectively the new task running.

> +* retrieve the thread :c:type:`struct thread_struct <thread_struct>` and fpu
> +  :c:type:`struct fpu <fpu>` structs from the next and previous tasks.
> +* gets the current cpu TSS :c:type:`struct tss_struct <tss_struct>`
> +* save the current FPU state while on the old task.
> +* store the FS and GS segment registers before changing the thread local storage.
> +* reload the GDT for the new tasks TLS.

You mentioned arch_start_context_switch() previously, this is where
arch_end_context_switch() lives.

> +* save the ES and DS segments of the previous task and load the same from the
> +  nest task.
> +* load the FS and GS segment registers.
> +* update the current task of the cpu.
> +* update the top of stack pointer for the CPU for entry trampoline.
> +* initialize FPU state for next task.
> +* set sp0 to point to the entry trampoline stack.
> +* call :c:func:`_switch_to_xtra()` to  handles debug registers, i/o bitmaps and
> +  speculation mitigation.
> +* Writes the task's CLOSid/RMID to IA32_PQR_MSR.

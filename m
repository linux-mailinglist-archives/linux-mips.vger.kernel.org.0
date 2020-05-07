Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1261C8100
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 06:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgEGE0p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 00:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725601AbgEGE0o (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 00:26:44 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA7ABC061A0F;
        Wed,  6 May 2020 21:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=6SVoikUmrVc5pqCi7ReiQ+nGFmpIHdKIVdLjMIbtG5w=; b=qq6CkyzxG1Uk/Tt/LzxnQNKwWn
        LGqxO6Ls81OQ/2u+5kJ3nESV5DM4zxDUZq1XGjaGiU13RuIAw+iDYXfl2+vtH2HHAEMQq4RaTBzRu
        kASiDK0mvactkkrgMee/Z1j/qfACcusI+DUJhhu+4XqPP9huAFFywTe029HVcnmT0zHCf+IJKk4EQ
        bQd485xSlhbP7X7NAD/3bxKOr8wNWNSaHu+iN0B9X2mBCkO5+W+W5Jg44R7BN6lmBVghKZELRyxrT
        d2rfV5O9BEHeI6A2QJLRR+1EErE4QXIWMXGIS/eUTEUsah0yGt3Q6928NMCWs9n+EcVfdUK/e1mWa
        d3tyly2w==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jWY7E-0003oD-1m; Thu, 07 May 2020 04:26:32 +0000
Subject: Re: [RFC PATCH v2 3/3] docs: scheduler: Add introduction to scheduler
 context-switch
To:     john mathew <john.mathew@unikie.com>, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@gmail.com, oleg.tsymbal@unikie.com,
        willy@infradead.org, valentin.schneider@arm.com,
        Mostafa Chamanara <mostafa.chamanara@basemark.com>
References: <20200506143931.23387-1-John.Mathew@partner.bmw.de>
 <20200506143931.23387-4-John.Mathew@partner.bmw.de>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <24d37bdd-d6bb-c0e4-a86b-96205bf7a3cf@infradead.org>
Date:   Wed, 6 May 2020 21:26:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506143931.23387-4-John.Mathew@partner.bmw.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/6/20 7:39 AM, john mathew wrote:
> From: John Mathew <john.mathew@unikie.com>
> 
> Add documentation for introduction to
>  -context-switch
>  -x86 context-switch
>  -MIPS context switch
> 
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Co-developed-by: Mostafa Chamanara <mostafa.chamanara@basemark.com>
> Signed-off-by: Mostafa Chamanara <mostafa.chamanara@basemark.com>
> Co-developed-by: Oleg Tsymbal <oleg.tsymbal@unikie.com>
> Signed-off-by: Oleg Tsymbal <oleg.tsymbal@unikie.com>
> Signed-off-by: John Mathew <john.mathew@unikie.com>
> ---
>  Documentation/scheduler/arch-specific.rst     |   3 +
>  Documentation/scheduler/context-switching.rst | 126 ++++++++++++++++++
>  Documentation/scheduler/index.rst             |   1 +
>  .../scheduler/mips-context-switch.rst         |  88 ++++++++++++
>  .../scheduler/sched-data-structs.rst          |   2 +-
>  .../scheduler/x86-context-switch.rst          |  65 +++++++++
>  6 files changed, 284 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/scheduler/context-switching.rst
>  create mode 100644 Documentation/scheduler/mips-context-switch.rst
>  create mode 100644 Documentation/scheduler/x86-context-switch.rst
> 

> diff --git a/Documentation/scheduler/context-switching.rst b/Documentation/scheduler/context-switching.rst
> new file mode 100644
> index 000000000000..af79a2c55713
> --- /dev/null
> +++ b/Documentation/scheduler/context-switching.rst
> @@ -0,0 +1,126 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +==========================
> +Process context switching
> +==========================
> +
> +Context Switching
> +-----------------
> +
> +Context switching, the switching from a running task to another,
> +is done by the context_switch() function defined in
> +kernel/sched.c.  It is called by __schedule() when a new process has

   kernel/sched/core.c.

> +been selected to run.
> +
> + The execution flow is as follows:
> +
> +* prepare_task_switch() performs necessary kernel preparations for the
> +  context switch and then calls prepare_arch_switch() for architecture
> +  specific context switch preparation. This call must be paired with a
> +  subsequent finish_task_switch() after the context switch. The various
> +  steps are:
> +
> +  - Prepare kcov for context switch. Context switch does switch_mm() to the
> +    next task's mm, then switch_to() that new task. This means vmalloc'd
> +    regions which had previously been faulted in can transiently disappear in
> +    the context of the prev task. Functions instrumented by KCOV may try to
> +    access a vmalloc'd kcov_area during this window, and result in a recursive
> +    fault. This is avoided by setting a new flag: KCOV_IN_CTXSW in kcov_mode
> +    prior to switching the mm, and cleared once the new task is live.
> +  - Update sched_info statistics for both the prev and next tasks.
> +  - Handle perf subsytem context switch from previous task to next.

                   subsystem

> +    The various steps are:
> +
> +    - Remove perf events for the task being context-switched out.
> +    - Stop each perf event and update the event value in event->count.
> +    - Call the context switch callback for PMU with flag indicating
> +      schedule out.
> +    - Create a PERF_RECORD_MISC_SWITCH_OUT perf event.
> +    - Context switch the perf event contexts between the current and next tasks.
> +    - Schedule out current cgroup events if cgroup perf events exist on the
> +      CPU

end with '.' period.

> +
> +  - Set TIF_NOTIFY_RESUME flag on the current thread for the Restartable
> +    sequence mechanism. Restartable sequences allow user-space to perform
> +    update operations on per-cpu data without requiring heavy-weight atomic
> +    operations.
> +  - Fire preempt notifiers. A task can request the scheduler to notify it
> +    whenever it is preempted or scheduled back in. This allows the task to
> +    swap any special-purpose registers like the fpu or Intel's VT registers.

                                                   FPU

> +  - Claim the next task as running to prevent load balancing run on it.
> +
> +* arch_start_context_switch() batches the reload of page tables and other
> +  process state with the actual context switch code for paravirtualized
> +  guests.
> +
> +* Transfer the real and anonymous address spaces between the switching tasks.
> +  Four possible transfer types are:
> +
> +  - kernel task switching to another kernel task
> +  - user task switching to a kernel task
> +  - kernel task switching to user task
> +  - user task switching to user task
> +
> +  For a kernel task switching to kernel task enter_lazy_tlb() is called
> +  which is an architecture specific implementation to handle a context
> +  without an mm. Architectures implement lazy tricks to minimize tlb

                                                                    TLB

> +  flushes here. The active address space from the previous task is
> +  borrowed (transferred) to the next task.
> +
> +  For a user task switching to kernel task it will have a real address
> +  space and so its anonymous users counter is incremented. This makes
> +  sure that the address space will not get freed even after the previous
> +  task exits.
> +
> +  For a user task switching to user task the architecture specific
> +  switch_mm_irqs_off() or switch_mm() functions are called.  The main
> +  functionality of these calls is to switch the address space between
> +  the user space processes.  This includes switching the page table pointers
> +  either via retrieved valid ASID for the process or page mapping in the TLB.
> +
> +  For a kernel task switching to a user task, switch_mm_irqs_off()
> +  replaces the address space of prev kernel task with the next from the user
> +  task. Same as for exiting process in this case, the context_switch()
> +  function saves the pointer to the memory descriptor used by prev in the
> +  runqueue’s prev_mm field and resets prev task active address space.
> +
> +* prepare_lock_switch() releases lockdep of the runqueue lock to handle
> +  the special case of the scheduler context switch where the runqueue lock
> +  will be released by the next task.
> +
> +* Architecture specific implementation of the switch_to() switches the

either                                    of switch_to()
or                                        of the switch_to() function

> +  register state and the stack. This involves saving and restoring stack
> +  information and the processor registers and any other
> +  architecture-specific state that must be managed and restored on a
> +  per-process basis.
> +
> +* finish_task_switch() performs the final steps of the context switch:
> +
> +  - Emit a warning if the preempt count is corrupted and set the  preempt count

                                                    drop one space ^^^

> +    to FORK_PREEMPT_COUNT.
> +  - Reset the pointer to the memory descriptor used by prev which was set in
> +    context_switch().
> +  - Store the state of the previous task to handle the possibility of a DEAD
> +    task.
> +  - Do virtual cpu time accounting for the previous task.

                  CPU

> +  - Handle perf subsytem context switch from previous task to current:

                   subsystem

> +
> +    - Add perf events for the current task.
> +    - Schedule in current cgroup events if cgroup perf events exist on the
> +      CPU

end with period.

> +    - Context switch the perf event contexts between the prev and current
> +      tasks.
> +    - Clear the PERF_RECORD_MISC_SWITCH_OUT perf event

ditto.

> +    - Call the context switch callback for PMU with flag indicating
> +      schedule in.
> +  - Free the task for load balancing run on it.
> +  - Unlock the rq lock.
> +  - Clear the KCOV_IN_CTXSW in kcov_mode which was set in prepare_task_switch
> +    now that the new task is live.
> +  - Fire preempt notifiers to notify about task scheduled back in.
> +  - If the prev task state indicated that it was dead, the corresponding
> +    scheduler class task_dead hook is called. Function-return probe
> +    instances associated with the task  are removed and put back on the

                        drop one space  ^^^

> +    free list. Stack for the task is freed and drop the RCU references.
> +  - Evaluate the need for No idle tick due to the context switch and do the
> +    idle tick if needed.
> \ No newline at end of file

Please fix that warning.

> diff --git a/Documentation/scheduler/mips-context-switch.rst b/Documentation/scheduler/mips-context-switch.rst
> new file mode 100644
> index 000000000000..a31a73f07ff9
> --- /dev/null
> +++ b/Documentation/scheduler/mips-context-switch.rst
> @@ -0,0 +1,88 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +==============================================
> +MIPS Architecture And Scheduler implementation
> +==============================================
> +
> +Multi-threading in MIPS CPUs
> +-----------------------------
> +The MIPS architecture defines four coprocessors.
> +
> +- CP0: supports virtual memory system and exception handling.
> +- CP1: reserved for the floating point coprocessor, the FPU
> +- CP2: available for specific implementations.
> +- CP3: reserved for floating point operations in the release 1
> +  implementation of MIPS64.
> +
> +MIPS32 and MIPS64 architectures provide support for optional components
> +known as Modules or Application Specific Extensions.  The MT module
> +enables the architecture to support multi-threaded implementations.
> +This includes support for virtual processors and light weight thread

                                                    lightweight

> +contexts.  Implementation of MT features depends on the individual MIPS
> +cores.  The virtual processing element (VPE) maintains a complete copy
> +of the processor state as seen by the software system which includes
> +interrupts, register set, and MMU.  This enables a single processor to
> +appear to an SMP operating system like two separate cores if it has
> +2 VPE's. For example two separate OS can run on each VPE such as Linux

                                     OSes

> +and and an RTOS.
> +
> +A lighter version of VPE enables threading at the user/application
> +software level.  It is called Thread Context (TC).  TC, is the hardware

                                                no comma ^^

> +state necessary to support a thread of execution.  This includes a set
> +of general purpose registers (GPRs), a program counter (PC), and some
> +multiplier and coprocessor state.  TC's have common execution unit.

                                      TCs

> +MIPS ISA provides instructions to utilize TC.
> +
> +The Quality of service block of the MT module allows the allocation of
> +processor cycles to threads, and sets relative thread priorities. This
> +enables 2 thread prioritization mechanisms. The user can prioritize one
> +thread over the other as well as allocate a specific ratio of the cycles
> +to specific threads.  These mechanisms help to allocate bandwidth a set

                                                  allocate bandwidth to a set

> +of threads effectively.  QoS block improves system level determinism
> +and predictability.  QosS block can be replaced by more application

                        QoS

> +specific blocks.
> +
> +MIPS Context Switch
> +-------------------
> +
> +Context switch behavior specific to MIPS begins in the way
> +:c:macro:`switch_to()` macro is implemented.  The main steps in the MIPS
> +implementation of the macro are:
> +
> +* Handle the FPU affinity management feature.  This feature is enabled
> +  by the :c:macro:`CONFIG_MIPS_MT_FPAFF` at build time. The macro checks
> +  if the FPU was used in the most recent time slice.  In case FPU was not
> +  used, the restriction of having to run on a cpu with FPU is removed.

                                                 CPU

> +* Disable the fpu and clear the bit indicating the FPU was used in this

                 FPU

> +  quantum for the task for the previous task

end with period.

> +* If FPU is enabled in the next task, check FCSR for any unmasked
> +  exceptions pending, clear them and send a signal.
> +* If MIPS DSP modules is enabled, save the dsp context of the previous

                                              DSP

> +  task and restore the dsp context of the next task.

                          DSP

> +* If coprocessor 2 is present set the access allowed field of the
> +  coprocessor 2.
> +* If coprocessor 2 access allowed field was set in previous task, clear it.
> +* Clear the the access allowed field of the coprocessor 2.
> +* Clear the llbit on MIPS release 6 such that instruction eretnc can be
> +  used unconditionally when returning to userland in entry.S.
> +  LLbit is used to specify operation for instructions that provide atomic
> +  read-modify-write. LLbit is set when a linked load occurs and is tested
> +  by the conditional store.  It is cleared, during other CPU operation,
> +  when a store to the location would no longer be atomic. In particular,
> +  it is cleared by exception return instructions.  eretnc instruction
> +  enables to return from interrupt, exception, or error trap without
> +  clearing the LLbit.
> +* Clear the global variable ll_bit used by mips exception handler.

                                              MIPS

> +* Write the thread pointer to the mips userlocal register if the cpu

                                     MIPS                           CPU

> +  supports this feature.  This register is not interpreted by hardware and
> +  can be used to share data between privileged and unprivileged software.
> +* If hardware watchpoint feature is enabled during build the watchpoint
> +  registers are restored from the next task.
> +* Finally the mips processor specific implementation of the resume()

                 MIPS

> +  function is called.  It restores the registers of the next task including
> +  the stack pointer.  The implementation is in assembly in the following
> +  architecutre specific files ::
> +
> +    arch/mips/kernel/r4k_switch.S
> +    arch/mips/kernel/r2300_switch.S
> +    arch/mips/kernel/octeon_switch.S
> \ No newline at end of file

Fix warning.

> diff --git a/Documentation/scheduler/x86-context-switch.rst b/Documentation/scheduler/x86-context-switch.rst
> new file mode 100644
> index 000000000000..fc5e686a6b17
> --- /dev/null
> +++ b/Documentation/scheduler/x86-context-switch.rst
> @@ -0,0 +1,65 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +X86 Context Switch
> +------------------
> +
> +The x86 architecture context switching logic is as follows.
> +After the switching of MM in the scheduler context_switch() calls the x86
> +implementation of :c:macro:`switch_to()` For x86 arch it is located at ::

                              `switch_to()`. For

> +
> +    arch/x86/include/asm/switch_to.h
> +
> +Since kernel 4.9, switch_to() has been split into two parts: a
> +`prepare_switch_to()` macro and the inline assembly implementation of
> +__switch_to_asm() in the assembly files ::
> +
> +    arch/x86/entry/entry_64.S
> +    arch/x86/entry/entry_32.S
> +
> +prepare_switch_to() handles the case when stack uses virtual memory. This
> +is configured at build time and is mostly enabled in most modern

                              drop:   mostly

> +distributions. This function accesses the stack pointer to prevent a double
> +fault. Switching to a stack that has top-level paging entry that is not
> +present in the current MM will result in a page fault which will be promoted
> +to double fault and the result is a panic. So it is necessary to probe the
> +stack now so that the vmalloc_fault can fix the page tables.
> +
> +The main steps of the inline assembly function __switch_to_asm() are:
> +
> +* store the callee saved registers to the old stack which will be switched
> +  away from
> +* swap the stack pointers between the old and the new task
> +* move the stack canary value to the current cpu's interrupt stack

                                                CPU's

> +* if return trampoline is enabled, overwrite all entries in the RSB on
> +  exiting a guest, to prevent malicious branch target predictions from
> +  affecting the host kernel
> +* restore all registers from the new stack previously pushed in reverse
> +  order
> +* jump to a C implementation of __switch_to(). The sources are located in::
> +
> +      arch/x86/kernel/process_64.c
> +      arch/x86/kernel/process_32.c
> +
> +
> +The main steps of the c function __switch_to() which is effectively

                         C function

> +the new task running are as follows:
> +
> +* retrieve the thread :c:type:`struct thread_struct <thread_struct>`
> +  and fpu :c:type:`struct fpu <fpu>` structs from the next and previous
> +  tasks
> +* get the current cpu TSS :c:type:`struct tss_struct <tss_struct>`

                     CPU

> +* save the current FPU state while on the old task
> +* store the FS and GS segment registers before changing the thread local
> +  storage
> +* reload the GDT for the new tasks TLS
> +  Following is effectively arch_end_context_switch().
> +* save the ES and DS segments of the previous task and load the same from
> +  the nest task
> +* load the FS and GS segment registers
> +* update the current task of the cpu

                                    CPU

> +* update the top of stack pointer for the CPU for entry trampoline
> +* initialize FPU state for next task
> +* set sp0 to point to the entry trampoline stack
> +* call _switch_to_xtra() to  handles debug registers, i/o

                                                         I/O

> +  bitmaps and speculation mitigation
> +* write the task's CLOSid/RMID to IA32_PQR_MSR
> 


thanks.
-- 
~Randy


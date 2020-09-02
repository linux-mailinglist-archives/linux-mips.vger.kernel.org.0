Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A6B25B1A6
	for <lists+linux-mips@lfdr.de>; Wed,  2 Sep 2020 18:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgIBQ1T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Sep 2020 12:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728453AbgIBQ0r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Sep 2020 12:26:47 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E49C061258
        for <linux-mips@vger.kernel.org>; Wed,  2 Sep 2020 09:26:47 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id k25so6640821ljg.9
        for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2020 09:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e7KvpNJ7jujH32GR9U4Nrx75aENRP1HZRhRHORZwqyc=;
        b=q6AvVvntGApMylrO0GfWETlJHASoxeFcJxzD4N4BRAIfpjE3AJrACCwiL8m9kR0rtH
         BA2g2hK4BWDv7+Hxy6pG05jD0ntdEmeyjRVlSlntTC8+NEO53CzdzmDcDQppjAdqUlQa
         cwk05xzjPhafWWo2L9ECRL66tur1MyVTlLo7H6HHRtv/dleXGE6PcImNdWq7/GDtjHUY
         iPQjG0R4tDlqCVc5KtoiivkaeId1oXoj+AjXBhW2E2ea8Xo/mM9UAcHJX3KEeiTevra5
         ujJ/8Wa10OP3ycsNs5lhN7arWrBzQ4gx55FBiJ4oiKgROOtwa8F0xTBxdfsZfkmQm2Fi
         g2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e7KvpNJ7jujH32GR9U4Nrx75aENRP1HZRhRHORZwqyc=;
        b=h9aDpSGJ5oZCbVDx8kdnEPrPDtiIJBpc/qhca3gJzcX4ouenK6jTxodTvuoRtIZ5YO
         2e7f39eH6PNRJjZ5+z43227v4J6zR9B9jZUuGf38pmyhIYrY4RZ85Px2810WSJWQ0smf
         03kU1IihuY9mpt1BGTbMpL1G18rGszl2gs4h488NFgmKhVCbXhxdQcFj0AuOD58NuRcm
         pYSa8xB1sJeGiHS8jG5oomAdUyixSxBzqyAsvQ0qxvysCAiQqlSguAo2By7FKucIEeQH
         qbTBw8rg5z3VABc8BcFP9Nt1SHlg9ZfujHv0nLggslthOkN+Sy41u5Ht+mitG+CvCrlF
         dARw==
X-Gm-Message-State: AOAM531y7G3ix+dcjkW1gdnmz2lN032AzAeIT2owYDcrd+ULPBX9bZ3e
        zLIYWR8fqL7r1XSP7Q39VFFscA==
X-Google-Smtp-Source: ABdhPJzw6kYreIYpqMl52MMLLRUdN+K6L/pXGqPNc23h1FT3vi6LyEb3wcFHd2+VQ5l6CzxIdPqxDg==
X-Received: by 2002:a2e:b1c4:: with SMTP id e4mr3822544lja.379.1599064005681;
        Wed, 02 Sep 2020 09:26:45 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id y24sm1191887lfg.75.2020.09.02.09.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 09:26:45 -0700 (PDT)
From:   John Mathew <john.mathew@unikie.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        willy@infradead.org, valentin.schneider@arm.com,
        John Mathew <john.mathew@unikie.com>,
        Mostafa Chamanara <mostafa.chamanara@basemark.com>,
        Oleg Tsymbal <oleg.tsymbal@unikie.com>
Subject: [RFC PATCH v8 3/3] docs: scheduler: Add introduction to scheduler context-switch
Date:   Wed,  2 Sep 2020 19:26:31 +0300
Message-Id: <20200902162632.10271-4-john.mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902162632.10271-1-john.mathew@unikie.com>
References: <20200902162632.10271-1-john.mathew@unikie.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add documentation for introduction to
 -context-switch
 -x86 context-switch
 -MIPS context switch

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Co-developed-by: Mostafa Chamanara <mostafa.chamanara@basemark.com>
Signed-off-by: Mostafa Chamanara <mostafa.chamanara@basemark.com>
Co-developed-by: Oleg Tsymbal <oleg.tsymbal@unikie.com>
Signed-off-by: Oleg Tsymbal <oleg.tsymbal@unikie.com>
Signed-off-by: John Mathew <john.mathew@unikie.com>
---
 Documentation/scheduler/arch-specific.rst     |   2 +
 Documentation/scheduler/context-switching.rst | 126 ++++++++++++++++++
 Documentation/scheduler/index.rst             |   1 +
 .../scheduler/mips-context-switch.rst         |  89 +++++++++++++
 .../scheduler/x86-context-switch.rst          |  55 ++++++++
 5 files changed, 273 insertions(+)
 create mode 100644 Documentation/scheduler/context-switching.rst
 create mode 100644 Documentation/scheduler/mips-context-switch.rst
 create mode 100644 Documentation/scheduler/x86-context-switch.rst

diff --git a/Documentation/scheduler/arch-specific.rst b/Documentation/scheduler/arch-specific.rst
index 3e5af3a0695e..65dc393b605f 100644
--- a/Documentation/scheduler/arch-specific.rst
+++ b/Documentation/scheduler/arch-specific.rst
@@ -10,3 +10,5 @@ Architecture Specific Scheduler Implementation Differences
 .. toctree::
    :maxdepth: 2
 
+   x86-context-switch
+   mips-context-switch
diff --git a/Documentation/scheduler/context-switching.rst b/Documentation/scheduler/context-switching.rst
new file mode 100644
index 000000000000..04f97bff08e1
--- /dev/null
+++ b/Documentation/scheduler/context-switching.rst
@@ -0,0 +1,126 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+==========================
+Process context switching
+==========================
+
+Context Switching
+-----------------
+
+Context switching, the switching from a running task to another,
+is done by the context_switch() function defined in kernel/sched/core.c.
+It is called by __schedule() when a new process has been selected to run.
+The execution flow is as follows:
+
+ - prepare_task_switch() performs necessary kernel preparations for the
+   context switch and then calls prepare_arch_switch() for architecture
+   specific context switch preparation. This call must be paired with a
+   subsequent finish_task_switch() after the context switch. The various
+   steps are:
+
+    - Prepare kcov for context switch. Context switch does switch_mm() to the
+      next task's mm, then switch_to() that new task. This means vmalloc'd
+      regions which had previously been faulted in can transiently disappear in
+      the context of the prev task. Functions instrumented by KCOV may try to
+      access a vmalloc'd kcov_area during this window, and result in a recursive
+      fault. This is avoided by setting a new flag: KCOV_IN_CTXSW in kcov_mode
+      prior to switching the mm, and cleared once the new task is live.
+    - Update sched_info statistics for both the prev and next tasks.
+    - Handle perf subsystem context switch from previous task to next.
+      The various steps are:
+
+        - Remove perf events for the task being context-switched out.
+        - Stop each perf event and update the event value in event->count.
+        - Call the context switch callback for PMU with flag indicating
+          schedule out.
+        - Create a PERF_RECORD_MISC_SWITCH_OUT perf event.
+        - Context switch the perf event contexts between the current and next tasks.
+        - Schedule out current cgroup events if cgroup perf events exist on the
+          CPU.
+
+    - Set TIF_NOTIFY_RESUME flag on the current thread for the Restartable
+      sequence mechanism. Restartable sequences allow user-space to perform
+      update operations on per-cpu data without requiring heavy-weight atomic
+      operations.
+    - Fire preempt notifiers. A task can request the scheduler to notify it
+      whenever it is preempted or scheduled back in. This allows the task to
+      swap any special-purpose registers like the FPU or Intel's VT registers.
+    - Claim the next task as running to prevent load balancing run on it.
+
+ - arch_start_context_switch() batches the reload of page tables and other
+   process state with the actual context switch code for paravirtualized
+   guests.
+
+ - Transfer the real and anonymous address spaces between the switching tasks.
+   Four possible transfer types are:
+
+    - kernel task switching to another kernel task
+    - user task switching to a kernel task
+    - kernel task switching to user task
+    - user task switching to user task
+
+    For a kernel task switching to kernel task enter_lazy_tlb() is called
+    which is an architecture specific implementation to handle a context
+    without an mm. Architectures implement lazy tricks to minimize TLB
+    flushes here. The active address space from the previous task is
+    borrowed (transferred) to the next task.
+
+    For a user task switching to kernel task it will have a real address
+    space and so its anonymous users counter is incremented. This makes
+    sure that the address space will not get freed even after the previous
+    task exits.
+
+    For a user task switching to user task the architecture specific
+    switch_mm_irqs_off() or switch_mm() functions are called.  The main
+    functionality of these calls is to switch the address space between
+    the user space processes.  This includes switching the page table pointers
+    either via retrieved valid ASID for the process or page mapping in the TLB.
+
+    For a kernel task switching to a user task, switch_mm_irqs_off()
+    replaces the address space of prev kernel task(last active_mm) with the
+    next (next mm) from the user task. The context_switch() function saves the
+    active_mm to the runqueue’s prev_mm field to drop this mm later in
+    the finish_task_switch().
+
+ - prepare_lock_switch() releases lockdep of the runqueue lock to handle
+   the special case of the scheduler context switch where the runqueue lock
+   will be released by the next task.
+
+ - Architecture specific implementation of switch_to() switches the
+   register state and the stack. This involves saving and restoring stack
+   information and the processor registers and any other
+   architecture-specific state that must be managed and restored on a
+   per-process basis.
+
+ - finish_task_switch() performs the final steps of the context switch:
+
+    - Emit a warning if the preempt count is corrupted and set the preempt count
+      to FORK_PREEMPT_COUNT.
+    - Reset the pointer to the memory descriptor used by prev which was set in
+      context_switch().
+    - Store the state of the previous task to handle the possibility of a DEAD
+      task.
+    - Do virtual CPU time accounting for the previous task.
+    - Handle perf subsystem context switch from previous task to current:
+
+       - Add perf events for the current task.
+       - Schedule in current cgroup events if cgroup perf events exist on the
+         CPU.
+       - Context switch the perf event contexts between the prev and current
+         tasks.
+       - Clear the PERF_RECORD_MISC_SWITCH_OUT perf event.
+       - Call the context switch callback for PMU with flag indicating
+         schedule in.
+
+    - Free the task for load balancing run on it.
+    - Unlock the rq lock.
+    - Clear the KCOV_IN_CTXSW in kcov_mode which was set in prepare_task_switch
+      now that the new task is live.
+    - Fire preempt notifiers to notify about task scheduled back in.
+    - If the prev task state indicated that it was dead, the corresponding
+      scheduler class task_dead hook is called. Function-return probe
+      instances associated with the task are removed and put back on the
+      free list. Stack for the task is freed and drop the RCU references.
+    - Evaluate the need for No idle tick due to the context switch and do the
+      idle tick if needed.
+
diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index e3b1d4fc1604..fc7ee056f3bb 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -20,6 +20,7 @@ specific implementation differences.
     sched-data-structs
     cfs-overview
     sched-design-CFS
+    context-switching
     sched-features
     arch-specific
     sched-debugging
diff --git a/Documentation/scheduler/mips-context-switch.rst b/Documentation/scheduler/mips-context-switch.rst
new file mode 100644
index 000000000000..42a3454a06f0
--- /dev/null
+++ b/Documentation/scheduler/mips-context-switch.rst
@@ -0,0 +1,89 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+==============================================
+MIPS Architecture And Scheduler implementation
+==============================================
+
+Multi-threading in MIPS CPUs
+-----------------------------
+The MIPS architecture defines four coprocessors.
+
+ - CP0: supports virtual memory system and exception handling.
+ - CP1: reserved for the floating point coprocessor, the FPU.
+ - CP2: available for specific implementations.
+ - CP3: reserved for floating point operations in the release 1
+   implementation of MIPS64.
+
+MIPS32 and MIPS64 architectures provide support for optional components
+known as Modules or Application Specific Extensions. The MT module
+enables the architecture to support multi-threaded implementations.
+This includes support for virtual processors and lightweight thread
+contexts. Implementation of MT features depends on the individual MIPS
+cores. The virtual processing element (VPE) maintains a complete copy
+of the processor state as seen by the software system which includes
+interrupts, register set, and MMU. This enables a single processor to
+appear to an SMP operating system like two separate cores if it has
+2 VPE's. For example two separate OSes can run on each VPE such as Linux
+and and an RTOS.
+
+A lighter version of VPE enables threading at the user/application
+software level.  It is called Thread Context (TC). TC is the hardware
+state necessary to support a thread of execution. This includes a set
+of general purpose registers (GPRs), a program counter (PC), and some
+multiplier and coprocessor state.  TCs have common execution unit.
+MIPS ISA provides instructions to utilize TC.
+
+The Quality of service block of the MT module allows the allocation of
+processor cycles to threads, and sets relative thread priorities. This
+enables 2 thread prioritization mechanisms. The user can prioritize one
+thread over the other as well as allocate a specific ratio of the cycles
+to specific threads. These mechanisms allocate bandwidth to a set
+of threads effectively. QoS block improves system level determinism
+and predictability. Qos block can be replaced by more application
+specific blocks.
+
+MIPS Context Switch
+-------------------
+
+Context switch behavior specific to MIPS begins in the way the switch_to()
+macro is implemented. The main steps in the MIPS implementation of the macro
+are:
+
+ - Handle the FPU affinity management feature. This feature is enabled
+   by the config option CONFIG_MIPS_MT_FPAFF at build time. The macro checks
+   if the FPU was used in the most recent time slice. In case FPU was not
+   used, the restriction of having to run on a CPU with FPU is removed.
+ - Disable the FPU and clear the bit indicating the FPU was used in this
+   quantum for the task for the previous task.
+ - If FPU is enabled in the next task, check FCSR for any unmasked
+   exceptions pending, clear them and send a signal.
+ - If MIPS DSP modules is enabled, save the DSP context of the previous
+   task and restore the dsp context of the next task.
+ - If coprocessor 2 is present set the access allowed field of the
+   coprocessor 2.
+ - If coprocessor 2 access allowed field was set in previous task, clear it.
+ - Clear the the access allowed field of the coprocessor 2.
+ - Clear the llbit on MIPS release 6 such that instruction eretnc can be
+   used unconditionally when returning to userland in entry.S.
+   LLbit is used to specify operation for instructions that provide atomic
+   read-modify-write. LLbit is set when a linked load occurs and is tested
+   by the conditional store.  It is cleared, during other CPU operation,
+   when a store to the location would no longer be atomic. In particular,
+   it is cleared by exception return instructions.  eretnc instruction
+   enables to return from interrupt, exception, or error trap without
+   clearing the LLbit.
+ - Clear the global variable ll_bit used by MIPS exception handler.
+ - Write the thread pointer to the MIPS userlocal register if the CPU
+   supports this feature. This register is not interpreted by hardware and
+   can be used to share data between privileged and unprivileged software.
+ - If hardware watchpoint feature is enabled during build, the watchpoint
+   registers are restored from the next task.
+ - Finally the MIPS processor specific implementation of the resume()
+   function is called. It restores the registers of the next task including
+   the stack pointer. The implementation is in assembly in the following
+   architecutre specific files ::
+
+        arch/mips/kernel/r4k_switch.S
+        arch/mips/kernel/r2300_switch.S
+        arch/mips/kernel/octeon_switch.S
+
diff --git a/Documentation/scheduler/x86-context-switch.rst b/Documentation/scheduler/x86-context-switch.rst
new file mode 100644
index 000000000000..96941d9435fc
--- /dev/null
+++ b/Documentation/scheduler/x86-context-switch.rst
@@ -0,0 +1,55 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+X86 Context Switch
+------------------
+
+The x86 architecture context switching logic is as follows.
+After the switching of MM in the scheduler, context_switch() calls the x86
+implementation of switch_to() macro. For x86 arch it is located at ::
+
+    arch/x86/include/asm/switch_to.h
+
+The macro calls the the assembly implementation of __switch_to_asm() in the
+assembly files ::
+
+    arch/x86/entry/entry_64.S
+    arch/x86/entry/entry_32.S
+
+The main steps of the assembly function __switch_to_asm() are:
+
+ - store the callee saved registers to the old stack which will be switched
+   away from.
+ - swap the stack pointers between the old and the new task.
+ - move the stack canary value to the current CPU's interrupt stack
+ - if return trampoline is enabled, overwrite all entries in the RSB on
+   exiting a guest, to prevent malicious branch target predictions from
+   affecting the host kernel.
+ - restore all registers from the new stack previously pushed in reverse
+   order.
+ - jump to a C implementation of __switch_to(). The sources are located in::
+
+      arch/x86/kernel/process_64.c
+      arch/x86/kernel/process_32.c
+
+
+The main steps of the C function __switch_to() which is effectively
+the new task running are as follows:
+
+ - retrieve the thread_struct and fpu struct from the next and previous tasks.
+ - get the current CPU tss_struct.
+ - save the current FPU state while on the old task.
+ - store the FS and GS segment registers before changing the thread local
+   storage.
+ - reload the GDT for the new tasks TLS.
+
+   Following is effectively arch_end_context_switch().
+ - save the ES and DS segments of the previous task and load the same from
+   the nest task.
+ - load the FS and GS segment registers.
+ - update the current task of the CPU.
+ - update the top of stack pointer for the CPU for entry trampoline.
+ - initialize FPU state for next task.
+ - set sp0 to point to the entry trampoline stack.
+ - call _switch_to_xtra() to handle debug registers, I/O
+   bitmaps and speculation mitigation.
+ - write the task's CLOSid/RMID to IA32_PQR_MSR.
-- 
2.17.1


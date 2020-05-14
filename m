Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65D9D1D2B67
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 11:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbgENJ1E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 05:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725935AbgENJ04 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 05:26:56 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50A6DC061A0E
        for <linux-mips@vger.kernel.org>; Thu, 14 May 2020 02:26:56 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id o14so2731084ljp.4
        for <linux-mips@vger.kernel.org>; Thu, 14 May 2020 02:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1wL5R3vO+lL8Dd7C3wcfbER/n0qOq9bKPHk33Ao8I8U=;
        b=kWWSklWBppO2L2Xa2j4VwEZt5GCAC5gqA5Qzno8FVY+yfk5e7zsTTsqzlSccZd5WE3
         /WdGL0/4qDeUyLBn7mGzZfcrgOzgahRRL70lUjRn7mwlCMBFdBlDB/d08crh6Ii7fXeT
         XJteJ4SwKOvmH8liblFaNK7uJdOmo7iMTr46/GLeMb4RHnBCKILnSLL0jx2pR8aHXCWJ
         QPkLHr/x6abZDMyqeAbMhdnur0d6In0YHZOTuYOtt0Pfbhah+cCUmM+nthUL9BwZnpll
         lsfUuhFs9JAT7rQxxKFxKS1Pm592dhYcBHAg1HA4fDJ1Up/QBSypYIuG0EuW2EC8/zms
         56AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1wL5R3vO+lL8Dd7C3wcfbER/n0qOq9bKPHk33Ao8I8U=;
        b=XJfS4V8HP9sv87wFf8ZP0qTZS8S2xFMAJWdd36Vf78GdacD+gnXs+A+HaAGYBzE/QJ
         DCy9G8zdiFoKRs9Xy1vaq0ETHfyR+poe205DNGn6LQymBKusNxDcos4oq256tpb2ekMl
         EG4Hpuz9bOqNp5KBLBZBHRNY4WYLer1wxe8w8CJoQ9RdKfb4ugDOLmWrmTNuGSLBuI/9
         orGoPlYr/i0bIIwbqn4Xcigj5gavgZIyNYGQF2UdF9ELBAVEsOtw0uHvPd13dlSmfaoy
         fsW7UqdCdz8w6fdmZjqwoae1LRlb1+0ZrZx28eTKNX7TzCyJ9E0xtJdsTbmCfnQHu3Kf
         B4+A==
X-Gm-Message-State: AOAM531Pp93llhQ49TXQ9GOz+2ClFz77N2oV56yDISRQjTmaTAzJ8HqS
        5abFISHeu3Y9aUwoc/5hiuW5GQ==
X-Google-Smtp-Source: ABdhPJyFQ+SQxmIRxCGs2mb8bKQMrhHnQN8MErz0OLS8YKVrOtz5745R6GI7E4hVaaV3Lpd/K/TIKQ==
X-Received: by 2002:a2e:2ac6:: with SMTP id q189mr1774237ljq.221.1589448414431;
        Thu, 14 May 2020 02:26:54 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id e25sm1426117lfb.89.2020.05.14.02.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 02:26:53 -0700 (PDT)
From:   john mathew <john.mathew@unikie.com>
X-Google-Original-From: john mathew <John.Mathew@unikie.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@gmail.com, willy@infradead.org,
        valentin.schneider@arm.com, rdunlap@infradead.org,
        John Mathew <john.mathew@unikie.com>,
        Mostafa Chamanara <mostafa.chamanara@basemark.com>,
        Oleg Tsymbal <oleg.tsymbal@unikie.com>
Subject: [RFC PATCH v5 3/3] docs: scheduler: Add introduction to scheduler context-switch
Date:   Thu, 14 May 2020 12:26:37 +0300
Message-Id: <20200514092637.15684-4-John.Mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200514092637.15684-1-John.Mathew@unikie.com>
References: <20200514092637.15684-1-John.Mathew@unikie.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: John Mathew <john.mathew@unikie.com>

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
 Documentation/scheduler/arch-specific.rst     |   3 +
 Documentation/scheduler/context-switching.rst | 125 ++++++++++++++++++
 Documentation/scheduler/index.rst             |   1 +
 .../scheduler/mips-context-switch.rst         |  89 +++++++++++++
 .../scheduler/x86-context-switch.rst          |  65 +++++++++
 5 files changed, 283 insertions(+)
 create mode 100644 Documentation/scheduler/context-switching.rst
 create mode 100644 Documentation/scheduler/mips-context-switch.rst
 create mode 100644 Documentation/scheduler/x86-context-switch.rst

diff --git a/Documentation/scheduler/arch-specific.rst b/Documentation/scheduler/arch-specific.rst
index c9c34863d994..65dc393b605f 100644
--- a/Documentation/scheduler/arch-specific.rst
+++ b/Documentation/scheduler/arch-specific.rst
@@ -9,3 +9,6 @@ Architecture Specific Scheduler Implementation Differences
 
 .. toctree::
    :maxdepth: 2
+
+   x86-context-switch
+   mips-context-switch
diff --git a/Documentation/scheduler/context-switching.rst b/Documentation/scheduler/context-switching.rst
new file mode 100644
index 000000000000..44a185764d3c
--- /dev/null
+++ b/Documentation/scheduler/context-switching.rst
@@ -0,0 +1,125 @@
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
+is done by the context_switch() function defined in kernel/sched.c.
+It is called by __schedule() when a new process has been selected to run.
+The execution flow is as follows:
+
+* prepare_task_switch() performs necessary kernel preparations for the
+  context switch and then calls prepare_arch_switch() for architecture
+  specific context switch preparation. This call must be paired with a
+  subsequent finish_task_switch() after the context switch. The various
+  steps are:
+
+  - Prepare kcov for context switch. Context switch does switch_mm() to the
+    next task's mm, then switch_to() that new task. This means vmalloc'd
+    regions which had previously been faulted in can transiently disappear in
+    the context of the prev task. Functions instrumented by KCOV may try to
+    access a vmalloc'd kcov_area during this window, and result in a recursive
+    fault. This is avoided by setting a new flag: KCOV_IN_CTXSW in kcov_mode
+    prior to switching the mm, and cleared once the new task is live.
+  - Update sched_info statistics for both the prev and next tasks.
+  - Handle perf subsystem context switch from previous task to next.
+    The various steps are:
+
+    * Remove perf events for the task being context-switched out.
+    * Stop each perf event and update the event value in event->count.
+    * Call the context switch callback for PMU with flag indicating
+      schedule out.
+    * Create a PERF_RECORD_MISC_SWITCH_OUT perf event.
+    * Context switch the perf event contexts between the current and next tasks.
+    * Schedule out current cgroup events if cgroup perf events exist on the
+      CPU.
+
+  - Set TIF_NOTIFY_RESUME flag on the current thread for the Restartable
+    sequence mechanism. Restartable sequences allow user-space to perform
+    update operations on per-cpu data without requiring heavy-weight atomic
+    operations.
+  - Fire preempt notifiers. A task can request the scheduler to notify it
+    whenever it is preempted or scheduled back in. This allows the task to
+    swap any special-purpose registers like the FPU or Intel's VT registers.
+  - Claim the next task as running to prevent load balancing run on it.
+
+* arch_start_context_switch() batches the reload of page tables and other
+  process state with the actual context switch code for paravirtualized
+  guests.
+
+* Transfer the real and anonymous address spaces between the switching tasks.
+  Four possible transfer types are:
+
+  * kernel task switching to another kernel task
+  * user task switching to a kernel task
+  * kernel task switching to user task
+  * user task switching to user task
+
+  For a kernel task switching to kernel task enter_lazy_tlb() is called
+  which is an architecture specific implementation to handle a context
+  without an mm. Architectures implement lazy tricks to minimize TLB
+  flushes here. The active address space from the previous task is
+  borrowed (transferred) to the next task.
+
+  For a user task switching to kernel task it will have a real address
+  space and so its anonymous users counter is incremented. This makes
+  sure that the address space will not get freed even after the previous
+  task exits.
+
+  For a user task switching to user task the architecture specific
+  switch_mm_irqs_off() or switch_mm() functions are called.  The main
+  functionality of these calls is to switch the address space between
+  the user space processes.  This includes switching the page table pointers
+  either via retrieved valid ASID for the process or page mapping in the TLB.
+
+  For a kernel task switching to a user task, switch_mm_irqs_off()
+  replaces the address space of prev kernel task with the next from the user
+  task. Same as for exiting process in this case, the context_switch()
+  function saves the pointer to the memory descriptor used by prev in the
+  runqueue’s prev_mm field and resets prev task active address space.
+
+* prepare_lock_switch() releases lockdep of the runqueue lock to handle
+  the special case of the scheduler context switch where the runqueue lock
+  will be released by the next task.
+
+* Architecture specific implementation of switch_to() switches the
+  register state and the stack. This involves saving and restoring stack
+  information and the processor registers and any other
+  architecture-specific state that must be managed and restored on a
+  per-process basis.
+
+* finish_task_switch() performs the final steps of the context switch:
+
+  - Emit a warning if the preempt count is corrupted and set the preempt count
+    to FORK_PREEMPT_COUNT.
+  - Reset the pointer to the memory descriptor used by prev which was set in
+    context_switch().
+  - Store the state of the previous task to handle the possibility of a DEAD
+    task.
+  - Do virtual CPU time accounting for the previous task.
+  - Handle perf subsystem context switch from previous task to current:
+
+    - Add perf events for the current task.
+    - Schedule in current cgroup events if cgroup perf events exist on the
+      CPU.
+    - Context switch the perf event contexts between the prev and current
+      tasks.
+    - Clear the PERF_RECORD_MISC_SWITCH_OUT perf event.
+    - Call the context switch callback for PMU with flag indicating
+      schedule in.
+  - Free the task for load balancing run on it.
+  - Unlock the rq lock.
+  - Clear the KCOV_IN_CTXSW in kcov_mode which was set in prepare_task_switch
+    now that the new task is live.
+  - Fire preempt notifiers to notify about task scheduled back in.
+  - If the prev task state indicated that it was dead, the corresponding
+    scheduler class task_dead hook is called. Function-return probe
+    instances associated with the task are removed and put back on the
+    free list. Stack for the task is freed and drop the RCU references.
+  - Evaluate the need for No idle tick due to the context switch and do the
+    idle tick if needed.
+
diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index f311abe5b711..691fdfe32954 100644
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
index 000000000000..d833ab6d8a76
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
+- CP0: supports virtual memory system and exception handling.
+- CP1: reserved for the floating point coprocessor, the FPU.
+- CP2: available for specific implementations.
+- CP3: reserved for floating point operations in the release 1
+  implementation of MIPS64.
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
+Context switch behavior specific to MIPS begins in the way
+:c:macro:`switch_to()` macro is implemented. The main steps in the MIPS
+implementation of the macro are:
+
+* Handle the FPU affinity management feature. This feature is enabled
+  by the :c:macro:`CONFIG_MIPS_MT_FPAFF` at build time. The macro checks
+  if the FPU was used in the most recent time slice. In case FPU was not
+  used, the restriction of having to run on a CPU with FPU is removed.
+* Disable the FPU and clear the bit indicating the FPU was used in this
+  quantum for the task for the previous task.
+* If FPU is enabled in the next task, check FCSR for any unmasked
+  exceptions pending, clear them and send a signal.
+* If MIPS DSP modules is enabled, save the DSP context of the previous
+  task and restore the dsp context of the next task.
+* If coprocessor 2 is present set the access allowed field of the
+  coprocessor 2.
+* If coprocessor 2 access allowed field was set in previous task, clear it.
+* Clear the the access allowed field of the coprocessor 2.
+* Clear the llbit on MIPS release 6 such that instruction eretnc can be
+  used unconditionally when returning to userland in entry.S.
+  LLbit is used to specify operation for instructions that provide atomic
+  read-modify-write. LLbit is set when a linked load occurs and is tested
+  by the conditional store.  It is cleared, during other CPU operation,
+  when a store to the location would no longer be atomic. In particular,
+  it is cleared by exception return instructions.  eretnc instruction
+  enables to return from interrupt, exception, or error trap without
+  clearing the LLbit.
+* Clear the global variable ll_bit used by MIPS exception handler.
+* Write the thread pointer to the MIPS userlocal register if the CPU
+  supports this feature. This register is not interpreted by hardware and
+  can be used to share data between privileged and unprivileged software.
+* If hardware watchpoint feature is enabled during build, the watchpoint
+  registers are restored from the next task.
+* Finally the MIPS processor specific implementation of the resume()
+  function is called. It restores the registers of the next task including
+  the stack pointer. The implementation is in assembly in the following
+  architecutre specific files ::
+
+    arch/mips/kernel/r4k_switch.S
+    arch/mips/kernel/r2300_switch.S
+    arch/mips/kernel/octeon_switch.S
+
diff --git a/Documentation/scheduler/x86-context-switch.rst b/Documentation/scheduler/x86-context-switch.rst
new file mode 100644
index 000000000000..68453e99cb2b
--- /dev/null
+++ b/Documentation/scheduler/x86-context-switch.rst
@@ -0,0 +1,65 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+X86 Context Switch
+------------------
+
+The x86 architecture context switching logic is as follows.
+After the switching of MM in the scheduler context_switch() calls the x86
+implementation of :c:macro:`switch_to()`. For x86 arch it is located at ::
+
+    arch/x86/include/asm/switch_to.h
+
+Since kernel 4.9, switch_to() has been split into two parts: a
+`prepare_switch_to()` macro and the inline assembly implementation of
+__switch_to_asm() in the assembly files ::
+
+    arch/x86/entry/entry_64.S
+    arch/x86/entry/entry_32.S
+
+prepare_switch_to() handles the case when stack uses virtual memory. This
+is configured at build time and is enabled in most modern distributions.
+This function accesses the stack pointer to prevent a double fault.
+Switching to a stack that has top-level paging entry that is not
+present in the current MM will result in a page fault which will be promoted
+to double fault and the result is a panic. So it is necessary to probe the
+stack now so that the vmalloc_fault can fix the page tables.
+
+The main steps of the inline assembly function __switch_to_asm() are:
+
+* store the callee saved registers to the old stack which will be switched
+  away from.
+* swap the stack pointers between the old and the new task.
+* move the stack canary value to the current CPU's interrupt stack
+* if return trampoline is enabled, overwrite all entries in the RSB on
+  exiting a guest, to prevent malicious branch target predictions from
+  affecting the host kernel.
+* restore all registers from the new stack previously pushed in reverse
+  order.
+* jump to a C implementation of __switch_to(). The sources are located in::
+
+      arch/x86/kernel/process_64.c
+      arch/x86/kernel/process_32.c
+
+
+The main steps of the C function __switch_to() which is effectively
+the new task running are as follows:
+
+* retrieve the thread :c:type:`struct thread_struct <thread_struct>`
+  and fpu :c:type:`struct fpu <fpu>` structs from the next and previous
+  tasks.
+* get the current CPU TSS :c:type:`struct tss_struct <tss_struct>`.
+* save the current FPU state while on the old task.
+* store the FS and GS segment registers before changing the thread local
+  storage.
+* reload the GDT for the new tasks TLS.
+  Following is effectively arch_end_context_switch().
+* save the ES and DS segments of the previous task and load the same from
+  the nest task.
+* load the FS and GS segment registers.
+* update the current task of the CPU.
+* update the top of stack pointer for the CPU for entry trampoline.
+* initialize FPU state for next task.
+* set sp0 to point to the entry trampoline stack.
+* call _switch_to_xtra() to handle debug registers, I/O
+  bitmaps and speculation mitigation.
+* write the task's CLOSid/RMID to IA32_PQR_MSR.
-- 
2.17.1


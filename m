Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA3319A922
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2020 12:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbgDAKDG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Apr 2020 06:03:06 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42295 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732164AbgDAKC5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Apr 2020 06:02:57 -0400
Received: by mail-lj1-f196.google.com with SMTP id q19so25049928ljp.9
        for <linux-mips@vger.kernel.org>; Wed, 01 Apr 2020 03:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5rUEwjtblUviLjV80afy/WRz2oEQBxd1hdzm/u9iAj8=;
        b=YsvhGe4vKyfCVK88GHK7cmxfN+88edT0VkuTqa5hX/rQBSbtnZ93EWNhss7glKq5Su
         SJsnIU3ztgWFR7nILD+AhyzlfgtG1T0Rk1PnViK41gWRMAysB2xB+VD51DtZzkMTl0xJ
         dZ6Wg8FO0Mkmr/qhmfW8Ta5DKip0ZcapxIKXy+BKTIAfsx09OyXpVnWblZFzIIlG1cF0
         oYFY9aJvVcXmTxANNKIXk/yXak4IXTH1aSWyVIiSvDPVwHB730VxXxVab0yBjgI4wzo9
         bJlM9EMOOLz4jRUFoxMNmU6gvTvic0O0cBEAQ8ujSigyo1TuoniecXiCVh/iqJRepz0d
         uBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5rUEwjtblUviLjV80afy/WRz2oEQBxd1hdzm/u9iAj8=;
        b=KX2f//bU9b2j7oCliM+d2oSq6ylix2f+gjhZIMoFNVIeSrB0TdvDUnM1chHA8j4Zly
         Kof7BgUPztATKyQnvV5ZZEH7NClL4lT9fgSi8JSnzf3AdCqf1NxIAbdO4hj0+EgKjt8W
         jicBVnu5rH5O9dPAxFNyaH1GFceGe+7ntYw0FZVjMwg58eaBPXp3iVgVCcZsRq/r49H5
         NzfhmMXLFOIfWz0tjb+V92AwuieVNDQG8mofIZGIwLUAWnX/bNavUVK097Ll2zwxi8jm
         b4uFxOu8o7z5ToM//ts1WTAgdHhwITiJT0UCxfUZjTiSdmRS/HvXcO+Bc72LW/JhowMW
         v1Lw==
X-Gm-Message-State: AGi0PuaJBcM1MqSP4wdg9MHwEAlp/7jgdyaHAmQNXRir4jq7TiJHC6/r
        czC8U6jwMr/73DVUSUhRYU210g==
X-Google-Smtp-Source: APiQypJLawd1hdpMcOv6TsEpEcxgg/N7HHiLMBjxEQyZRGFiYXSIgPidJo2j84WUV78z8qhhHIleSw==
X-Received: by 2002:a05:651c:105b:: with SMTP id x27mr3576327ljm.2.1585735373561;
        Wed, 01 Apr 2020 03:02:53 -0700 (PDT)
Received: from localhost.localdomain (dyvyn9m99j8s7-9xsphjt-4.rev.dnainternet.fi. [2001:14bb:440:beab:bd3f:1fbf:f66f:618f])
        by smtp.googlemail.com with ESMTPSA id n14sm862986ljm.104.2020.04.01.03.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 03:02:53 -0700 (PDT)
From:   John Mathew <john.mathew@unikie.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com,
        John Mathew <john.mathew@unikie.com>
Subject: [RFC PATCH 3/3] docs: scheduler: Add introduction to scheduler context-switch
Date:   Wed,  1 Apr 2020 13:00:29 +0300
Message-Id: <20200401100029.1445-4-john.mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200401100029.1445-1-john.mathew@unikie.com>
References: <20200401100029.1445-1-john.mathew@unikie.com>
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
Signed-off-by: John Mathew <john.mathew@unikie.com>
---
 Documentation/scheduler/arch-specific.rst     |  3 +
 Documentation/scheduler/context-switching.rst | 71 +++++++++++++++++
 Documentation/scheduler/index.rst             |  1 +
 .../scheduler/mips-context-switch.rst         | 78 +++++++++++++++++++
 .../scheduler/x86-context-switch.rst          | 59 ++++++++++++++
 5 files changed, 212 insertions(+)
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
index 000000000000..dd4ff63b1e97
--- /dev/null
+++ b/Documentation/scheduler/context-switching.rst
@@ -0,0 +1,71 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+==========================
+Process context switching
+==========================
+
+Context Switching
+-----------------
+
+Context switching, the switching from a running task to another, is handled by
+the :c:func:`context_switch()` function defined in kernel/sched.c . It is called
+by __schedule() when a new process has been selected to run.
+
+ The execution flow is as follows:
+
+* Calls prepare_task_switch() to prepare both previous and new task by
+  storing or changing some values in their task_struct.
+
+
+* Calls macro :c:macro:`arch_start_context_switch()`
+  A facility to provide batching of the reload of page tables and  other process
+  state with the actual context switch code for  paravirtualized guests.  By
+  convention, only one of the batched  update (lazy) modes (CPU, MMU) should be
+  active at any given time,  entry should never be nested, and entry and exits
+  should always be  paired. This is for sanity of maintaining and reasoning about
+  the kernel code.  In this case, the exit (end of the context switch) is  in
+  architecture-specific code, and so doesn't need a generic definition.
+
+
+* The next few steps consists of handling the transfer of real and anonymous
+  address spaces between the switching tasks.  Four possible context switches are
+
+  - kernel task switching to another kernel task.
+  - user task switching to a kernel task.
+  - kernel task switching to user task,
+  - user task switching to  user task.
+
+For a kernel task switching to kernel task :c:func:`enter_lazy_tlb()` is called
+which is an architecture specific implementation to handle a context without an
+mm. Architectures implement lazy tricks to minimize tlb flushes here.
+Then the active address space from the previous task is borrowed (transferred)
+to the next task. The active address space of the previous task is set to NULL.
+
+For a user task switching to kernel task it will have a real address space. This
+address space is pinned by calling :c:func:`mmgrab()` . This makes sure that the
+address space will not get freed even after the previous task exits.
+
+For a user task switching to user task the architecture specific
+:c:func:`switch_mm_irqs_off()` or :c:func:`switch_mm()` functions. The main
+functionality of this calls is to switch the address space between the
+user space processes. This includes switching the page table pointers and
+ensuring that the new address space has a valid ASID.
+
+For a kernel task switching to a user task, the active address space of the
+kernel task is transferred to the user task and the active address space of the
+kernel task is set to NULL.
+
+* Next the  :c:func:`prepare_lock_switch()` function is called for a lockdep
+  release of the runqueue lock to handle the special case of the scheduler in which
+  the runqueue lock will be released by the next task.
+
+* Then the architecture specific implementation of the :c:func:`switch_to()`
+  function is called to switch the register state and the stack. This involves
+  saving and restoring stack information and the processor registers and any other
+  architecture-specific state that must be managed and restored on a per-process
+  basis.
+
+* Calls finish_task_switch()  must be called after the context switch,
+  paired with a prepare_task_switch() call before the context switch.It will
+  reconcile locking set up by prepare_task_switch, and do any other
+  architecture-specific cleanup actions.
diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 9772cf81fd96..289e06a68764 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -18,6 +18,7 @@ specific implementation differences.
 
     overview
     cfs-sched-overview
+    context-switching
     sched-features
     arch-specific.rst
     sched-debugging.rst
diff --git a/Documentation/scheduler/mips-context-switch.rst b/Documentation/scheduler/mips-context-switch.rst
new file mode 100644
index 000000000000..e917bbe1c104
--- /dev/null
+++ b/Documentation/scheduler/mips-context-switch.rst
@@ -0,0 +1,78 @@
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
+- CP1: reserved for the floating point coprocessor, the FPU
+- CP2: available for specific implementations.
+- CP3: reserved for floating point operations in the release 1 implementation
+       of MIPS64.
+
+MIPS32 and MIPS64 architectures provide support for optional components known
+as Modules or Application Specific Extensions. The MT module enables the
+architecture to support multi-threaded implementations. This includes support
+for virtual processors and light weight thread contexts. Implementation of MT
+features depends on the individual MIPS cores. The virtual processing element (VPE)
+maintains a complete copy of the processor state as seen by the software system
+which includes interrupts, register set, and MMU. This enables a single processor
+to appear to an SMP operating system like two separate cores if it has 2 VPE's.
+For example two separate OS can run on each VPE such as Linux and and an RTOS.
+
+A lighter version of VPE enables threading at the user/application software level.
+It is called Thread Context (TC). TC, is the hardware state necessary to support
+a thread of execution. This includes a set of general purpose registers (GPRs),
+a program counter (PC), and some multiplier and coprocessor state. TC's have
+common execution unit. MIPS ISA provides instructions to utilize TC.
+
+The Quality of service block of the MT module allows the allocation of processor
+cycles to threads, and sets relative thread priorities. This enables 2 thread
+prioritization mechanisms. The user can prioritize one thread over the other as
+well as allocate a specific ratio of the cycles to specific threads. These
+mechanisms help to allocate bandwidth a set of threads effectively. QoS block
+improves system level determinism  and predictability. QosS block can be replaced
+by more application specific blocks.
+
+MIPS Context Switch
+-------------------
+
+Context switch behavior specific to MIPS begins in the way :c:macro:`switch_to()`
+macro is implemented. The main steps in the MIPS implementation of the macro are:
+
+* Handle the FPU affinity management feature . This feature is enabled by the
+  :c:macro:`CONFIG_MIPS_MT_FPAFF` at build time The macro checks if the FPU was
+  used in the most recent time slice. In case FPU was not used, the restriction of
+  having to run on a cpu with FPU is removed.
+* For the previous task, disable the fpu and clear the bit indicating the FPU was
+  used in this quantum for the task.
+* If fpu is enabled in the next task, check FCSR for any unmasked exceptions
+  pending, clear them and send a signal.
+* if MIPS DSP modules is enabled, save the dsp context of the previous task and
+  restore the dsp context of the next task.
+* If coprocessor 2 is present set the access allowed field of the coprocessor 2.
+* if coprocessor 2 access allowed field was set in previous task, clear it.
+* clear the the access allowed field of the coprocessor 2.
+* clear the llbit on MIPS release 6 such that instruction eretnc can be used
+  unconditionally when returning to userland in entry.S. LLbit is used to specify
+  operation for instructions that provide atomic read-modify-write. LLbit is set
+  when a linked load occurs and is tested by the conditional store. It is cleared,
+  during other CPU operation, when a store to the location would no longer be
+  atomic. In particular, it is cleared by exception return instructions.
+  eretnc instruction enables to return from interrupt, exception, or error trap
+  without clearing the LLbit.
+* clear the global variable ll_bit used by mips exception handler.
+* write the thread pointer to the mips userlocal register if the cpu supports
+  this feature. This register is not interpreted by hardware and can be used to
+  share data between privileged and unprivileged software.
+* if hardware watchpoint feature is enabled during build the watchpoint registers
+  are restored from the next task.
+* Finally the mips processor specific implementation of the :c:func:`resume()`
+  function is called. It restores the registers of the next task including the
+  stack pointer. The implementation is in assembly::
+
+    arch/mips/kernel/r4k_switch.S
diff --git a/Documentation/scheduler/x86-context-switch.rst b/Documentation/scheduler/x86-context-switch.rst
new file mode 100644
index 000000000000..ae7b2e09453a
--- /dev/null
+++ b/Documentation/scheduler/x86-context-switch.rst
@@ -0,0 +1,59 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+X86 Context Switch
+------------------
+
+The x86 architecture context switching logic is as follows.
+After the switching of MM in the scheduler :c:func:`context_switch()` the call
+to the x86 implementation of :c:macro:`switch_to()`
+is made.  For x86 arch it is located at ::
+
+    arch/x86/include/asm/switch_to.h
+
+Since 4.9, switch_to() has been broken in to two parts: a :c:func:`prepare_switch_to()`
+macro and the inline assembly portion of has been moved to an actual assembly
+file ::
+
+    arch/x86/entry/entry_64.S
+
+* There is still a C portion of the switch which occurs via a jump in the middle
+  of the assembly code. The source is located in arch/x86/kernel/process_64.c
+  since 2.6.24
+
+The main function of the prepare_switch_to() is to handle the case when stack
+uses virtual memory. This is configured at build time and is mostly enable in
+most modern distributions. This function accesses the stack pointer to prevent a
+double fault.Switching to a stack that has top-level paging entry that is not
+present in the current MM will result in a page fault which will be promoted to
+double fault and the result is a panic. So it is necessary to probe the stack now
+so that the vmalloc_fault can fix the page tables.
+
+The main steps of the inline assembly function __switch_to_asm() are:
+
+* store the callee saved registers to the old stack which will be switched away from.
+* swaps the stack pointers between the old and the new task.
+* move the stack canary value to the current cpu's interrupt stack.
+* if return trampoline is enabled, overwrite all entries in the RSB on exiting
+  a guest, to prevent malicious branch target predictions from affecting the host
+  kernel.
+* restore all registers from the new stack previously pushed in reverse order.
+
+The main steps of the c function :c:func:`__switch_to()` which the assembly code
+jumps to is as follows:
+
+* retrieve the thread :c:type:`struct thread_struct <thread_struct>` and fpu
+  :c:type:`struct fpu <fpu>` structs from the next and previous tasks.
+* gets the current cpu TSS :c:type:`struct tss_struct <tss_struct>`
+* save the current FPU state while on the old task.
+* store the FS and GS segment registers before changing the thread local storage.
+* reload the GDT for the new tasks TLS.
+* save the ES and DS segments of the previous task and load the same from the
+  nest task.
+* load the FS and GS segment registers.
+* update the current task of the cpu.
+* update the top of stack pointer for the CPU for entry trampoline.
+* initialize FPU state for next task.
+* set sp0 to point to the entry trampoline stack.
+* call :c:func:`_switch_to_xtra()` to  handles debug registers, i/o bitmaps and
+  speculation mitigation.
+* Writes the task's CLOSid/RMID to IA32_PQR_MSR.
-- 
2.17.1


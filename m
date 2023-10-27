Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40DC27D9FFB
	for <lists+linux-mips@lfdr.de>; Fri, 27 Oct 2023 20:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346389AbjJ0SXT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Oct 2023 14:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346388AbjJ0SW4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 27 Oct 2023 14:22:56 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 784F610F2
        for <linux-mips@vger.kernel.org>; Fri, 27 Oct 2023 11:22:44 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da04fb79246so1711645276.2
        for <linux-mips@vger.kernel.org>; Fri, 27 Oct 2023 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430963; x=1699035763; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dSzaJ5MjV13E6q0DS9u4ZW54i690mbtysQRlTl8m4E8=;
        b=ROnluImDhqyCn75qI+tqyi5myj8UyFdtYFi2+sxFPCe6XfNKrISKApRhFy9LtbfWuk
         m4xPsDbnmyFaStrJZHGkZbJgGKe/vtBj7ZWgGsvUeRgdX2szG9NypNg5GJaH2Xgq21fy
         kr8pLixtJWAxDK2FPXcdOYCNZY83gMqzfFsKwQYisWvHt5rClU00vYHbzVtt4OFNRP+P
         tmviXu7EqUj6MmxJraqJ2x6W03Z/DQtyqykjgPaIO+qPdn5R80f5/t4MyEEZ0u2FemI5
         xmwWE8hb2b9NCUU+o3LZzT0nBbEN2Co5ZA1Wf2BGR+PXT2QO2bj6fvZ1Fo4WShMW8Y4k
         gUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430963; x=1699035763;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSzaJ5MjV13E6q0DS9u4ZW54i690mbtysQRlTl8m4E8=;
        b=oA/mP+KK+u73w+RpEGTN3YiKH8yTlrTH52OJJR5tZps8P2mO1Q4+OrgLwA9jcF1CS1
         jMz/DHLVyIn6Z6FCJxAQGLVXI9zQLJyChzVtBTjvfJk6l+a4DzLaTHYFHRfCdqz3Elta
         5eECiLjM9x5n/aTdCwzB6wtP3z7nFoWdvl2XKA3w5d1gbdMRvuu8YV+V5KbhFGN5uzMz
         SCX4Mg3JttCOA+hhpgT/MKgx+OcbB3TzvG7bznqloSy3uLf45eBjX9paDjQ6TGtg85Cq
         Bls82PoE75hRI6JTDzs6V/3hsc6TeZzbAc8OS1Ll51/264kK2Qoli3ln2galVYr7on7L
         qZWw==
X-Gm-Message-State: AOJu0Yx7tsWrXqSSrmq28lvQvO1g4i3VDHvjqWUXzNhs7Akdh85Gco7s
        YEojiNXptz34R8Ajao2HEpq1GS9bVSk=
X-Google-Smtp-Source: AGHT+IE2yfyx6OwAXQ6PbUozSNKQr4HAB6CvBECxReNk+TNP1aa3zG1osU5Glk09o10tbDLcLiI8MNAMXYU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1746:b0:d9a:59cb:8bed with SMTP id
 bz6-20020a056902174600b00d9a59cb8bedmr61033ybb.5.1698430963421; Fri, 27 Oct
 2023 11:22:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri, 27 Oct 2023 11:21:51 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-10-seanjc@google.com>
Subject: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
From:   Sean Christopherson <seanjc@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Xiaoyao Li <xiaoyao.li@intel.com>,
        Xu Yilun <yilun.xu@intel.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Fuad Tabba <tabba@google.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Anish Moorthy <amoorthy@google.com>,
        David Matlack <dmatlack@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Maciej Szmigiero <mail@maciej.szmigiero.name>,
        David Hildenbrand <david@redhat.com>,
        Quentin Perret <qperret@google.com>,
        Michael Roth <michael.roth@amd.com>,
        Wang <wei.w.wang@intel.com>,
        Liam Merwick <liam.merwick@oracle.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Chao Peng <chao.p.peng@linux.intel.com>

Add a new KVM exit type to allow userspace to handle memory faults that
KVM cannot resolve, but that userspace *may* be able to handle (without
terminating the guest).

KVM will initially use KVM_EXIT_MEMORY_FAULT to report implicit
conversions between private and shared memory.  With guest private memory,
there will be two kind of memory conversions:

  - explicit conversion: happens when the guest explicitly calls into KVM
    to map a range (as private or shared)

  - implicit conversion: happens when the guest attempts to access a gfn
    that is configured in the "wrong" state (private vs. shared)

On x86 (first architecture to support guest private memory), explicit
conversions will be reported via KVM_EXIT_HYPERCALL+KVM_HC_MAP_GPA_RANGE,
but reporting KVM_EXIT_HYPERCALL for implicit conversions is undesriable
as there is (obviously) no hypercall, and there is no guarantee that the
guest actually intends to convert between private and shared, i.e. what
KVM thinks is an implicit conversion "request" could actually be the
result of a guest code bug.

KVM_EXIT_MEMORY_FAULT will be used to report memory faults that appear to
be implicit conversions.

Note!  To allow for future possibilities where KVM reports
KVM_EXIT_MEMORY_FAULT and fills run->memory_fault on _any_ unresolved
fault, KVM returns "-EFAULT" (-1 with errno == EFAULT from userspace's
perspective), not '0'!  Due to historical baggage within KVM, exiting to
userspace with '0' from deep callstacks, e.g. in emulation paths, is
infeasible as doing so would require a near-complete overhaul of KVM,
whereas KVM already propagates -errno return codes to userspace even when
the -errno originated in a low level helper.

Report the gpa+size instead of a single gfn even though the initial usage
is expected to always report single pages.  It's entirely possible, likely
even, that KVM will someday support sub-page granularity faults, e.g.
Intel's sub-page protection feature allows for additional protections at
128-byte granularity.

Link: https://lore.kernel.org/all/20230908222905.1321305-5-amoorthy@google.com
Link: https://lore.kernel.org/all/ZQ3AmLO2SYv3DszH@google.com
Cc: Anish Moorthy <amoorthy@google.com>
Cc: David Matlack <dmatlack@google.com>
Suggested-by: Sean Christopherson <seanjc@google.com>
Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst | 41 ++++++++++++++++++++++++++++++++++
 arch/x86/kvm/x86.c             |  1 +
 include/linux/kvm_host.h       | 11 +++++++++
 include/uapi/linux/kvm.h       |  8 +++++++
 4 files changed, 61 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index ace984acc125..860216536810 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6723,6 +6723,26 @@ array field represents return values. The userspace should update the return
 values of SBI call before resuming the VCPU. For more details on RISC-V SBI
 spec refer, https://github.com/riscv/riscv-sbi-doc.
 
+::
+
+		/* KVM_EXIT_MEMORY_FAULT */
+		struct {
+			__u64 flags;
+			__u64 gpa;
+			__u64 size;
+		} memory;
+
+KVM_EXIT_MEMORY_FAULT indicates the vCPU has encountered a memory fault that
+could not be resolved by KVM.  The 'gpa' and 'size' (in bytes) describe the
+guest physical address range [gpa, gpa + size) of the fault.  The 'flags' field
+describes properties of the faulting access that are likely pertinent.
+Currently, no flags are defined.
+
+Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in that it
+accompanies a return code of '-1', not '0'!  errno will always be set to EFAULT
+or EHWPOISON when KVM exits with KVM_EXIT_MEMORY_FAULT, userspace should assume
+kvm_run.exit_reason is stale/undefined for all other error numbers.
+
 ::
 
     /* KVM_EXIT_NOTIFY */
@@ -7757,6 +7777,27 @@ This capability is aimed to mitigate the threat that malicious VMs can
 cause CPU stuck (due to event windows don't open up) and make the CPU
 unavailable to host or other VMs.
 
+7.34 KVM_CAP_MEMORY_FAULT_INFO
+------------------------------
+
+:Architectures: x86
+:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
+
+The presence of this capability indicates that KVM_RUN will fill
+kvm_run.memory_fault if KVM cannot resolve a guest page fault VM-Exit, e.g. if
+there is a valid memslot but no backing VMA for the corresponding host virtual
+address.
+
+The information in kvm_run.memory_fault is valid if and only if KVM_RUN returns
+an error with errno=EFAULT or errno=EHWPOISON *and* kvm_run.exit_reason is set
+to KVM_EXIT_MEMORY_FAULT.
+
+Note: Userspaces which attempt to resolve memory faults so that they can retry
+KVM_RUN are encouraged to guard against repeatedly receiving the same
+error/annotated fault.
+
+See KVM_EXIT_MEMORY_FAULT for more information.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 6409914428ca..ee3cd8c3c0ef 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4518,6 +4518,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ENABLE_CAP:
 	case KVM_CAP_VM_DISABLE_NX_HUGE_PAGES:
 	case KVM_CAP_IRQFD_RESAMPLE:
+	case KVM_CAP_MEMORY_FAULT_INFO:
 		r = 1;
 		break;
 	case KVM_CAP_EXIT_HYPERCALL:
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4e741ff27af3..96aa930536b1 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2327,4 +2327,15 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
 
+static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
+						 gpa_t gpa, gpa_t size)
+{
+	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
+	vcpu->run->memory_fault.gpa = gpa;
+	vcpu->run->memory_fault.size = size;
+
+	/* Flags are not (yet) defined or communicated to userspace. */
+	vcpu->run->memory_fault.flags = 0;
+}
+
 #endif
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index bd1abe067f28..7ae9987b48dd 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -274,6 +274,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_RISCV_SBI        35
 #define KVM_EXIT_RISCV_CSR        36
 #define KVM_EXIT_NOTIFY           37
+#define KVM_EXIT_MEMORY_FAULT     38
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -520,6 +521,12 @@ struct kvm_run {
 #define KVM_NOTIFY_CONTEXT_INVALID	(1 << 0)
 			__u32 flags;
 		} notify;
+		/* KVM_EXIT_MEMORY_FAULT */
+		struct {
+			__u64 flags;
+			__u64 gpa;
+			__u64 size;
+		} memory_fault;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
@@ -1203,6 +1210,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
 #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
 #define KVM_CAP_USER_MEMORY2 230
+#define KVM_CAP_MEMORY_FAULT_INFO 231
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.42.0.820.g83a721a137-goog


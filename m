Return-Path: <linux-mips+bounces-14948-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id btcDNnfcJmrrlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14948-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:15:03 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB0E657E5A
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:15:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14948-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-14948-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E8D5E302B14E
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598B43F0A97;
	Mon,  8 Jun 2026 14:43:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840963D647F;
	Mon,  8 Jun 2026 14:43:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929799; cv=none; b=eujn6chPfk/Qm+HrueV9WpqoF3qEYIXWLSdlqs9aH7Toimsd7ccDT0ZPEDT+MulYWQpwdrEuuOuZce/0ui8096phaqwmNCZ6mCZJ7kxLYxLuzHqdGUIjyOzwg19Urx1uwykd5yzCy8AzF7md43cpnIDLItnPF+Uoe9EisYI7Y18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929799; c=relaxed/simple;
	bh=6aySD2cd3gjBLclt68B9z4lNL1/HGQzFEpEM/r752dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OleMjl1HiHhCe++XLLQAlwgyVXSMb/X0Mn2ItmcPa0ORiF7S0rTYGWAlntO8hvkD8roN2CrYoxsXgaI7587OIceXr3sFcACR5aZfUCczCYDCQqSbUhE+Q0bAWqI1KvgBZH4VUk10d62UoNKm1Pj1fdH83GC8RDQBPOmvZ9K66F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B25C02028AB;
	Mon,  8 Jun 2026 16:43:06 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	nsaenz@amazon.com,
	anelkz@amazon.de,
	James.Bottomley@HansenPartnership.com,
	Melody Wang <huibo.wang@amd.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	x86@kernel.org,
	coconut-svsm@lists.linux.dev,
	joerg.roedel@amd.com
Subject: [PATCH 08/60] Documentation: kvm: introduce "VM plane" concept
Date: Mon,  8 Jun 2026 16:42:00 +0200
Message-ID: <20260608144252.351443-9-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.87 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.83)[subject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[8bytes.org: no valid DMARC record];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:seanjc@google.com,m:thomas.lendacky@amd.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@HansenPartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14948-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFB0E657E5A

From: Paolo Bonzini <pbonzini@redhat.com>

There have been multiple occurrences of processors introducing a virtual
privilege level concept for guests, where the hypervisor hosts multiple
copies of a vCPU's register state (or at least of most of it) and provides
hypercalls or instructions to switch between them.  These include AMD
VMPLs, Intel TDX partitions, Microsoft Hyper-V VTLs, and ARM CCA planes.
Include documentation on how the feature will be exposed to userspace.

In the past, two main solutions that were attempted, mostly in the context
of Hyper-V VTLs and SEV-SNP VMPLs:

- use a single vCPU file descriptor, and store multiple copies of the state
  in a single struct kvm_vcpu.  This requires a lot of changes to
  provide multiple copies of affected fields, especially MMUs and APICs;
  and complex uAPI extensions to direct existing ioctls to a specific
  privilege level.  This solution looked marginally okay for SEV-SNP
  VMPLs, but only because the copies of the register state were hidden
  in the VMSA (KVM does not manage it); it showed all its problems when
  applied to Hyper-V VTLs.

- use multiple VM and vCPU file descriptors, and handle the switch entirely
  in userspace.  This got gnarly pretty fast for even more reasons than
  the previous case, for example because VMs could not share anymore
  memslots, including dirty bitmaps and private/shared attributes (a
  substantial problem for SEV-SNP since VMPLs share their ASID).  Another
  problem was the need to share _some_ register state across VTLs and
  to control that vCPUs did not run in parallel; there needed to be a
  lot of logic to be added in userspace to ensure that higher-privileged
  VTL properly interrupted a lower-privileged one.

  This solution also complicates in-kernel implementation of privilege
  level switch, or even makes it impossible, because there is no kernel
  knowledge of the relationship between vCPUs that have the same id but
  belong to different privilege levels.

Especially given the need to accelerate switches in kernel, it is clear
that KVM needs some level of knowledge of the relationship between vCPUs
that have the same id but belong to different privilege levels.  For this
reason, I proposed a design that only gives the initial set of VM and vCPU file
descriptors the full set of ioctls + struct kvm_run; other privilege
levels instead only support a small part of the KVM API.  In fact for
the vm file descriptor it is only three ioctls: KVM_CHECK_EXTENSION,
KVM_SIGNAL_MSI, KVM_SET_MEMORY_ATTRIBUTES.  For vCPUs it is basically
KVM_GET/SET_*.

This solves a lot of the problems in the multiple-file-descriptors solution,
namely it gets for free the ability to avoid parallel execution of the
same vCPUs in different privilege levels.  Changes to the userspace API
of course exist, but they are relatively small and more easily backwards
compatible, because they boil down to the introduction of new file
descriptor kinds instead of having to change the inputs to all affected
ioctls.

It does share some of the code churn issues in the single-file-descriptor
solution; on the other hand a prototype multi-fd VMPL implementation[1]
also needed large scale changes which therefore seem unavoidable when
privilege levels are provided by hardware, and not a software concept
only as is the case for VTLs.
hardware

   [1] https://lore.kernel.org/lkml/cover.1726506534.git.roy.hopkins@suse.com/

Acknowledgements: thanks to everyone who participated in the discussions,
you are too many to mention in a small margin.  Thanks to Roy Hopkins,
Tom Lendacky, Anel Orazgaliyeva, Nicolas Saenz-Julienne for experimenting
with implementations of VTLs and VMPLs.

Ah, and because x86 has three names for it and Arm has one, choose the
Arm name for all architectures to avoid bikeshedding and to displease
everyone---including the KVM/arm64 folks, probably.

Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 Documentation/virt/kvm/api.rst | 102 +++++++++++++++++++++++----------
 1 file changed, 72 insertions(+), 30 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 52bbbb553ce1..d90b4a406454 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -56,6 +56,18 @@ be checked with :ref:`KVM_CHECK_EXTENSION <KVM_CHECK_EXTENSION>`.  Some
 capabilities also need to be enabled for VMs or VCPUs where their
 functionality is desired (see :ref:`cap_enable` and :ref:`cap_enable_vm`).
 
+On some architectures, a "virtual privilege level" concept may be present
+apart from the usual separation between user and supervisor mode, or
+between hypervisor and guest mode.  When this is the case, a single vCPU
+can have multiple copies of its register state (or at least most of it),
+and will switch between them through a special processor instruction,
+or through some kind of hypercall.
+
+KVM calls these privilege levels "planes".  Planes other than the
+initially-created one (called "plane 0") have a file descriptor each,
+and so do the planes of each vCPU.  Ioctls for vCPU planes should also
+be issued from a single thread, unless specially marked as asynchronous
+in the documentation.
 
 2. Restrictions
 ===============
@@ -119,6 +131,11 @@ description:
   Type:
       system, vm, or vcpu.
 
+      File descriptors for planes other than plane 0 provide a subset
+      of vm and vcpu ioctls.  Those that *are* supported in extra
+      planes are marked specially in the documentation (for example,
+      `vcpu (all planes)`).
+
   Parameters:
       what parameters are accepted by the ioctl.
 
@@ -309,7 +326,7 @@ the VCPU file descriptor can be mmap-ed, including:
 
 :Capability: basic
 :Architectures: all
-:Type: vm ioctl
+:Type: vm ioctl (all planes)
 :Parameters: vcpu id (apic id on x86)
 :Returns: vcpu fd on success, -1 on error
 
@@ -350,6 +367,8 @@ machines, the resulting vcpu fd can be memory mapped at page offset
 KVM_S390_SIE_PAGE_OFFSET in order to obtain a memory map of the virtual
 cpu's hardware control block.
 
+VCPUs for non-zero planes can only be created if the VCPU the same index has
+already been created for plane zero.
 
 4.8 KVM_GET_DIRTY_LOG
 ---------------------
@@ -421,7 +440,7 @@ kvm_run' (see below).
 
 :Capability: basic
 :Architectures: all except arm64
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_regs (out)
 :Returns: 0 on success, -1 on error
 
@@ -461,7 +480,7 @@ Reads the general purpose registers from the vcpu.
 
 :Capability: basic
 :Architectures: all except arm64
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_regs (in)
 :Returns: 0 on success, -1 on error
 
@@ -475,7 +494,7 @@ See KVM_GET_REGS for the data structure.
 
 :Capability: basic
 :Architectures: x86, ppc
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_sregs (out)
 :Returns: 0 on success, -1 on error
 
@@ -506,7 +525,7 @@ but not yet injected into the cpu core.
 
 :Capability: basic
 :Architectures: x86, ppc
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_sregs (in)
 :Returns: 0 on success, -1 on error
 
@@ -519,7 +538,7 @@ data structures.
 
 :Capability: basic
 :Architectures: x86
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_translation (in/out)
 :Returns: 0 on success, -1 on error
 
@@ -645,7 +664,7 @@ This is an asynchronous vcpu ioctl and can be invoked from any thread.
 
 :Capability: basic (vcpu), KVM_CAP_GET_MSR_FEATURES (system)
 :Architectures: x86
-:Type: system ioctl, vcpu ioctl
+:Type: system ioctl, vcpu ioctl (all planes)
 :Parameters: struct kvm_msrs (in/out)
 :Returns: number of msrs successfully returned;
           -1 on error
@@ -685,7 +704,7 @@ kvm will fill in the 'data' member.
 
 :Capability: basic
 :Architectures: x86
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_msrs (in)
 :Returns: number of msrs successfully set (see below), -1 on error
 
@@ -773,7 +792,7 @@ signal mask.
 
 :Capability: basic
 :Architectures: x86, loongarch
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_fpu (out)
 :Returns: 0 on success, -1 on error
 
@@ -811,7 +830,7 @@ Reads the floating point state from the vcpu.
 
 :Capability: basic
 :Architectures: x86, loongarch
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_fpu (in)
 :Returns: 0 on success, -1 on error
 
@@ -1128,7 +1147,7 @@ Other flags returned by ``KVM_GET_CLOCK`` are accepted but ignored.
 :Capability: KVM_CAP_VCPU_EVENTS
 :Extended by: KVM_CAP_INTR_SHADOW
 :Architectures: x86, arm64
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_vcpu_events (out)
 :Returns: 0 on success, -1 on error
 
@@ -1254,7 +1273,7 @@ Calling this ioctl on a vCPU that hasn't been initialized will return
 :Capability: KVM_CAP_VCPU_EVENTS
 :Extended by: KVM_CAP_INTR_SHADOW
 :Architectures: x86, arm64
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_vcpu_events (in)
 :Returns: 0 on success, -1 on error
 
@@ -1323,7 +1342,7 @@ Calling this ioctl on a vCPU that hasn't been initialized will return
 
 :Capability: KVM_CAP_DEBUGREGS
 :Architectures: x86
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_debugregs (out)
 :Returns: 0 on success, -1 on error
 
@@ -1345,7 +1364,7 @@ Reads debug registers from the vcpu.
 
 :Capability: KVM_CAP_DEBUGREGS
 :Architectures: x86
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_debugregs (in)
 :Returns: 0 on success, -1 on error
 
@@ -1662,7 +1681,7 @@ otherwise it will return EBUSY error.
 
 :Capability: KVM_CAP_XSAVE
 :Architectures: x86
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_xsave (out)
 :Returns: 0 on success, -1 on error
 
@@ -1682,7 +1701,7 @@ This ioctl would copy current vcpu's xsave struct to the userspace.
 
 :Capability: KVM_CAP_XSAVE and KVM_CAP_XSAVE2
 :Architectures: x86
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_xsave (in)
 :Returns: 0 on success, -1 on error
 
@@ -1710,7 +1729,7 @@ contents of CPUID leaf 0xD on the host.
 
 :Capability: KVM_CAP_XCRS
 :Architectures: x86
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_xcrs (out)
 :Returns: 0 on success, -1 on error
 
@@ -1737,7 +1756,7 @@ This ioctl would copy current vcpu's xcrs to the userspace.
 
 :Capability: KVM_CAP_XCRS
 :Architectures: x86
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_xcrs (in)
 :Returns: 0 on success, -1 on error
 
@@ -1886,11 +1905,14 @@ The flags bitmap is defined as::
 
 :Capability: KVM_CAP_IRQ_ROUTING
 :Architectures: x86 s390 arm64
-:Type: vm ioctl
+:Type: vm ioctl (all planes)
 :Parameters: struct kvm_irq_routing (in)
 :Returns: 0 on success, -1 on error
 
 Sets the GSI routing table entries, overwriting any previously set entries.
+Note that the kernel maintains only one GSI routing table for all planes. The
+plane for which the GSI routing table was set last will receive all interrupts
+signaled through GSI pins.
 
 On arm64, GSI routing has the following limitation:
 
@@ -2040,7 +2062,7 @@ error.
 
 :Capability: KVM_CAP_IRQCHIP
 :Architectures: x86
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_lapic_state (out)
 :Returns: 0 on success, -1 on error
 
@@ -2071,7 +2093,7 @@ always uses xAPIC format.
 
 :Capability: KVM_CAP_IRQCHIP
 :Architectures: x86
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_lapic_state (in)
 :Returns: 0 on success, -1 on error
 
@@ -2305,7 +2327,7 @@ prior to calling the KVM_RUN ioctl.
 
 :Capability: KVM_CAP_ONE_REG
 :Architectures: all
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_one_reg (in)
 :Returns: 0 on success, negative value on failure
 
@@ -2930,7 +2952,7 @@ Following are the KVM-defined registers for x86:
 
 :Capability: KVM_CAP_ONE_REG
 :Architectures: all
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_one_reg (in and out)
 :Returns: 0 on success, negative value on failure
 
@@ -2984,7 +3006,7 @@ after pausing the vcpu, but before it is resumed.
 
 :Capability: KVM_CAP_SIGNAL_MSI
 :Architectures: x86 arm64
-:Type: vm ioctl
+:Type: vm ioctl (all planes)
 :Parameters: struct kvm_msi (in)
 :Returns: >0 on delivery, 0 if guest blocked the MSI, and -1 on error
 
@@ -3605,7 +3627,7 @@ VCPU matching underlying host.
 
 :Capability: basic
 :Architectures: arm64, mips, riscv, x86 (if KVM_CAP_ONE_REG)
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_reg_list (in/out)
 :Returns: 0 on success; -1 on error
 
@@ -4904,7 +4926,7 @@ The acceptable values for the flags field are::
 
 :Capability: KVM_CAP_NESTED_STATE
 :Architectures: x86
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_nested_state (in/out)
 :Returns: 0 on success, -1 on error
 
@@ -4978,7 +5000,7 @@ to the KVM_CHECK_EXTENSION ioctl().
 
 :Capability: KVM_CAP_NESTED_STATE
 :Architectures: x86
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_nested_state (in)
 :Returns: 0 on success, -1 on error
 
@@ -5859,7 +5881,7 @@ then ``length`` is returned.
 
 :Capability: KVM_CAP_SREGS2
 :Architectures: x86
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_sregs2 (out)
 :Returns: 0 on success, -1 on error
 
@@ -5892,7 +5914,7 @@ flags values for ``kvm_sregs2``:
 
 :Capability: KVM_CAP_SREGS2
 :Architectures: x86
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_sregs2 (in)
 :Returns: 0 on success, -1 on error
 
@@ -6108,7 +6130,7 @@ as the descriptors in Descriptors block.
 
 :Capability: KVM_CAP_XSAVE2
 :Architectures: x86
-:Type: vcpu ioctl
+:Type: vcpu ioctl (all planes)
 :Parameters: struct kvm_xsave (out)
 :Returns: 0 on success, -1 on error
 
@@ -6555,6 +6577,26 @@ KVM_S390_KEYOP_SSKE
 
 .. _kvm_run:
 
+.. _KVM_CREATE_PLANE:
+
+4.145 KVM_CREATE_PLANE
+----------------------
+
+:Capability: KVM_CAP_PLANES
+:Architectures: none
+:Type: vm ioctl
+:Parameters: plane id
+:Returns: a VM fd that can be used to control the new plane.
+
+Creates a new *plane*, i.e. a separate privilege level for the virtual machine.
+
+Each plane has a numeric id that is used when communicating with KVM.  While
+KVM is currently agnostic to whether low ids are more or less privileged, it is
+expected that this will not always be the case in the future.  For example KVM
+in the future may use the plane id when planes are supported by hardware (as is
+the case for VMPLs in AMD), or if KVM supports accelerated plane switch
+operations (as might be the case for Hyper-V VTLs).
+
 5. The kvm_run structure
 ========================
 
-- 
2.53.0



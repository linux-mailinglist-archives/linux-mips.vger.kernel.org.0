Return-Path: <linux-mips+bounces-14941-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s+RoNw/bJmqZlwIAu9opvQ
	(envelope-from <linux-mips+bounces-14941-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:09:03 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4775D657D63
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 17:09:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14941-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-14941-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C17F8339E8F4
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 14:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C883D6CB8;
	Mon,  8 Jun 2026 14:43:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1ACB3CF97A;
	Mon,  8 Jun 2026 14:43:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929794; cv=none; b=qxR3ssy/b5KHcUPPABlKGl50pENzkVYry0SEQgJDgD3+yR0C7EGawPK0vnrrb80mXtRcdMTIehEz9PrfkQcgS8yXOI2hmdxdb2ZuwtGpAIaFQNRq7NbtWK96LeSQ44Lv/XHfnQQ0kdmTHfr3mua3V+ykXZ2RhADhhVqBcGLcAek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929794; c=relaxed/simple;
	bh=Fv/hsVAPfO6+kiVjf/X8vCRkI0ugqiRVJJSnzUbozQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R4zSLtPq6gGQQeNNxficcFDZgLqIFreGO2X9L1k+/Vw70zwxkKYHS8U09BhEuU0w+AAu+Rg1qwCIt+ySECpNhqtyP3iGSFrS5rtZERLBLmGxtYgMj36PwJsyCBOOrDMQv1TBa1CKgp1zfs9aaD0BHVMlrzBfRHt7ij1qo0uNav0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0EB79202536;
	Mon,  8 Jun 2026 16:43:05 +0200 (CEST)
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
Subject: [PATCH 00/60] KVM Planes + SEV-SNP Support
Date: Mon,  8 Jun 2026 16:41:52 +0200
Message-ID: <20260608144252.351443-1-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.45 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.91)[subject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:seanjc@google.com,m:thomas.lendacky@amd.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@HansenPartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[8bytes.org: no valid DMARC record];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[joro@8bytes.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-14941-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[8bytes.org:mid,8bytes.org:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4775D657D63

From: Joerg Roedel <joerg.roedel@amd.com>

Hi,

Here is the updated patch-set implementing support for planes in KVM.
Planes is KVMs name for supporting various privilege separation
features of hardware (AMD SEV-SNP VMPLs, Intel TDX, ARM CCA Planes) or
software (Hyper-V VSM) in KVM.

The code posted here is based on prior work by Tom Lendacky, Roy
Hopkins[1] and Paolo Bonzini[2] as well as the numerous participants
of the KVM Planes BoF at KVM Forum 2024.

The user-space interface has slightly changed compared to the previous
patches posted by Paolo. The Documentation patch has the details.

The changes implement the base-support in KVM and X86 as well as the
parts required for AMD SEV-SNP VMPLs. The patches are based on
v7.1-rc7 and can be used to run an SEV-SNP VM with COCONUT-SVSM[3] in
VMPL0 with a Linux guest in VMPL2. An updated QEMU is needed as well,
the changes for that will be posted separately.

This changes depend on Melodys patches for supporting restricted
injection. As they are required to run COCONUT-SVSM, they are included
here for completeness.

KVM planes support as posted here has a number of known limitations:

	- Using planes requires IRQ-Chip in split mode
	- IRQFD not yet supported
	- Memory attributes are not per-plane yet - this is required
	  for VSM

The patches are also in this git branch:

	https://github.com/joergroedel/linux/tree/kvm-planes-v7.1

And can be used together with this QEMU tree:

	https://github.com/joergroedel/qemu/tree/qemu-planes-linux-v7.1

Please review.

-Joerg

[1] https://lore.kernel.org/all/cover.1726506534.git.roy.hopkins@suse.com/
[2] https://lore.kernel.org/all/20250401161106.790710-1-pbonzini@redhat.com/
[3] https://github.com/coconut-svsm/svsm/

Joerg Roedel (37):
  kvm: Introduce struct kvm_vcpu_common
  kvm: Move vcpu accounting to struct kvm_vcpu_common
  kvm: Add read accessors for kvm_vcpu scheduling state
  kvm: Make kvm_running_vcpus point to struct kvm_vcpu_common
  kvm: Move VCPU scheduling state to struct kvm_vcpu_common
  kvm: Add accessors for kvm_vcpu->mutex
  kvm: Move VCPU locking to struct kvm_vcpu_common
  kvm: Move kvm_vcpu->rcuwait to struct kvm_vcpu_common
  kvm: Introduce accessors for kvm_vcpu->mode
  kvm: Move kvm_vcpu mode and requests field to struct kvm_vcpu_common
  kvm: Introduce per-plane VCPU requests
  kvm: Move kvm_vcpu pid members to struct kvm_vcpu_common
  kvm: Move kvm_vcpu sigset members to struct kvm_vcpu_common
  kvm: Move kvm_vcpu spinloop members to struct kvm_vcpu_common
  kvm: Move kvm_vcpu->dirty_ring to struct kvm_vcpu_common
  kvm: Introduce arch-specific plane state
  kvm: Introduce arch-specific part of struct kvm_vcpu_common
  kvm: Allocate struct kvm_plane in architecture code
  KVM: Implement KVM_CREATE_VCPU ioctl for planes
  kvm: Keep track of plane VCPUs in struct kvm_vcpu_common
  kvm: Add VCPU plane-scheduling state and helpers
  kvm: Add plane_level to kvm_kernel_irq_routing_entry
  kvm: Pass plane_level to kvm_set_routing_entry()
  kvm: Make KVM_SET_GSI_ROUTING per plane
  kvm: x86: Handle IOAPIC EOIs per plane
  kvm: x86: Move CPUID state to struct kvm_vcpu_arch_common
  kvm: x86: Move cpu_caps to struct kvm_vcpu_arch_common
  kvm: x86: Update state for all plane VCPUs after CPUID update
  kvm: x86: Share MTRR state across planes
  kvm: x86: Select a plane to run
  kvm: x86: Make event injection VCPU requests per-plane
  kvm: x86: Allow hardware backend to overwrite struct kvm_plane
    allocation
  kvm: x86: Make KVM_REQ_UPDATE_PROTECTED_GUEST_STATE per plane
  kvm: x86: Share pio_data across planes
  kvm: x86: Switch to plane0 if it has events
  kvm: x86: Restrict KVM planes support to KVM_IRQCHIP_SPLIT
  kvm: svm: Track vmsa_features per plane

Melody Wang (7):
  x86/sev: Define the #HV doorbell page structure
  KVM: SVM: Add support for the SEV-SNP #HV doorbell page NAE event
  KVM: SVM: Inject #HV when Restricted Injection is active
  KVM: SVM: Inject NMIs when Restricted Injection is active
  KVM: SVM: Inject MCEs when Restricted Injection is active
  KVM: SVM: Enable Restricted Injection for an SEV-SNP guest
  KVM: SVM: Add support for the SEV-SNP #HV IPI NAE event

Paolo Bonzini (11):
  Documentation: kvm: introduce "VM plane" concept
  kvm: Introduce struct kvm_plane
  kvm: Move vcpu_array to struct kvm_plane
  kvm: Implement KVM_CAP_PLANES
  kvm: Implement KVM_CREATE_PLANE ioctl
  kvm: Add KVM_EXIT_PLANE_EVENT
  kvm: Allocate struct kvm_run only for struct kvm_vcpu_common
  kvm: Make KVM_SIGNAL_MSI per plane
  kvm: x86: Make apic_map per plane
  kvm: x86: Make local APIC code aware of planes
  kvm: x86: Introduce max_planes x86-op

Tom Lendacky (5):
  kvm: svm: Implement GET_AP_APIC_IDS NAE event
  kvm: sev: Allow for VMPL level specification in AP create
  kvm: svm: Invoke a specified VMPL level VMSA for the vCPU
  kvm: svm: Implement max_planes x86 operation
  kvm: svm: Advertise full multi-VMPL support to the SNP guest

 Documentation/virt/kvm/api.rst        | 102 +++-
 arch/arm64/include/asm/kvm_host.h     |  19 +-
 arch/arm64/kvm/arch_timer.c           |   3 +-
 arch/arm64/kvm/arm.c                  |  37 +-
 arch/arm64/kvm/inject_fault.c         |   4 +-
 arch/arm64/kvm/nested.c               |   2 +-
 arch/arm64/kvm/vgic/vgic-init.c       |   3 +-
 arch/arm64/kvm/vgic/vgic-irqfd.c      |   7 +-
 arch/loongarch/include/asm/kvm_host.h |  17 +
 arch/loongarch/kvm/intc/pch_pic.c     |   2 +-
 arch/loongarch/kvm/irqfd.c            |   5 +-
 arch/loongarch/kvm/timer.c            |   2 +-
 arch/loongarch/kvm/vcpu.c             |  16 +-
 arch/loongarch/kvm/vm.c               |  18 +
 arch/mips/include/asm/kvm_host.h      |  17 +
 arch/mips/kvm/mips.c                  |  35 +-
 arch/powerpc/include/asm/kvm_host.h   |  17 +
 arch/powerpc/kvm/book3s_pr.c          |   2 +-
 arch/powerpc/kvm/book3s_xics.c        |   4 +-
 arch/powerpc/kvm/book3s_xive.c        |   4 +-
 arch/powerpc/kvm/book3s_xive_native.c |   4 +-
 arch/powerpc/kvm/booke.c              |   2 +-
 arch/powerpc/kvm/mpic.c               |   6 +-
 arch/powerpc/kvm/powerpc.c            |  27 +-
 arch/powerpc/kvm/trace.h              |   2 +-
 arch/riscv/include/asm/kvm_host.h     |  17 +
 arch/riscv/kvm/aia_device.c           |   4 +-
 arch/riscv/kvm/main.c                 |  18 +
 arch/riscv/kvm/vcpu.c                 |  13 +-
 arch/riscv/kvm/vm.c                   |   6 +-
 arch/s390/include/asm/kvm_host.h      |  17 +
 arch/s390/kvm/interrupt.c             |  11 +-
 arch/s390/kvm/kvm-s390.c              |  33 +-
 arch/s390/kvm/pv.c                    |   2 +-
 arch/x86/include/asm/cpufeatures.h    |   1 +
 arch/x86/include/asm/kvm-x86-ops.h    |   4 +
 arch/x86/include/asm/kvm_host.h       |  96 ++--
 arch/x86/include/asm/sev-common.h     |   8 +
 arch/x86/include/asm/svm.h            |  42 ++
 arch/x86/include/uapi/asm/svm.h       |   9 +
 arch/x86/kvm/cpuid.c                  |  70 ++-
 arch/x86/kvm/cpuid.h                  |  31 +-
 arch/x86/kvm/hyperv.c                 |   2 +-
 arch/x86/kvm/i8254.c                  |   2 +-
 arch/x86/kvm/ioapic.c                 |   8 +-
 arch/x86/kvm/irq.c                    |  19 +-
 arch/x86/kvm/lapic.c                  | 144 +++--
 arch/x86/kvm/lapic.h                  |  14 +-
 arch/x86/kvm/mmu/mmu.c                |   4 +-
 arch/x86/kvm/mtrr.c                   |  12 +-
 arch/x86/kvm/smm.c                    |   2 +-
 arch/x86/kvm/svm/sev.c                | 644 ++++++++++++++++++++--
 arch/x86/kvm/svm/svm.c                |  85 ++-
 arch/x86/kvm/svm/svm.h                |  52 +-
 arch/x86/kvm/trace.h                  |   2 +-
 arch/x86/kvm/vmx/common.h             |   2 +-
 arch/x86/kvm/vmx/main.c               |  16 +-
 arch/x86/kvm/vmx/nested.h             |   4 +-
 arch/x86/kvm/vmx/posted_intr.c        |   2 +-
 arch/x86/kvm/vmx/vmx.c                |  11 +-
 arch/x86/kvm/vmx/x86_ops.h            |   1 +
 arch/x86/kvm/x86.c                    | 237 ++++++--
 arch/x86/kvm/x86.h                    |   5 +
 arch/x86/kvm/xen.c                    |   2 +-
 arch/x86/kvm/xen.h                    |   2 +-
 include/linux/kvm_host.h              | 278 ++++++++--
 include/linux/kvm_types.h             |   2 +
 include/uapi/linux/kvm.h              |  18 +
 virt/kvm/dirty_ring.c                 |   4 +-
 virt/kvm/irqchip.c                    |  13 +-
 virt/kvm/kvm_main.c                   | 764 +++++++++++++++++++-------
 71 files changed, 2460 insertions(+), 630 deletions(-)

-- 
2.53.0



Return-Path: <linux-mips+bounces-12166-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D12C47A31
	for <lists+linux-mips@lfdr.de>; Mon, 10 Nov 2025 16:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EF14189296D
	for <lists+linux-mips@lfdr.de>; Mon, 10 Nov 2025 15:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D312C2EA470;
	Mon, 10 Nov 2025 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Eq0V5hQT"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E4B266B67
	for <linux-mips@vger.kernel.org>; Mon, 10 Nov 2025 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762789394; cv=none; b=nnmvSKyk45jWuqWpn+SX6K9jT2TTtsFcsit3xnG9Knq3EfQArVDaPz1bwShZpA/xzteOpBwtXkP3wjuk91pQodVwaJjMfZ9xCL/TsQWQNN8FA7XReLCZfUCNI9BjIG7oiXYeVjlLM5L8m5Z7bIaLfI5M4+8+V1MagQt59BWpg/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762789394; c=relaxed/simple;
	bh=Z6QBCawmA0V88I7dtIc6ikzQytNDqs3gMMcaJjnYR/s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NELnuwqPBi/WODUAIhKmfiCPmhhdZfFYRXiIgzslt3sZWkOQB5hr63cNOHvL+Atn0yyk/vYqlDDihE3l2KFpq1YX9oddzp8r1KAC2Uz/POIrq+yHVt7vDUFHmndJMG8sLOf94Pz8RTLfh3RrH+vG9JqQQX98c+OXtzoe0wMW6qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Eq0V5hQT; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso3669421a91.3
        for <linux-mips@vger.kernel.org>; Mon, 10 Nov 2025 07:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762789392; x=1763394192; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=87FfliXTeIYU4Ti4q0mlK1AlR2N3oXTPIRkcYWMY8TY=;
        b=Eq0V5hQTZhkQ+ohZrWL/oHj8OmZTVggJ+yIyHAGJRo91MUv3E5tmnQRQ59CvB9Ayck
         EanyjyAnazLcNTE5CzcBdijJXLt/LNJD0WN+RhYwGJv2mXRAX2o9RTAyC6wVFxGF46no
         r/BPjOeayUt6r/Q5tFHrcc65vm52h0ZM7CngepvxQi+/o221p55jsPNjDNmqaA60z3VB
         mW4eQcV+QI4r21WdQTkSTavT1EWFzxJlgNLw+euHAHsrYQLslf8dRMEJ0BLHp2zWVLxV
         j7iFXTcnstIKRd6N3VlaX1col+IKJK536N+AHvJORipySrJT9nuBita6LLyQHTJ1AZqP
         yvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762789392; x=1763394192;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=87FfliXTeIYU4Ti4q0mlK1AlR2N3oXTPIRkcYWMY8TY=;
        b=Bgxb6/ghoRP/oGFOhhg290FRirdNjaNkLUNJMg51aQFEVfaUg2l/00MjFe8Ns12B8l
         ZSLNqP10LEfXw4/Zf2T5POCyrzQC901ohvc4dVIJsjEFtOKdfvoUhCrs/tLspKnlHITm
         xHh+NYgOzTDbOepBr0kehkQU++dWSqUyAhCNjKaaK84If297psG3Hb0aVb4xhRxO26L0
         BH5Ja5bjMNl95BhySMWab+1dm6brrj/yMvhQYOcUM1lWEJJCFz5J37dzd9PkVxEa9rN3
         l0j12b0I3YYaS3Bino4VYSp515UsmHlxAoNoYhOL9MfKXmxIUwNdtdI22ZS1nXEYH2xp
         Z7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQhLG5b1sWel/rvJhSSCK7yIxEgCtrCRy5zZj7GRjVoCOVEvWeFRh+UC4mPoZBU7mRWnYocoaq4FkB@vger.kernel.org
X-Gm-Message-State: AOJu0YzGk5Q8llnXXg2RiHa51u4iGyXLddjQG12VAB5pzzTpkdxn2Mby
	hg0KjdYNtTfmDROJiwceoENfyLkPsWf6R1HL39qm7byAbImuGnDX3XoGczLBojaLpU1o4daw4da
	vueWEeA==
X-Google-Smtp-Source: AGHT+IGU2QqcHJOpKVyUh8wnC6DXg/rmfR5MmGRMoX3raYINDU0h+4Ytj4+FRCcbgxWr/CiKwQo1uRnxIsY=
X-Received: from pjbdw16.prod.google.com ([2002:a17:90b:950:b0:343:6849:31ae])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a10:b0:341:124f:474f
 with SMTP id 98e67ed59e1d1-3436cd0c3e9mr10428985a91.32.1762789392114; Mon, 10
 Nov 2025 07:43:12 -0800 (PST)
Date: Mon, 10 Nov 2025 07:37:29 -0800
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <176278827443.918905.17609380057567446021.b4-ty@google.com>
Subject: Re: [PATCH v4 00/28] KVM: x86/mmu: TDX post-populate cleanups
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 30 Oct 2025 13:09:23 -0700, Sean Christopherson wrote:
> Non-x86 folks, as with v3, patches 1 and 2 are likely the only thing of
> interest here.  They make kvm_arch_vcpu_async_ioctl() mandatory and then
> rename it to kvm_arch_vcpu_unlocked_ioctl().
> 
> As for the x86 side...
> 
> Clean up the TDX post-populate paths (and many tangentially related paths) to
> address locking issues between gmem and TDX's post-populate hook[*], and
> within KVM itself (KVM doesn't ensure full mutual exclusivity between paths
> that for all intents and purposes the TDX-Module requires to be serialized).
> 
> [...]

Applied to kvm-x86 tdx, with fixups for the various typos.  Thanks for all the
reviews and testing!

Other KVM arch maintainers, please holler if you want a stable tag for the
kvm_arch_vcpu_async_ioctl() changes (they're based directly on v6.18-rc4).

[01/28] KVM: Make support for kvm_arch_vcpu_async_ioctl() mandatory
        https://github.com/kvm-x86/linux/commit/0a0da3f92118
[02/28] KVM: Rename kvm_arch_vcpu_async_ioctl() to kvm_arch_vcpu_unlocked_ioctl()
        https://github.com/kvm-x86/linux/commit/50efc2340a59
[03/28] KVM: TDX: Drop PROVE_MMU=y sanity check on to-be-populated mappings
        https://github.com/kvm-x86/linux/commit/5294a4b93e07
[04/28] KVM: x86/mmu: Add dedicated API to map guest_memfd pfn into TDP MMU
        https://github.com/kvm-x86/linux/commit/3ab3283dbb2c
[05/28] KVM: x86/mmu: WARN if KVM attempts to map into an invalid TDP MMU root
        https://github.com/kvm-x86/linux/commit/c1f173fb3389
[06/28] Revert "KVM: x86/tdp_mmu: Add a helper function to walk down the TDP MMU"
        https://github.com/kvm-x86/linux/commit/fe7413e39810
[07/28] KVM: x86/mmu: Rename kvm_tdp_map_page() to kvm_tdp_page_prefault()
        https://github.com/kvm-x86/linux/commit/6de2fb089bb2
[08/28] KVM: TDX: Drop superfluous page pinning in S-EPT management
        https://github.com/kvm-x86/linux/commit/ce7b5695397b
[09/28] KVM: TDX: Return -EIO, not -EINVAL, on a KVM_BUG_ON() condition
        https://github.com/kvm-x86/linux/commit/e6348c90dda9
[10/28] KVM: TDX: Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte()
        https://github.com/kvm-x86/linux/commit/b836503300dc
[11/28] KVM: x86/mmu: Drop the return code from kvm_x86_ops.remove_external_spte()
        https://github.com/kvm-x86/linux/commit/7139c8606505
[12/28] KVM: TDX: WARN if mirror SPTE doesn't have full RWX when creating S-EPT mapping
        https://github.com/kvm-x86/linux/commit/b9d5cf6de0b6
[13/28] KVM: TDX: Avoid a double-KVM_BUG_ON() in tdx_sept_zap_private_spte()
        https://github.com/kvm-x86/linux/commit/24adff397052
[14/28] KVM: TDX: Use atomic64_dec_return() instead of a poor equivalent
        https://github.com/kvm-x86/linux/commit/af96d5452e5e
[15/28] KVM: TDX: Fold tdx_mem_page_record_premap_cnt() into its sole caller
        https://github.com/kvm-x86/linux/commit/b4b2b6eda5af
[16/28] KVM: TDX: ADD pages to the TD image while populating mirror EPT entries
        https://github.com/kvm-x86/linux/commit/6b5b71ffabf9
[17/28] KVM: TDX: Fold tdx_sept_zap_private_spte() into tdx_sept_remove_private_spte()
        https://github.com/kvm-x86/linux/commit/14c9938619be
[18/28] KVM: TDX: Combine KVM_BUG_ON + pr_tdx_error() into TDX_BUG_ON()
        https://github.com/kvm-x86/linux/commit/597d7068702f
[19/28] KVM: TDX: Derive error argument names from the local variable names
        https://github.com/kvm-x86/linux/commit/55560b6be5bc
[20/28] KVM: TDX: Assert that mmu_lock is held for write when removing S-EPT entries
        https://github.com/kvm-x86/linux/commit/2ff14116982c
[21/28] KVM: TDX: Add macro to retry SEAMCALLs when forcing vCPUs out of guest
        https://github.com/kvm-x86/linux/commit/3d626ce5a8cc
[22/28] KVM: TDX: Add tdx_get_cmd() helper to get and validate sub-ioctl command
        https://github.com/kvm-x86/linux/commit/59d5c1ed6df2
[23/28] KVM: TDX: Convert INIT_MEM_REGION and INIT_VCPU to "unlocked" vCPU ioctl
        https://github.com/kvm-x86/linux/commit/94428e3ba325
[24/28] KVM: TDX: Use guard() to acquire kvm->lock in tdx_vm_ioctl()
        https://github.com/kvm-x86/linux/commit/0b76e827b29d
[25/28] KVM: TDX: Don't copy "cmd" back to userspace for KVM_TDX_CAPABILITIES
        https://github.com/kvm-x86/linux/commit/f26061fe2c25
[26/28] KVM: TDX: Guard VM state transitions with "all" the locks
        https://github.com/kvm-x86/linux/commit/15945e9ec195
[27/28] KVM: TDX: Bug the VM if extending the initial measurement fails
        https://github.com/kvm-x86/linux/commit/ad44aa4c5d3f
[28/28] KVM: TDX: Fix list_add corruption during vcpu_load()
        https://github.com/kvm-x86/linux/commit/1e3a825c9ec9

--
https://github.com/kvm-x86/linux/tree/next


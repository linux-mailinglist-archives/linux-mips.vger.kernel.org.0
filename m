Return-Path: <linux-mips+bounces-7926-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EB0A43171
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 00:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64CBC3AAAEF
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2025 23:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA273212D61;
	Mon, 24 Feb 2025 23:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CIBugYDJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2666A211A18
	for <linux-mips@vger.kernel.org>; Mon, 24 Feb 2025 23:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740441359; cv=none; b=IwiAnrwrbKCyP5f5GVCgBjsADZp+1ITEL0OBMlUzK62rwIvaY/sflTTM6iOztAlplc2xvHYirsae+xN9cM/g8fGBn1HXUBEUbZlYVwAX91q2XOtGMMhrUA6JQF3o6uUoExz+9QmaX/qZZc4rNLRxSEC3nS8vJXWSQW6EdD/qtEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740441359; c=relaxed/simple;
	bh=FzPHzxKck26ULHcvqQmiQmgEbS2iBAXavvGHTfk/ScE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=in8VclL3GQTfnxRxSTFegn0VMT0fov+iPD57D7k2PD+SUnQQT8/RfR0OzdK3+ld4M/FkH7yqKa/3Z1BL/SgVmAa7B3qaHeW+R+QXjKJ8umMIBE8lKslqgi0Kq2Z9GkSxkitokokmtaYpOSHx5015+kDHLtkTAzBlTmxckXJErcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CIBugYDJ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fc2fee4425so16669289a91.0
        for <linux-mips@vger.kernel.org>; Mon, 24 Feb 2025 15:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441357; x=1741046157; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=N18ZDDRfnjFxKJiD7qnA09wciuUkX/DOLJoxqyHk2n8=;
        b=CIBugYDJZGG3BGtMpDZXa3jBhg8fECWqoXxuXKtRkt3oLu6TfpFnQ1l4EEgAf85m/6
         LT+8P1yc+xQJFIVNGhqzTkJMvT3MTCWNsMdl5MaljUHDooFsaslO+S5GEpNuvFXfEk1N
         18K9dqTfTtavZesV4pMcbfzaFKPLttNi0wA6sWg3ECE2Ki+NjPfL5DFqg5gET5uOZnMI
         c/0Fkcc4G2VnbAddft/Jw01/bAc/N+zO0ktpSWhlqI/wWVAwvP2lNzqZfgm8NwpMn51E
         7vj6hOYXb3q0fEwGlQZHMrevKh3xnt2LoWqZOvvm2rsWSbfCoO6Evk7M0z2aTNXYvcCi
         +stQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441357; x=1741046157;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N18ZDDRfnjFxKJiD7qnA09wciuUkX/DOLJoxqyHk2n8=;
        b=e12CkPxjSeJMlIcfCeHJg+dyakvxFXBxqm2joego5l6CWoaAGi28xchkpiUBx9tcm2
         drukhLFZ+dzJScBYXV5PeX7A4cjJ9ohJxmlKIYjCO4YrtHyTtq5fLGbIj2op8lJxoxIB
         qsmixDA5zxRBYYJ/BCn5Ucuwz7v4FgDZQgFRrHlLGiHqHK6mcmTMjhg3BIKRPZner/eL
         jtkkZ9RrZLRcphjfDJQ943bgyzpT4OMVEkTic3O1vq9a3b+d6zh+WfFygb2mIiGD6zay
         p8+EJBKWu2T+ddvXHfb2QOVmXzaQiGUCaXFpLhO3NS6BjeYtRi6EtviPQsXycGdH4kgu
         1wCg==
X-Forwarded-Encrypted: i=1; AJvYcCXPyFAB/AG+qN2yliN6PLIr0jOBv+JN9QG23RIpHYmwS14C8Nv7uBYb0DxJkqnLN1N3eJuVdNl1+YXx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnwf3+WvIKlpG0Ou9IYOaltvNQI5/PfbQFv0Y50+YdYxOG4Owp
	7BKWk1ibaDvKn02l1iBp1d7rwvPvi8flVFzbdDBhqQMrV9HeoRakGBp2Io6O7ZpQemNHpKN3/0r
	Whg==
X-Google-Smtp-Source: AGHT+IFBRvTh2AoRMsZzInrrN+gn6icsuEOKduQCozj1AYhvRpYSpNqeaxExZSkYlXTQzmgl2LLloh+gErw=
X-Received: from pjbpb10.prod.google.com ([2002:a17:90b:3c0a:b0:2fc:11a0:c54d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ec6:b0:2ee:70cb:a500
 with SMTP id 98e67ed59e1d1-2fce77a00c5mr23270511a91.1.1740441357604; Mon, 24
 Feb 2025 15:55:57 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 24 Feb 2025 15:55:42 -0800
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-8-seanjc@google.com>
Subject: [PATCH 7/7] KVM: Drop kvm_arch_sync_events() now that all
 implementations are nops
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"

Remove kvm_arch_sync_events() now that x86 no longer uses it (no other
arch has ever used it).

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h     | 2 --
 arch/loongarch/include/asm/kvm_host.h | 1 -
 arch/mips/include/asm/kvm_host.h      | 1 -
 arch/powerpc/include/asm/kvm_host.h   | 1 -
 arch/riscv/include/asm/kvm_host.h     | 2 --
 arch/s390/include/asm/kvm_host.h      | 1 -
 arch/x86/kvm/x86.c                    | 5 -----
 include/linux/kvm_host.h              | 1 -
 virt/kvm/kvm_main.c                   | 1 -
 9 files changed, 15 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7cfa024de4e3..40897bd2b4a3 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1346,8 +1346,6 @@ static inline bool kvm_system_needs_idmapped_vectors(void)
 	return cpus_have_final_cap(ARM64_SPECTRE_V3A);
 }
 
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
-
 void kvm_init_host_debug_data(void);
 void kvm_vcpu_load_debug(struct kvm_vcpu *vcpu);
 void kvm_vcpu_put_debug(struct kvm_vcpu *vcpu);
diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
index 590982cd986e..ab5b7001e2ff 100644
--- a/arch/loongarch/include/asm/kvm_host.h
+++ b/arch/loongarch/include/asm/kvm_host.h
@@ -320,7 +320,6 @@ static inline bool kvm_is_ifetch_fault(struct kvm_vcpu_arch *arch)
 
 /* Misc */
 static inline void kvm_arch_hardware_unsetup(void) {}
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index f7222eb594ea..c14b10821817 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -886,7 +886,6 @@ extern unsigned long kvm_mips_get_ramsize(struct kvm *kvm);
 extern int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu,
 			     struct kvm_mips_interrupt *irq);
 
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_free_memslot(struct kvm *kvm,
 					 struct kvm_memory_slot *slot) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 6e1108f8fce6..2d139c807577 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -902,7 +902,6 @@ struct kvm_vcpu_arch {
 #define __KVM_HAVE_ARCH_WQP
 #define __KVM_HAVE_CREATE_DEVICE
 
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
 static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index cc33e35cd628..0e9c2fab6378 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -301,8 +301,6 @@ static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
 	return IS_ENABLED(CONFIG_GUEST_PERF_EVENTS) && !!vcpu;
 }
 
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
-
 #define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
 
 void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
index 9a367866cab0..424f899d8163 100644
--- a/arch/s390/include/asm/kvm_host.h
+++ b/arch/s390/include/asm/kvm_host.h
@@ -1056,7 +1056,6 @@ bool kvm_s390_pv_cpu_is_protected(struct kvm_vcpu *vcpu);
 extern int kvm_s390_gisc_register(struct kvm *kvm, u32 gisc);
 extern int kvm_s390_gisc_unregister(struct kvm *kvm, u32 gisc);
 
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_free_memslot(struct kvm *kvm,
 					 struct kvm_memory_slot *slot) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ea445e6579f1..454fd6b8f3db 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12770,11 +12770,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	return ret;
 }
 
-void kvm_arch_sync_events(struct kvm *kvm)
-{
-
-}
-
 /**
  * __x86_set_memory_region: Setup KVM internal memory slot
  *
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c28a6aa1f2ed..5438a1b446a6 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1747,7 +1747,6 @@ static inline void kvm_unregister_perf_callbacks(void) {}
 
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type);
 void kvm_arch_destroy_vm(struct kvm *kvm);
-void kvm_arch_sync_events(struct kvm *kvm);
 
 int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu);
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 991e8111e88b..55153494ac70 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1271,7 +1271,6 @@ static void kvm_destroy_vm(struct kvm *kvm)
 	kvm_destroy_pm_notifier(kvm);
 	kvm_uevent_notify_change(KVM_EVENT_DESTROY_VM, kvm);
 	kvm_destroy_vm_debugfs(kvm);
-	kvm_arch_sync_events(kvm);
 	mutex_lock(&kvm_lock);
 	list_del(&kvm->vm_list);
 	mutex_unlock(&kvm_lock);
-- 
2.48.1.658.g4767266eb4-goog



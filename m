Return-Path: <linux-mips+bounces-7953-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC6FA445CA
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 17:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AC7916766A
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 16:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433301946DA;
	Tue, 25 Feb 2025 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PePPDQuD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ED8192D63;
	Tue, 25 Feb 2025 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740500197; cv=none; b=s/LAeEHDlcj7WKLHBkc3v7movkWnwUF+CaP2TAf/MwbDDHRwHUSkVddCUAD6NKv5nlZ6W1/4V4VtvEd0qxbousHrs95qah6eJEjM3EQwcHHmGK19uDUuK/j2/zVeCdYMebADhlT3X/s5Vlbqx0BPs/xZfdC4y2V87vmyGuGf25A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740500197; c=relaxed/simple;
	bh=cErrfXom+s5pVkXQLiiVjTzZPrY+mFw7aipCxQfEmaY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MIXyzmbuisLD95T0XDyCq8QpnHiIGpFFC4ybxtbpKNPvLQyb6ON8+fEoVJzIgED1bFXMwCPMbyejo4PZeiq50Fz0kemfp0OIOza1Cy6WPRLi6/ysrxU9idApyKiAi3bJVlabobed7SMfRMSQqvG1KhjiCMq/k3AWsCNXG+m+WC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PePPDQuD; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PDjY8u011012;
	Tue, 25 Feb 2025 16:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=EB5xjS
	HoX3r4ods50zGkpSGZkJJvGI3sQjehgnGJBSo=; b=PePPDQuDji4R5cS+e2V1L2
	z0JCj0LuK/xrDfeO46zmjIF3tGJgtoBeM4FgD5lYzomRRMeymyFRQ1N+COj4+n3z
	zhEh1DIkK25owLsjddnGuriJp+VNxa6TBp8Rqe92T59nFrOI7ZEJ/STGVfcZT+f4
	w5Vkh8iT36VQgba/UrWh/IbdwEpnNF1cpE72Ep3nuf6eryElWG6187EYNn2YUBzB
	/xjn4vT9fw//W5Q2vkK1bLOBHbvGSrYvCT45nvnMlQfN9pA0ot3+nAKgP2j7p90s
	BhZNP6wxViFEBdCttUtxJVgzsm+4N0qgG/8wgEaR+9yaWQmjIPQfV92dQlq6+8Eg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4514q0brm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 16:15:55 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51PG36en010783;
	Tue, 25 Feb 2025 16:15:54 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4514q0brm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 16:15:54 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51PF0EdW002578;
	Tue, 25 Feb 2025 16:15:53 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44yu4jnfxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 16:15:53 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51PGFoBR33358422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 16:15:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E488120043;
	Tue, 25 Feb 2025 16:15:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3319720040;
	Tue, 25 Feb 2025 16:15:48 +0000 (GMT)
Received: from p-imbrenda (unknown [9.171.32.179])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue, 25 Feb 2025 16:15:48 +0000 (GMT)
Date: Tue, 25 Feb 2025 17:15:44 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
        Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Madhavan Srinivasan
 <maddy@linux.ibm.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley
 <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou
 <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvm@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Aaron Lewis
 <aaronlewis@google.com>,
        Jim Mattson <jmattson@google.com>, Yan Zhao
 <yan.y.zhao@intel.com>,
        Rick P Edgecombe <rick.p.edgecombe@intel.com>,
        Kai
 Huang <kai.huang@intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>
Subject: Re: [PATCH 7/7] KVM: Drop kvm_arch_sync_events() now that all
 implementations are nops
Message-ID: <20250225171544.40477437@p-imbrenda>
In-Reply-To: <20250224235542.2562848-8-seanjc@google.com>
References: <20250224235542.2562848-1-seanjc@google.com>
	<20250224235542.2562848-8-seanjc@google.com>
Organization: IBM
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4oNEms2UIOy6dhSLXf3MQHQxp5QC-fsG
X-Proofpoint-GUID: XwTFU_1fd0Y_Q4qJBAUmVROi_e0umdsT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0 impostorscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502250103

On Mon, 24 Feb 2025 15:55:42 -0800
Sean Christopherson <seanjc@google.com> wrote:

> Remove kvm_arch_sync_events() now that x86 no longer uses it (no other
> arch has ever used it).
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

> ---
>  arch/arm64/include/asm/kvm_host.h     | 2 --
>  arch/loongarch/include/asm/kvm_host.h | 1 -
>  arch/mips/include/asm/kvm_host.h      | 1 -
>  arch/powerpc/include/asm/kvm_host.h   | 1 -
>  arch/riscv/include/asm/kvm_host.h     | 2 --
>  arch/s390/include/asm/kvm_host.h      | 1 -
>  arch/x86/kvm/x86.c                    | 5 -----
>  include/linux/kvm_host.h              | 1 -
>  virt/kvm/kvm_main.c                   | 1 -
>  9 files changed, 15 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 7cfa024de4e3..40897bd2b4a3 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1346,8 +1346,6 @@ static inline bool kvm_system_needs_idmapped_vectors(void)
>  	return cpus_have_final_cap(ARM64_SPECTRE_V3A);
>  }
>  
> -static inline void kvm_arch_sync_events(struct kvm *kvm) {}
> -
>  void kvm_init_host_debug_data(void);
>  void kvm_vcpu_load_debug(struct kvm_vcpu *vcpu);
>  void kvm_vcpu_put_debug(struct kvm_vcpu *vcpu);
> diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
> index 590982cd986e..ab5b7001e2ff 100644
> --- a/arch/loongarch/include/asm/kvm_host.h
> +++ b/arch/loongarch/include/asm/kvm_host.h
> @@ -320,7 +320,6 @@ static inline bool kvm_is_ifetch_fault(struct kvm_vcpu_arch *arch)
>  
>  /* Misc */
>  static inline void kvm_arch_hardware_unsetup(void) {}
> -static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
>  static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
>  static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> index f7222eb594ea..c14b10821817 100644
> --- a/arch/mips/include/asm/kvm_host.h
> +++ b/arch/mips/include/asm/kvm_host.h
> @@ -886,7 +886,6 @@ extern unsigned long kvm_mips_get_ramsize(struct kvm *kvm);
>  extern int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu,
>  			     struct kvm_mips_interrupt *irq);
>  
> -static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_free_memslot(struct kvm *kvm,
>  					 struct kvm_memory_slot *slot) {}
>  static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 6e1108f8fce6..2d139c807577 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -902,7 +902,6 @@ struct kvm_vcpu_arch {
>  #define __KVM_HAVE_ARCH_WQP
>  #define __KVM_HAVE_CREATE_DEVICE
>  
> -static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
>  static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
>  static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index cc33e35cd628..0e9c2fab6378 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -301,8 +301,6 @@ static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
>  	return IS_ENABLED(CONFIG_GUEST_PERF_EVENTS) && !!vcpu;
>  }
>  
> -static inline void kvm_arch_sync_events(struct kvm *kvm) {}
> -
>  #define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
>  
>  void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
> diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
> index 9a367866cab0..424f899d8163 100644
> --- a/arch/s390/include/asm/kvm_host.h
> +++ b/arch/s390/include/asm/kvm_host.h
> @@ -1056,7 +1056,6 @@ bool kvm_s390_pv_cpu_is_protected(struct kvm_vcpu *vcpu);
>  extern int kvm_s390_gisc_register(struct kvm *kvm, u32 gisc);
>  extern int kvm_s390_gisc_unregister(struct kvm *kvm, u32 gisc);
>  
> -static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_free_memslot(struct kvm *kvm,
>  					 struct kvm_memory_slot *slot) {}
>  static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index ea445e6579f1..454fd6b8f3db 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12770,11 +12770,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>  	return ret;
>  }
>  
> -void kvm_arch_sync_events(struct kvm *kvm)
> -{
> -
> -}
> -
>  /**
>   * __x86_set_memory_region: Setup KVM internal memory slot
>   *
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index c28a6aa1f2ed..5438a1b446a6 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1747,7 +1747,6 @@ static inline void kvm_unregister_perf_callbacks(void) {}
>  
>  int kvm_arch_init_vm(struct kvm *kvm, unsigned long type);
>  void kvm_arch_destroy_vm(struct kvm *kvm);
> -void kvm_arch_sync_events(struct kvm *kvm);
>  
>  int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu);
>  
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 991e8111e88b..55153494ac70 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1271,7 +1271,6 @@ static void kvm_destroy_vm(struct kvm *kvm)
>  	kvm_destroy_pm_notifier(kvm);
>  	kvm_uevent_notify_change(KVM_EVENT_DESTROY_VM, kvm);
>  	kvm_destroy_vm_debugfs(kvm);
> -	kvm_arch_sync_events(kvm);
>  	mutex_lock(&kvm_lock);
>  	list_del(&kvm->vm_list);
>  	mutex_unlock(&kvm_lock);



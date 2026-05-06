Return-Path: <linux-mips+bounces-14478-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFWzL9un+mlURAMAu9opvQ
	(envelope-from <linux-mips+bounces-14478-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 04:30:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3A94D5ABD
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 04:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 671DA3020D69
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 02:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585742701BB;
	Wed,  6 May 2026 02:30:47 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF81F217648;
	Wed,  6 May 2026 02:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778034647; cv=none; b=ICTH92OR+ZzBqa74zOy2itNulJREAd3MPDxCHE3+gMVLS/XNxYO6EbSmd3I/JW/Q8yEbEexSxU0sFcHGJ0k3VPiqg4RF/ghEUI29iFykBRzcnPrhbR8Puct+Ueoyr81iaUsmiFEf7o1x7mX25AcfrQgB6za+5ZJYW8jm/2oqoWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778034647; c=relaxed/simple;
	bh=S4/VXvdku8KrRO7E02/awFvdGYjK7r5TqE4xFnD51jM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=DoeHSlb/YZO1FMo4UTdwu4WF3Y5rV7ut8QX++rBKnLSO18xNfm2Zykmr7IMHeb+Gxi+p2uONTEe4iv3SR6QbEpmMPl3tvXl/Scw/5LAOan7LGIU90NpRskA3HZYrgcpOc62UiggjtR/sehWxIbq9S6YLU/ky/r4rCRTPqHwwpVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Dx8erLp_ppMvoGAA--.22639S3;
	Wed, 06 May 2026 10:30:35 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxB8G1p_ppz2Z7AA--.24349S3;
	Wed, 06 May 2026 10:30:15 +0800 (CST)
Subject: Re: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in
 kvm_arch_flush_shadow_all()
To: James Houghton <jthoughton@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Sean Christopherson <seanjc@google.com>,
 Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>,
 Ricardo Koller <ricarkol@google.com>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 James Hogan <jhogan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260504224213.1049426-1-jthoughton@google.com>
 <20260504224213.1049426-2-jthoughton@google.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <25838e74-01dd-d085-395b-676266dc9a9a@loongson.cn>
Date: Wed, 6 May 2026 10:27:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260504224213.1049426-2-jthoughton@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxB8G1p_ppz2Z7AA--.24349S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWryxWry7uF4rWrWDXFy7Jwc_yoWrKFW7pF
	WDCa4DGr45Gr1Y9343Jw1DZw1F9ws5KF1fGFy5XayrtFyYv3s8K3WvyF1xAFW5JrZ7WFZa
	vF15Krn8A3yvywbCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j0mhrUUU
	UU=
X-Rspamd-Queue-Id: 7E3A94D5ABD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maobibo@loongson.cn,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14478-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[loongson.cn];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]



On 2026/5/5 上午6:42, James Houghton wrote:
> kvm_arch_flush_shadow_all() may sometimes be called on the same `kvm`
> concurrently in the event that the KVM's `mm` is __mmput() at the
> same time that last reference to the KVM is being dropped.
> 
> T1              T2
> KVM_CREATE_VM
>                  Get VM file from T1
> close VM
> exit_mm()       close VM
> 
> T1: exit_mm() -> kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
>      with only the KVM srcu read lock held.
> 
> T2: kvm_vm_release() ---> mmu_notifier_unregister() ->
>      kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
>      again, with only the KVM srcu read lock held.
By looking through the code, kvm_arch_destroy_vm() will free PGD page 
only, page table walking is executing in deleting memslot or exit_mm().

With normal code, life cycle of VM is something like this:
   KVM_CREATE_VM
     Create_VCPUs
     Create memslots
     Destroy_VCPUs
     Destroy memslots
   close VM
   exit_mm()

And there is kvm_get_kvm()/kvm_put_kvm() function call with 
creating/destroy vCPUs, however no such operations with memslot 
operation. Is it possible that VM is destroyed without removing 
memslots, such as the following operation.
   KVM_CREATE_VM
     Create memslots
   close VM
   exit_mm()

Regards
Bibo Mao

> 
> This leads to a potential double-free of
> kvm->arch.kvm_mmu_free_memory_cache and now with NV
> kvm->arch.nested_mmus.
> 
> Cc: stable@vger.kernel.org
> Fixes: e7bf7a490c68 ("KVM: arm64: Split huge pages when dirty logging is enabled")
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
>   arch/arm64/include/asm/kvm_mmu.h |  1 +
>   arch/arm64/kvm/mmu.c             | 23 +++++++++++++++++++----
>   arch/arm64/kvm/nested.c          |  4 +++-
>   3 files changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
> index 01e9c72d6aa7..30d5c24fcebb 100644
> --- a/arch/arm64/include/asm/kvm_mmu.h
> +++ b/arch/arm64/include/asm/kvm_mmu.h
> @@ -178,6 +178,7 @@ void stage2_unmap_vm(struct kvm *kvm);
>   int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long type);
>   void kvm_uninit_stage2_mmu(struct kvm *kvm);
>   void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu);
> +void kvm_free_stage2_pgd_locked(struct kvm_s2_mmu *mmu);
>   int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
>   			  phys_addr_t pa, unsigned long size, bool writable);
>   
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index d089c107d9b7..4bab407d43bb 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1021,7 +1021,9 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
>   
>   void kvm_uninit_stage2_mmu(struct kvm *kvm)
>   {
> -	kvm_free_stage2_pgd(&kvm->arch.mmu);
> +	lockdep_assert_held_write(&kvm->mmu_lock);
> +
> +	kvm_free_stage2_pgd_locked(&kvm->arch.mmu);
>   	kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
>   }
>   
> @@ -1095,12 +1097,14 @@ void stage2_unmap_vm(struct kvm *kvm)
>   	srcu_read_unlock(&kvm->srcu, idx);
>   }
>   
> -void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
> +static void __kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu, bool locked)
>   {
>   	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
>   	struct kvm_pgtable *pgt = NULL;
>   
> -	write_lock(&kvm->mmu_lock);
> +	if (!locked)
> +		write_lock(&kvm->mmu_lock);
> +
>   	pgt = mmu->pgt;
>   	if (pgt) {
>   		mmu->pgd_phys = 0;
> @@ -1111,7 +1115,8 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>   	if (kvm_is_nested_s2_mmu(kvm, mmu))
>   		kvm_init_nested_s2_mmu(mmu);
>   
> -	write_unlock(&kvm->mmu_lock);
> +	if (!locked)
> +		write_unlock(&kvm->mmu_lock);
>   
>   	if (pgt) {
>   		kvm_stage2_destroy(pgt);
> @@ -1119,6 +1124,16 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>   	}
>   }
>   
> +void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
> +{
> +	__kvm_free_stage2_pgd(mmu, false);
> +}
> +
> +void kvm_free_stage2_pgd_locked(struct kvm_s2_mmu *mmu)
> +{
> +	__kvm_free_stage2_pgd(mmu, true);
> +}
> +
>   static void hyp_mc_free_fn(void *addr, void *mc)
>   {
>   	struct kvm_hyp_memcache *memcache = mc;
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 883b6c1008fb..977598bff5e6 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1190,11 +1190,13 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
>   {
>   	int i;
>   
> +	guard(write_lock)(&kvm->mmu_lock);
> +
>   	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
>   		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
>   
>   		if (!WARN_ON(atomic_read(&mmu->refcnt)))
> -			kvm_free_stage2_pgd(mmu);
> +			kvm_free_stage2_pgd_locked(mmu);
>   	}
>   	kvfree(kvm->arch.nested_mmus);
>   	kvm->arch.nested_mmus = NULL;
> 



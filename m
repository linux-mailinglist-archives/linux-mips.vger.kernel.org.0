Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9E5343979C
	for <lists+linux-mips@lfdr.de>; Mon, 25 Oct 2021 15:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbhJYNeW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Oct 2021 09:34:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38535 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232360AbhJYNeW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 Oct 2021 09:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635168719;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jwuvCkOHo62fGDRtX62BpdTPwCRqLZcCn5V8ASXdLIA=;
        b=SpvM56gOQxdR2GkQfeSmO+O/QwaoLWm5eUlFc95EtEJ6WV0po9Bi8WS7HsQjdn9GzFG1ju
        6YKz+JxvVOqnjNuFN8z8yiBL9ghxfN0/sLTk35vM0QqSCbgTJy8hGKf+8NwwM5AEaR0tBQ
        mfUC1q4uy7Ay1Dfyv00r0snJP9ma5nY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-LaCzS94fPmyWXv--zLd8CQ-1; Mon, 25 Oct 2021 09:31:58 -0400
X-MC-Unique: LaCzS94fPmyWXv--zLd8CQ-1
Received: by mail-ed1-f71.google.com with SMTP id k28-20020a508adc000000b003dd5e21da4bso2285475edk.11
        for <linux-mips@vger.kernel.org>; Mon, 25 Oct 2021 06:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jwuvCkOHo62fGDRtX62BpdTPwCRqLZcCn5V8ASXdLIA=;
        b=S6Mbx6BEny+DlRGWb9fjAazY0gWxLeDnGI0XMLTUuVKQWsStT4uMXU6v2VMhEPAqOH
         5XucouBcjy8VT+30DT49ZuqB6haIVzw2ve0MAxCI1pfka1Adr+htikWN6aXYa9R6w74g
         mIFA3MsYHVN6rAxQ0rDMdZAYD6DuAAQguwiEOEamdDYasacpuqn8abpAADmu0jlCo9Nd
         C1RsxoZRL5L3XiK5vJnUUvWl71t2WiTSSrTLmXccsn2ka4wkd+R49We3qsu3GY5+jM1F
         gkQfQdnIcnFJ9giQpa7MoEg1C3dzOkqwEKzsU5+YzGFlSqGGoI2qB3skBh8hBHd+c7H4
         YnXA==
X-Gm-Message-State: AOAM531dwX4POusUb1zNBHezb82qMQTNOxUZgdwE3rO6bWJHMAu2RLsp
        nN2d7zJzuia8NPG7K+DIwrIlDUGdtBLnxWCDF80vaxZ1kEpWzXhg5+RRRA36qz69WoZ30dyy/gl
        jsoNrj7YIgdkuKJNnKd4GNg==
X-Received: by 2002:a17:906:2606:: with SMTP id h6mr22238662ejc.301.1635168717198;
        Mon, 25 Oct 2021 06:31:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqwGQb/OPNb2TrcrVpQ2kfMVsFqyH8YAEneTvl+Ho2w1Ti+MJiG6IAW7s9nE4hJCbcjwxz7g==
X-Received: by 2002:a17:906:2606:: with SMTP id h6mr22238632ejc.301.1635168716958;
        Mon, 25 Oct 2021 06:31:56 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id kw10sm7463469ejc.71.2021.10.25.06.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 06:31:56 -0700 (PDT)
Message-ID: <9236e715-c471-e1c8-6117-6f37b908a6bd@redhat.com>
Date:   Mon, 25 Oct 2021 15:31:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 10/43] KVM: arm64: Move vGIC v4 handling for WFI out
 arch callback hook
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Atish Patra <atish.patra@wdc.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        David Matlack <dmatlack@google.com>,
        Oliver Upton <oupton@google.com>,
        Jing Zhang <jingzhangos@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-11-seanjc@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211009021236.4122790-11-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/10/21 04:12, Sean Christopherson wrote:
> Move the put and reload of the vGIC out of the block/unblock callbacks
> and into a dedicated WFI helper.  Functionally, this is nearly a nop as
> the block hook is called at the very beginning of kvm_vcpu_block(), and
> the only code in kvm_vcpu_block() after the unblock hook is to update the
> halt-polling controls, i.e. can only affect the next WFI.
> 
> Back when the arch (un)blocking hooks were added by commits 3217f7c25bca
> ("KVM: Add kvm_arch_vcpu_{un}blocking callbacks) and d35268da6687
> ("arm/arm64: KVM: arch_timer: Only schedule soft timer on vcpu_block"),
> the hooks were invoked only when KVM was about to "block", i.e. schedule
> out the vCPU.  The use case at the time was to schedule a timer in the
> host based on the earliest timer in the guest in order to wake the
> blocking vCPU when the emulated guest timer fired.  Commit accb99bcd0ca
> ("KVM: arm/arm64: Simplify bg_timer programming") reworked the timer
> logic to be even more precise, by waiting until the vCPU was actually
> scheduled out, and so move the timer logic from the (un)blocking hooks to
> vcpu_load/put.
> 
> In the meantime, the hooks gained usage for enabling vGIC v4 doorbells in
> commit df9ba95993b9 ("KVM: arm/arm64: GICv4: Use the doorbell interrupt
> as an unblocking source"), and added related logic for the VMCR in commit
> 5eeaf10eec39 ("KVM: arm/arm64: Sync ICH_VMCR_EL2 back when about to block").
> 
> Finally, commit 07ab0f8d9a12 ("KVM: Call kvm_arch_vcpu_blocking early
> into the blocking sequence") hoisted the (un)blocking hooks so that they
> wrapped KVM's halt-polling logic in addition to the core "block" logic.
> 
> In other words, the original need for arch hooks to take action _only_
> in the block path is long since gone.
> 
> Cc: Oliver Upton <oupton@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

This needs a word on why kvm_psci_vcpu_suspend does not need the hooks. 
  Or it needs to be changed to also use kvm_vcpu_wfi in the PSCI code, I 
don't know.

Marc, can you review and/or advise?

Thanks,

Paolo

> ---
>   arch/arm64/include/asm/kvm_emulate.h |  2 ++
>   arch/arm64/kvm/arm.c                 | 52 +++++++++++++++++++---------
>   arch/arm64/kvm/handle_exit.c         |  3 +-
>   3 files changed, 38 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index fd418955e31e..de8b4f5922b7 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -41,6 +41,8 @@ void kvm_inject_vabt(struct kvm_vcpu *vcpu);
>   void kvm_inject_dabt(struct kvm_vcpu *vcpu, unsigned long addr);
>   void kvm_inject_pabt(struct kvm_vcpu *vcpu, unsigned long addr);
>   
> +void kvm_vcpu_wfi(struct kvm_vcpu *vcpu);
> +
>   static __always_inline bool vcpu_el1_is_32bit(struct kvm_vcpu *vcpu)
>   {
>   	return !(vcpu->arch.hcr_el2 & HCR_RW);
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 7838e9fb693e..1346f81b34df 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -359,27 +359,12 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
>   
>   void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
>   {
> -	/*
> -	 * If we're about to block (most likely because we've just hit a
> -	 * WFI), we need to sync back the state of the GIC CPU interface
> -	 * so that we have the latest PMR and group enables. This ensures
> -	 * that kvm_arch_vcpu_runnable has up-to-date data to decide
> -	 * whether we have pending interrupts.
> -	 *
> -	 * For the same reason, we want to tell GICv4 that we need
> -	 * doorbells to be signalled, should an interrupt become pending.
> -	 */
> -	preempt_disable();
> -	kvm_vgic_vmcr_sync(vcpu);
> -	vgic_v4_put(vcpu, true);
> -	preempt_enable();
> +
>   }
>   
>   void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
>   {
> -	preempt_disable();
> -	vgic_v4_load(vcpu);
> -	preempt_enable();
> +
>   }
>   
>   void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> @@ -662,6 +647,39 @@ static void vcpu_req_sleep(struct kvm_vcpu *vcpu)
>   	smp_rmb();
>   }
>   
> +/**
> + * kvm_vcpu_wfi - emulate Wait-For-Interrupt behavior
> + * @vcpu:	The VCPU pointer
> + *
> + * Suspend execution of a vCPU until a valid wake event is detected, i.e. until
> + * the vCPU is runnable.  The vCPU may or may not be scheduled out, depending
> + * on when a wake event arrives, e.g. there may already be a pending wake event.
> + */
> +void kvm_vcpu_wfi(struct kvm_vcpu *vcpu)
> +{
> +	/*
> +	 * Sync back the state of the GIC CPU interface so that we have
> +	 * the latest PMR and group enables. This ensures that
> +	 * kvm_arch_vcpu_runnable has up-to-date data to decide whether
> +	 * we have pending interrupts, e.g. when determining if the
> +	 * vCPU should block.
> +	 *
> +	 * For the same reason, we want to tell GICv4 that we need
> +	 * doorbells to be signalled, should an interrupt become pending.
> +	 */
> +	preempt_disable();
> +	kvm_vgic_vmcr_sync(vcpu);
> +	vgic_v4_put(vcpu, true);
> +	preempt_enable();
> +
> +	kvm_vcpu_block(vcpu);
> +	kvm_clear_request(KVM_REQ_UNHALT, vcpu);
> +
> +	preempt_disable();
> +	vgic_v4_load(vcpu);
> +	preempt_enable();
> +}
> +
>   static int kvm_vcpu_initialized(struct kvm_vcpu *vcpu)
>   {
>   	return vcpu->arch.target >= 0;
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index 275a27368a04..4794563a506b 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -95,8 +95,7 @@ static int kvm_handle_wfx(struct kvm_vcpu *vcpu)
>   	} else {
>   		trace_kvm_wfx_arm64(*vcpu_pc(vcpu), false);
>   		vcpu->stat.wfi_exit_stat++;
> -		kvm_vcpu_block(vcpu);
> -		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
> +		kvm_vcpu_wfi(vcpu);
>   	}
>   
>   	kvm_incr_pc(vcpu);
> 


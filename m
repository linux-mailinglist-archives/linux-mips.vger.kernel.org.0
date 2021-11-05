Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF16446964
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 21:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbhKEUGj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 16:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbhKEUGj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 16:06:39 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6E1C061714
        for <linux-mips@vger.kernel.org>; Fri,  5 Nov 2021 13:03:59 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id m26so9846586pff.3
        for <linux-mips@vger.kernel.org>; Fri, 05 Nov 2021 13:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PN/lxoi+e5tCVO5pPjxKDOBewixY35Ifh+V+MQmKh2Y=;
        b=f5rhbj9pb5GgTT0825+tujieonyli7SwThgHMXaD3NP3Mog1A094HPsqZZlkGOJ/Q+
         r3ZJnNzRBB3NhkN8VE/G5vrgRKhdENk2u9DuDgAERoqocOOeFGdBNvbmuevHRGuv/PzT
         2oM9e8uLyVHxjP0SBflIjCbS2YVvFiGTQPV4FXb1yFhkAV2Dwb/b8vz1V1fKzExBfVLb
         Xj15HqIIyyCqzeQTYv54iKEeMFkAbdprvcVA6NgVuqrrvC5EFRz5/vl/ehO9cRPXvPHn
         fwuRS81bHhHxNVlMCQCaLVr17+7bYqD4G5MIyYU1T+K/ui2sRBFDHO8DZRxHvFM9pN8W
         0Kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PN/lxoi+e5tCVO5pPjxKDOBewixY35Ifh+V+MQmKh2Y=;
        b=aD2WUPu6lov7+lsacB8P0u0jFVjPZye+y70riqIyj1c5wPp12K2GXtun72K4ktW7kw
         W5lCKHhMS89enuaHegNQTD95myNWR2ClDtieHfDK1c8F2RpabF5v3VMLA0cjaMuf4wnb
         hCC8VEfihcfyu5mo2v3tlXLBToOZjdEpuLXuvV/QJO3p1UzU84W/EbpW8cNX6uEP1MFK
         xBsQ8MZdGLhzEcHG5lizxqFxaeShhdNeHdrhptv3A7nexCMztK7YnCuKmiMD3Z8YdokA
         /FxqnBxHkpgo6ng43m1+6zB5N776m2LuRGwFQ9w2dNCJ3IbyD6MKXB7uZKQkxd3Ah6vB
         mSGQ==
X-Gm-Message-State: AOAM530BmRDz8ToqSKug7+C/est9KcqDEZAMzM9WomXpZwa0U7pFXijO
        9MDaWM2qG9mFtctLSEb+rfd6yw==
X-Google-Smtp-Source: ABdhPJyd4QYc+InpdUIun9J0aiQkUM13aDBr60E6YJVxeHTQZZxRXWXSmp46OuKH+1B6vf2ZVsVbyQ==
X-Received: by 2002:a05:6a00:22d1:b0:494:72c5:803b with SMTP id f17-20020a056a0022d100b0049472c5803bmr10239284pfj.84.1636142638330;
        Fri, 05 Nov 2021 13:03:58 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id c198sm6639870pga.6.2021.11.05.13.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 13:03:57 -0700 (PDT)
Date:   Fri, 5 Nov 2021 20:03:53 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, linuxppc-dev@lists.ozlabs.org,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Juergen Gross <jgross@suse.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        kernel-team@android.com
Subject: Re: [PATCH 4/5] KVM: x86: Use kvm_get_vcpu() instead of open-coded
 access
Message-ID: <YYWOKTYHhJywwCRk@google.com>
References: <20211105192101.3862492-1-maz@kernel.org>
 <20211105192101.3862492-5-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105192101.3862492-5-maz@kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 05, 2021, Marc Zyngier wrote:
> As we are about to change the way vcpus are allocated, mandate
> the use of kvm_get_vcpu() instead of open-coding the access.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/x86/kvm/vmx/posted_intr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> index 5f81ef092bd4..82a49720727d 100644
> --- a/arch/x86/kvm/vmx/posted_intr.c
> +++ b/arch/x86/kvm/vmx/posted_intr.c
> @@ -272,7 +272,7 @@ int pi_update_irte(struct kvm *kvm, unsigned int host_irq, uint32_t guest_irq,
>  
>  	if (!kvm_arch_has_assigned_device(kvm) ||
>  	    !irq_remapping_cap(IRQ_POSTING_CAP) ||
> -	    !kvm_vcpu_apicv_active(kvm->vcpus[0]))
> +	    !kvm_vcpu_apicv_active(kvm_get_vcpu(kvm, 0)))

Huh.  The existing code is decidedly odd.  I think it might even be broken, as
it's not obvious that vCPU0 _must_ be created when e.g. kvm_arch_irq_bypass_add_producer()
is called.

An equivalent, safe check would be:

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 5f81ef092bd4..a3100591a9ca 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -272,7 +272,7 @@ int pi_update_irte(struct kvm *kvm, unsigned int host_irq, uint32_t guest_irq,

        if (!kvm_arch_has_assigned_device(kvm) ||
            !irq_remapping_cap(IRQ_POSTING_CAP) ||
-           !kvm_vcpu_apicv_active(kvm->vcpus[0]))
+           !kvm_apicv_activated(kvm))
                return 0;

        idx = srcu_read_lock(&kvm->irq_srcu);


But I think even that is flawed, as APICv can be dynamically deactivated and
re-activated while the VM is running, and I don't see a path that re-updates
the IRTE when APICv is re-activated.  So I think a more conservative check is
needed, e.g.

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 5f81ef092bd4..6cf5b2e86118 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -272,7 +272,7 @@ int pi_update_irte(struct kvm *kvm, unsigned int host_irq, uint32_t guest_irq,

        if (!kvm_arch_has_assigned_device(kvm) ||
            !irq_remapping_cap(IRQ_POSTING_CAP) ||
-           !kvm_vcpu_apicv_active(kvm->vcpus[0]))
+           !irqchip_in_kernel(kvm) || !enable_apicv)
                return 0;

        idx = srcu_read_lock(&kvm->irq_srcu);


Paolo, am I missing something?

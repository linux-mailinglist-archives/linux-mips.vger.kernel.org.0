Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731C041B9F4
	for <lists+linux-mips@lfdr.de>; Wed, 29 Sep 2021 00:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243050AbhI1WOg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 18:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243026AbhI1WOf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 18:14:35 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28D3C06161C
        for <linux-mips@vger.kernel.org>; Tue, 28 Sep 2021 15:12:55 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id g14so237136pfm.1
        for <linux-mips@vger.kernel.org>; Tue, 28 Sep 2021 15:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mlGjiTQKkKxj4KcXOOnDVYyCs2ZSFatBALPcwummKQM=;
        b=jNRMWegrFCxfd1N3NSKKno4QA4WsToa8zhOgjhCTO9pYDJCneH2oOgqg6dFx8DO9WF
         fwg1HEPb3KvCAeF3bRE0/7Ymnd8Dfky61i04gYYvZL7w8j6q8Y/ySOjvayDVBN4iOWxC
         +FGF2ioFURjwyLWgi9QR0Ok/CwEElNFeuVoB9sT6QJJNTKVvZ0sDmvGthThk9iVZyaDD
         F1ZENnMgH4SFf4Va3ys/kvLX4q8l6AVlrCj4ZEeSj63wNA0C7PdNfwD7gNXfs0xY8fuO
         bpPRJE2F3EWvgtBjP8eZIeX/TGj2enUv06ukSy0MfjiC+Vq77zG/0ySvIBOJhAHJ8ZTc
         80iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mlGjiTQKkKxj4KcXOOnDVYyCs2ZSFatBALPcwummKQM=;
        b=k7B41NR+oTA/XBuT1m24qQGScF1ZJpPsnCSeg9l/B2VNBYBYKlMzk2odQSbPSNLck9
         y8evesC3dPd9IKuLXlhBjPIQEUzPhPWczh40s+kqoLE9ghemFkCp+jzuMkSYzdManbgR
         wo3EzG7IZvd8LWBlUL44djXFfKyh0LHvfYVkg2vmsaD0wV9Kx9cKjLxVfv3tQC34khPT
         UVBj7DKXFV1RBHq+3fL9HGlLSb8fgEkQNZXt+hQBU9ZZuEE1c0tLuFeFnX7sI+sQrmMG
         O0Mxe8I7861m2HeFTOJYlVqzZSI4THPmJ9ybMm+R6L1sRoEVMQtrM6VmN3wJZivZQAEg
         C8+g==
X-Gm-Message-State: AOAM530PZi3W5RbDDuR3SyQESce5fJrUoWRtjcsIGeQmiBme/yLtmxDD
        WZ5oDQEE/2fTdNTjUrKUwshgIA==
X-Google-Smtp-Source: ABdhPJwMJ6PXu1iYzvoK+xsmZtCnYCHuS4ke1upsonClun/Rtn4gUyNzkh7CQWduaPHweqPWa/7aGA==
X-Received: by 2002:aa7:83c4:0:b0:44b:bc59:1a46 with SMTP id j4-20020aa783c4000000b0044bbc591a46mr2781583pfn.77.1632867175070;
        Tue, 28 Sep 2021 15:12:55 -0700 (PDT)
Received: from google.com (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
        by smtp.gmail.com with ESMTPSA id q6sm104284pjd.26.2021.09.28.15.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 15:12:54 -0700 (PDT)
Date:   Tue, 28 Sep 2021 22:12:50 +0000
From:   David Matlack <dmatlack@google.com>
To:     Sean Christopherson <seanjc@google.com>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jing Zhang <jingzhangos@google.com>
Subject: Re: [PATCH 13/14] KVM: x86: Directly block (instead of "halting")
 UNINITIALIZED vCPUs
Message-ID: <YVOTYk9aSl72hCmX@google.com>
References: <20210925005528.1145584-1-seanjc@google.com>
 <20210925005528.1145584-14-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210925005528.1145584-14-seanjc@google.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 24, 2021 at 05:55:27PM -0700, Sean Christopherson wrote:
> Go directly to kvm_vcpu_block() when handling the case where userspace
> attempts to run an UNINITIALIZED vCPU.  The vCPU isn't halted and its time
> spent in limbo arguably should not be factored into halt-polling as the
> behavior of the VM at this point is not at all indicative of the behavior
> of the VM once it is up and running, i.e. executing HLT in idle tasks.
> 
> Note, because this case is encountered only on the first run of an AP vCPU,
> vcpu->halt_poll_ns is guaranteed to be '0', and so KVM will not attempt
> halt-polling, i.e. this really only affects the post-block bookkeeping.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: David Matlack <dmatlack@google.com>

> ---
>  arch/x86/kvm/x86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 0d71c73a61bb..b444f9315766 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -10127,7 +10127,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  			r = -EINTR;
>  			goto out;
>  		}
> -		kvm_vcpu_halt(vcpu);
> +		kvm_vcpu_block(vcpu);
>  		if (kvm_apic_accept_events(vcpu) < 0) {
>  			r = 0;
>  			goto out;
> -- 
> 2.33.0.685.g46640cef36-goog
> 

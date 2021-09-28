Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC4841B9FE
	for <lists+linux-mips@lfdr.de>; Wed, 29 Sep 2021 00:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243068AbhI1WQk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 18:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243079AbhI1WQj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 18:16:39 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57616C061755
        for <linux-mips@vger.kernel.org>; Tue, 28 Sep 2021 15:14:59 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id q23so206540pfs.9
        for <linux-mips@vger.kernel.org>; Tue, 28 Sep 2021 15:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oDTEp4uXq7wouuQuWuPnWVQXCIo6P8LpvQajseAha48=;
        b=BnufAkDaSqbvE0tuVagV8WXp+XHOA8rRfAQGH7v7vq47FtDaVwPb2gV3pg84col7Jn
         wiWxSJtOhRHOZ1OnBfK1IusCBeqHNprdHmkCTk9hwy1TjpFLJ2o37qhbCK64RU58wR+/
         NVNuIOjncjEgaNz1Aji8RAKlyT10kUNAthNYDNVDkepM7EAAeST1QgAUJgZz9JV6W8pQ
         Ga3dyZRVb1TCTPcNFYt7tNYB7fChJLmzpTPIY1149VIXRC09i0vUfJF6BV+ql+c0RWWW
         CLk/XS24h5X+HgfBHwpw+x6pOo0ByCwKeOnP2OHqWK6fByzx9dwNkhyWHGw0eQ1hWxHI
         bubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oDTEp4uXq7wouuQuWuPnWVQXCIo6P8LpvQajseAha48=;
        b=qBDzInoABtO5rKj0r0DdbjeL9wnBWMHwAGf9vl7NmEJV9mJkbdt1e2xEgzCYTc76hb
         YmfSAm82YQ5Oq+tnt4Q/vCRNxYostW+QixOQPIq4gp5X2evSPB4bNLghGI2zetXc/Ubb
         nKW1OloPm2PyQwM26juLRyLnpSkAoUgRvSFkcrAbY0Pgx+BV6VrkwWtlGX4I+oOVb89G
         3vUE9neot+XJs1nHFC0vc+2JlHQgi7Nf3MqoG5j5FM8A33gjb394nSNh8bExqbs8zvks
         dkU5+we/CR0EyRQBVX0N7DcbrgMyHbO4SgDzK+xE1d51WWxXro4eC8+gUlYZntbAJfyW
         Hl3Q==
X-Gm-Message-State: AOAM531//BhYSlTosgdgCxzBi893uLM+hrS48cyUD64xiMykIuVgdw5u
        HnpkF5w4oWTO3B7n4xU0WoVYhg==
X-Google-Smtp-Source: ABdhPJxBJllV/6MHwH/O4bupLMykTY/L8aml4vOWRLyRzjZbQcPh2xbpVAvFMm0QwWZGt6UvJ4KliA==
X-Received: by 2002:a62:dd0a:0:b0:44b:bd85:9387 with SMTP id w10-20020a62dd0a000000b0044bbd859387mr2015835pff.49.1632867298411;
        Tue, 28 Sep 2021 15:14:58 -0700 (PDT)
Received: from google.com (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
        by smtp.gmail.com with ESMTPSA id d7sm142548pfq.43.2021.09.28.15.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 15:14:57 -0700 (PDT)
Date:   Tue, 28 Sep 2021 22:14:54 +0000
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
Subject: Re: [PATCH 14/14] KVM: x86: Invoke kvm_vcpu_block() directly for
 non-HALTED wait states
Message-ID: <YVOT3gj1ulBTNSw3@google.com>
References: <20210925005528.1145584-1-seanjc@google.com>
 <20210925005528.1145584-15-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210925005528.1145584-15-seanjc@google.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 24, 2021 at 05:55:28PM -0700, Sean Christopherson wrote:
> Call kvm_vcpu_block() directly for all wait states except HALTED so that
> kvm_vcpu_halt() is no longer a misnomer on x86.
> 
> Functionally, this means KVM will never attempt halt-polling or adjust
> vcpu->halt_poll_ns for INIT_RECEIVED (a.k.a. Wait-For-SIPI (WFS)) or
> AP_RESET_HOLD; UNINITIALIZED is handled in kvm_arch_vcpu_ioctl_run(),
> and x86 doesn't use any other "wait" states.
> 
> As mentioned above, the motivation of this is purely so that "halt" isn't
> overloaded on x86, e.g. in KVM's stats.  Skipping halt-polling for WFS
> (and RESET_HOLD) has no meaningful effect on guest performance as there
> are typically single-digit numbers of INIT-SIPI sequences per AP vCPU,
> per boot, versus thousands of HLTs just to boot to console.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: David Matlack <dmatlack@google.com>

> ---
>  arch/x86/kvm/x86.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index b444f9315766..a0f313c4bc49 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9893,7 +9893,10 @@ static inline int vcpu_block(struct kvm *kvm, struct kvm_vcpu *vcpu)
>  	if (!kvm_arch_vcpu_runnable(vcpu) &&
>  	    (!kvm_x86_ops.pre_block || static_call(kvm_x86_pre_block)(vcpu) == 0)) {
>  		srcu_read_unlock(&kvm->srcu, vcpu->srcu_idx);
> -		kvm_vcpu_halt(vcpu);
> +		if (vcpu->arch.mp_state == KVM_MP_STATE_HALTED)
> +			kvm_vcpu_halt(vcpu);
> +		else
> +			kvm_vcpu_block(vcpu);
>  		vcpu->srcu_idx = srcu_read_lock(&kvm->srcu);
>  
>  		if (kvm_x86_ops.post_block)
> -- 
> 2.33.0.685.g46640cef36-goog
> 

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E51C41B6D2
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 21:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242356AbhI1TDW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 15:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242253AbhI1TDW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 15:03:22 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49E1C061746
        for <linux-mips@vger.kernel.org>; Tue, 28 Sep 2021 12:01:42 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id j14so14861070plx.4
        for <linux-mips@vger.kernel.org>; Tue, 28 Sep 2021 12:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xt0gEcyOTVXB3cbfAORCeU0aPfpfHLNMXNfI9X69CVQ=;
        b=P2WbyomAz9CC+YDhARNtEQPob4jnZ2g2oykK3Tx9s3ZzF3kIhs4M8u5I6nL6TYVoGq
         rrOLmGGUE/wsUTWlv/vaHIT0qruIxiC5Hconls6bpVJIAswiiw3izm0NUdKLNEX/vTj1
         hNuCFj8rB/KJEKNYPyTIjrwmUxsuMdqXz/A3MzGuI1a3Kwyq70MOLXcjCuAwjRmB7Dhb
         kf47CJCAyIoWzJus9Q6TAK/lSg8ZsxvgmyTdZgT9A2DiUE772alKYF35OPb474XMP0BJ
         1g92CPbM5JIG9MA0Bz7RxJUC/t1T7o89IaaifLPvH7z+3t2ti9exdaFi/jE6y9Sz0Jjp
         UImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xt0gEcyOTVXB3cbfAORCeU0aPfpfHLNMXNfI9X69CVQ=;
        b=jnKfhpgLXofc6WTZ36HGxpXvSiUnNf1rDEInfyFPCJ2QdE3vrZB32D6crruGxkMlI/
         2erGSFBKBIHgCgEjP7RtSFCDJp2v1ZPORsKxI4kMLn2CXAAz907L0XquyVcCo/V1HHCI
         PkAS6b4fA/w5bR5+3dHQSvzV44JmlrMpUU+1O5ZKsN8bf4JckAdF9RNGV0jmcoX1eA+2
         KWBerkFflM9dDidHZ79+0+qwY6wtm+FWvzO/HbJavHhxGMUFLWN1qxwAf3ozDNndBmKC
         JSVX0Nbr8yc/zlNmGf/XUVVwMW33JrLY0fapyvVFd943X1pGoHfk/Hn/YwbSnNLnC07L
         pgOA==
X-Gm-Message-State: AOAM532g4TmB3GHv5YYa4x5BwwZ7gUrDzx54jiynTeyBRyJ0IuDdPetH
        8JMuYTfuCTuOj4GpqsYjd5rNYg==
X-Google-Smtp-Source: ABdhPJwN22eVEV+ILvTVZFxrClU0H39RaKFVj+LTEdtXecOP9yW45Z7Ldv9r7U41GdYk3WWGVE+ldw==
X-Received: by 2002:a17:902:b909:b0:13a:2d8e:12bc with SMTP id bf9-20020a170902b90900b0013a2d8e12bcmr6453208plb.6.1632855701799;
        Tue, 28 Sep 2021 12:01:41 -0700 (PDT)
Received: from google.com (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
        by smtp.gmail.com with ESMTPSA id j24sm20993011pfh.65.2021.09.28.12.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 12:01:41 -0700 (PDT)
Date:   Tue, 28 Sep 2021 19:01:38 +0000
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
Subject: Re: [PATCH 03/14] KVM: Refactor and document halt-polling stats
 update helper
Message-ID: <YVNmkuaUYwYvlbaY@google.com>
References: <20210925005528.1145584-1-seanjc@google.com>
 <20210925005528.1145584-4-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210925005528.1145584-4-seanjc@google.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 24, 2021 at 05:55:17PM -0700, Sean Christopherson wrote:
> Add a comment to document that halt-polling is considered successful even
> if the polling loop itself didn't detect a wake event, i.e. if a wake
> event was detect in the final kvm_vcpu_check_block().  Invert the param
> to the update helper so that the helper is a dumb function that is "told"
> whether or not polling was successful, as opposed to having it determinine
> success/failure based on blocking behavior.
> 
> Opportunistically tweak the params to the update helper to reduce the
> line length for the call site so that it fits on a single line, and so
> that the prototype conforms to the more traditional kernel style.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: David Matlack <dmatlack@google.com>

> ---
>  virt/kvm/kvm_main.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 8b33f5045b4d..12fe91a0a4c8 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3199,13 +3199,15 @@ static int kvm_vcpu_check_block(struct kvm_vcpu *vcpu)
>  	return ret;
>  }
>  
> -static inline void
> -update_halt_poll_stats(struct kvm_vcpu *vcpu, u64 poll_ns, bool waited)
> +static inline void update_halt_poll_stats(struct kvm_vcpu *vcpu, ktime_t start,
> +					  ktime_t end, bool success)
>  {
> -	if (waited)
> -		vcpu->stat.generic.halt_poll_fail_ns += poll_ns;
> -	else
> +	u64 poll_ns = ktime_to_ns(ktime_sub(end, start));
> +
> +	if (success)
>  		vcpu->stat.generic.halt_poll_success_ns += poll_ns;
> +	else
> +		vcpu->stat.generic.halt_poll_fail_ns += poll_ns;
>  }
>  
>  /*
> @@ -3274,9 +3276,13 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
>  	kvm_arch_vcpu_unblocking(vcpu);
>  	block_ns = ktime_to_ns(cur) - ktime_to_ns(start);
>  
> +	/*
> +	 * Note, halt-polling is considered successful so long as the vCPU was
> +	 * never actually scheduled out, i.e. even if the wake event arrived
> +	 * after of the halt-polling loop itself, but before the full wait.
> +	 */
>  	if (do_halt_poll)
> -		update_halt_poll_stats(
> -			vcpu, ktime_to_ns(ktime_sub(poll_end, start)), waited);
> +		update_halt_poll_stats(vcpu, start, poll_end, !waited);
>  
>  	if (halt_poll_allowed) {
>  		if (!vcpu_valid_wakeup(vcpu)) {
> -- 
> 2.33.0.685.g46640cef36-goog
> 

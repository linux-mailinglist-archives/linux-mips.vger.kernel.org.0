Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA834321CD9
	for <lists+linux-mips@lfdr.de>; Mon, 22 Feb 2021 17:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbhBVQZs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Feb 2021 11:25:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbhBVQZk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Feb 2021 11:25:40 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3343AC06174A
        for <linux-mips@vger.kernel.org>; Mon, 22 Feb 2021 08:25:00 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id o22so126553pjs.1
        for <linux-mips@vger.kernel.org>; Mon, 22 Feb 2021 08:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K8Mk8DPpk11B6V3YwuQN3+iAtbjKIINrpZOMJr9ijMU=;
        b=ZkL+DPyOhtNNe7hZI9CaKbe4ebR0w/c08TMwcW6jEWxnEH8r794ZleXZWoZ/UR0m9l
         /JvwszOIsqxGcoQusTcqqjnSjevmzjijIqmibZWhNlf1fAH+fqB2XaC9yYLNGSgQajKW
         cQ37mvXb34+aOOxfrJiSDd0duyNERIQhiKqe1mF+9oUWIOq5QI43wZI8wjHcqYbkkeNz
         F74iB1b0pF2iLrhK6gzgmonIkdXMBmp9UGOP+w4UrVRBbDRpQmc5IjIAIQwXpNnoKanf
         hCRm8lc+Mszq2AP9WNUUdxblVMsJd9jJlh10sSOCswStuXopFHTvKoZcecsf/gsAVlr3
         E8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K8Mk8DPpk11B6V3YwuQN3+iAtbjKIINrpZOMJr9ijMU=;
        b=rld7rHxxWSb77s/J06a4Ss8IIYm/qNpapKEWHM6ZGn53p5TmmZK+8ZvM/fxJLar9ii
         trTUYwgarDVL7gJF4JaaQ9B1/qQNMZQqefqD/oUQYBMsktLNilZNt0fD0d8FoAob5Omi
         vsiRFNgfQiWVY0rYUGp6Fr489P+yGXLGkfGrfldcvvO55hZ8okuw0IcOk3zYpVH4OipO
         kzhgyBeHX/rmAVjsqZ/lV67FipBxJ/v+bZAZgi6Se3EzdxEgDxXXl4TtU1bwmI8bm3gm
         VbhhfFdG5R8+Gd4ny+PCjH8mFJ9uMfxV/qWOUQ8l3kPTCyN+ii2/4gwYxEiqG/09HxPM
         KE7w==
X-Gm-Message-State: AOAM530/FP9XmzknfEIvdISNtoS0MwwSpZ40hJ1LMu7pWjcfizLAOFFK
        lqhL+5N3sZ1MJZs7UUiwD+IhBQ==
X-Google-Smtp-Source: ABdhPJzpaRZ20ovy1dpVfBdxXc3ZVF23iR3XDePJsjQUoeSVBm8Osbw6p/Oa6Rqwlvu7+JfquMJWyQ==
X-Received: by 2002:a17:903:1d0:b029:df:d098:f1cb with SMTP id e16-20020a17090301d0b02900dfd098f1cbmr23104083plh.49.1614011099559;
        Mon, 22 Feb 2021 08:24:59 -0800 (PST)
Received: from google.com ([2620:15c:f:10:655e:415b:3b95:bd58])
        by smtp.gmail.com with ESMTPSA id f2sm21929378pfk.63.2021.02.22.08.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:24:58 -0800 (PST)
Date:   Mon, 22 Feb 2021 08:24:51 -0800
From:   Sean Christopherson <seanjc@google.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        linux-mips@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
        kvm-ppc@vger.kernel.org,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: [PATCH v4 2/2] KVM: x86/mmu: Consider the hva in mmu_notifier
 retry
Message-ID: <YDPa07i3S3Y7/iwy@google.com>
References: <20210222024522.1751719-1-stevensd@google.com>
 <20210222024522.1751719-3-stevensd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210222024522.1751719-3-stevensd@google.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 22, 2021, David Stevens wrote:
> ---
> v3 -> v4:
>  - Skip prefetch while invalidations are in progress

Oof, nice catch.

...

> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 9ac0a727015d..f6aaac729667 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -2758,6 +2758,13 @@ static void direct_pte_prefetch(struct kvm_vcpu *vcpu, u64 *sptep)
>  	if (sp->role.level > PG_LEVEL_4K)
>  		return;
>  
> +	/*
> +	 * If addresses are being invalidated, skip prefetching to avoid
> +	 * accidentally prefetching those addresses.
> +	 */
> +	if (unlikely(vcpu->kvm->mmu_notifier_count))
> +		return;

FNAME(pte_prefetch) needs the same check.

Paolo, this brings up a good addition for the work to integrate the mmu notifier
into the rest of KVM, e.g. for vmcs12 pages.  Ideally, gfn_to_page_many_atomic()
and __gfn_to_pfn_memslot() would WARN if mmu_notifier_count is non-zero, but
that will fire all over the place until the nested code properly integrates the
notifier.  There are a few use cases where racing with the notifier is acceptable,
e.g. reexecute_instruction(), but hopefully we can address those flows without
things getting too ugly.

> +
>  	__direct_pte_prefetch(vcpu, sp, sptep);
>  }

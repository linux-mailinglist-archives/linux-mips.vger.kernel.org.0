Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51BC63050CC
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 05:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236703AbhA0E12 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Jan 2021 23:27:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389675AbhA0AGw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Jan 2021 19:06:52 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B54C061797
        for <linux-mips@vger.kernel.org>; Tue, 26 Jan 2021 16:04:41 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id 31so27724plb.10
        for <linux-mips@vger.kernel.org>; Tue, 26 Jan 2021 16:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ehN8g8luuF2BKLiZYDz35HTGbUgrzlwEK0VyDMRc1bE=;
        b=u+tGmLtats3b8HsEfxKVQgMK0GXcYfxMRPArDpxJoYSxVOHzNMkczWTT9UKc+iuL5c
         1i80Ybhtd+JjjT+hrlRpf+r1Oti1xkqj1SSUkApAb7iuqNc0hAkpN+PYw76+kF30zXuT
         xKNeJ0v6+/QBYk7eVYWEZTsCW8IasRNlBF9OpHVGxlio9+VdQohz9RpJPqPxKapSecTH
         XpaQaL94Nfi9thSv44/gpO6nt2eB1Ocr0Vtnc3sPmSduLvYB3U07MvoJrdF3T7Y1+n08
         NfLW9PKtYmJe5bubHPO75UGFwYTmQBwPme6NriQsLx5/PJNyd+X6U36wepGK/wdj+iNS
         wuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ehN8g8luuF2BKLiZYDz35HTGbUgrzlwEK0VyDMRc1bE=;
        b=nduEQ2Byn9r4AhScpNq5ZEdMie3vT/KMqoKgmisjBKb932ndv2lmn+uxbCzaf5sVOJ
         ULF7XDcnJAWcK0LlfkIEbDIJ+bSPVGUVM+19sA5xaAIk6DSOAy41FicKu2Lmhs14616B
         lhKTM1SqTP38/Pm/eBtdGsVUnF00ao1GKfic7BNSt16KTPlb3kFKxvTTmrs2+TwTP1mq
         /HPDLhRjodPnYsPRsHtC3vi7RIW00m08YHk1yBGbkpPFyhNJxs1+5O/7fyHMN+8hfJrz
         aAkdHO/Cv2C/ba91YQLqewK36KIkXJzQpBSjx/0qPKuoFjm23nuUEDoe04/eWQEk92h9
         n7fw==
X-Gm-Message-State: AOAM530P1f4xYb11uXedJj0dSaeFranMt0xSTdcLeu/ryJcypPCnn/dj
        YmSFqMSxpAWCAO9ZCW+LqiUrsQ==
X-Google-Smtp-Source: ABdhPJzzbvfi/5tp5Y0OvbgmuXAJ+a6Aqpa1MNl1ySc5Qa2syXhxmjS34UST5dEuL1LWwufhbGgubw==
X-Received: by 2002:a17:90b:4a09:: with SMTP id kk9mr2478013pjb.15.1611705881203;
        Tue, 26 Jan 2021 16:04:41 -0800 (PST)
Received: from google.com ([2620:15c:f:10:1ea0:b8ff:fe73:50f5])
        by smtp.gmail.com with ESMTPSA id y4sm75088pji.34.2021.01.26.16.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 16:04:40 -0800 (PST)
Date:   Tue, 26 Jan 2021 16:04:33 -0800
From:   Sean Christopherson <seanjc@google.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
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
Subject: Re: [PATCH] KVM: x86/mmu: consider the hva in mmu_notifer retry
Message-ID: <YBCuEaxZu0MuD3MW@google.com>
References: <20210125064234.2078146-1-stevensd@google.com>
 <YA8PXCEVukW0UzC5@google.com>
 <CAD=HUj5YMtSJY6ZO9TRXHDEfWRM1o3Lrm7nkz=G2VJ_oZ-c5mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj5YMtSJY6ZO9TRXHDEfWRM1o3Lrm7nkz=G2VJ_oZ-c5mw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 26, 2021, David Stevens wrote:
> > This needs a comment to explicitly state that 'count > 1' cannot be done at
> > this time.  My initial thought is that it would be more intuitive to check for
> > 'count > 1' here, but that would potentially check the wrong wrange when count
> > goes from 2->1.  The comment about persistence in invalidate_range_start() is a
> > good hint, but I think it's worth being explicit to avoid bad "cleanup" in the
> > future.
> >
> > > +     if (unlikely(kvm->mmu_notifier_count)) {
> > > +             if (kvm->mmu_notifier_range_start <= hva &&
> > > +                 hva < kvm->mmu_notifier_range_end)
> 
> I'm not sure I understand what you're suggesting here. How exactly
> would 'count > 1' be used incorrectly here? I'm fine with adding a
> comment, but I'm not sure what the comment needs to clarify.

There's no guarantee that the remaining in-progress invalidation when the count
goes from 2->1 is the same invalidation call that set range_start/range_end.

E.g. given two invalidations, A and B, the order of calls could be:

  kvm_mmu_notifier_invalidate_range_start(A)
  kvm_mmu_notifier_invalidate_range_start(B)
  kvm_mmu_notifier_invalidate_range_end(A)
  kvm_mmu_notifier_invalidate_range_end(B) <-- ???

or

  kvm_mmu_notifier_invalidate_range_start(A)
  kvm_mmu_notifier_invalidate_range_start(B)
  kvm_mmu_notifier_invalidate_range_end(B)
  kvm_mmu_notifier_invalidate_range_end(A) <-- ???

In the first case, "A" is in-progress when the count goes 2->1, in the second
case "B" is still in-progress.  Checking for "count > 1" in the consumer instead
of handling it in the producer (as you did) would lead to the consumer checking
against the wrong range.  I don't see a way to solve that without adding some
amount of history, which I agree is unnecessary.

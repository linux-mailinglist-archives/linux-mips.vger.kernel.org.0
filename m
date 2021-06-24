Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8FDA3B32A6
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jun 2021 17:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbhFXPhu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Jun 2021 11:37:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28208 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230008AbhFXPht (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 24 Jun 2021 11:37:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624548930;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f6k4ykVaPXFxqKCeveqsqgjZTsHJh+2Hx0FU9Hu8Shk=;
        b=CzWgx2D41CtewkNoKfSXlHNvHr4JzTaydpUFctZ4grhohiyPOOiZM03jcOk+BqcQY9PARI
        ND/EiZ7OUbRRvzed7FFSGmmjCFYZnkRwlObmggnrscauZJ4LXoRq8lHxJhyJVtNv037ugs
        MALhEc0j8q3/V50B+B5aP17iCj4dO/Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-iZUzXONtPhm_TnAWHMwJMA-1; Thu, 24 Jun 2021 11:35:29 -0400
X-MC-Unique: iZUzXONtPhm_TnAWHMwJMA-1
Received: by mail-wr1-f70.google.com with SMTP id v8-20020a5d43c80000b029011a94e052f2so2352604wrr.2
        for <linux-mips@vger.kernel.org>; Thu, 24 Jun 2021 08:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f6k4ykVaPXFxqKCeveqsqgjZTsHJh+2Hx0FU9Hu8Shk=;
        b=YIFkHderPBETU0JYBlu9eejqFufGm1FSU0UuOcYiOb4MaTt8W7I/gJ0FRPHCmpfZJn
         TzAa71N2+O7fOsrgUdHLOeQ/ymI7od7R5cI2Ga/AePucRj4i+u2LINhmgNgpSmegTha/
         Dos8rAlevaS4mCk620hwA16rdD1YexArdRw8FDUfqrNQpYouBpCHvPQkDxvDBo49g3LQ
         MFFty0G6LGgIdKf0Xzj2VKvQuueNV6fQ8Xf+dqwj1YObB2CH+yvK29rV0U07ce2RaXj4
         XpLFa/yK3g+lKd2VsbHpIaMtXRMNmQpRWzfXYkpiuOfcoKZZjwi65mwdhfyjYrX9SKCE
         tDiQ==
X-Gm-Message-State: AOAM530gPKfoI44SuH1FaK4czcbBaR0jMBn7Bp4pCERZa9IDEeYHf02y
        cF86clOTYn/zPEme6zrU6zR9hkyqKIGFKXT/PXdtg8LlenvXE+6LkF4Uo2x0RTjH+v7NkEiRBpl
        mowbxZ8sX00cNxsJ/XmccGQ==
X-Received: by 2002:a05:6000:1251:: with SMTP id j17mr5373882wrx.122.1624548927955;
        Thu, 24 Jun 2021 08:35:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBnDqu4vf3bAIylFJkD7JiEEmgRW9T3VoP4swdNx5pmdzHboAZtCJNJi7bVPTY8V2i+hs/AQ==
X-Received: by 2002:a05:6000:1251:: with SMTP id j17mr5373864wrx.122.1624548927675;
        Thu, 24 Jun 2021 08:35:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id v18sm4013288wrv.24.2021.06.24.08.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 08:35:27 -0700 (PDT)
To:     Nicholas Piggin <npiggin@gmail.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Paul Mackerras <paulus@ozlabs.org>,
        David Stevens <stevensd@chromium.org>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>
Cc:     Alexandru Elisei <alexandru.elisei@arm.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        intel-gvt-dev@lists.freedesktop.org,
        James Morse <james.morse@arm.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, kvmarm@lists.cs.columbia.edu,
        kvm-ppc@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Sean Christopherson <seanjc@google.com>,
        David Stevens <stevensd@google.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Will Deacon <will@kernel.org>
References: <20210624035749.4054934-1-stevensd@google.com>
 <1624530624.8jff1f4u11.astroid@bobo.none>
 <1624534759.nj0ylor2eh.astroid@bobo.none>
 <0d3a699a-15eb-9f1b-0735-79d14736f38c@redhat.com>
 <1624539354.6zggpdrdbw.astroid@bobo.none>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/6] KVM: Remove uses of struct page from x86 and arm64
 MMU
Message-ID: <81d99029-ec40-19c5-5647-20607d78dab0@redhat.com>
Date:   Thu, 24 Jun 2021 17:35:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1624539354.6zggpdrdbw.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 24/06/21 14:57, Nicholas Piggin wrote:
> KVM: Fix page ref underflow for regions with valid but non-refcounted pages

It doesn't really fix the underflow, it disallows mapping them in the 
first place.  Since in principle things can break, I'd rather be 
explicit, so let's go with "KVM: do not allow mapping valid but 
non-reference-counted pages".

> It's possible to create a region which maps valid but non-refcounted
> pages (e.g., tail pages of non-compound higher order allocations). These
> host pages can then be returned by gfn_to_page, gfn_to_pfn, etc., family
> of APIs, which take a reference to the page, which takes it from 0 to 1.
> When the reference is dropped, this will free the page incorrectly.
> 
> Fix this by only taking a reference on the page if it was non-zero,

s/on the page/on valid pages/ (makes clear that invalid pages are fine 
without refcounting).

Thank you *so* much, I'm awful at Linux mm.

Paolo

> which indicates it is participating in normal refcounting (and can be
> released with put_page).
> 
> Signed-off-by: Nicholas Piggin<npiggin@gmail.com>


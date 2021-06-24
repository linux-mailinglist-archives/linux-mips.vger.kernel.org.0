Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB0E3B280F
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jun 2021 08:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbhFXHA0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Jun 2021 03:00:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21800 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229772AbhFXHAM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 24 Jun 2021 03:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624517863;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=igFDOV6BxGJ7IfsozRxLlI1SBnI7ilQNQtLZk9DKzFQ=;
        b=NfMKvr8Ax1E1LpAoe9jSBidAQj+ol3buwQmpYHGZG+kDQY+eCVgPPndbFH8AmRYtuUGdd6
        73Dbvk1gl3N6WMgE0j2Ge8KPXEThGtYmYzN2ufR5BXrPwwfcYj9hfimVKweuRvymgVyEEw
        vdbW6duZZOGeWQm/vjJkitKFrUcOawo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-M1D0SRDPO0a3-FzauhlbUQ-1; Thu, 24 Jun 2021 02:57:41 -0400
X-MC-Unique: M1D0SRDPO0a3-FzauhlbUQ-1
Received: by mail-wm1-f72.google.com with SMTP id y129-20020a1c32870000b029016920cc7087so494425wmy.4
        for <linux-mips@vger.kernel.org>; Wed, 23 Jun 2021 23:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=igFDOV6BxGJ7IfsozRxLlI1SBnI7ilQNQtLZk9DKzFQ=;
        b=m+XNIIMpGqqF1tYQEqQsedBuDLEbhmPVyN0U0iWmRK7LDKdzw9GHNflTa4N1UEbQof
         5+ksvZNZoG8BpGUrCRqCkgesuOYo8TZmFfQvm80fyma0efavwSzzK6jd1RaznopvXIYj
         qHqKPg4EM9DHSL6vxK9lMWHP/B783vxpzhlE+WwzRst6iHrmFErIPCtfAsLRYsNz3IWV
         h6izACY6OZIWPsSaRVwSlnfTFGWlGBztq0L52eAFSir9bYsIhBF4G1GZM38DGn//kogw
         B7f0BJPNIYjXL8scp18aBd9SXIrf4nNh+F3mWgaW16nk8Vq1WivklBmRKY3vhrUpYx4M
         gIjw==
X-Gm-Message-State: AOAM531dLnsh7UVmZFH0jkotCcJPrcPe21YcF6QZ4epFY0ts2uwhv6gD
        4Ciu4PnbdVnHOiMp7DkfKXGWBlY9+vTrgyvJHl5nj5McXbsqeyuQ16DDv9bpR/baJhaM6HIt3vL
        s1BcB3gUZ+tchU+unq68Gew==
X-Received: by 2002:a05:6000:1889:: with SMTP id a9mr85605wri.141.1624517860503;
        Wed, 23 Jun 2021 23:57:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdqChWxI2TqFhdGI9pdTdW0OY2cpxOML9ILwZzD3plJUW6I8N3vbOFGhbVC127GRhm0xAu2w==
X-Received: by 2002:a05:6000:1889:: with SMTP id a9mr85587wri.141.1624517860347;
        Wed, 23 Jun 2021 23:57:40 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id o26sm1900491wmr.29.2021.06.23.23.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 23:57:39 -0700 (PDT)
Subject: Re: [PATCH 0/6] KVM: Remove uses of struct page from x86 and arm64
 MMU
To:     David Stevens <stevensd@chromium.org>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        David Stevens <stevensd@google.com>
References: <20210624035749.4054934-1-stevensd@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20baae77-785c-5d46-e00c-41d86c2fbc56@redhat.com>
Date:   Thu, 24 Jun 2021 08:57:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624035749.4054934-1-stevensd@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 24/06/21 05:57, David Stevens wrote:
> KVM supports mapping VM_IO and VM_PFNMAP memory into the guest by using
> follow_pte in gfn_to_pfn. However, the resolved pfns may not have
> assoicated struct pages, so they should not be passed to pfn_to_page.
> This series removes such calls from the x86 and arm64 secondary MMU. To
> do this, this series modifies gfn_to_pfn to return a struct page in
> addition to a pfn, if the hva was resolved by gup. This allows the
> caller to call put_page only when necessated by gup.
> 
> This series provides a helper function that unwraps the new return type
> of gfn_to_pfn to provide behavior identical to the old behavior. As I
> have no hardware to test powerpc/mips changes, the function is used
> there for minimally invasive changes. Additionally, as gfn_to_page and
> gfn_to_pfn_cache are not integrated with mmu notifier, they cannot be
> easily changed over to only use pfns.
> 
> This addresses CVE-2021-22543 on x86 and arm64.

Thank you very much for this.  I agree that it makes sense to have a 
minimal change; I had similar changes almost ready, but was stuck with 
deadlocks in the gfn_to_pfn_cache case.  In retrospect I should have 
posted something similar to your patches.

I have started reviewing the patches, and they look good.  I will try to 
include them in 5.13.

Paolo


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 874411F49EE
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 01:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgFIXD5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 19:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728108AbgFIXDx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 19:03:53 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2864C05BD1E
        for <linux-mips@vger.kernel.org>; Tue,  9 Jun 2020 16:03:52 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id q10so116686vka.4
        for <linux-mips@vger.kernel.org>; Tue, 09 Jun 2020 16:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QPEA53MpdF9ON3exFjCberFh9r4WY/+iX04WGFZFtXU=;
        b=rwanDsZdo86Rv+vzZDRG+0C9QrHIbGQgfj2nwO+GiGBNVyLSExN93DGrkptklgs9I1
         AC0cy3+rivR0wtaNSSV9u8U2CqWzAr9cwayr0OtE6O+jC2+BtUr9VjUb8UFNbXJkVAi1
         WfJhopss4dvT37wHibefpDeELAXyANGodPwrJTtsn9yIlJTNlMVMXjXyhR/cP5akWDCP
         mjbboyehlJjrEud3b556BAnXu9H3ea7lZqMAdBWMg65r0d3SNuuwYPZvv8rUlGOJMmVx
         1rAQzDRF0wybOVz5i+mnG2dV7tbBHX6NxTZfN6sP+E0p5F7rIRZGBiMOtY3RefHOaxGa
         MGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QPEA53MpdF9ON3exFjCberFh9r4WY/+iX04WGFZFtXU=;
        b=UI8NW0ZWjdWTitPqrR/XQd7YZ2KCLy6J+5h73XrZdwVpPVaQThHtGzm0Z/54ivQedY
         R4FOzc48EuRndjwo59VYQjvuREvK1BW6iY5OwjO4R3mkjaFJm+Eh4wQqDX9O3rzZnuyL
         qu3HR9ctz8cwkAFBTsFw8NyDLw2NI13L6MrY4oBPU2zbl5A9e7s7WqAW+1joUS6Em3sL
         16vR86Zf2NrZ0JG6VCioqRZX+xjxSu6tBxSzoSis9aNPS/oDZU04SWSmeV3E2geEh6b+
         JO44DZm8rb7HkiFv7llzilRG0KrRjTOunxMup/4ZxUEbGZ9ZRaxOXsLDp47BIzy0UPbE
         +Xdw==
X-Gm-Message-State: AOAM5316uORM1vytpLrUX5Rqgq/iek1j8TrbRr7FFeKHQbk4RUgeIOjH
        rTxgUfwHSX7EvXCW6xlKlvMxc0H2CbBYFW4LnKlB7g==
X-Google-Smtp-Source: ABdhPJwvz0K9ugkUS0zUu2sV6SC9xdH2ngcwyFlRhaY+EjhyMbUztSqGBkZnAcJGtcUe/roomwm1IuKpnHfl3gWMyfI=
X-Received: by 2002:a1f:974d:: with SMTP id z74mr401275vkd.40.1591743831579;
 Tue, 09 Jun 2020 16:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200605213853.14959-1-sean.j.christopherson@intel.com> <20200605213853.14959-7-sean.j.christopherson@intel.com>
In-Reply-To: <20200605213853.14959-7-sean.j.christopherson@intel.com>
From:   Ben Gardon <bgardon@google.com>
Date:   Tue, 9 Jun 2020 16:03:40 -0700
Message-ID: <CANgfPd9Y9P+-got9HmtrvChmwZBe-XOA0zSSLMsPCUKcuBv4aQ@mail.gmail.com>
Subject: Re: [PATCH 06/21] KVM: x86/mmu: Move fast_page_fault() call above mmu_topup_memory_caches()
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     Marc Zyngier <maz@kernel.org>, Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
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
        Peter Feiner <pfeiner@google.com>,
        Peter Shier <pshier@google.com>,
        Junaid Shahid <junaids@google.com>,
        Christoffer Dall <christoffer.dall@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 5, 2020 at 2:39 PM Sean Christopherson
<sean.j.christopherson@intel.com> wrote:
>
> Avoid refilling the memory caches and potentially slow reclaim/swap when
> handling a fast page fault, which does not need to allocate any new
> objects.
>
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Reviewed-by: Ben Gardon <bgardon@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 5e773564ab20..4b4c3234d623 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -4095,6 +4095,9 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u32 error_code,
>         if (page_fault_handle_page_track(vcpu, error_code, gfn))
>                 return RET_PF_EMULATE;
>
> +       if (fast_page_fault(vcpu, gpa, error_code))
> +               return RET_PF_RETRY;
> +
>         r = mmu_topup_memory_caches(vcpu);
>         if (r)
>                 return r;
> @@ -4102,9 +4105,6 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u32 error_code,
>         if (lpage_disallowed)
>                 max_level = PG_LEVEL_4K;
>
> -       if (fast_page_fault(vcpu, gpa, error_code))
> -               return RET_PF_RETRY;
> -
>         mmu_seq = vcpu->kvm->mmu_notifier_seq;
>         smp_rmb();
>
> --
> 2.26.0
>

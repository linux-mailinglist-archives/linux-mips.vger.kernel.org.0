Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A06E189FA2
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2020 16:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbgCRP2r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Mar 2020 11:28:47 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:27922 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727052AbgCRP2r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 18 Mar 2020 11:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584545325;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VUCh0wftalNEjNdcnFsloNUT1bkuB14BiJcAimoQrqM=;
        b=FJZLVPVwM9sxinJZPM/+apOJKvvsEkOOyS3GoeVFkkKeujwnU+YOS1r4a+TFQSnsRouWHF
        Xrt/cTIF7hTN5QQrXnAONodLbUvT7NmADEJEstbdh9ni9dnJqn2w99QqYXfZJ6SkvACRyI
        suDEjptPlEaZILKbyyf4c+gge5YaK8A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-1g35Y7-_ODOYxGtWEWcdEA-1; Wed, 18 Mar 2020 11:28:43 -0400
X-MC-Unique: 1g35Y7-_ODOYxGtWEWcdEA-1
Received: by mail-wr1-f71.google.com with SMTP id b11so12486065wru.21
        for <linux-mips@vger.kernel.org>; Wed, 18 Mar 2020 08:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VUCh0wftalNEjNdcnFsloNUT1bkuB14BiJcAimoQrqM=;
        b=IpsjoITGE/3c8fkvyujiCq9GNdsTZn/LuVUZQ27F/QituRpbF7FYBfw+O0WlNEMP/S
         bt6AFjWA+tynagcIVu+bKsqXJqxYd8yw5NSoOF7UEvQpt1AHGBwW4kKKVqjNz6iUtQRr
         2534cVRY9vOYJUMCh+kmSZv0UmCDD9nTOwrn/8mShumYIiMGqoFkl9c9KLBFN18Q1yom
         JQAHvHA6S7KlACOnPP0a7AyPzhwy33gi7ArHIIEUkna1FDt6vqIuPwiLjvYpT+OkIrxv
         Pm/CZMecHyQf5loSufETSbXSB7kvqUTkKENztA+kofMkMJ7uTSqHWxiiW8Lacn48nuf0
         ENPg==
X-Gm-Message-State: ANhLgQ3KR6fvjvxCh0OH0PRcdoyx3Tgdf7qyAh4jo/PzlNE6Roq1brw4
        mtQ15G99nWVNhbO/V36MYKXhz7ZC/4VSKqcjhe7omtUpx6SrLpBu/pw+GBF2/nhxN2pPkaFiDdh
        MHVP49wd/qa0EdVD2S2Bf7Q==
X-Received: by 2002:adf:9dc3:: with SMTP id q3mr6070600wre.261.1584545322303;
        Wed, 18 Mar 2020 08:28:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvQ3As6L76WZ//A5cqQI05TIc7ne2hi0uHoFiBQHs2a7RxVtpIdNpmfB+GipThRk+6Nmotnqw==
X-Received: by 2002:adf:9dc3:: with SMTP id q3mr6070584wre.261.1584545322057;
        Wed, 18 Mar 2020 08:28:42 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id b12sm9676686wro.66.2020.03.18.08.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 08:28:41 -0700 (PDT)
Date:   Wed, 18 Mar 2020 11:28:37 -0400
From:   Peter Xu <peterx@redhat.com>
To:     maobibo <maobibo@loongson.cn>
Cc:     linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        linux-mips@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH RFC 4/4] KVM: MIPS: Define arch-specific
 kvm_flush_remote_tlbs()
Message-ID: <20200318152837.GB26585@xz-x1>
References: <20200207223520.735523-1-peterx@redhat.com>
 <20200207223520.735523-5-peterx@redhat.com>
 <e434cbe0-8d1c-c7fe-e169-01268bd4541c@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e434cbe0-8d1c-c7fe-e169-01268bd4541c@loongson.cn>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 18, 2020 at 11:03:13AM +0800, maobibo wrote:
> 
> 
> On 02/08/2020 06:35 AM, Peter Xu wrote:
> > Select HAVE_KVM_ARCH_TLB_FLUSH_ALL for MIPS to define its own
> > kvm_flush_remote_tlbs().  It's as simple as calling the
> > flush_shadow_all(kvm) hook.  Then replace all the flush_shadow_all()
> > calls to use this KVM generic API to do TLB flush.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  arch/mips/kvm/Kconfig |  1 +
> >  arch/mips/kvm/mips.c  | 22 ++++++++++------------
> >  2 files changed, 11 insertions(+), 12 deletions(-)
> > 
> > diff --git a/arch/mips/kvm/Kconfig b/arch/mips/kvm/Kconfig
> > index eac25aef21e0..8a06f660d39e 100644
> > --- a/arch/mips/kvm/Kconfig
> > +++ b/arch/mips/kvm/Kconfig
> > @@ -26,6 +26,7 @@ config KVM
> >  	select KVM_MMIO
> >  	select MMU_NOTIFIER
> >  	select SRCU
> > +	select HAVE_KVM_ARCH_TLB_FLUSH_ALL
> >  	---help---
> >  	  Support for hosting Guest kernels.
> > 
> > diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> > index 1d5e7ffda746..518020b466bf 100644
> > --- a/arch/mips/kvm/mips.c
> > +++ b/arch/mips/kvm/mips.c
> > @@ -194,13 +194,16 @@ int kvm_arch_create_memslot(struct kvm *kvm, struct kvm_memory_slot *slot,
> >  	return 0;
> >  }
> > 
> > +void kvm_flush_remote_tlbs(struct kvm *kvm)
> > +{
> > +	kvm_mips_callbacks->flush_shadow_all(kvm);
> > +}
> > +
> Hi Peter,

Hi, Bibo,

> 
> Although I do not understand mip VZ fully, however it changes behavior of
> MIPS VZ, since kvm_flush_remote_tlbs is also called in function
> kvm_mmu_notifier_change_pte/kvm_mmu_notifier_invalidate_range_start

I'm not familiar with MIPS either, however... I would start to suspect
MIPS could be problematic with MMU notifiers when cpu_has_guestid is
not set.  If that's the case, then this series might instead fix it.

Thanks,

-- 
Peter Xu


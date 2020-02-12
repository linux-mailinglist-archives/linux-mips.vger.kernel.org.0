Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 476C515A91A
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2020 13:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727960AbgBLMZh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Feb 2020 07:25:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60351 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725887AbgBLMZh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Feb 2020 07:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581510335;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v7SHYl6d5ReTOaQmbSZgfq/qRRUXKZndS7RBXf8LMdk=;
        b=gFOE0Ewg6jjmj2If5KMxaO7nz9Y88RObJBJ7XYEdSRfgVjYiRNMbIGdKWvNolWTXS2is3y
        FN41kXl+R1ohKDguw7GtjAN2lwvzhLRx3Azo20YhppXbDQi2ndDVckZhk7lgDf1LyRpwck
        l8XflWYQSJmfgiOUl53arcBwbMA7cco=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-D9-iCO7UMtizhQrBiGFedw-1; Wed, 12 Feb 2020 07:25:33 -0500
X-MC-Unique: D9-iCO7UMtizhQrBiGFedw-1
Received: by mail-wm1-f70.google.com with SMTP id b8so434381wmj.0
        for <linux-mips@vger.kernel.org>; Wed, 12 Feb 2020 04:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v7SHYl6d5ReTOaQmbSZgfq/qRRUXKZndS7RBXf8LMdk=;
        b=kXyHOVK/zH908KnrS5XUCjqeMOCLFm/0AcSDJLFvI9Z5wCPasPyYsGc5jSIoERb5sO
         r11fUSDRvQ8DWYzaNBdcjdeM/1n2gIr9323oljWECC/64rO+/1hffjwr41FcKkisSrav
         lrwf5RPEDsPm0ZPSFwy5e7D9993f9Qz+LaN8w4GptpxsIm5K8t9SdQYwyyVULbVi5lwk
         mQUNevxYS2WvLu38kBFQySbvMU6I51PwWvW0t2i+tH2Db7420daeEdEAy8YyT7N0QHHf
         CdWJU7b03d+OOFL365YwAJWUfQjyM9qOdghQ2gvVv7t+kzH6DHAIBvIc/d7poTnP3ZVZ
         r5VQ==
X-Gm-Message-State: APjAAAUo6aY1ijHr2RjqNO5Zwh9BYGYdmsOO831hyjIfAMM7pHOcgsoR
        UbrkNHmK145FTM02lWhAsjCuGD2CoUUgGPOTIG1D19OoxxyjAWOmYVXnQgGB3qsX1m1E6a8bOy4
        7SgiLm/7V5macBpELjxLvPA==
X-Received: by 2002:a5d:6191:: with SMTP id j17mr14382618wru.427.1581510332378;
        Wed, 12 Feb 2020 04:25:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqxbaykaLeEfUuQejm3gf0f5E8MaPJD6NfjGX4uidLN43pX0GmVVm4HohpkS4WyXa8V87p0/9A==
X-Received: by 2002:a5d:6191:: with SMTP id j17mr14382327wru.427.1581510328245;
        Wed, 12 Feb 2020 04:25:28 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:652c:29a6:517b:66d9? ([2001:b07:6468:f312:652c:29a6:517b:66d9])
        by smtp.gmail.com with ESMTPSA id z11sm388108wrv.96.2020.02.12.04.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2020 04:25:24 -0800 (PST)
Subject: Re: [PATCH RFC 0/4] KVM: MIPS: Provide arch-specific
 kvm_flush_remote_tlbs()
To:     Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org
Cc:     Sean Christopherson <sean.j.christopherson@intel.com>,
        linux-mips@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>
References: <20200207223520.735523-1-peterx@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <44ba59d6-39a5-4221-1ae6-41e5a305d316@redhat.com>
Date:   Wed, 12 Feb 2020 13:25:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200207223520.735523-1-peterx@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 07/02/20 23:35, Peter Xu wrote:
> [This series is RFC because I don't have MIPS to compile and test]
> 
> kvm_flush_remote_tlbs() can be arch-specific, by either:
> 
> - Completely replace kvm_flush_remote_tlbs(), like ARM, who is the
>   only user of CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL so far
> 
> - Doing something extra before kvm_flush_remote_tlbs(), like MIPS VZ
>   support, however still wants to have the common tlb flush to be part
>   of the process.  Could refer to kvm_vz_flush_shadow_all().  Then in
>   MIPS it's awkward to flush remote TLBs: we'll need to call the mips
>   hooks.
> 
> It's awkward to have different ways to specialize this procedure,
> especially MIPS cannot use the genenal interface which is quite a
> pity.  It's good to make it a common interface.
> 
> This patch series removes the 2nd MIPS usage above, and let it also
> use the common kvm_flush_remote_tlbs() interface.  It should be
> suggested that we always keep kvm_flush_remote_tlbs() be a common
> entrance for tlb flushing on all archs.
> 
> This idea comes from the reading of Sean's patchset on dynamic memslot
> allocation, where a new dirty log specific hook is added for flushing
> TLBs only for the MIPS code [1].  With this patchset, logically the
> new hook in that patch can be dropped so we can directly use
> kvm_flush_remote_tlbs().
> 
> TODO: We can even extend another common interface for ranged TLB, but
> let's see how we think about this series first.
> 
> Any comment is welcomed, thanks.
> 
> Peter Xu (4):
>   KVM: Provide kvm_flush_remote_tlbs_common()
>   KVM: MIPS: Drop flush_shadow_memslot() callback
>   KVM: MIPS: Replace all the kvm_flush_remote_tlbs() references
>   KVM: MIPS: Define arch-specific kvm_flush_remote_tlbs()
> 
>  arch/mips/include/asm/kvm_host.h |  7 -------
>  arch/mips/kvm/Kconfig            |  1 +
>  arch/mips/kvm/mips.c             | 22 ++++++++++------------
>  arch/mips/kvm/trap_emul.c        | 15 +--------------
>  arch/mips/kvm/vz.c               | 14 ++------------
>  include/linux/kvm_host.h         |  1 +
>  virt/kvm/kvm_main.c              | 10 ++++++++--
>  7 files changed, 23 insertions(+), 47 deletions(-)
> 

Compile-tested and queued.

MIPS folks, I see that arch/mips/kvm/mmu.c uses pud_index, so it's not
clear to me if it's meant to only work if CONFIG_PGTABLE_LEVELS=4 or
it's just bit rot.  Should I add a "depends on PGTABLE_LEVEL=4" to
arch/mips/Kconfig?

Paolo


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD643321F07
	for <lists+linux-mips@lfdr.de>; Mon, 22 Feb 2021 19:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbhBVSTX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Feb 2021 13:19:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20532 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232233AbhBVSSj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Feb 2021 13:18:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614017832;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M1O2O9X5RXSfF+m5PX0DyBo6+zLejZgNhGtzl18mwLU=;
        b=FNRVHNe5CfMAVPXVFmRvIU5n9TtA7YYFEYjtQBkgOC/QcmIouTfKp1Os1gxR6Rk3cVoFcw
        OBdvccM/XxS9Ad7gD+7PwdCPL60S/diPZK6xrZVZS/sf6i+HdxYOo9LBCb/GMPuq7fFWSj
        b+1esQY5BV02h5mBuOhTRZEnnBK8RAY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-Nw8W08_IOg6Rp6_HUDC8sQ-1; Mon, 22 Feb 2021 13:17:09 -0500
X-MC-Unique: Nw8W08_IOg6Rp6_HUDC8sQ-1
Received: by mail-ej1-f71.google.com with SMTP id rh17so1185795ejb.19
        for <linux-mips@vger.kernel.org>; Mon, 22 Feb 2021 10:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M1O2O9X5RXSfF+m5PX0DyBo6+zLejZgNhGtzl18mwLU=;
        b=OA2i78K3wjd/JApYTb4F9bhLsG9CEYWvgZzghjFB8K44bWuFt/UyWlpM4pFEbIazz9
         av1UEbpfIMXzxOuJbr0Lx3yHMDkJ9sE7sgJZaLQUQ9za4SzGq4IzyQeyTpFqMUipq0sz
         SupTO+Ok+lncBiQ3d5VUpWKBiKkn5WNC+N3m84kUNYaQaU57f8N4h/PdS9hLEz2UDgeM
         Vr3JoPJdpEH4Q0IICAsE46GBkK5qxpxzFAgrDpiBKbGLvhvvaDWdTzZwKGs19viXmLeh
         69XI6Igjv9whhuHlgGTl7jm62Q4hK4uFGhXjnyEzmQq+0oGMVu2XzPrAgFuJYZlfs8Si
         q8Uw==
X-Gm-Message-State: AOAM5319jGlPTq91BLcPqY0XTotwnedc4w8YySRTo/4vR9DoPrARQcks
        FcPpRQiGJe9w+4U+ZiuZl3dnB3AK19lLmwDqHfJCptjmUlgvai9R5sxU5PAk/sUa/bQ0wf3CvfO
        kpjAuec183Vo7U2PjSPa4OQ==
X-Received: by 2002:a17:906:1c4f:: with SMTP id l15mr11171184ejg.148.1614017828675;
        Mon, 22 Feb 2021 10:17:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT03kSWOr2tXOOmqkmqccMekugd1GPN0H9nHYrXxVs3CozSxxVXGpHmYF/OdiWxYx0Hw1ilw==
X-Received: by 2002:a17:906:1c4f:: with SMTP id l15mr11171153ejg.148.1614017828484;
        Mon, 22 Feb 2021 10:17:08 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id d5sm12773936edu.12.2021.02.22.10.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 10:17:07 -0800 (PST)
Subject: Re: [PATCH v4 0/2] KVM: x86/mmu: Skip mmu_notifier changes when
 possible
To:     David Stevens <stevensd@chromium.org>,
        Sean Christopherson <seanjc@google.com>
Cc:     Vitaly Kuznetsov <vkuznets@redhat.com>,
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
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Stevens <stevensd@google.com>
References: <20210222024522.1751719-1-stevensd@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7fe10f74-e183-411a-468b-93fcdf786bb6@redhat.com>
Date:   Mon, 22 Feb 2021 19:17:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222024522.1751719-1-stevensd@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 22/02/21 03:45, David Stevens wrote:
> These patches reduce how often mmu_notifier updates block guest page
> faults. The primary benefit of this is the reduction in the likelihood
> of extreme latency when handling a page fault due to another thread
> having been preempted while modifying host virtual addresses.
> 
> v3 -> v4:
>   - Fix bug by skipping prefetch during invalidation
> 
> v2 -> v3:
>   - Added patch to skip check for MMIO page faults
>   - Style changes
> 
> David Stevens (1):
>    KVM: x86/mmu: Consider the hva in mmu_notifier retry
> 
> Sean Christopherson (1):
>    KVM: x86/mmu: Skip mmu_notifier check when handling MMIO page fault
> 
>   arch/powerpc/kvm/book3s_64_mmu_hv.c    |  2 +-
>   arch/powerpc/kvm/book3s_64_mmu_radix.c |  2 +-
>   arch/x86/kvm/mmu/mmu.c                 | 23 ++++++++++++++------
>   arch/x86/kvm/mmu/paging_tmpl.h         |  7 ++++---
>   include/linux/kvm_host.h               | 25 +++++++++++++++++++++-
>   virt/kvm/kvm_main.c                    | 29 ++++++++++++++++++++++----
>   6 files changed, 72 insertions(+), 16 deletions(-)
> 

Rebased, and queued with the fix that Sean suggested.

Paolo


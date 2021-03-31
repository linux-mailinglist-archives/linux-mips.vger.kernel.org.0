Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E2834FAE9
	for <lists+linux-mips@lfdr.de>; Wed, 31 Mar 2021 09:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234195AbhCaH5j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Mar 2021 03:57:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21434 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234190AbhCaH5Z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 31 Mar 2021 03:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617177444;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QzUhMnMU3zQi7kbLUex8emke2jBdKMAGI8Tet8F4dtw=;
        b=PICz9S+uBtGk/mte47jDU1AGrkdflPKcD5bU88EEagj46Oqn1uIHDo/bIGCl0/x62ltz4e
        NzPRIUwYEUu16rBRMCTz5vVNLPe0CGgBV1F7pjtpj10uBlurF3ClfpS7Il8yt2yAXV0gqB
        PjSHJgEzf/9ugPVOYl1jllwv0YcX9co=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-wGlzXrq-Mxiy6dkfgYUGrA-1; Wed, 31 Mar 2021 03:57:22 -0400
X-MC-Unique: wGlzXrq-Mxiy6dkfgYUGrA-1
Received: by mail-wm1-f70.google.com with SMTP id f9so401235wml.0
        for <linux-mips@vger.kernel.org>; Wed, 31 Mar 2021 00:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QzUhMnMU3zQi7kbLUex8emke2jBdKMAGI8Tet8F4dtw=;
        b=lMQBgLtzFtnZLfPoiuanJXy+g0MhCP9SIUXK5wTgRekR+VeuRcETQHdQbaxNKAHHpL
         FKDmSUi/zBnzMQphrZ92GdCxO8DcwjhedMw+geU5Caj2AAmfo0euWOUQl/odm6HlXgVF
         mSrHX4yGOWawjo/73XBPl27X7zXcOifAraq5dasWAEKpN/vf7WTn9Qf6ojpaxx2r5r2K
         8ooamsbnScnzOicniFiey0XBaro3BhcuBhYp2bdfyL4UK+lxZM8SitBiht/wdfWcZhSv
         TVqlugasqokqBFeTrompAK8q0qYYQL29TFZ16Vp3fXIECSyaF7qwM7O3EpVFVBLDFg5T
         YKQg==
X-Gm-Message-State: AOAM5332f9/cmngBF2FKDQ8rzfopH/BZvMtAAtynsYZWzDrXmxIS6nsP
        GVPxz1zqu0Zb1ssKwWHfjzxJhLAw5YD+SKLfkUEEl3t+t0I9gg7jX43ZiaSCj7n+8FZgIEgynSC
        MMHrcSgVEshcxOr+jaPGiLA==
X-Received: by 2002:a05:600c:190a:: with SMTP id j10mr1935784wmq.140.1617177441042;
        Wed, 31 Mar 2021 00:57:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg+EcdGfruRX3HrpM78c15MOqjXD+Pq6QPq9lrCE+nNtYrHVJVg0glnjf7PSn4UemOs7R8Kw==
X-Received: by 2002:a05:600c:190a:: with SMTP id j10mr1935760wmq.140.1617177440807;
        Wed, 31 Mar 2021 00:57:20 -0700 (PDT)
Received: from [192.168.10.118] ([93.56.169.140])
        by smtp.gmail.com with ESMTPSA id b65sm2631515wmh.4.2021.03.31.00.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 00:57:19 -0700 (PDT)
Subject: Re: [PATCH 00/18] KVM: Consolidate and optimize MMU notifiers
To:     Sean Christopherson <seanjc@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>
Cc:     James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ben Gardon <bgardon@google.com>
References: <20210326021957.1424875-1-seanjc@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a2ca8cb2-5c91-b971-9b6e-65cf9ee97ffa@redhat.com>
Date:   Wed, 31 Mar 2021 09:57:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210326021957.1424875-1-seanjc@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 26/03/21 03:19, Sean Christopherson wrote:
> The end goal of this series is to optimize the MMU notifiers to take
> mmu_lock if and only if the notification is relevant to KVM, i.e. the hva
> range overlaps a memslot.   Large VMs (hundreds of vCPUs) are very
> sensitive to mmu_lock being taken for write at inopportune times, and
> such VMs also tend to be "static", e.g. backed by HugeTLB with minimal
> page shenanigans.  The vast majority of notifications for these VMs will
> be spurious (for KVM), and eliding mmu_lock for spurious notifications
> avoids an otherwise unacceptable disruption to the guest.
> 
> To get there without potentially degrading performance, e.g. due to
> multiple memslot lookups, especially on non-x86 where the use cases are
> largely unknown (from my perspective), first consolidate the MMU notifier
> logic by moving the hva->gfn lookups into common KVM.
> 
> Applies on my TDP MMU TLB flushing bug fixes[*], which conflict horribly
> with the TDP MMU changes in this series.  That code applies on kvm/queue
> (commit 4a98623d5d90, "KVM: x86/mmu: Mark the PAE roots as decrypted for
> shadow paging").
> 
> Speaking of conflicts, Ben will soon be posting a series to convert a
> bunch of TDP MMU flows to take mmu_lock only for read.  Presumably there
> will be an absurd number of conflicts; Ben and I will sort out the
> conflicts in whichever series loses the race.
> 
> Well tested on Intel and AMD.  Compile tested for arm64, MIPS, PPC,
> PPC e500, and s390.  Absolutely needs to be tested for real on non-x86,
> I give it even odds that I introduced an off-by-one bug somewhere.
> 
> [*] https://lkml.kernel.org/r/20210325200119.1359384-1-seanjc@google.com
> 
> 
> Patches 1-7 are x86 specific prep patches to play nice with moving
> the hva->gfn memslot lookups into common code.  There ended up being waaay
> more of these than I expected/wanted, but I had a hell of a time getting
> the flushing logic right when shuffling the memslot and address space
> loops.  In the end, I was more confident I got things correct by batching
> the flushes.
> 
> Patch 8 moves the existing API prototypes into common code.  It could
> technically be dropped since the old APIs are gone in the end, but I
> thought the switch to the new APIs would suck a bit less this way.
> 
> Patch 9 moves arm64's MMU notifier tracepoints into common code so that
> they are not lost when arm64 is converted to the new APIs, and so that all
> architectures can benefit.
> 
> Patch 10 moves x86's memslot walkers into common KVM.  I chose x86 purely
> because I could actually test it.  All architectures use nearly identical
> code, so I don't think it actually matters in the end.
> 
> Patches 11-13 move arm64, MIPS, and PPC to the new APIs.
> 
> Patch 14 yanks out the old APIs.
> 
> Patch 15 adds the mmu_lock elision, but only for unpaired notifications.
> 
> Patch 16 adds mmu_lock elision for paired .invalidate_range_{start,end}().
> This is quite nasty and no small part of me thinks the patch should be
> burned with fire (I won't spoil it any further), but it's also the most
> problematic scenario for our particular use case.  :-/
> 
> Patches 17-18 are additional x86 cleanups.

Queued and 1-9 and 18, thanks.  There's a small issue in patch 10 that 
prevented me from committing 10-15, but they mostly look good.

Paolo


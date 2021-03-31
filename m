Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01A52350855
	for <lists+linux-mips@lfdr.de>; Wed, 31 Mar 2021 22:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236559AbhCaUnA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Mar 2021 16:43:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25315 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236590AbhCaUmg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 31 Mar 2021 16:42:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617223355;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NNGnbExYiLuLZaTb/olJYdDzkOfEQoR57OqAJHWnBDw=;
        b=UqcaIi/ABRlSq9nJyxYJJQJT/dIvZs3QdWSTDWMhT8X2i2eR4zmZs9C9dqwZAFg3Z9hNmm
        Q9vphi5WXHoNNjiHDLJXV7/LwkWaumx8poQAqmMWbrNRw95uXGCKew2zWnyVZ8heL9s+ff
        Uk8RoS7ma/c+bMK5/xa6kjWkYJeusw0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-wNPb82dOPs2zHav2x7wfUg-1; Wed, 31 Mar 2021 16:42:33 -0400
X-MC-Unique: wNPb82dOPs2zHav2x7wfUg-1
Received: by mail-ed1-f70.google.com with SMTP id f9so1731595edd.13
        for <linux-mips@vger.kernel.org>; Wed, 31 Mar 2021 13:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NNGnbExYiLuLZaTb/olJYdDzkOfEQoR57OqAJHWnBDw=;
        b=rCDYTXHBPgTYhC6JC18NdTWyT5WiLDVkpcKQMfWcm5yME39YoGKJx41SeuL2xQ0j0g
         kgewOkBmBxlSNevdvumBh1cQG0yl17fIZ6j8NdSbrJHoQ6OFnm+RbJSdKf2rHw69Miq4
         jU/l22MvEjqoTAUIhF8bnVYsvAe4F9NHp0IU9af+oDQAPBaLMyfVOe0TiE7t20Sbp7qU
         WXfzR38LwQi3fBA296nEaaC2dVT0dN9/lX47FAf4Gbo+1louMi6sa1/cGMCvGf7+Heb2
         IzbMip01BgKLnRubExri/HVqHav8synJL3X3bvN7sBeNVu8FDrN58tXttbIMSFcjWfl2
         Bz5Q==
X-Gm-Message-State: AOAM530SJ1cETHIrwHHTZaGh5H8Nac0b59DjgELSrrzwr4EYmL+IQK8g
        RHEsDNs1SXyEuq/PIqJk+IiVB7mcqrZlzjp5p1TYqtygxaZxBwAe7Sn4PiYUhQse4tAgP3uaYIc
        MXFgFf9bIpnHsX5mDqd9F1Q==
X-Received: by 2002:a17:906:b2cd:: with SMTP id cf13mr5620146ejb.181.1617223352347;
        Wed, 31 Mar 2021 13:42:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqxL3J7jbjShgrs5EgrNAd2B78hY43Jwyx1rE3bLvbATiArdEjVf/0Kcaqy2JK8oqTSMxLyw==
X-Received: by 2002:a17:906:b2cd:: with SMTP id cf13mr5620121ejb.181.1617223352197;
        Wed, 31 Mar 2021 13:42:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id ak20sm1761857ejc.72.2021.03.31.13.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 13:42:31 -0700 (PDT)
To:     Sean Christopherson <seanjc@google.com>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        James Morse <james.morse@arm.com>,
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
 <20210326021957.1424875-17-seanjc@google.com>
 <6e7dc7d0-f5dc-85d9-1c50-d23b761b5ff3@redhat.com>
 <YGSmMeSOPcjxRwf6@google.com>
 <56ea69fe-87b0-154b-e286-efce9233864e@redhat.com>
 <YGTRzf/4i9Y8XR2c@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 16/18] KVM: Don't take mmu_lock for range invalidation
 unless necessary
Message-ID: <0e30625f-934d-9084-e293-cb3bcbc9e4b8@redhat.com>
Date:   Wed, 31 Mar 2021 22:42:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YGTRzf/4i9Y8XR2c@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 31/03/21 21:47, Sean Christopherson wrote:
> Rereading things, a small chunk of the rwsem nastiness can go away.  I don't see
> any reason to use rw_semaphore instead of rwlock_t.

Wouldn't it be incorrect to lock a mutex (e.g. inside *another* MMU 
notifier's invalidate callback) while holding an rwlock_t?  That makes 
sense because anybody that's busy waiting in write_lock potentially 
cannot be preempted until the other task gets the mutex.  This is a 
potential deadlock.

I also thought of busy waiting on down_read_trylock if the MMU notifier 
cannot block, but that would also be invalid for the opposite reason 
(the down_write task might be asleep, waiting for other readers to 
release the task, and the down_read_trylock busy loop might not let that 
task run).

> And that's _already_ the worst case since notifications are currently
> serialized by mmu_lock.

But right now notifications are not a single critical section, they're 
two, aren't they?

Paolo


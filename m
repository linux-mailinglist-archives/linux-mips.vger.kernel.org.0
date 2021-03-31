Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE4E3504BE
	for <lists+linux-mips@lfdr.de>; Wed, 31 Mar 2021 18:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbhCaQhK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Mar 2021 12:37:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46007 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233867AbhCaQgv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 31 Mar 2021 12:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617208609;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QVCeiltaTGJXJYSW6dhbkobIMYPQfKpSFl3XbU9a+wA=;
        b=Z1Foasehn2XmvJG751Vlb333YRRv2hQxD96MGHmWTyGD0khQBB4hFtKKd7u8BvMNlY28HQ
        6Dah9a+l/mVY69//hjUn179zF4HzhcRzzGXLQN5s42ATAhojMOZ9UO1QBsv/+eFG34oeQ6
        +T1tKhEUDIFdZ9cW4OpQAUqSsKm3dGc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-I_wZe-6PO0miy3fbaQzZkA-1; Wed, 31 Mar 2021 12:36:48 -0400
X-MC-Unique: I_wZe-6PO0miy3fbaQzZkA-1
Received: by mail-ed1-f71.google.com with SMTP id y10so1402419edr.20
        for <linux-mips@vger.kernel.org>; Wed, 31 Mar 2021 09:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QVCeiltaTGJXJYSW6dhbkobIMYPQfKpSFl3XbU9a+wA=;
        b=DQmr7ZosV2obtZ5r7VWm8vG+O160XDTGpvh+neAz1MR3WYb2s/pOs42AukUqxGIFk8
         KuGRvmWNYesZMD0TPdv+qnPYcsyariuitAnz8f2acv0WAZQmUfE9/uQ8QYRAI4nx4F4+
         gC9wP1KTI7Y2gPDKGzGIXO6Y9kyIrg/K6nCwwLVlc6qC6G6oa3Pa2ntHZUk9+uW0UAuL
         epTEMkWa4L7rHrCTBERipPB+jwH3fJDIz/igV5T7VDVFmHyh77L4xmp9VHIfRi+RIpsw
         +OKNtbhBQd+g5QtcRv3+9sJplbYsqResB6FfowFtn408PTuW2ajgFnSd0zdHQComP9qu
         cZ8A==
X-Gm-Message-State: AOAM531L+VgHG531pELgLYO4ZECmjTvUWiNenPso9kBmiuYoxNPCbjmN
        YY96LvjZKsuVpBEpoQd7HJXg+92Xyoh/IspMGxPCGF37pAGW6R/w47LgqKjzrloFrebAGLVfXW5
        cS4BQAOCt0dBKX0521I6SBw==
X-Received: by 2002:a17:906:2786:: with SMTP id j6mr4459312ejc.157.1617208606670;
        Wed, 31 Mar 2021 09:36:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH0TubmRiztxbbKWWpE6U/9a4Jmz4SSbDeZziJUjL7bKl7L31NfjvonwQzH04qoJmbwktymw==
X-Received: by 2002:a17:906:2786:: with SMTP id j6mr4459281ejc.157.1617208606447;
        Wed, 31 Mar 2021 09:36:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id hb19sm1500893ejb.11.2021.03.31.09.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 09:36:45 -0700 (PDT)
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
 <20210326021957.1424875-11-seanjc@google.com>
 <ba3f7a9c-0b59-cbeb-5d46-4236cde2c51f@redhat.com>
 <YGShRP9E49p3vcos@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 10/18] KVM: Move x86's MMU notifier memslot walkers to
 generic code
Message-ID: <d843bbd5-d3f0-3cda-aaa5-8e0fb1d69554@redhat.com>
Date:   Wed, 31 Mar 2021 18:36:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YGShRP9E49p3vcos@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 31/03/21 18:20, Sean Christopherson wrote:
> Every call
> to .change_pte() is bookended by .invalidate_range_{start,end}(), i.e. the above
> missing kvm->mmu_notifier_seq++ is benign because kvm->mmu_notifier_count is
> guaranteed to be non-zero.

In fact ARM even relies on invalidate wrapping the change_pte handler.

         /*
          * The MMU notifiers will have unmapped a huge PMD before calling
          * ->change_pte() (which in turn calls kvm_set_spte_hva()) and
          * therefore we never need to clear out a huge PMD through this
          * calling path and a memcache is not required.
          */

> Assuming all of the above is correct, I'm very tempted to rip out .change_pte()
> entirely.

There is still the performance benefit from immediately remapping the 
page to the new destination without waiting for a fault.  Yes it's 
hypothetical but I would prefer to leave that change for later.

The fact that the count is nonzero means that you will not even have to 
complicate kvm_mmu_notifier_change_pte to handle the removal of 
mmu_notifier_seq; just add a patch before this one to WARN if it is 
zero.  (The rest of my review to patch 16 still holds).

Paolo

> It's been dead weight for 8+ years and no one has complained about
> KSM+KVM performance (I'd also be curious to know how much performance was gained
> by shaving VM-Exits).  As KVM is the only user of .change_pte(), dropping it in
> KVM would mean the entire MMU notifier could also go away.
> 


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 288673508AD
	for <lists+linux-mips@lfdr.de>; Wed, 31 Mar 2021 23:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbhCaVAn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Mar 2021 17:00:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47178 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230071AbhCaVA0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 31 Mar 2021 17:00:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617224425;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2LQqUVLUZYdl8RcTGPBOfvhnoH130Hf3/RpFvvu9duY=;
        b=aJI/mCTuFXTQ4R9K5aOqHXaoS/Fe6UoCuahgFNQqaRcBfBxKJ7tyMzwMskLYepoBe7/+lh
        Q5sJ07jUVrD4x2orXZfe0Ten862GK9ZY1m6FjtgWBvJcb2kDdGsGxBPRDPhACZIPU9AceK
        3QZCHhhVnLsfXYTvYpK2Gb8/AtpvhjI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-ecRSattiO52JQ22gFBIyjw-1; Wed, 31 Mar 2021 17:00:22 -0400
X-MC-Unique: ecRSattiO52JQ22gFBIyjw-1
Received: by mail-ej1-f72.google.com with SMTP id gn30so1360503ejc.3
        for <linux-mips@vger.kernel.org>; Wed, 31 Mar 2021 14:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2LQqUVLUZYdl8RcTGPBOfvhnoH130Hf3/RpFvvu9duY=;
        b=ObHErVrws1Edp3lEpstKShbcofSb/+9Of61nX9Wx2zF1iMnN7UftrZ8G0h1yVv6AdV
         XWR9Tdmb47jpsF674nMc+xdCNEK0pWy3qC8lH+xmak+irOXyKUBavJHUipf7WMVzitfG
         s7ij1hCb4iFBckpco7mJEs44IxYO2X4z5SvWp6fv1lzTpnN4PXveClHhp0O1cEKtNYZW
         INXyv/yskgxVTVMW8txrL/MdC8nyYVR01qyvCG4t6n2YST23Gf5juHGrxi+hejrx80OM
         3I4SLm7jAgyryGMGG3ULE8Z9BrshxPmRoqBdSQe3wQo7lmtZeePbO8q9msJG1Hb7FWCL
         G6sg==
X-Gm-Message-State: AOAM532uWePhKExDH5a3cGdRYSBN2HfRq49B8+Md87oyamtjwOK8Up5L
        gBVE4l4kKIeewMGD+4MDf2ysC1QZ9RDYRLjkfjNDqPICJsKgdZWl6VKeMa1TiJXa3HqUomKo1Bq
        lIjLFTdehAFTstU6AGRzwgA==
X-Received: by 2002:aa7:d3ca:: with SMTP id o10mr6104410edr.374.1617224421715;
        Wed, 31 Mar 2021 14:00:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw50R87T4Vu7z/jVciLQACACQ+dsOT5/iwXfrDvSvIyaxglINHwXnv99OCNOBQhJmcFA6BI0w==
X-Received: by 2002:aa7:d3ca:: with SMTP id o10mr6104376edr.374.1617224421543;
        Wed, 31 Mar 2021 14:00:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id x21sm2291820eds.53.2021.03.31.14.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 14:00:20 -0700 (PDT)
Subject: Re: [PATCH 16/18] KVM: Don't take mmu_lock for range invalidation
 unless necessary
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
 <YGTg/AWdieMM/mS7@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <60357fd0-d412-fe47-8023-8107a60ade7e@redhat.com>
Date:   Wed, 31 Mar 2021 23:00:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YGTg/AWdieMM/mS7@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 31/03/21 22:52, Sean Christopherson wrote:
> 100% agree with introducing on_lock separately from the conditional locking.
> 
> Not so sure about introducing conditional locking and then converting non-x86
> archs.  I'd prefer to keep the conditional locking after arch conversion.
> If something does go awry, it would be nice to be able to preciesly bisect to
> the conditional locking.  Ditto if it needs to be reverted because it breaks an
> arch.

Ok, that sounds good too.

Paolo


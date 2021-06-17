Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 717173AB2EA
	for <lists+linux-mips@lfdr.de>; Thu, 17 Jun 2021 13:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232477AbhFQLs2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Jun 2021 07:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33917 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232172AbhFQLs1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Jun 2021 07:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623930378;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ujv31ni+pedAzRqkqN94IhUeHH6igQoDkhQGmN9rbYg=;
        b=hpGILq3r6bD1G/hGAnxtpVY85/dETDg9oac92N2dAmxGLvT8lPxz+2RFP8hD+HOrKk0Fwq
        Ry+nDIXKwbmI236Uyq61v4oGF2qyL55bcviw953NKjjgx0bt1cb+j7Kq7dHrhKoZYbcfYO
        G3+W+u7M7OVVaXehD2KY1i5lRu4ZY20=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-ZcbWDGCONiSblOY-xYmOvA-1; Thu, 17 Jun 2021 07:46:15 -0400
X-MC-Unique: ZcbWDGCONiSblOY-xYmOvA-1
Received: by mail-ed1-f70.google.com with SMTP id z16-20020aa7d4100000b029038feb83da57so1359509edq.4
        for <linux-mips@vger.kernel.org>; Thu, 17 Jun 2021 04:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ujv31ni+pedAzRqkqN94IhUeHH6igQoDkhQGmN9rbYg=;
        b=a+tF9P1b/ttAasfP9T5zO6AezgWpXPRUPvoBfU4kQM0C9uocsAkuGiWh+mzhAWCeDv
         Cp/p2btVgVxoAqsq7qF6l5yxXCnARYUifcv3v9mpvtWrlwtJddkyZsZlllKEZvlqFbXy
         3qE/Cd1bdEVGcPak78D8DMGHt+CVMPzslyxraKCzFkrE0EkR7DmKCkFT5fWnQxU8hHDw
         r0nkUzvsyJzhrOjllzt3UiV01/jnTMPk5fRubajfB9MiDYepZqGf5bYc8DbNoOWfG9bJ
         mriMR5aXEAP9oXy7/aZ/ctQvbZHqQEeIHGhf7y+QgZ6E0kEbAHC0Fr+kL8lXRYCwjKvb
         Am+A==
X-Gm-Message-State: AOAM5332GFfOb8r4ixebpcwaLQnNT1ySRc3acOGLX1s2PKpIrLvqL4rd
        y2InnclvuJM2Tbr/pjXtR/EItiQHS1T/HmnVbzBB76ReaKpf/Jsj5qR28e6k3omGhRfYYfD74Kt
        CmrKgw4yz3sTgS4NFLKfeYw==
X-Received: by 2002:aa7:cf0d:: with SMTP id a13mr5826467edy.384.1623930370629;
        Thu, 17 Jun 2021 04:46:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGp0u6bbKTpBWAweRlzIakuy+NTS2L7DG9uaEaAYNed1OyNxc+QE79jbRlb3hr0uHlxKTUpw==
X-Received: by 2002:aa7:cf0d:: with SMTP id a13mr5826434edy.384.1623930370434;
        Thu, 17 Jun 2021 04:46:10 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id t14sm1472804edr.36.2021.06.17.04.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 04:46:09 -0700 (PDT)
Subject: Re: [PATCH v10 3/5] KVM: stats: Add documentation for binary
 statistics interface
To:     Greg KH <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Jing Zhang <jingzhangos@google.com>, KVM <kvm@vger.kernel.org>,
        KVMARM <kvmarm@lists.cs.columbia.edu>,
        LinuxMIPS <linux-mips@vger.kernel.org>,
        KVMPPC <kvm-ppc@vger.kernel.org>,
        LinuxS390 <linux-s390@vger.kernel.org>,
        Linuxkselftest <linux-kselftest@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Peter Shier <pshier@google.com>,
        Oliver Upton <oupton@google.com>,
        David Rientjes <rientjes@google.com>,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        David Matlack <dmatlack@google.com>,
        Ricardo Koller <ricarkol@google.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>,
        Fuad Tabba <tabba@google.com>
References: <20210617044146.2667540-1-jingzhangos@google.com>
 <20210617044146.2667540-4-jingzhangos@google.com>
 <YMrkGZzPrt0jA1iP@kroah.com>
 <0d959828-da89-bceb-f7cc-35622a60c431@redhat.com>
 <YMs1Pwf+nSQsfVUW@kroah.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <348aa108-076b-04dd-9fd2-e840a7a85f5d@redhat.com>
Date:   Thu, 17 Jun 2021 13:46:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMs1Pwf+nSQsfVUW@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 17/06/21 13:42, Greg KH wrote:
> On Thu, Jun 17, 2021 at 01:29:22PM +0200, Paolo Bonzini wrote:
>> On 17/06/21 07:56, Greg KH wrote:
>>> On Thu, Jun 17, 2021 at 04:41:44AM +0000, Jing Zhang wrote:
>>>> +string starts at the end of ``struct kvm_stats_desc``.
>>>> +The maximum length (including trailing '\0') is indicated by ``name_size``
>>>> +in ``struct kvm_stats_header``.
>>>
>>> I thought we were replacing [0] arrays with [], are you sure you should
>>> be declaring this as [0]?  Same for all structures in this document (and
>>> code).
>>
>> In C code [0] is a bit more flexible than [].  I think in this particular
>> case [] won't work due to how the structures are declared. In the
>> documentation [] is certainly clearer.
> 
> Look at all of the patches that Gustavo has been doing all over the tree
> for this work, you do not want to make him do this again here.
> 
> Gustavo, is [0] ok for fields like these?

I should be able to get back to KVM stuff later today, I'll check myself 
if [] can be applied and reply.  I had queued an early version of these 
for my local build to play with them but I haven't been able to do a 
complete review.

Paolo


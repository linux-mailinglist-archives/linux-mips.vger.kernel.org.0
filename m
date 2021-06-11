Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60F43A41D0
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jun 2021 14:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhFKMQP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Jun 2021 08:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26090 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231400AbhFKMQN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 11 Jun 2021 08:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623413655;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tshLc4zdYGgPabfNvrWwtgUPpGh1iSBRoaKHJCb/8hw=;
        b=PMI2b6zBnWHuxdj543hlg7h0EXf0fTk0tnlT6pTbIzGd0QQG09ZoMII4o0VpoVLgUFTViD
        3MojeNqYmPqNFj8TGJvxxazwWXBzZ86l5Cwf2Q7x/2SB39QRhjJm/FleCl2NuEixi9+3NK
        sBFcpACCHILfCb2QetHonb5Dg5bJjAg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-sgpx7F6IPgG_QTEgvDgulg-1; Fri, 11 Jun 2021 08:14:14 -0400
X-MC-Unique: sgpx7F6IPgG_QTEgvDgulg-1
Received: by mail-wr1-f70.google.com with SMTP id k11-20020adfe3cb0000b0290115c29d165cso2535826wrm.14
        for <linux-mips@vger.kernel.org>; Fri, 11 Jun 2021 05:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tshLc4zdYGgPabfNvrWwtgUPpGh1iSBRoaKHJCb/8hw=;
        b=fMTBJDvLbuosTKxqRx+2RUWV5v6AVmiXH3CvTikSc8SNffjo0Y8mDhK83+6mI9sAP1
         WuXAXFY0oz8HceFr9Mw3PYKeLhGPJzVz7qmM4iYINew7SnUYtzg2+CcsPTBCpK10ervh
         9ejYY6qbrIEXOTvswp8D9tJ2KW8TCCFwdYGp0TIeOL5uYgG+aWwKktge49y/L+sXcIeR
         q2ruCxDGYgHD4CDv7ZGrdz+7kIbgfELwqU0JcGwBR5S6337G0ItGonMEdmSjIbFkQDcC
         +nljZff2YPFZqibifPuKodYy2NvPA+nJn8gRyFlVkDCL18rAYAsxWZuChDOw+GQkgXZ8
         swsg==
X-Gm-Message-State: AOAM532M/KhEUZrSUre5D8RSipgI9zEKKTs3K4pLB+EXsDbono+hOiii
        qKlk7ye/isuh8bOJaD0sCZDLjWIbQBSBShD633yCUjE8XTPFiUKO7cKRwPuS3WKiNzEhRuJkdqm
        TjxHoD1d8GqkxEPlPBbDFMw==
X-Received: by 2002:a05:600c:3650:: with SMTP id y16mr3677468wmq.92.1623413652698;
        Fri, 11 Jun 2021 05:14:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzekCA0/z805DZlMHydl4+u+pU/IhlWHIqCvhI6IwFtHm385E+SV0tWtc3pGZK67eFkb8/Udw==
X-Received: by 2002:a05:600c:3650:: with SMTP id y16mr3677424wmq.92.1623413652485;
        Fri, 11 Jun 2021 05:14:12 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id r18sm6837910wro.62.2021.06.11.05.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jun 2021 05:14:11 -0700 (PDT)
Subject: Re: [PATCH v7 1/4] KVM: stats: Separate generic stats from
 architecture specific ones
To:     Christian Borntraeger <borntraeger@de.ibm.com>,
        Jing Zhang <jingzhangos@google.com>, KVM <kvm@vger.kernel.org>,
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
        Krish Sadhukhan <krish.sadhukhan@oracle.com>
References: <20210603211426.790093-1-jingzhangos@google.com>
 <20210603211426.790093-2-jingzhangos@google.com>
 <03f3fa03-6f61-7864-4867-3dc332a9d6f3@de.ibm.com>
 <bdd315f7-0615-af69-90c3-1e5646f3e259@redhat.com>
 <c0173386-0c37-73c0-736a-e904636b6c94@de.ibm.com>
 <c5199e63-762d-a731-7ef2-c2af3a8cb0c3@redhat.com>
 <050e9d8e-278d-278c-13f7-ea0b39d13fbe@de.ibm.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8dd7259c-d0f6-6816-178f-ab0f0b486955@redhat.com>
Date:   Fri, 11 Jun 2021 14:14:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <050e9d8e-278d-278c-13f7-ea0b39d13fbe@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/06/21 14:08, Christian Borntraeger wrote:
>>
>> I always interpreted it as "number of times the KVM page table 
>> management code needed other CPUs to learn about new page tables". 
>> Whether the broadcast is done in software or hardware shouldn't 
>> matter; either way I suppose there is still some traffic on the bus 
>> involved.
> 
> 
> My point is that KVM page table management on s390x completely 
> piggy-backs on the qemu address space page table management from common 
> code for the last level.
> And due to the way we handle page tables we also do not teach "other 
> CPUs". We always teach the whole system with things like IPTE.

But that just means that you'll have fewer KVM-exclusive and thus nicer 
numbers than x86 or ARM. :)  It still makes sense to count 
gmap_flush_tlb calls.

Paolo


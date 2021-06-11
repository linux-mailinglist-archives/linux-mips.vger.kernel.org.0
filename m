Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A8A3A40C4
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jun 2021 13:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhFKLEc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Jun 2021 07:04:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37677 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231512AbhFKLEb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 11 Jun 2021 07:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623409353;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+RrRblTQxTiQW11uEZwz6k6Rn04ho0Rc+4Nvx3QLrzo=;
        b=YOFA/w/5O72zRCZi6RzFFbA3EWX4oOchLsagub6WY5zV3sNlo+Rj3PeYBnWMvgA+2mbsQI
        moTIOSzDYR9UJdpcKa/3s772OqQ+LPqEh+R5c+qRE1lTvsapsVDVsQOZ5wV6DpiqAiag3B
        5PrxIaB8OCHBobd3XKz4hn+nqQBvlLA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81--gvBfYp2MFSRFai6H5UQ8g-1; Fri, 11 Jun 2021 07:02:31 -0400
X-MC-Unique: -gvBfYp2MFSRFai6H5UQ8g-1
Received: by mail-wr1-f70.google.com with SMTP id h104-20020adf90710000b029010de8455a3aso2458834wrh.12
        for <linux-mips@vger.kernel.org>; Fri, 11 Jun 2021 04:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+RrRblTQxTiQW11uEZwz6k6Rn04ho0Rc+4Nvx3QLrzo=;
        b=SfJ/ds1wSHtysawXFlspVqNs8lBFjv5LZRpql2PGKn9Nq1kWifo2v39wprWUzy7HQa
         MPeNC2nBgnQgmnnCde5fntCTGfmRcBiW9gHJxchyux6CQalMJ39EPTXg3oY5ROaVJ4B5
         4LeddQWZit3iT0gmKq4/W/7cg+ewh8/IP66zsstP/LMN1m6nGPFXtFU7MJB12N9iGGJ+
         lo2FXZTg981IkoTlJJFLowjTfjgsEQ8kAlop9xiZf3uX45GjjW1OsGHRwg/qgLQLXlJ5
         Km4xiPjgaL7L97lp6WLDo1hUH2refwECmNVVvDsKxL7ZlNYgoEZzv3WDElGgKDBDJa6i
         SIPA==
X-Gm-Message-State: AOAM531Vml9okdHmtq8G7lP+fgc5CqnQyPOp/ZreXfzi7ZfJ3kJf494W
        nMheA4JYEXmJ4ma4qex9UHcRs4p05eR1BXuu0ICAx5gN839QW40l45djY6DdpsImZTH+R3KUhNg
        1QljLGrcVR2JMsr2d90Imlg==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr3381389wrr.35.1623409350639;
        Fri, 11 Jun 2021 04:02:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSsd36dFENgYkdGQ54PSpUsoW2KwSiq8W+9CJYc+K0FgC3tbwdQbKFEEq0OpZ/4SfqgN/ULg==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr3381331wrr.35.1623409350364;
        Fri, 11 Jun 2021 04:02:30 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id m6sm7999909wrw.9.2021.06.11.04.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jun 2021 04:02:29 -0700 (PDT)
Subject: Re: [PATCH v7 0/4] KVM statistics data fd-based binary interface
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
 <4b44c5a7-21c0-73c0-bb03-21806c83b4ae@de.ibm.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <db9722a0-8cfb-1bb4-a158-18efc29a1630@redhat.com>
Date:   Fri, 11 Jun 2021 13:02:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <4b44c5a7-21c0-73c0-bb03-21806c83b4ae@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/06/21 08:57, Christian Borntraeger wrote:
> 
> On 03.06.21 23:14, Jing Zhang wrote:
>> This patchset provides a file descriptor for every VM and VCPU to read
>> KVM statistics data in binary format.
>> It is meant to provide a lightweight, flexible, scalable and efficient
>> lock-free solution for user space telemetry applications to pull the
>> statistics data periodically for large scale systems. The pulling
>> frequency could be as high as a few times per second.
>> In this patchset, every statistics data are treated to have some
>> attributes as below:
>>    * architecture dependent or generic
>>    * VM statistics data or VCPU statistics data
> 
> Are the debugfs things good enough, or do we want to also add the same
> ioctl for the /dev/kvm to get the global counters as well, e.g. for
> tools like kvm_stat?

I think we should, yes.  We should also add the summarized VCPU 
statistics to the VM-level file descriptor.  However, it can be done in 
steps.

Paolo


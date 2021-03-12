Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF523395E6
	for <lists+linux-mips@lfdr.de>; Fri, 12 Mar 2021 19:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbhCLSLY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Mar 2021 13:11:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32483 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231789AbhCLSLR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Mar 2021 13:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615572676;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SQXRSD89A8xhrCuxpBydg6Y3MyKh1PtNusEjHfIcj18=;
        b=KZ8yOtidfGUcx654m9Pe4lxyuho4yK6NSU0ZJbKsZ832NWmTMviBuXC7ZIXX9BDoh98D6i
        1NZIJdP7mBqHMr4r+s4HUF6jJzTXwm6UOuCSZofo0inrTUZk8UyAR2zzPgKPyfIyq44ZJv
        30HjzYMhdZbmDkjzkQaT/7RRnmXpXuM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-ViAxs8SBOG2Hi9IHrw3dMg-1; Fri, 12 Mar 2021 13:11:15 -0500
X-MC-Unique: ViAxs8SBOG2Hi9IHrw3dMg-1
Received: by mail-wm1-f72.google.com with SMTP id r18so5649018wmq.5
        for <linux-mips@vger.kernel.org>; Fri, 12 Mar 2021 10:11:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SQXRSD89A8xhrCuxpBydg6Y3MyKh1PtNusEjHfIcj18=;
        b=l9+EmbYXdduKdj9FG+kQZcYvmcqnj0vpYHa1Hwy3qnI5ZMzJn9rZGJ+lSNe5ag27o+
         06j5B9tGdc434+dXSUmHFNpV9dLfb96Qxk/qLnStcZPnmHtUbcFpNJ6MVhvxufJUFPKB
         wBlJAjsxR69RZUf/mPv4ipxdYrA7zXaYwI1tpGvKBDNQFAeKudBdDTBcwNVEz3XiFECk
         S3UfM5zA+7SXfKKY7OOVWYMDqJQBCxkulCyW98q5U/+kmGLIjkM0r1oRUB5YvWjmuS4C
         CRUbFrHOT7asAG519D1vibrSDqyJDCbAdybLWr/XdeRwxIXsq07DvRFVaXGBholv0bkv
         kjiw==
X-Gm-Message-State: AOAM5332lOsLyymO4amfIpCvdS/q1W9xsqFdY+48xa1Bxud8l1PzukGc
        9gP5whYJvi+HGGdJ+/Q7XA/TcCeWmFL5akmvFj8KxOe3kfImVf7aeW8Y8BRqNPyrQ/MI0oKyEYN
        FrOPHuhKBobrloRjyh/tNwQ==
X-Received: by 2002:a1c:498b:: with SMTP id w133mr14755140wma.134.1615572673386;
        Fri, 12 Mar 2021 10:11:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2aInA1bidlltyWIjYrqBjK+SGizjJOOZcscWT2RiFNd2X/0uEYFLiJqfA7xaEL8hELymOZw==
X-Received: by 2002:a1c:498b:: with SMTP id w133mr14755105wma.134.1615572673180;
        Fri, 12 Mar 2021 10:11:13 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id y8sm2934326wmi.46.2021.03.12.10.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 10:11:12 -0800 (PST)
To:     Jing Zhang <jingzhangos@google.com>
Cc:     KVM <kvm@vger.kernel.org>, KVM ARM <kvmarm@lists.cs.columbia.edu>,
        Linux MIPS <linux-mips@vger.kernel.org>,
        KVM PPC <kvm-ppc@vger.kernel.org>,
        Linux S390 <linux-s390@vger.kernel.org>,
        Linux kselftest <linux-kselftest@vger.kernel.org>,
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
        Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20210310003024.2026253-1-jingzhangos@google.com>
 <20210310003024.2026253-4-jingzhangos@google.com>
 <bb03107c-a413-50da-e228-d338dd471fb3@redhat.com>
 <CAAdAUtjj52+cAhD4KUzAaqrMSJXHD0g=ecQNG-a92Mqn3BCxiQ@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 3/4] KVM: stats: Add ioctl commands to pull statistics
 in binary format
Message-ID: <ac7462de-1531-5428-5dca-4e3dfb897000@redhat.com>
Date:   Fri, 12 Mar 2021 19:11:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAAdAUtjj52+cAhD4KUzAaqrMSJXHD0g=ecQNG-a92Mqn3BCxiQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/03/21 22:41, Jing Zhang wrote:
>> I would prefer a completely different interface, where you have a file
>> descriptor that can be created and associated to a vCPU or VM (or even
>> to /dev/kvm).  Having a file descriptor is important because the fd can
>> be passed to a less-privileged process that takes care of gathering the
>> metrics
> Separate file descriptor solution is very tempting. We are still considering it
> seriously. Our biggest concern is that the metrics gathering/handling process
> is not necessary running on the same node as the one file descriptor belongs to.
> It scales better to pass metrics data directly than to pass file descriptors.

If you want to pass metrics data directly, you can just read the file 
descriptor from your VMM, just like you're using the ioctls now. 
However the file descriptor also allows a privilege-separated same-host 
interface.

>> 4 bytes flags (always zero)
>> 4 bytes number of statistics
>> 4 bytes offset of the first stat description
>> 4 bytes offset of the first stat value
>> stat descriptions:
>>    - 4 bytes for the type (for now always zero: uint64_t)
>>    - 4 bytes for the flags (for now always zero)
>>    - length of name
>>    - name
>> statistics in 64-bit format
> 
> The binary format presented above is very flexible. I understand why it is
> organized this way.
> In our situation, the metrics data could be pulled periodically as short as
> half second. They are used by different kinds of monitors/triggers/alerts.
> To enhance efficiency and reduce traffic caused by metrics passing, we
> treat all metrics info/data as two kinds. One is immutable information,
> which doesn't change in a given system boot. The other is mutable
> data (statistics data), which is pulled/transferred periodically at a high
> frequency.

The format allows to place the values before the descriptions.  So you 
could use pread to only read the first part of the file descriptor, and 
the file_operations implementation would then skip the work of building 
the immutable data.  It doesn't have to be implemented from the
beginning like that, but the above format supports it.

Paolo


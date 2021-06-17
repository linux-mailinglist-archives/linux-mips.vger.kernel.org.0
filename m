Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDDA3AB271
	for <lists+linux-mips@lfdr.de>; Thu, 17 Jun 2021 13:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbhFQLZy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Jun 2021 07:25:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41618 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232545AbhFQLZy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Jun 2021 07:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623929026;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QeoOEjtdTbZHikE6qVHZkIHtsqJ8oL1MWdn59al3yJU=;
        b=eu+rQMY7SDZ5k7TEYB+ZEXfNH1gWf0IdKrXFZsjVQgz8DDEWWBeTspIAcrQ6mF1gNtjEZ1
        ZPx3ksYIZ8xjoyqQmzFM2nVMAj0PxaVi7bhbxWoAuu97h2aMkrQM7JZjulBLPg5wrThNAc
        cAAcOsmSUtwv1ut14RD5eSFVxukqyVM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604--wXxCOORMM2_6gFRxNOD0A-1; Thu, 17 Jun 2021 07:23:45 -0400
X-MC-Unique: -wXxCOORMM2_6gFRxNOD0A-1
Received: by mail-ej1-f71.google.com with SMTP id jy19-20020a1709077633b02903eb7acdb38cso2024808ejc.14
        for <linux-mips@vger.kernel.org>; Thu, 17 Jun 2021 04:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QeoOEjtdTbZHikE6qVHZkIHtsqJ8oL1MWdn59al3yJU=;
        b=iDuuAKIgQTt/yuyztUs612cQ9kyGj1OytJTZxNC7pmJdqHD8OvpBmsBW6rI8Npd68C
         egi0N3e2NK67jNBHKU8GFB49qFp5L6gIZsMuORaUxTfvE+d2s1RgaW8WHSWnSeTsPJKS
         ijUaOEGLP9YlrIAu2ZzR7JUuSoqB1pzHrqQGn9xiyJNB53hCVLVmsLH1L3Lm5k7Dtv62
         SLqyYq7IBE5FsqHN1VyvLyE0U/PGUTy5Q6E4GkcRUCpi/A2g3CQl4awy1AQaiDpDjQZb
         1Zwc9Amqq5V9mBtEvwMqbGKKYOOaft/RlfkSGmPqdRjOTzIdH69KawmTnSiPJG7RVrtG
         xOgw==
X-Gm-Message-State: AOAM531GGC1SC7IkCpVfwKob199rc94tq27oY1qZIVBvJVHzoMHO8q6V
        pkrkH1k/Cf9DsNxFHyF/OLt4RsaQ/q1p6+TwD68s8FMLD9HaWhPC3i/j9JW8VQO8uYjCEPR0BKF
        xAFHcRlsZE9Ki2FKZTYEZUA==
X-Received: by 2002:a05:6402:268f:: with SMTP id w15mr5799044edd.228.1623928793192;
        Thu, 17 Jun 2021 04:19:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc8lc8kbfFsQbKsVnuEADgPqEmYVAvmC/1IvjtxjrXOO4gKYpFUgt0NPkDolV15GoZuo9rTg==
X-Received: by 2002:a05:6402:268f:: with SMTP id w15mr5799027edd.228.1623928793011;
        Thu, 17 Jun 2021 04:19:53 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id e18sm3537900ejh.64.2021.06.17.04.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 04:19:52 -0700 (PDT)
Subject: Re: [PATCH v10 3/5] KVM: stats: Add documentation for binary
 statistics interface
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jing Zhang <jingzhangos@google.com>
Cc:     KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.cs.columbia.edu>,
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
 <YMrmqOxDWJ2/8sfD@kroah.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <be506135-5bc3-31bd-1b20-063f01f41df1@redhat.com>
Date:   Thu, 17 Jun 2021 13:19:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMrmqOxDWJ2/8sfD@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 17/06/21 08:07, Greg KH wrote:
>> The statistics data itself could be read out by userspace telemetry
>> periodically without any extra parsing or setup effort.
> Do you have a pointer to userspace code that can do such a thing that
> others can use?  We do not like adding apis to the kernel without at
> least seeing the user of those apis, especially for complex things like
> this.
> 
> Ideally you would include some library code in the kernel tree itself
> that everyone can use for this for their own programs.  You have
> provided a test which is great, but how do we know it works for "real"
> usages?

I am pretty sure that Google is using this internally, but we are also 
going to work on QEMU and Libvirt support for this.

As for the rest, thanks for the review---I'll let Jing act on it and 
only add my own remarks in a couple places.

Paolo


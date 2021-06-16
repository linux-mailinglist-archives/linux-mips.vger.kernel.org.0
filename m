Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9403AA487
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jun 2021 21:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232944AbhFPTrQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Jun 2021 15:47:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46291 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231941AbhFPTrP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 16 Jun 2021 15:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623872709;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+QNVwJfqsz7DuF9a+ahjJykVrEv0cF3FdHRVfv7uhlg=;
        b=ZTpgshbjpdwHd+PY5yNh43xp9To38BAvaEeuvuNk9pxHBPxPIvT+1l5JGf7BTyY6QqRIlN
        6/MCdXHKTpK2STxe2veGauiiUNmAGPW/jwROR9jgVilEtNfuJwD8PNEPjLuBKZ/AJBNB75
        Lf35pNeeB0EvJncCk/ribjkI+9t4VtM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-eVfr6ecbPBG0DOswGMNvAQ-1; Wed, 16 Jun 2021 15:45:06 -0400
X-MC-Unique: eVfr6ecbPBG0DOswGMNvAQ-1
Received: by mail-ej1-f70.google.com with SMTP id u4-20020a1709061244b02904648b302151so1363495eja.17
        for <linux-mips@vger.kernel.org>; Wed, 16 Jun 2021 12:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+QNVwJfqsz7DuF9a+ahjJykVrEv0cF3FdHRVfv7uhlg=;
        b=sWCC8bp2cUAbZjNXM6yH4klyfMcMdQMFu+9XnnIgnCz5OCZXWRccoegkg6YKF+jBLI
         C1/sFvlP21i8qO39j8o9UqJUwc8jX58XTlOI73MbHngjtJkCKmLyzIPRiq0CzscauW4h
         9QUnlBQusNCygYMH/bpt1p3qqxfPGLY1y1NBkTbC7kSMtxc6/+MULrVSqXEqpBk2hw5A
         jZCWSZYQIoV1PC24IFTDFBLE+IzSNUoKnNnP23wivEQLmyvCl/v9n+5cUC4KM+EYka8W
         0me+EWyRtltVnUORprFnVacNIhP3bbL78ZA1gnPQ8oBS39hYXK/QpyvBg5wmpAz4bp5J
         FFng==
X-Gm-Message-State: AOAM532iawqqn/rHVz5UrAHITOXhCTHMGy5R4/BuQ5eE5RuLkSMsE+fX
        ecNL8b1L5Hpo2pBrL6w6HHDk5iMsby+Me0/Ii/iqW1hJbWlRt7Mj8+n/a7ynUKiRHL/p3En+nkE
        ommaadNe+2v/0s8gFBoaFyg==
X-Received: by 2002:a17:907:6fd:: with SMTP id yh29mr1241053ejb.432.1623872704841;
        Wed, 16 Jun 2021 12:45:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4XKHV98pEZbROOGkCOI5giEsQGV4xvXa4BnXoBwGpr7AA8qMDKS7AagRuHdxurUSpCqNENg==
X-Received: by 2002:a17:907:6fd:: with SMTP id yh29mr1241026ejb.432.1623872704577;
        Wed, 16 Jun 2021 12:45:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id m22sm233740ejn.50.2021.06.16.12.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 12:45:03 -0700 (PDT)
To:     Greg KH <gregkh@linuxfoundation.org>
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
References: <20210614212155.1670777-1-jingzhangos@google.com>
 <20210614212155.1670777-4-jingzhangos@google.com>
 <YMoW7SBqO9EPgCXw@kroah.com>
 <9b9a951d-d020-5599-5c4f-e154b40522b9@redhat.com>
 <YMpAcaqjk4ZN90gj@kroah.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v9 3/5] KVM: stats: Add documentation for statistics data
 binary interface
Message-ID: <56cbf176-4b89-fe52-1c84-56468b932cc8@redhat.com>
Date:   Wed, 16 Jun 2021 21:45:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMpAcaqjk4ZN90gj@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 16/06/21 20:18, Greg KH wrote:
> On Wed, Jun 16, 2021 at 06:59:15PM +0200, Paolo Bonzini wrote:
>> - varlink structs are encoded as JSON dictionaries.  Therefore, every time
>> userspace reads the fields, the kernel has to include the field names as
>> JSON dictionary keys.  This means that a lot of time is spent writing
>> buffers, and on the receiving side parsing them.
> 
> Has this been measured?  Years ago when I messed with this, it was in
> the noise as JSON parsing is really fast these days.

Yes, parsing is really fast.  However, the work doesn't end at building 
an in-memory representation.  An efficient representation (and a schema 
that is negotiated in advance) makes it possible to do this work as late 
and as little as possible, instead of doing it on every fetch of the 
statistics.

For cloud vendors running virtual machines, they want to consolidate 
housekeeping tasks on as few CPUs as possible (because housekeeping CPUs 
cannot be billed to the customers), and every millisecond really counts.
ASCII is inviting, but things like Protobufs, FlatBuffers, Cap'n'Proto 
are all binary because all those hidden costs do exist.

>> - because numeric data has to be converted to ASCII the output doesn't have
>> fixed offsets, so it is not possible to make an efficient implementation of
>> pread.
> 
> efficient where?  In the kernel?

Yes, Jing's patches can just do a quick copy_to_user if pread does not 
access the schema.  And it's very simple code too.

>> - even though Varlink specifies that int is "usually int64", a little-known
>> gem is that JSON behavior for numbers not representable as a double (i.e.
>> exceeding 2^53) is implementation-defined
> 
> That's interesting, do the varlink developers know this?  And we can say
> "for the kernel int will be int64" and be done with it, so this
> shouldn't be that big of an issue.

Well yeah, but there's still the problem of what the other side thinks. 
  In the end varlink's interesting because it's just JSON, meaning 
there's plenty of parsers available---but they all too often don't 
separate int vs. double.  We had this issue with projects talking to 
QEMU (which has been using JSON the same way as varlink for ten years or 
so) and JSON parsers returning an overflow for 2^64-1 (because it rounds 
to 2^64) or an incorrect value.  I'm not saying it's a showstopper, it's 
just an unavoidable ugliness if you pick JSON.

>> For the schema, there are some specific problems with varlink, but also a
>> more generic issue.  The specific problems are:
>>
>> - the schema doesn't include the length of arrays.  This makes it hard to
>> compute in advance lengths and offsets of fields (even ignoring the fact
>> that data is not binary, which I'll get to later)
> 
> Do you care in advance?

Yes, once we add for example histograms we would like to include in the 
schema the size and number of the buckets.

> Again, I didn't think this was an issue with the kernel implementation
> in that the userspace side could determine the schema by the data coming
> from the kernel, it wouldn't have to "know" about it ahead of time.
> But I could be wrong.

No, you're right.  The C implementations are really just very thin 
wrappers over JSON.  There's very little "Varlink"ness in them.

However the interesting part of the schema are the metadata--the unit, 
whether something is an instant vs. a cumulative value, the bucket size 
when we add histograms.  These things are obviously not included in the 
data and must be communicated separately.  Userspace tools could also 
use a schema to validate user requests ("record the halt_poll_fail_ns 
every second").

>> All that said, what we _could_ do is serialize the schema as JSON
>> instead of using a binary format
> 
> It should be in some standard format. If not, and it sounds like you
> have looked into it, or at least the  userspace side, then that's fine.
> But you should write up a justification somewhere why you didn't use an
> existing format (what about the netlink format?)

I guess you're talking about NETLINK_GENERIC, that also has the issue 
that the schema (the attributes) is not dynamic but rather part of the 
uAPI.  We explicitly don't want them to be stable, they're like 
tracepoints in that respect and that's why we took ideas from trace-cmd. 
  Anyway, as a start Jing will summarize all these discussions in v10.

Thanks,

Paolo


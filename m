Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9229F1D388D
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 19:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgENRnD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 13:43:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22062 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726084AbgENRnC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 May 2020 13:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589478180;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D5sDx7dFYVPQq/9gZnVKC9PwVBjvUUzuU4UJpJeg6i4=;
        b=JQIAFXBFqQ6sPZwbxBiDTC5ChEq/oay+lOglPSx+JW72Re7FNaJIVQ4Ns+7bv9i8LcAdpU
        plyPa2u1WhyWZFr2rBZEnzq8F5MYSfZbGqWi5rORGTsT3QQsymJgCX9Pa9ze122jbQtFNA
        OW5S6+g2OZ9nsF0TJ/h0ss+NygaCLDE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-FT5uQ5vUPQShfeqfPdN2XA-1; Thu, 14 May 2020 13:42:59 -0400
X-MC-Unique: FT5uQ5vUPQShfeqfPdN2XA-1
Received: by mail-wm1-f69.google.com with SMTP id h6so13855269wmi.7
        for <linux-mips@vger.kernel.org>; Thu, 14 May 2020 10:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D5sDx7dFYVPQq/9gZnVKC9PwVBjvUUzuU4UJpJeg6i4=;
        b=h1ZoaIX+mWSETGuk+2sUHYFCTDmfi+Z1LT7Hrrf73c7gc8uaBvuBJF+PzTbM2zEH3t
         tCUEoWUit6l9/0l28uBD7abyev7zZeybdv2xwWQXzHHP8KJejHOUkVybtZYwLHK706IJ
         ahJyWDDl5Mx/lkYxfou9Ql4ID6PJWc9YUg4WWbGUkj4R/XkSqCpwgePTAROpoNEafz3/
         ZaQ4HsQSOLHzpBwnlD6hxw1II7jpYjzyI9RHZU42PaNFwcmdNxOjYrjgsvYtVici4oUU
         M44lAvYKHU77WTNHJKwBGJ6Q0+NXXWzTJheHN9rObM2mXfY9CKfiubjoUYZ+hyMwttdn
         0vMA==
X-Gm-Message-State: AGi0PuYcXGfk23RNQTwYI3IBYDMba5cEZxY0OwWmxRaKy+Gv29kLXYUV
        kyEq5YImlWP/x9Fm+ic8IRMrIvbXNedyBDT5hLKWiTznwOa5ICVMNbaQGp0Jlik0Yw8VsxZH2Xb
        P6ZddnB00ASsGTqfEkyfnSA==
X-Received: by 2002:a1c:3182:: with SMTP id x124mr53013505wmx.54.1589478177799;
        Thu, 14 May 2020 10:42:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypLHsxLGQ9nhYmAh9ZrOpDofZG0BF1DYUCQUcdUAHKdJA5OS/syMmvoJESfLmoWjrDK3d7BTww==
X-Received: by 2002:a1c:3182:: with SMTP id x124mr53013466wmx.54.1589478177392;
        Thu, 14 May 2020 10:42:57 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.85.171])
        by smtp.gmail.com with ESMTPSA id d126sm22211297wmd.32.2020.05.14.10.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 10:42:56 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] Statsfs: a new ram-based file sytem for Linux
 kernel statistics
To:     Jonathan Adams <jwadams@google.com>
Cc:     Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        kvm list <kvm@vger.kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20200504110344.17560-1-eesposit@redhat.com>
 <CA+VK+GN=iDhDV2ZDJbBsxrjZ3Qoyotk_L0DvsbwDVvqrpFZ8fQ@mail.gmail.com>
 <29982969-92f6-b6d0-aeae-22edb401e3ac@redhat.com>
 <CA+VK+GOccmwVov9Fx1eMZkzivBduWRuoyAuCRtjMfM4LemRkgw@mail.gmail.com>
 <fe21094c-bdb0-b802-482e-72bc17e5232a@redhat.com>
 <CA+VK+GOnVK23X+J-VVWUK6VVpkeVOvsmQAw=HAf89h_ksYM9Rg@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ec17c313-d95c-d41f-5852-d7d3637e1ad5@redhat.com>
Date:   Thu, 14 May 2020 19:42:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CA+VK+GOnVK23X+J-VVWUK6VVpkeVOvsmQAw=HAf89h_ksYM9Rg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14/05/20 19:35, Jonathan Adams wrote:
>> In general for statsfs we took a more explicit approach where each
>> addend in a sum is a separate stats_fs_source.  In this version of the
>> patches it's also a directory, but we'll take your feedback and add both
>> the ability to hide directories (first) and to list values (second).
>> 
>> So, in the cases of interfaces and KVM objects I would prefer to keep
>> each addend separate.
>
> This just feels like a lot of churn just to add a statistic or object;
> in your model, every time a KVM or VCPU is created, you create the N
> statistics, leading to N*M total objects.

While it's N*M files, only O(M) statsfs API calls are needed to create
them.  Whether you have O(N*M) total kmalloc-ed objects or O(M) is an
implementation detail.

Having O(N*M) API calls would be a non-started, I agree - especially
once you start thinking of more efficient publishing mechanisms that
unlike files are also O(M).

>> For CPUs that however would be pretty bad.  Many subsystems might
>> accumulate stats percpu for performance reason, which would then be
>> exposed as the sum (usually).  So yeah, native handling of percpu values
>> makes sense.  I think it should fit naturally into the same custom
>> aggregation framework as hash table keys, we'll see if there's any devil
>> in the details.
>>
>> Core kernel stats such as /proc/interrupts or /proc/stat are the
>> exception here, since individual per-CPU values can be vital for
>> debugging.  For those, creating a source per stat, possibly on-the-fly
>> at hotplug/hot-unplug time because NR_CPUS can be huge, would still be
>> my preferred way to do it.
> 
> Our metricfs has basically two modes: report all per-CPU values (for
> the IPI counts etc; you pass a callback which takes a 'int cpu'
> argument) or a callback that sums over CPUs and reports the full
> value.  It also seems hard to have any subsystem with a per-CPU stat
> having to install a hotplug callback to add/remove statistics.

Yes, this is also why I think percpu values should have some kind of
native handling.  Reporting per-CPU values individually is the exception.

> In my model, a "CPU" parameter enum which is automatically kept
> up-to-date is probably sufficient for the "report all per-CPU values".

Yes (or a separate CPU source in my model).

Paolo

> Does this make sense to you?  I realize that this is a significant
> change to the model y'all are starting with; I'm willing to do the
> work to flesh it out.


> Thanks for your time,
> - Jonathan
> 
> P.S.  Here's a summary of the types of statistics we use in metricfs
> in google, to give a little context:
> 
> - integer values (single value per stat, source also a single value);
> a couple of these are boolean values exported as '0' or '1'.
> - per-CPU integer values, reported as a <cpuid, value> table
> - per-CPU integer values, summed and reported as an aggregate
> - single-value values, keys related to objects:
>     - many per-device (disk, network, etc) integer stats
>     - some per-device string data (version strings, UUIDs, and
> occasional statuses.)
> - a few histograms (usually counts by duration ranges)
> - the "function name" to count for the WARN statistic I mentioned.
> - A single statistic with two keys (for livepatch statistics; the
> value is the livepatch status as a string)
> 
> Most of the stats with keys are "complete" (every key has a value),
> but there are several examples of statistics where only some of the
> possible keys have values, or (e.g. for networking statistics) only
> the keys visible to the reading process (e.g. in its namespaces) are
> included.
> 


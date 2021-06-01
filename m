Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D475A396FC3
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 11:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233577AbhFAJEC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 05:04:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44078 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233450AbhFAJEB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Jun 2021 05:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622538140;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lTj0e2ix7Em5ReRBGmBE8UcFjJXaGmDtfxA9DwPKs3Y=;
        b=hl5WtER7JX53dBcKImZjoE4E6KN9LoXwoMyigbxWhzWkOWPZpdeAiu+PmU/q0+IunsoGhN
        Yo66ulpzstSzLhhTrtXenzpOU7dgAvXVUxsEbekOoe20CEKuba75uU6PStmzEGMitZe29N
        Alxkuqq1//928qwfQ4rZUCgxtdhPy1Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-q_0SXmbeMN6M176ZqvzXZQ-1; Tue, 01 Jun 2021 05:02:19 -0400
X-MC-Unique: q_0SXmbeMN6M176ZqvzXZQ-1
Received: by mail-wr1-f70.google.com with SMTP id u5-20020adf9e050000b029010df603f280so4580591wre.18
        for <linux-mips@vger.kernel.org>; Tue, 01 Jun 2021 02:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=lTj0e2ix7Em5ReRBGmBE8UcFjJXaGmDtfxA9DwPKs3Y=;
        b=ekO9zYmyVBCULZ+fV31A2i5rZzjtjBIvib1brDgqkZyMn6/rv8VtMcFEjcw9uFkrSq
         SnqPW20QwRu/X4VFsCfL1m2/QildTIpr6QJ5ZUewstjxUsj1M1+mHjGDHZD77nSKBKgO
         vsLj1i5AW5X9zb7MRfyp2i3dVkZwjxLwesE+Q52fB6m5ZupT7ST2f2sXd5+0Na3QZJMU
         UvyAl9+JYbmQH5EW0hA9p1MPiXLlbcqqtDQaVrMA4yZMlN0Wugfro18AMCLEVr656JqW
         qE5A6BZQyzQdFN5jz0oDQSkTmq97uc6EyTobvIHMZqBLIMzkjZmKCAW5vv2jmFeZIaWs
         I06w==
X-Gm-Message-State: AOAM532lUdKB+A0CaxaSUgaKGmFcDorDZC1x3bNpHQZhS3j7rK5j5XdU
        mUx8OI7Y2aKZcEMd6QZ7LUAjyJ+c86tfLa2lTG6mbn9gF9B8zpc4yccRhrSLWbyty1kGCYsNwWq
        K+myh/LDq3dsMIwNinnO/+w==
X-Received: by 2002:a05:600c:47c4:: with SMTP id l4mr3421517wmo.145.1622538138340;
        Tue, 01 Jun 2021 02:02:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzye8Yw+0bLOb0SBvbHwXC4HYmyiMFfH3IyzfuxKInF6JuzngzXM+aezXKoW/iZU7+Z69Ow5A==
X-Received: by 2002:a05:600c:47c4:: with SMTP id l4mr3421493wmo.145.1622538138179;
        Tue, 01 Jun 2021 02:02:18 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c69ce.dip0.t-ipconnect.de. [91.12.105.206])
        by smtp.gmail.com with ESMTPSA id 11sm17960058wmo.24.2021.06.01.02.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 02:02:17 -0700 (PDT)
From:   David Hildenbrand <david@redhat.com>
To:     Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org
References: <20210531122959.23499-1-rppt@kernel.org>
 <20210531122959.23499-2-rppt@kernel.org>
 <1efc386c-2cb4-164f-7194-497f142f969f@redhat.com>
Organization: Red Hat
Subject: Re: [RFC/RFT PATCH 1/5] s390: make crashk_res resource a child of
 "System RAM"
Message-ID: <f6cd0c41-d7e2-65f5-94eb-9a21514df799@redhat.com>
Date:   Tue, 1 Jun 2021 11:02:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1efc386c-2cb4-164f-7194-497f142f969f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 01.06.21 10:45, David Hildenbrand wrote:
> On 31.05.21 14:29, Mike Rapoport wrote:
>> From: Mike Rapoport <rppt@linux.ibm.com>
>>
>> Commit 4e042af463f8 ("s390/kexec: fix crash on resize of reserved memory")
>> added a comment that says "crash kernel resource should not be part of the
>> System RAM resource" but never explained why. As it looks from the code in
>> the kernel and in kexec there is no actual reason for that.
> 
> Are you sure?
> 
> Looking at kexec-tools: kexec/arch/s390/kexec-s390.c
> 
> get_memory_ranges_s390() wants "System RAM" and Crash kernel only with
> "with_crashk=1". Your patch would change that. "Crash kernel" would
> always be included if you make it a child of "System RAM".
> 
> Further, get_memory_ranges() and is_crashkernel_mem_reserved() look out
> for "Crash kernel\n" via parse_iomem_single().
> 
> However, parse_iomem_single() does not care about ranges that start with
> spaces IIRC via
>     sscanf(line, "%llx-%llx : %n" ...

I think I'm wrong about that one because I read

"Input white-space characters (as specified by the isspace function) are 
skipped, unless the specification includes a [ , c , or n specifier"

So having it as a child won't affect parse_iomem_single().

-- 
Thanks,

David / dhildenb


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422FB4A59C4
	for <lists+linux-mips@lfdr.de>; Tue,  1 Feb 2022 11:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236486AbiBAKRK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Feb 2022 05:17:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50366 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236468AbiBAKRG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Feb 2022 05:17:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643710626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1rSMPibeU2/x9y1HGJmwIBX0MF6r0zdDZVn4ZSeYeqM=;
        b=BTJtMh/m9wI877MoJHJo8Ss1XH0a7PwVHOmxVkpkHjrxvMdSxPzz8ZscqYEXV3uEF4h7Nq
        JAbfc3pvCb0vO5IAiObiWenIWaQN7vCjMmb1ZSrYmeQUVRkIqULicGCQjO5sN+tCZd7zD+
        9kExqb8KeIhBd1T5B10BbJPp9h+gTdo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-hi_HtmgMNCyXDrGpaCjhTw-1; Tue, 01 Feb 2022 05:17:05 -0500
X-MC-Unique: hi_HtmgMNCyXDrGpaCjhTw-1
Received: by mail-wm1-f72.google.com with SMTP id o194-20020a1ca5cb000000b00350b177fb22so1327435wme.3
        for <linux-mips@vger.kernel.org>; Tue, 01 Feb 2022 02:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=1rSMPibeU2/x9y1HGJmwIBX0MF6r0zdDZVn4ZSeYeqM=;
        b=d0B5gzFrcBiAU4bFw8cRhHVeHUj5pOc/0w9eKNfHoFyCNhoOFG/7j6HuHBwOCrDgPM
         LxS8f/Fbd9hG9rRlEql6A8ci5YwOr+W7ft9hMn5aUzfBfpbzLgYofrctKqOTqgk7PaTb
         wmahPDNPEhgMtGn7hQRd8gBn1SwwafvB0XxUT3UFLoyI9QnkHjFU8Nx7Wwam0J/5LaCm
         JSy9Wv0vY0fxo4RfanSfYcsH2mokluhfKEeA37iXQpRMuyk8+M+TCOhZ58h/SQL5Yzi+
         Yf0LBLVy9supMCk5octdmER8/e6+CIJvyhDWDvX3lCzCNqoMiQeaV1C65xKtEKcTwuKL
         5K6A==
X-Gm-Message-State: AOAM530QxLoRdae2G0aUe44nT/nuQddjLLWsRL7BkT1BLmek+kUS6ETT
        yxw0DtllYfydSjvLwQUBhJ86OrNGC21z7LwaFxSN3VeHWj91jFmO5hznFk1J0vNm2FIlQBzKVTT
        Douii5+epmABCabTxnwT/dQ==
X-Received: by 2002:adf:f54d:: with SMTP id j13mr20271542wrp.596.1643710624127;
        Tue, 01 Feb 2022 02:17:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwW9cnbVOET7eNHaJPpg1tW+PwHgA1p1BZnH/wRYWshALkMr1QDZjc+KGZLPaL4fKlWIFXhpA==
X-Received: by 2002:adf:f54d:: with SMTP id j13mr20271503wrp.596.1643710623856;
        Tue, 01 Feb 2022 02:17:03 -0800 (PST)
Received: from ?IPV6:2003:cb:c711:ba00:67b6:a3ab:b0a8:9517? (p200300cbc711ba0067b6a3abb0a89517.dip0.t-ipconnect.de. [2003:cb:c711:ba00:67b6:a3ab:b0a8:9517])
        by smtp.gmail.com with ESMTPSA id p2sm1600619wmc.33.2022.02.01.02.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 02:17:03 -0800 (PST)
Message-ID: <19907f0c-4d83-4d85-4233-f4ee727574a0@redhat.com>
Date:   Tue, 1 Feb 2022 11:17:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH RFC v1] drivers/base/node: consolidate node device
 subsystem initialization in node_dev_init()
Content-Language: en-US
To:     Oscar Salvador <osalvador@suse.de>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
References: <20220128151540.164759-1-david@redhat.com>
 <YfeARpenqPii1WQH@localhost.localdomain>
 <3be2e20c-f0b9-c080-adf4-b0e17c046eb0@redhat.com>
 <20220131094041.GA15392@linux>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220131094041.GA15392@linux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 31.01.22 10:40, Oscar Salvador wrote:
> On Mon, Jan 31, 2022 at 08:48:54AM +0100, David Hildenbrand wrote:
>> Hi Oscar,
> 
> Hi David :-),
> 
>> Right, and the idea is that the online state of nodes (+ node/zone
>> ranges) already has to be known at that point in time, because
>> otherwise, we'd be in bigger trouble.
> 
> Yeah, I wanted to check where exactly did we mark the nodes online,
> and for the few architectures I checked it happens in setup_arch(),
> which is called very early in start_kernel(), while driver_init()
> gets called through arch_call_rest_init(), which happens at the end
> of the function.
> 
> I am not sure whether we want to remark that somehow in the changelog,
> so it is crystal clear that by the time the node_dev_init() gets called,
> we already set the nodes online.
> 
> Anyway, just saying, but is fine as is.

I'll adjust the first paragraph to:

    ... and call node_dev_init() after memory_dev_init() from driver_init(),
    so before any of the existing arch/subsys calls. All online nodes should
    be known at that point: early during boot, arch code determines node and
    zone ranges and sets the relevant nodes online; usually this happens in
    setup_arch().

Thanks!

-- 
Thanks,

David / dhildenb


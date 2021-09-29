Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5A141BCF9
	for <lists+linux-mips@lfdr.de>; Wed, 29 Sep 2021 04:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhI2C6e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 22:58:34 -0400
Received: from foss.arm.com ([217.140.110.172]:57194 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243733AbhI2C6d (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Sep 2021 22:58:33 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDA65D6E;
        Tue, 28 Sep 2021 19:56:51 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F15653F70D;
        Tue, 28 Sep 2021 19:56:48 -0700 (PDT)
Subject: Re: [PATCH] mm/mmap: Define index macros for protection_map[]
To:     Christoph Hellwig <hch@infradead.org>
Cc:     linux-mm@kvack.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1632712920-8171-1-git-send-email-anshuman.khandual@arm.com>
 <YVHcCZXmQ1yjINaf@infradead.org>
 <f224c661-f8f0-3c4a-bad8-095209412dd4@arm.com>
 <YVKdH4G5Alfwjkix@infradead.org>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <9051a597-0229-aaf2-9aad-42509b4f621d@arm.com>
Date:   Wed, 29 Sep 2021 08:27:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YVKdH4G5Alfwjkix@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 9/28/21 10:12 AM, Christoph Hellwig wrote:
> On Tue, Sep 28, 2021 at 08:24:43AM +0530, Anshuman Khandual wrote:
>>> simple switch statement provided by each architecture.  See the below
>>> WIP which just works for x86 and without pagetable debugging for where I
>>> think we should be going.
>>
>> Sure, this will work as well but all platforms need to be changed at once.
>> Is there any platform that would not subscribe ARCH_HAS_GET_PAGE_PROT and
>> export its own vm_get_page_prot() ? AFAICS all platforms are required to
>> export __PXXX and __SXXX elements currently.
>>
>> This seems to be a better idea than the current proposal. Probably all the
>> vm_flags combinations, which will be used in those switch statements can be
>> converted into macros just to improve readability. Are you planning to send
>> this as a proper patch soon ?
> 
> This was just a quіck WIP patch.  If you have some spare time to tackle
> it for real I'd sugget the following approach:

Sure, will try and get this working.

> 
>  1) Remove the direct references to protection_map in debug_vm_pgtable.c
>  2) add the ARCH_HAS_GET_PAGE_PROT symbol that lets architectures
>     provide vm_get_page_prot itself and not define protection_map at all
>     in this case
>  3) convert all architectures that touch protection_map to provide
>     vm_get_page_prot themselves
>  4) mark protection_map static
>  5) convert all architectures that provide arch_filter_pgprot and/or
>     arch_vm_get_page_prot to provide vm_get_page_prot directly and
>     remove those hooks
>  6) remove the __S???/__P??? macros and the generic vm_get_page_prot
>     after providing an arch implementation for every architecture.
>     This can maybe simplified with a new generic version that directly
>     looks at PAGE_* macros, but that will need further investigation
>     first.
> 

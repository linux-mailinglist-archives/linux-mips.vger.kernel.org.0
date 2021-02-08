Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFC99312926
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 04:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbhBHDEf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Feb 2021 22:04:35 -0500
Received: from foss.arm.com ([217.140.110.172]:55206 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229565AbhBHDEe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Feb 2021 22:04:34 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00ADF1FB;
        Sun,  7 Feb 2021 19:03:47 -0800 (PST)
Received: from [192.168.0.130] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74C8B3F719;
        Sun,  7 Feb 2021 19:03:42 -0800 (PST)
Subject: Re: [PATCH] mm/memtest: Add ARCH_USE_MEMTEST
To:     Max Filippov <jcmvbkbc@gmail.com>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <1612498242-31579-1-git-send-email-anshuman.khandual@arm.com>
 <CAMo8BfLXaycXgy-F=TaWzpEZZJKEhbZecxwvBVd6jTo0RJ8atQ@mail.gmail.com>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <dc4c19d2-62e6-389a-bb03-33bf30381a3b@arm.com>
Date:   Mon, 8 Feb 2021 08:34:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMo8BfLXaycXgy-F=TaWzpEZZJKEhbZecxwvBVd6jTo0RJ8atQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2/5/21 1:05 PM, Max Filippov wrote:
> On Thu, Feb 4, 2021 at 8:10 PM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
>>
>> early_memtest() does not get called from all architectures. Hence enabling
>> CONFIG_MEMTEST and providing a valid memtest=[1..N] kernel command line
>> option might not trigger the memory pattern tests as would be expected in
>> normal circumstances. This situation is misleading.
>>
>> The change here prevents the above mentioned problem after introducing a
>> new config option ARCH_USE_MEMTEST that should be subscribed on platforms
>> that call early_memtest(), in order to enable the config CONFIG_MEMTEST.
>> Conversely CONFIG_MEMTEST cannot be enabled on platforms where it would
>> not be tested anyway.
>>
>> Cc: Russell King <linux@armlinux.org.uk>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Chris Zankel <chris@zankel.net>
>> Cc: Max Filippov <jcmvbkbc@gmail.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-mips@vger.kernel.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-xtensa@linux-xtensa.org
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> This patch applies on v5.11-rc6 and has been tested on arm64 platform. But
>> it has been just build tested on all other platforms.
>>
>>  arch/arm/Kconfig     | 1 +
>>  arch/arm64/Kconfig   | 1 +
>>  arch/mips/Kconfig    | 1 +
>>  arch/powerpc/Kconfig | 1 +
>>  arch/x86/Kconfig     | 1 +
>>  arch/xtensa/Kconfig  | 1 +
>>  lib/Kconfig.debug    | 9 ++++++++-
>>  7 files changed, 14 insertions(+), 1 deletion(-)
> 
> Anshuman, entries in arch/*/Konfig files are sorted in alphabetical order,
> please keep them that way.

Sure, will fix up and resend.

> 
> Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
> 

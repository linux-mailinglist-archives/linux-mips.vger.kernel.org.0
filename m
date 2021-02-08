Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2460431293F
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 04:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhBHDRY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Feb 2021 22:17:24 -0500
Received: from foss.arm.com ([217.140.110.172]:55294 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229537AbhBHDRX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Feb 2021 22:17:23 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B1061FB;
        Sun,  7 Feb 2021 19:16:37 -0800 (PST)
Received: from [192.168.0.130] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E46963F719;
        Sun,  7 Feb 2021 19:16:31 -0800 (PST)
Subject: Re: [PATCH] mm/memtest: Add ARCH_USE_MEMTEST
To:     Vladimir Murzin <vladimir.murzin@arm.com>, linux-mm@kvack.org
Cc:     Chris Zankel <chris@zankel.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        Paul Mackerras <paulus@samba.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
References: <1612498242-31579-1-git-send-email-anshuman.khandual@arm.com>
 <a58f1a92-087d-cf90-ce2b-0c88b39a8116@arm.com>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <d6e9f640-e5c2-49b7-7ca9-ec6c3191e6f9@arm.com>
Date:   Mon, 8 Feb 2021 08:47:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a58f1a92-087d-cf90-ce2b-0c88b39a8116@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2/5/21 2:50 PM, Vladimir Murzin wrote:
> Hi Anshuman,
> 
> On 2/5/21 4:10 AM, Anshuman Khandual wrote:
>> early_memtest() does not get called from all architectures. Hence enabling
>> CONFIG_MEMTEST and providing a valid memtest=[1..N] kernel command line
>> option might not trigger the memory pattern tests as would be expected in
>> normal circumstances. This situation is misleading.
> 
> Documentation already mentions which architectures support that:
> 
> memtest=        [KNL,X86,ARM,PPC] Enable memtest
> 
> yet I admit that not all reflected there

But there is nothing that prevents CONFIG_MEMTEST from being set on
other platforms that do not have an affect, which is not optimal.

> 
>>
>> The change here prevents the above mentioned problem after introducing a
>> new config option ARCH_USE_MEMTEST that should be subscribed on platforms
>> that call early_memtest(), in order to enable the config CONFIG_MEMTEST.
>> Conversely CONFIG_MEMTEST cannot be enabled on platforms where it would
>> not be tested anyway.
>>
> 
> Is that generic pattern? What about other cross arch parameters? Do they already
> use similar subscription or they rely on documentation?

Depending solely on the documentation should not be sufficient.

> 
> I'm not against the patch just want to check if things are consistent...
Not sure about other similar situations but those if present should
get fixed as well.

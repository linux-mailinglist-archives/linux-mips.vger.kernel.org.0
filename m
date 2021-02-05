Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502553107BE
	for <lists+linux-mips@lfdr.de>; Fri,  5 Feb 2021 10:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhBEJXU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Feb 2021 04:23:20 -0500
Received: from foss.arm.com ([217.140.110.172]:53220 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230075AbhBEJUT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Feb 2021 04:20:19 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47C6931B;
        Fri,  5 Feb 2021 01:19:32 -0800 (PST)
Received: from [10.57.5.97] (unknown [10.57.5.97])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87A5C3F73B;
        Fri,  5 Feb 2021 01:19:28 -0800 (PST)
Subject: Re: [PATCH] mm/memtest: Add ARCH_USE_MEMTEST
To:     Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
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
From:   Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <a58f1a92-087d-cf90-ce2b-0c88b39a8116@arm.com>
Date:   Fri, 5 Feb 2021 09:20:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1612498242-31579-1-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Anshuman,

On 2/5/21 4:10 AM, Anshuman Khandual wrote:
> early_memtest() does not get called from all architectures. Hence enabling
> CONFIG_MEMTEST and providing a valid memtest=[1..N] kernel command line
> option might not trigger the memory pattern tests as would be expected in
> normal circumstances. This situation is misleading.

Documentation already mentions which architectures support that:

memtest=        [KNL,X86,ARM,PPC] Enable memtest

yet I admit that not all reflected there

> 
> The change here prevents the above mentioned problem after introducing a
> new config option ARCH_USE_MEMTEST that should be subscribed on platforms
> that call early_memtest(), in order to enable the config CONFIG_MEMTEST.
> Conversely CONFIG_MEMTEST cannot be enabled on platforms where it would
> not be tested anyway.
> 

Is that generic pattern? What about other cross arch parameters? Do they already
use similar subscription or they rely on documentation?

I'm not against the patch just want to check if things are consistent...

Cheers
Vladimir

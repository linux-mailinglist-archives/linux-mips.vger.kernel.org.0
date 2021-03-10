Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D69403335A5
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 07:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhCJGDJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 01:03:09 -0500
Received: from foss.arm.com ([217.140.110.172]:38652 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229525AbhCJGDD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 01:03:03 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5C521FB;
        Tue,  9 Mar 2021 22:03:02 -0800 (PST)
Received: from [10.163.67.114] (unknown [10.163.67.114])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDF513F70D;
        Tue,  9 Mar 2021 22:02:57 -0800 (PST)
Subject: Re: [PATCH V2] mm/memtest: Add ARCH_USE_MEMTEST
To:     linux-mm@kvack.org
Cc:     Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
        linux-kernel@vger.kernel.org
References: <1614573126-7740-1-git-send-email-anshuman.khandual@arm.com>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <d8f959e4-8a8b-7f11-4ce5-32462c46c05f@arm.com>
Date:   Wed, 10 Mar 2021 11:33:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1614573126-7740-1-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 3/1/21 10:02 AM, Anshuman Khandual wrote:
> early_memtest() does not get called from all architectures. Hence enabling
> CONFIG_MEMTEST and providing a valid memtest=[1..N] kernel command line
> option might not trigger the memory pattern tests as would be expected in
> normal circumstances. This situation is misleading.
> 
> The change here prevents the above mentioned problem after introducing a
> new config option ARCH_USE_MEMTEST that should be subscribed on platforms
> that call early_memtest(), in order to enable the config CONFIG_MEMTEST.
> Conversely CONFIG_MEMTEST cannot be enabled on platforms where it would
> not be tested anyway.
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-xtensa@linux-xtensa.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v5.12-rc1 and has been tested on arm64 platform.
> But it has been just build tested on all other platforms.
> 
> Changes in V2:
> 
> - Added ARCH_USE_MEMTEST in the sorted alphabetical order on platforms

Gentle ping, any updates or objections ?

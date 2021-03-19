Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D21341CFB
	for <lists+linux-mips@lfdr.de>; Fri, 19 Mar 2021 13:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbhCSMel (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Mar 2021 08:34:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:37230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229766AbhCSMeU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 19 Mar 2021 08:34:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C25964EB6;
        Fri, 19 Mar 2021 12:34:15 +0000 (UTC)
Date:   Fri, 19 Mar 2021 12:34:12 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-mm@kvack.org, Russell King <linux@armlinux.org.uk>,
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
Subject: Re: [PATCH V2] mm/memtest: Add ARCH_USE_MEMTEST
Message-ID: <20210319123412.GB6832@arm.com>
References: <1614573126-7740-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614573126-7740-1-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 01, 2021 at 10:02:06AM +0530, Anshuman Khandual wrote:
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

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

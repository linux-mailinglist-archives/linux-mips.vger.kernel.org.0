Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACC01B175B
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 22:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgDTUmq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 16:42:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:53106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725774AbgDTUmq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 16:42:46 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 50BB9207FC;
        Mon, 20 Apr 2020 20:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587415366;
        bh=/Lm2cTmavSfvPwo3EnY/skppJ5i7CHKipIJNiAMzESE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vX206r139s9j+s4JKnaMI4JpxtutoxgTKEzqEw3LnEF+8MAWjTABg/8ixx8KpUvhJ
         aBeW060QZCReO+UrYVjtFosA573ZmpGd4EEAhYESWJJ38YU2e8uDaSguoFjd9eEoa2
         GF7apirwkq/9qg8hWCNZ5P1q630+XpFbjnKHsvw4=
Date:   Mon, 20 Apr 2020 21:42:39 +0100
From:   Will Deacon <will@kernel.org>
To:     George Spelvin <lkml@sdf.org>
Cc:     linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev@lists.ozlabs.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org
Subject: Re: [RFC PATCH v1 40/50] arch/*/include/asm/stackprotector.h: Use
 get_random_canary() consistently
Message-ID: <20200420204238.GB29998@willie-the-truck>
References: <202003281643.02SGhM0T009250@sdf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202003281643.02SGhM0T009250@sdf.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 10, 2019 at 12:35:14AM -0500, George Spelvin wrote:
> ... in boot_init_stack_canary().
> 
> This is the archetypical example of where the extra security of
> get_random_bytes() is wasted.  The canary is only important as
> long as it's stored in __stack_chk_guard.
> 
> It's also a great example of code that has been copied around
> a lot and not updated.
> 
> Remove the XOR with LINUX_VERSION_CODE as it's pointless; the inclusion
> of utsname() in init_std_data in the random seeding obviates it.
> 
> The XOR with the TSC on x86 and mtfb() on powerPC were left in,
> as I haven't proved them redundant yet.  For those, we call
> get_random_long(), xor, and mask manually.
> 
> FUNCTIONAL CHANGE: mips and xtensa were changed from 64-bit
> get_random_long() to 56-bit get_random_canary() to match the
> others, in accordance with the logic in CANARY_MASK.
> 
> (We could do 1 bit better and zero *one* of the two high bytes.)
> 
> Signed-off-by: George Spelvin <lkml@sdf.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: linux-sh@vger.kernel.org
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc:  "H. Peter Anvin" <hpa@zytor.com>
> Cc: x86@kernel.org
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-xtensa@linux-xtensa.org
> ---
>  arch/arm/include/asm/stackprotector.h     | 9 +++------
>  arch/arm64/include/asm/stackprotector.h   | 8 ++------
>  arch/mips/include/asm/stackprotector.h    | 7 ++-----
>  arch/powerpc/include/asm/stackprotector.h | 6 ++----
>  arch/sh/include/asm/stackprotector.h      | 8 ++------
>  arch/x86/include/asm/stackprotector.h     | 4 ++--
>  arch/xtensa/include/asm/stackprotector.h  | 7 ++-----
>  7 files changed, 15 insertions(+), 34 deletions(-)

Just found this kicking around in the depths of my inbox. Is the series
dead?

Will

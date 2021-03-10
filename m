Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1C2334155
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 16:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbhCJPTL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 10:19:11 -0500
Received: from elvis.franken.de ([193.175.24.41]:42321 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229602AbhCJPS5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 10:18:57 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lK0bw-00088y-02; Wed, 10 Mar 2021 16:18:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 597E6C1D54; Wed, 10 Mar 2021 16:07:55 +0100 (CET)
Date:   Wed, 10 Mar 2021 16:07:55 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/2] MIPS: Remove KVM_GUEST support
Message-ID: <20210310150755.GC12960@alpha.franken.de>
References: <20210301152958.3480-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301152958.3480-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 01, 2021 at 04:29:56PM +0100, Thomas Bogendoerfer wrote:
> KVM_GUEST is broken and unmaintained, so let's remove it.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/Kconfig                           |  17 -
>  arch/mips/configs/malta_kvm_guest_defconfig | 436 --------------------
>  arch/mips/include/asm/mach-generic/spaces.h |  12 -
>  arch/mips/include/asm/processor.h           |   5 -
>  arch/mips/include/asm/uaccess.h             |   9 -
>  arch/mips/kernel/cevt-r4k.c                 |   4 -
>  arch/mips/mti-malta/Platform                |   6 +-
>  arch/mips/mti-malta/malta-time.c            |   5 -
>  8 files changed, 1 insertion(+), 493 deletions(-)
>  delete mode 100644 arch/mips/configs/malta_kvm_guest_defconfig

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

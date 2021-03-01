Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6A383281BD
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 16:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236855AbhCAPEU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Mar 2021 10:04:20 -0500
Received: from elvis.franken.de ([193.175.24.41]:33729 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236881AbhCAPEB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Mar 2021 10:04:01 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lGk4s-00041h-01; Mon, 01 Mar 2021 16:03:18 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4A5A9C03C2; Mon,  1 Mar 2021 15:49:46 +0100 (CET)
Date:   Mon, 1 Mar 2021 15:49:46 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Maciej W . Rozycki" <macro@orcam.me.uk>,
        Ralf Baechle <ralf@linux-mips.org>,
        George Cherian <gcherian@marvell.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2] MIPS: select CPU_MIPS64 for remaining MIPS64 CPUs
Message-ID: <20210301144946.GD11261@alpha.franken.de>
References: <CAHmME9ohOsdAwGaqCQZKDynNoC2k=14g9VSFP2mTUA7txf_Ssw@mail.gmail.com>
 <20210227230236.3234498-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210227230236.3234498-1-Jason@zx2c4.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Feb 28, 2021 at 12:02:36AM +0100, Jason A. Donenfeld wrote:
> CPU_MIPS64 is supposed to be selected for CPUs that implement a revision
> of the MIPS64 ISA. While it contains the generic ones, it forgot about
> Octeon and Loongson in its list, which are indeed MIPS64 processors.
> This commit adds these missing CPUs to the auto-selection list.
> 
> Cc: Maciej W. Rozycki <macro@orcam.me.uk>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: George Cherian <gcherian@marvell.com>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/mips/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

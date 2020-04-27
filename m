Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5332E1B9FE6
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2020 11:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgD0Jao (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Apr 2020 05:30:44 -0400
Received: from elvis.franken.de ([193.175.24.41]:57095 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726003AbgD0Jao (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Apr 2020 05:30:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jT05x-0000OE-00; Mon, 27 Apr 2020 11:30:33 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 1A88FC0327; Mon, 27 Apr 2020 11:04:12 +0200 (CEST)
Date:   Mon, 27 Apr 2020 11:04:12 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Guoyun Sun <sunguoyun@loongson.cn>,
        Paul Burton <paulburton@kernel.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Price <steven.price@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        TieZhu Yang <yangtiezhu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] mips/mm: Add page soft dirty tracking
Message-ID: <20200427090412.GA7286@alpha.franken.de>
References: <1587460527-13986-1-git-send-email-sunguoyun@loongson.cn>
 <20200426165441.GA10053@alpha.franken.de>
 <QNNE9Q.WIYO7ZSN6WHE@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <QNNE9Q.WIYO7ZSN6WHE@crapouillou.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 26, 2020 at 07:09:26PM +0200, Paul Cercueil wrote:
> >>  arch/mips/Kconfig                    |  1 +
> >>  arch/mips/include/asm/pgtable-bits.h |  8 ++++--
> >>  arch/mips/include/asm/pgtable.h      | 48
> >>++++++++++++++++++++++++++++++++++--
> >
> >this breaks all 32bit builds where CPU support RIXI, because it overflows
> >pgtable_bits.
> 
> I think we'd need to make PTEs 64-bit at some point.

I'm taking patches ;-) Any idea how much performance impact we might
see by this ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

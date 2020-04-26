Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFC361B91E0
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 18:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgDZQyz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 12:54:55 -0400
Received: from elvis.franken.de ([193.175.24.41]:56034 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbgDZQyz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 12:54:55 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jSkYN-00023Z-00; Sun, 26 Apr 2020 18:54:51 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2CE3FC0325; Sun, 26 Apr 2020 18:54:42 +0200 (CEST)
Date:   Sun, 26 Apr 2020 18:54:42 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Guoyun Sun <sunguoyun@loongson.cn>
Cc:     Paul Burton <paulburton@kernel.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Cercueil <paul@crapouillou.net>,
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
Message-ID: <20200426165441.GA10053@alpha.franken.de>
References: <1587460527-13986-1-git-send-email-sunguoyun@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587460527-13986-1-git-send-email-sunguoyun@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 21, 2020 at 05:15:27PM +0800, Guoyun Sun wrote:
> User space checkpoint and restart tool (CRIU) needs the page's change
> to be soft tracked. This allows to do a pre checkpoint and then dump
> only touched pages.
> 
> Signed-off-by: Guoyun Sun <sunguoyun@loongson.cn>
> ---
>  arch/mips/Kconfig                    |  1 +
>  arch/mips/include/asm/pgtable-bits.h |  8 ++++--
>  arch/mips/include/asm/pgtable.h      | 48 ++++++++++++++++++++++++++++++++++--

this breaks all 32bit builds where CPU support RIXI, because it overflows
pgtable_bits.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

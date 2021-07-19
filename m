Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9B43CCD78
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jul 2021 07:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233597AbhGSFmy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jul 2021 01:42:54 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:51442 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229777AbhGSFmx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Jul 2021 01:42:53 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
        id 1m5Lzk-0004RI-3h; Mon, 19 Jul 2021 13:39:12 +0800
Received: from herbert by gondobar with local (Exim 4.92)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1m5LzP-0004N7-JA; Mon, 19 Jul 2021 13:38:51 +0800
Date:   Mon, 19 Jul 2021 13:38:51 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Russell King Oracle <linux@armlinux.org.uk>
Cc:     hch@lst.de, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, James.Bottomley@hansenpartnership.com,
        guoren@kernel.org, tsbogend@alpha.franken.de, nickhu@andestech.com,
        green.hu@gmail.com, deanbo422@gmail.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org, geoff@infradead.org,
        paul@crapouillou.net, ulf.hansson@linaro.org, alexs@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: flush_kernel_dcache_page fixes and removal
Message-ID: <20210719053851.GA16780@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210713084648.GF22278@shell.armlinux.org.uk>
X-Newsgroups: apana.lists.os.linux.doc,apana.lists.os.linux.kernel,apana.lists.os.linux.scsi
Organization: Core
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Russell King Oracle <linux@armlinux.org.uk> wrote:
>
> I think you need to be careful - I seem to have a recollection that the
> reason we ended up with flush_kernel_dcache_page() was the need to avoid
> the taking of the mmap lock for 32-bit ARM VIVT based CPUs in
> flush_dcache_page(). 32-bit ARM flush_dcache_page() can block.
> 
> If you're sure that all these changes you're making do not end up
> calling flush_dcache_page() from a path where we are atomic, then fine.

The Crypto API has been calling flush_dcache_page from softirq
context since before the advent of git (see crypto/scatterwalk.c
from the initial import).  So if 32-bit ARM blocks on it then this
has been broken for almost 20 years.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

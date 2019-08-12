Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A35F89E4A
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 14:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728601AbfHLM2n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 08:28:43 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:53692 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728242AbfHLM2m (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Aug 2019 08:28:42 -0400
Received: from gondolin.me.apana.org.au ([192.168.0.6] helo=gondolin.hengli.com.au)
        by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1hx9R4-0005M2-CI; Mon, 12 Aug 2019 22:28:26 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1hx9Qj-0005Zh-1A; Mon, 12 Aug 2019 22:28:05 +1000
Date:   Mon, 12 Aug 2019 22:28:05 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Vladimir Serbinenko <phcoder@gmail.com>,
        Jussi Kivilinna <jussi.kivilinna@iki.fi>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 3/5] lib/mpi: Fix for building for MIPS32 with Clang
Message-ID: <20190812122804.GB17459@gondor.apana.org.au>
References: <20190812033120.43013-1-natechancellor@gmail.com>
 <20190812033120.43013-4-natechancellor@gmail.com>
 <20190812052355.GA47342@archlinux-threadripper>
 <20190812052653.GA47439@archlinux-threadripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812052653.GA47439@archlinux-threadripper>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Aug 11, 2019 at 10:26:53PM -0700, Nathan Chancellor wrote:
>
> >  I noticed you didn't pick up this patch with the other ones you
> >  applied. I just wanted to make sure it wasn't because it was sent to
> >  the wrong person. This set of files doesn't appear to have an owner in
> >  MAINTAINERS, I guess based on git history either Andrew or Hubert (on
> >  CC) pick up patches for this set of files? If I need to, I can resend
> >  it to the proper people.
> > 
> >  Cheers,
> >  Nathan
> 
> Sigh, actually add Andrew and Herbert and get his name right, sorry :(

You can route it through the crypto tree by posting this to the
linux-crypto@vger.kernel.org mailing list.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

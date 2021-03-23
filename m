Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9958234543A
	for <lists+linux-mips@lfdr.de>; Tue, 23 Mar 2021 01:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhCWAvV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 20:51:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:52238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231716AbhCWAvI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Mar 2021 20:51:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04DC6619A0;
        Tue, 23 Mar 2021 00:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616460668;
        bh=0GU+mvpQ6KFpPVwE2ur3Erg8FSP3jRjW/eXtmRXCw7s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SRAQIK6VlIa1BVXD5FgNvXzx34HBQ3nVMbX7leQvXvYXSMTtjgk6mWm4fxRtHdXrG
         Sl+9cOPfdzkSxJI2g2QhbnigL6cSZfMkC0RXNulceHz9OmyPFHKGTbqAKxWTn8/twn
         EMzv+hHcg9G2Xmp3tGlnPk4bdmyS+lwe3Zw5YlpwukFKZT4m6kIj5geuBLx+pQG1y4
         1zJRcn7b5muK8qMSLrlEyTwhClWY39umEzKY43sl4UdqV3ngeHney4bbSaXcYlXV4m
         SIGJroPcyjPLzcfqW6L4ifaGkbd5OjitKvwFa06caWIHybxlw6K6H+NmicgKjVof6X
         xrNN0Gkawe9Ig==
Date:   Mon, 22 Mar 2021 17:51:06 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] crypto: poly1305: fix poly1305_core_setkey() declaration
Message-ID: <YFk7erL3xBHoGNmj@gmail.com>
References: <20210322170542.1791154-1-arnd@kernel.org>
 <CAMj1kXGj+autwGM-Me7qNoORsux9Xz_1-P=7w4m-9vGMXwDq4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMj1kXGj+autwGM-Me7qNoORsux9Xz_1-P=7w4m-9vGMXwDq4Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 22, 2021 at 07:51:47PM +0100, Ard Biesheuvel wrote:
> On Mon, 22 Mar 2021 at 18:05, Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > gcc-11 points out a mismatch between the declaration and the definition
> > of poly1305_core_setkey():
> >
> > lib/crypto/poly1305-donna32.c:13:67: error: argument 2 of type ‘const u8[16]’ {aka ‘const unsigned char[16]’} with mismatched bound [-Werror=array-parameter=]
> >    13 | void poly1305_core_setkey(struct poly1305_core_key *key, const u8 raw_key[16])
> >       |                                                          ~~~~~~~~~^~~~~~~~~~~
> > In file included from lib/crypto/poly1305-donna32.c:11:
> > include/crypto/internal/poly1305.h:21:68: note: previously declared as ‘const u8 *’ {aka ‘const unsigned char *’}
> >    21 | void poly1305_core_setkey(struct poly1305_core_key *key, const u8 *raw_key);
> >
> > This is harmless in principle, as the calling conventions are the same,
> > but the more specific prototype allows better type checking in the
> > caller.
> >
> > Change the declaration to match the actual function definition.
> > The poly1305_simd_init() is a bit suspicious here, as it previously
> > had a 32-byte argument type, but looks like it needs to take the
> > 16-byte POLY1305_BLOCK_SIZE array instead.
> >
> 
> This looks ok to me. For historical reasons, the Poly1305 integration
> is based on an unkeyed shash, and both the Poly1305 key and nonce are
> passed as ordinary input, prepended to the actual data.
> poly1305_simd_init() takes only the key but not the nonce, so it
> should only be passed 16 bytes.

Well to be more precise, there are two conventions for using Poly1305.  One
where it is invoked many times with the same 16-byte key and different 16-byte
nonces.  And one where every invocation uses a unique key *and* nonce,
interpreted as a 32-byte "one-time key".

So that's why there's a mix of 16 and 32 byte "keys".

The naming "POLY1305_KEY_SIZE" assumes the second convention, which is a bit
confusing; it really should be called something like POLY1305_ONETIME_KEY_SIZE.
I guess the idea was that the one-time key convention is the more common one.

Anyway, the patch seems to be fine, as it uses the correct length in each
location.  You can add:

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric

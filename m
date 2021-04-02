Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE08035290B
	for <lists+linux-mips@lfdr.de>; Fri,  2 Apr 2021 11:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhDBJsz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Apr 2021 05:48:55 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:33790 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234217AbhDBJsz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Apr 2021 05:48:55 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1lSGOu-0003UO-NG; Fri, 02 Apr 2021 20:47:37 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 02 Apr 2021 20:47:36 +1100
Date:   Fri, 2 Apr 2021 20:47:36 +1100
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH] crypto: poly1305: fix poly1305_core_setkey() declaration
Message-ID: <20210402094736.GC24509@gondor.apana.org.au>
References: <20210322170542.1791154-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210322170542.1791154-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 22, 2021 at 06:05:15PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-11 points out a mismatch between the declaration and the definition
> of poly1305_core_setkey():
> 
> lib/crypto/poly1305-donna32.c:13:67: error: argument 2 of type ‘const u8[16]’ {aka ‘const unsigned char[16]’} with mismatched bound [-Werror=array-parameter=]
>    13 | void poly1305_core_setkey(struct poly1305_core_key *key, const u8 raw_key[16])
>       |                                                          ~~~~~~~~~^~~~~~~~~~~
> In file included from lib/crypto/poly1305-donna32.c:11:
> include/crypto/internal/poly1305.h:21:68: note: previously declared as ‘const u8 *’ {aka ‘const unsigned char *’}
>    21 | void poly1305_core_setkey(struct poly1305_core_key *key, const u8 *raw_key);
> 
> This is harmless in principle, as the calling conventions are the same,
> but the more specific prototype allows better type checking in the
> caller.
> 
> Change the declaration to match the actual function definition.
> The poly1305_simd_init() is a bit suspicious here, as it previously
> had a 32-byte argument type, but looks like it needs to take the
> 16-byte POLY1305_BLOCK_SIZE array instead.
> 
> Fixes: 1c08a104360f ("crypto: poly1305 - add new 32 and 64-bit generic versions")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/crypto/poly1305-glue.c    | 2 +-
>  arch/arm64/crypto/poly1305-glue.c  | 2 +-
>  arch/mips/crypto/poly1305-glue.c   | 2 +-
>  arch/x86/crypto/poly1305_glue.c    | 6 +++---
>  include/crypto/internal/poly1305.h | 3 ++-
>  include/crypto/poly1305.h          | 6 ++++--
>  lib/crypto/poly1305-donna32.c      | 3 ++-
>  lib/crypto/poly1305-donna64.c      | 3 ++-
>  lib/crypto/poly1305.c              | 3 ++-
>  9 files changed, 18 insertions(+), 12 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

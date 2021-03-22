Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71B7344F1C
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 19:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbhCVSwb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 14:52:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:36406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231264AbhCVSwA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Mar 2021 14:52:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0504761998;
        Mon, 22 Mar 2021 18:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616439120;
        bh=2fS+/Livsn8MwVQQPP8+bbzUCI4zhar3EDmM0iAhvjg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oMY1f8u/nYkN7rwfWVWIPU3qOBj2iwk1B11OkIX+fu5y4FQyVsyuIw6Q1UyYZUiI+
         x0RfQ6YXOS8C03ktJfHNq6iDFl3cvRsUdgaqe/EWlI91QQTyERXplXo9qeXqPy6XdV
         tqFP7ukR5U39YhVmv7gRG4LJeqtqQVSYRsXzOUtpSRspheU7/ZnVWGOkT/gxZoKy9+
         mbnElav8V4g1SEryS7MAN/I9V+r4HJn7apnUANOj+kpv8Ce+EMARlvFXRiOepBTFBS
         J+iYlNxkWcEXweI1Awwauuok/laM9xZ9lwO6C4yGuSzPb5/uX004uhrhwWiVyJ+2VS
         JruYM0RF0mUHw==
Received: by mail-ot1-f48.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so17011270otn.1;
        Mon, 22 Mar 2021 11:51:59 -0700 (PDT)
X-Gm-Message-State: AOAM531Kv0CGZjXVJMfzH6D8m1j7/jnPHH+PVXTla1cq3d311oNu4Xup
        sIPgcnZNu4f9VeieZgaa65aQMyn2Beb/GMFa/SM=
X-Google-Smtp-Source: ABdhPJxLN/vBjt2z77f4DHwfHWzR/2c4/ffbtlZ0Ogy2F1NFJ1rx4iLFRHoD7QGLJ0jOhdalSmkq+RMlp09MYFIqV4Q=
X-Received: by 2002:a9d:57cb:: with SMTP id q11mr1065771oti.108.1616439119206;
 Mon, 22 Mar 2021 11:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210322170542.1791154-1-arnd@kernel.org>
In-Reply-To: <20210322170542.1791154-1-arnd@kernel.org>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 22 Mar 2021 19:51:47 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGj+autwGM-Me7qNoORsux9Xz_1-P=7w4m-9vGMXwDq4Q@mail.gmail.com>
Message-ID: <CAMj1kXGj+autwGM-Me7qNoORsux9Xz_1-P=7w4m-9vGMXwDq4Q@mail.gmail.com>
Subject: Re: [PATCH] crypto: poly1305: fix poly1305_core_setkey() declaration
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
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
        Eric Biggers <ebiggers@google.com>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 22 Mar 2021 at 18:05, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> gcc-11 points out a mismatch between the declaration and the definition
> of poly1305_core_setkey():
>
> lib/crypto/poly1305-donna32.c:13:67: error: argument 2 of type =E2=80=98c=
onst u8[16]=E2=80=99 {aka =E2=80=98const unsigned char[16]=E2=80=99} with m=
ismatched bound [-Werror=3Darray-parameter=3D]
>    13 | void poly1305_core_setkey(struct poly1305_core_key *key, const u8=
 raw_key[16])
>       |                                                          ~~~~~~~~=
~^~~~~~~~~~~
> In file included from lib/crypto/poly1305-donna32.c:11:
> include/crypto/internal/poly1305.h:21:68: note: previously declared as =
=E2=80=98const u8 *=E2=80=99 {aka =E2=80=98const unsigned char *=E2=80=99}
>    21 | void poly1305_core_setkey(struct poly1305_core_key *key, const u8=
 *raw_key);
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

This looks ok to me. For historical reasons, the Poly1305 integration
is based on an unkeyed shash, and both the Poly1305 key and nonce are
passed as ordinary input, prepended to the actual data.
poly1305_simd_init() takes only the key but not the nonce, so it
should only be passed 16 bytes.

> Fixes: 1c08a104360f ("crypto: poly1305 - add new 32 and 64-bit generic ve=
rsions")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

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
>
> diff --git a/arch/arm/crypto/poly1305-glue.c b/arch/arm/crypto/poly1305-g=
lue.c
> index 3023c1acfa19..c31bd8f7c092 100644
> --- a/arch/arm/crypto/poly1305-glue.c
> +++ b/arch/arm/crypto/poly1305-glue.c
> @@ -29,7 +29,7 @@ void __weak poly1305_blocks_neon(void *state, const u8 =
*src, u32 len, u32 hibit)
>
>  static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
>
> -void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 *key)
> +void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POL=
Y1305_KEY_SIZE])
>  {
>         poly1305_init_arm(&dctx->h, key);
>         dctx->s[0] =3D get_unaligned_le32(key + 16);
> diff --git a/arch/arm64/crypto/poly1305-glue.c b/arch/arm64/crypto/poly13=
05-glue.c
> index 683de671741a..9c3d86e397bf 100644
> --- a/arch/arm64/crypto/poly1305-glue.c
> +++ b/arch/arm64/crypto/poly1305-glue.c
> @@ -25,7 +25,7 @@ asmlinkage void poly1305_emit(void *state, u8 *digest, =
const u32 *nonce);
>
>  static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
>
> -void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 *key)
> +void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POL=
Y1305_KEY_SIZE])
>  {
>         poly1305_init_arm64(&dctx->h, key);
>         dctx->s[0] =3D get_unaligned_le32(key + 16);
> diff --git a/arch/mips/crypto/poly1305-glue.c b/arch/mips/crypto/poly1305=
-glue.c
> index fc881b46d911..bc6110fb98e0 100644
> --- a/arch/mips/crypto/poly1305-glue.c
> +++ b/arch/mips/crypto/poly1305-glue.c
> @@ -17,7 +17,7 @@ asmlinkage void poly1305_init_mips(void *state, const u=
8 *key);
>  asmlinkage void poly1305_blocks_mips(void *state, const u8 *src, u32 len=
, u32 hibit);
>  asmlinkage void poly1305_emit_mips(void *state, u8 *digest, const u32 *n=
once);
>
> -void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 *key)
> +void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POL=
Y1305_KEY_SIZE])
>  {
>         poly1305_init_mips(&dctx->h, key);
>         dctx->s[0] =3D get_unaligned_le32(key + 16);
> diff --git a/arch/x86/crypto/poly1305_glue.c b/arch/x86/crypto/poly1305_g=
lue.c
> index 646da46e8d10..1dfb8af48a3c 100644
> --- a/arch/x86/crypto/poly1305_glue.c
> +++ b/arch/x86/crypto/poly1305_glue.c
> @@ -16,7 +16,7 @@
>  #include <asm/simd.h>
>
>  asmlinkage void poly1305_init_x86_64(void *ctx,
> -                                    const u8 key[POLY1305_KEY_SIZE]);
> +                                    const u8 key[POLY1305_BLOCK_SIZE]);
>  asmlinkage void poly1305_blocks_x86_64(void *ctx, const u8 *inp,
>                                        const size_t len, const u32 padbit=
);
>  asmlinkage void poly1305_emit_x86_64(void *ctx, u8 mac[POLY1305_DIGEST_S=
IZE],
> @@ -81,7 +81,7 @@ static void convert_to_base2_64(void *ctx)
>         state->is_base2_26 =3D 0;
>  }
>
> -static void poly1305_simd_init(void *ctx, const u8 key[POLY1305_KEY_SIZE=
])
> +static void poly1305_simd_init(void *ctx, const u8 key[POLY1305_BLOCK_SI=
ZE])
>  {
>         poly1305_init_x86_64(ctx, key);
>  }
> @@ -129,7 +129,7 @@ static void poly1305_simd_emit(void *ctx, u8 mac[POLY=
1305_DIGEST_SIZE],
>                 poly1305_emit_avx(ctx, mac, nonce);
>  }
>
> -void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 *key)
> +void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POL=
Y1305_KEY_SIZE])
>  {
>         poly1305_simd_init(&dctx->h, key);
>         dctx->s[0] =3D get_unaligned_le32(&key[16]);
> diff --git a/include/crypto/internal/poly1305.h b/include/crypto/internal=
/poly1305.h
> index 064e52ca5248..196aa769f296 100644
> --- a/include/crypto/internal/poly1305.h
> +++ b/include/crypto/internal/poly1305.h
> @@ -18,7 +18,8 @@
>   * only the =CE=B5-almost-=E2=88=86-universal hash function (not the ful=
l MAC) is computed.
>   */
>
> -void poly1305_core_setkey(struct poly1305_core_key *key, const u8 *raw_k=
ey);
> +void poly1305_core_setkey(struct poly1305_core_key *key,
> +                         const u8 raw_key[POLY1305_BLOCK_SIZE]);
>  static inline void poly1305_core_init(struct poly1305_state *state)
>  {
>         *state =3D (struct poly1305_state){};
> diff --git a/include/crypto/poly1305.h b/include/crypto/poly1305.h
> index f1f67fc749cf..090692ec3bc7 100644
> --- a/include/crypto/poly1305.h
> +++ b/include/crypto/poly1305.h
> @@ -58,8 +58,10 @@ struct poly1305_desc_ctx {
>         };
>  };
>
> -void poly1305_init_arch(struct poly1305_desc_ctx *desc, const u8 *key);
> -void poly1305_init_generic(struct poly1305_desc_ctx *desc, const u8 *key=
);
> +void poly1305_init_arch(struct poly1305_desc_ctx *desc,
> +                       const u8 key[POLY1305_KEY_SIZE]);
> +void poly1305_init_generic(struct poly1305_desc_ctx *desc,
> +                          const u8 key[POLY1305_KEY_SIZE]);
>
>  static inline void poly1305_init(struct poly1305_desc_ctx *desc, const u=
8 *key)
>  {
> diff --git a/lib/crypto/poly1305-donna32.c b/lib/crypto/poly1305-donna32.=
c
> index 3cc77d94390b..7fb71845cc84 100644
> --- a/lib/crypto/poly1305-donna32.c
> +++ b/lib/crypto/poly1305-donna32.c
> @@ -10,7 +10,8 @@
>  #include <asm/unaligned.h>
>  #include <crypto/internal/poly1305.h>
>
> -void poly1305_core_setkey(struct poly1305_core_key *key, const u8 raw_ke=
y[16])
> +void poly1305_core_setkey(struct poly1305_core_key *key,
> +                         const u8 raw_key[POLY1305_BLOCK_SIZE])
>  {
>         /* r &=3D 0xffffffc0ffffffc0ffffffc0fffffff */
>         key->key.r[0] =3D (get_unaligned_le32(&raw_key[0])) & 0x3ffffff;
> diff --git a/lib/crypto/poly1305-donna64.c b/lib/crypto/poly1305-donna64.=
c
> index 6ae181bb4345..d34cf4053668 100644
> --- a/lib/crypto/poly1305-donna64.c
> +++ b/lib/crypto/poly1305-donna64.c
> @@ -12,7 +12,8 @@
>
>  typedef __uint128_t u128;
>
> -void poly1305_core_setkey(struct poly1305_core_key *key, const u8 raw_ke=
y[16])
> +void poly1305_core_setkey(struct poly1305_core_key *key,
> +                         const u8 raw_key[POLY1305_BLOCK_SIZE])
>  {
>         u64 t0, t1;
>
> diff --git a/lib/crypto/poly1305.c b/lib/crypto/poly1305.c
> index 9d2d14df0fee..26d87fc3823e 100644
> --- a/lib/crypto/poly1305.c
> +++ b/lib/crypto/poly1305.c
> @@ -12,7 +12,8 @@
>  #include <linux/module.h>
>  #include <asm/unaligned.h>
>
> -void poly1305_init_generic(struct poly1305_desc_ctx *desc, const u8 *key=
)
> +void poly1305_init_generic(struct poly1305_desc_ctx *desc,
> +                          const u8 key[POLY1305_KEY_SIZE])
>  {
>         poly1305_core_setkey(&desc->core_r, key);
>         desc->s[0] =3D get_unaligned_le32(key + 16);
> --
> 2.29.2
>

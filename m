Return-Path: <linux-mips+bounces-8585-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6EFA8785A
	for <lists+linux-mips@lfdr.de>; Mon, 14 Apr 2025 09:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B06A63AABE0
	for <lists+linux-mips@lfdr.de>; Mon, 14 Apr 2025 07:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515311AA1E8;
	Mon, 14 Apr 2025 07:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOKguFF2"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197F725776;
	Mon, 14 Apr 2025 07:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744614250; cv=none; b=McTPYhbljNm9nuUva2ebsstgpudyfNdPXkTl6AFAeJZkKT3t3jemWC1qahn9YLGNwBDAd0eLxuW6WTZZ5b+GmU14bgiAifnGy3h99BIu4n5jNOGIsA0R3f+nd8jo/KEwgDJUIrPBN7gLGX0/o++fhdaSauzOEN8tfX0dqk90ip8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744614250; c=relaxed/simple;
	bh=icC6pKxwkk63ydYys6oK1ioyyV4qcPSvCmG0NKiQefg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=erHj8vLjA+4ylF9ndK/dbQyLbkeerQ3iRxZA4C4nITyJ49UMeEty1qMXYtDaHZmk6eY13VuvqTmOJtCTVJGE25PZoW2ZwDbrUjs9HdcGLIvDyskbf5cFLa07Hk+ek1hcX9zlg2EodPbPLkXpIZa+uyBgs0/Zfnb4tXEgoO0dYt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOKguFF2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969E8C4CEEC;
	Mon, 14 Apr 2025 07:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744614249;
	bh=icC6pKxwkk63ydYys6oK1ioyyV4qcPSvCmG0NKiQefg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EOKguFF2VxI82DMzK1Hz/A36DdD6tyL16iCFnyNocB04XiHAEx2Usjf/l6jDguOkg
	 x3x3GRKL3w5pPVXZXuWw8qka//Ftfz2gh2c3JWvNBxmk2NWEGeFWbV1va2ur/nm60z
	 GY7tun/dRfez4UgI3Y+aeNdjEkOUTPStzp/a77Huyjwo9YDobX5TXngfK1JnmNckvv
	 Pxe1thYVFZ8sjvAerBTj+XrQO6k9DRsERd4IDnLmszh5hTBhX9R1hMavHavnnO/RBa
	 8vBY9W5SWdJavz0DzdjfjrDYaFhxI5GAVDy48t8XDSSp72bBnRzw+3Sv8wRiahxeGv
	 Hqppo3tkdiUcg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-549946c5346so4563449e87.2;
        Mon, 14 Apr 2025 00:04:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMy9NkNs+FsFrRXfyOYjPqojV6Bx3otIbNwMMrCWFQDqtm8P4ct9hzToHmD5VQMtyGKsRdBOMYdMewivo=@vger.kernel.org, AJvYcCW55GQrRD3piXZUzy5eCNXDqKiA4V9RbaidzJ8hu6evyUaOP5nLhw+YseqAyiPGlrrZzJQX2H/yS+N2cw==@vger.kernel.org, AJvYcCWdBD5JvLx2ACqPzNccHi/291TEYc0hiVJSoICbEVHeet40SjW1AXPNroaVcJbBkL8PsXITiZnQJH4tRA==@vger.kernel.org, AJvYcCX7gYMYpZcZntVkxgQ61OyEwf45v6t+lVYA97SnpQXvHXv8Pq/s1fpCA5OsAYq39ZBox+6V/fXvFVg9CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYWZSK+UmsGZJ/I+GU/FUXwvfeXKAtPVlp6y0aV2n5ot0DYDBF
	yqHm+4VZ5bemkqf3tHOtzCRHXBAeGDw8h+50aRvJDkBlJtlJwCDVXq6NozX63TKWWN3UoTkUaPn
	PbXn2nXZoIwJ788qtymL2OH5egfo=
X-Google-Smtp-Source: AGHT+IEoYXlejAjxOwys1OLaOhDBK3py6wT/Y0QJYW6cfE2lr6fzReeEdjo+qSenumfyEoIhuh4zXG1xEt+R7ijOO8Y=
X-Received: by 2002:a05:6512:ba7:b0:546:2f7a:38c4 with SMTP id
 2adb3069b0e04-54d45292cd1mr2746051e87.13.1744614247886; Mon, 14 Apr 2025
 00:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413154350.10819-1-ebiggers@kernel.org>
In-Reply-To: <20250413154350.10819-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 14 Apr 2025 09:03:56 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGhG6PKVzqmVT6qrQ+GPkk_oxXE5d-ut0swi49V2=o-wQ@mail.gmail.com>
X-Gm-Features: ATxdqUEnYfS7U-gc63ktCKYv5CbPjrmaDdsHdKGekiLY6qQSH14mpXQi1o5UxKs
Message-ID: <CAMj1kXGhG6PKVzqmVT6qrQ+GPkk_oxXE5d-ut0swi49V2=o-wQ@mail.gmail.com>
Subject: Re: [PATCH] lib/crc: make the CPU feature static keys __ro_after_init
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Apr 2025 at 17:44, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> All of the CRC library's CPU feature static_keys are initialized by
> initcalls and never change afterwards, so there's no need for them to be
> in the regular .data section.  Put them in .data..ro_after_init instead.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>
> I'm planning to take this via the crc tree.
>
>  arch/arm/lib/crc-t10dif-glue.c       | 4 ++--
>  arch/arm/lib/crc32-glue.c            | 4 ++--
>  arch/arm64/lib/crc-t10dif-glue.c     | 4 ++--
>  arch/loongarch/lib/crc32-loongarch.c | 2 +-
>  arch/mips/lib/crc32-mips.c           | 2 +-
>  arch/powerpc/lib/crc-t10dif-glue.c   | 2 +-
>  arch/powerpc/lib/crc32-glue.c        | 2 +-
>  arch/s390/lib/crc32-glue.c           | 2 +-
>  arch/sparc/lib/crc32_glue.c          | 2 +-
>  arch/x86/lib/crc-t10dif-glue.c       | 2 +-
>  arch/x86/lib/crc32-glue.c            | 4 ++--
>  arch/x86/lib/crc64-glue.c            | 2 +-
>  12 files changed, 16 insertions(+), 16 deletions(-)
>


Acked-by: Ard Biesheuvel <ardb@kernel.org>



> diff --git a/arch/arm/lib/crc-t10dif-glue.c b/arch/arm/lib/crc-t10dif-glue.c
> index 6efad3d78284..382437094bdd 100644
> --- a/arch/arm/lib/crc-t10dif-glue.c
> +++ b/arch/arm/lib/crc-t10dif-glue.c
> @@ -14,12 +14,12 @@
>  #include <crypto/internal/simd.h>
>
>  #include <asm/neon.h>
>  #include <asm/simd.h>
>
> -static DEFINE_STATIC_KEY_FALSE(have_neon);
> -static DEFINE_STATIC_KEY_FALSE(have_pmull);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
>
>  #define CRC_T10DIF_PMULL_CHUNK_SIZE    16U
>
>  asmlinkage u16 crc_t10dif_pmull64(u16 init_crc, const u8 *buf, size_t len);
>  asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
> diff --git a/arch/arm/lib/crc32-glue.c b/arch/arm/lib/crc32-glue.c
> index 4340351dbde8..7ef7db9c0de7 100644
> --- a/arch/arm/lib/crc32-glue.c
> +++ b/arch/arm/lib/crc32-glue.c
> @@ -16,12 +16,12 @@
>
>  #include <asm/hwcap.h>
>  #include <asm/neon.h>
>  #include <asm/simd.h>
>
> -static DEFINE_STATIC_KEY_FALSE(have_crc32);
> -static DEFINE_STATIC_KEY_FALSE(have_pmull);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
>
>  #define PMULL_MIN_LEN  64      /* min size of buffer for pmull functions */
>
>  asmlinkage u32 crc32_pmull_le(const u8 buf[], u32 len, u32 init_crc);
>  asmlinkage u32 crc32_armv8_le(u32 init_crc, const u8 buf[], u32 len);
> diff --git a/arch/arm64/lib/crc-t10dif-glue.c b/arch/arm64/lib/crc-t10dif-glue.c
> index bacd18f23168..99d0b5668a28 100644
> --- a/arch/arm64/lib/crc-t10dif-glue.c
> +++ b/arch/arm64/lib/crc-t10dif-glue.c
> @@ -15,12 +15,12 @@
>  #include <crypto/internal/simd.h>
>
>  #include <asm/neon.h>
>  #include <asm/simd.h>
>
> -static DEFINE_STATIC_KEY_FALSE(have_asimd);
> -static DEFINE_STATIC_KEY_FALSE(have_pmull);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_asimd);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
>
>  #define CRC_T10DIF_PMULL_CHUNK_SIZE    16U
>
>  asmlinkage void crc_t10dif_pmull_p8(u16 init_crc, const u8 *buf, size_t len,
>                                     u8 out[16]);
> diff --git a/arch/loongarch/lib/crc32-loongarch.c b/arch/loongarch/lib/crc32-loongarch.c
> index c44ee4f32557..8e6d1f517e73 100644
> --- a/arch/loongarch/lib/crc32-loongarch.c
> +++ b/arch/loongarch/lib/crc32-loongarch.c
> @@ -24,11 +24,11 @@ do {                                                        \
>  } while (0)
>
>  #define CRC32(crc, value, size)                _CRC32(crc, value, size, crc)
>  #define CRC32C(crc, value, size)       _CRC32(crc, value, size, crcc)
>
> -static DEFINE_STATIC_KEY_FALSE(have_crc32);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
>
>  u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
>  {
>         if (!static_branch_likely(&have_crc32))
>                 return crc32_le_base(crc, p, len);
> diff --git a/arch/mips/lib/crc32-mips.c b/arch/mips/lib/crc32-mips.c
> index 676a4b3e290b..84df361e7181 100644
> --- a/arch/mips/lib/crc32-mips.c
> +++ b/arch/mips/lib/crc32-mips.c
> @@ -60,11 +60,11 @@ do {                                                        \
>         _CRC32(crc, value, size, crc32)
>
>  #define CRC32C(crc, value, size) \
>         _CRC32(crc, value, size, crc32c)
>
> -static DEFINE_STATIC_KEY_FALSE(have_crc32);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
>
>  u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
>  {
>         if (!static_branch_likely(&have_crc32))
>                 return crc32_le_base(crc, p, len);
> diff --git a/arch/powerpc/lib/crc-t10dif-glue.c b/arch/powerpc/lib/crc-t10dif-glue.c
> index f411b0120cc5..ddd5c4088f50 100644
> --- a/arch/powerpc/lib/crc-t10dif-glue.c
> +++ b/arch/powerpc/lib/crc-t10dif-glue.c
> @@ -19,11 +19,11 @@
>  #define VMX_ALIGN              16
>  #define VMX_ALIGN_MASK         (VMX_ALIGN-1)
>
>  #define VECTOR_BREAKPOINT      64
>
> -static DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
>
>  u32 __crct10dif_vpmsum(u32 crc, unsigned char const *p, size_t len);
>
>  u16 crc_t10dif_arch(u16 crci, const u8 *p, size_t len)
>  {
> diff --git a/arch/powerpc/lib/crc32-glue.c b/arch/powerpc/lib/crc32-glue.c
> index dbd10f339183..42f2dd3c85dd 100644
> --- a/arch/powerpc/lib/crc32-glue.c
> +++ b/arch/powerpc/lib/crc32-glue.c
> @@ -11,11 +11,11 @@
>  #define VMX_ALIGN              16
>  #define VMX_ALIGN_MASK         (VMX_ALIGN-1)
>
>  #define VECTOR_BREAKPOINT      512
>
> -static DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
>
>  u32 __crc32c_vpmsum(u32 crc, const u8 *p, size_t len);
>
>  u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
>  {
> diff --git a/arch/s390/lib/crc32-glue.c b/arch/s390/lib/crc32-glue.c
> index 124214a27340..8f20a8e595c3 100644
> --- a/arch/s390/lib/crc32-glue.c
> +++ b/arch/s390/lib/crc32-glue.c
> @@ -16,11 +16,11 @@
>
>  #define VX_MIN_LEN             64
>  #define VX_ALIGNMENT           16L
>  #define VX_ALIGN_MASK          (VX_ALIGNMENT - 1)
>
> -static DEFINE_STATIC_KEY_FALSE(have_vxrs);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vxrs);
>
>  /*
>   * DEFINE_CRC32_VX() - Define a CRC-32 function using the vector extension
>   *
>   * Creates a function to perform a particular CRC-32 computation. Depending
> diff --git a/arch/sparc/lib/crc32_glue.c b/arch/sparc/lib/crc32_glue.c
> index a70752c729cf..d34e7cc7e1a1 100644
> --- a/arch/sparc/lib/crc32_glue.c
> +++ b/arch/sparc/lib/crc32_glue.c
> @@ -15,11 +15,11 @@
>  #include <linux/kernel.h>
>  #include <linux/crc32.h>
>  #include <asm/pstate.h>
>  #include <asm/elf.h>
>
> -static DEFINE_STATIC_KEY_FALSE(have_crc32c_opcode);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32c_opcode);
>
>  u32 crc32_le_arch(u32 crc, const u8 *data, size_t len)
>  {
>         return crc32_le_base(crc, data, len);
>  }
> diff --git a/arch/x86/lib/crc-t10dif-glue.c b/arch/x86/lib/crc-t10dif-glue.c
> index f89c335cde3c..d073b3678edc 100644
> --- a/arch/x86/lib/crc-t10dif-glue.c
> +++ b/arch/x86/lib/crc-t10dif-glue.c
> @@ -7,11 +7,11 @@
>
>  #include <linux/crc-t10dif.h>
>  #include <linux/module.h>
>  #include "crc-pclmul-template.h"
>
> -static DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
>
>  DECLARE_CRC_PCLMUL_FUNCS(crc16_msb, u16);
>
>  u16 crc_t10dif_arch(u16 crc, const u8 *p, size_t len)
>  {
> diff --git a/arch/x86/lib/crc32-glue.c b/arch/x86/lib/crc32-glue.c
> index e3f93b17ac3f..e6a6285cfca8 100644
> --- a/arch/x86/lib/crc32-glue.c
> +++ b/arch/x86/lib/crc32-glue.c
> @@ -9,12 +9,12 @@
>
>  #include <linux/crc32.h>
>  #include <linux/module.h>
>  #include "crc-pclmul-template.h"
>
> -static DEFINE_STATIC_KEY_FALSE(have_crc32);
> -static DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
>
>  DECLARE_CRC_PCLMUL_FUNCS(crc32_lsb, u32);
>
>  u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
>  {
> diff --git a/arch/x86/lib/crc64-glue.c b/arch/x86/lib/crc64-glue.c
> index b0e1b719ecbf..1214ee726c16 100644
> --- a/arch/x86/lib/crc64-glue.c
> +++ b/arch/x86/lib/crc64-glue.c
> @@ -7,11 +7,11 @@
>
>  #include <linux/crc64.h>
>  #include <linux/module.h>
>  #include "crc-pclmul-template.h"
>
> -static DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
>
>  DECLARE_CRC_PCLMUL_FUNCS(crc64_msb, u64);
>  DECLARE_CRC_PCLMUL_FUNCS(crc64_lsb, u64);
>
>  u64 crc64_be_arch(u64 crc, const u8 *p, size_t len)
>
> base-commit: e8c24520a1338f938774268a9bafb679ace93b76
> --
> 2.49.0
>


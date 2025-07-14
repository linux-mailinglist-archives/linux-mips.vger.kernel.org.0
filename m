Return-Path: <linux-mips+bounces-9806-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 413B5B03590
	for <lists+linux-mips@lfdr.de>; Mon, 14 Jul 2025 07:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F8DC189AB55
	for <lists+linux-mips@lfdr.de>; Mon, 14 Jul 2025 05:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEAE1F4C8E;
	Mon, 14 Jul 2025 05:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lzd55PdU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4A51F541E;
	Mon, 14 Jul 2025 05:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752470546; cv=none; b=D3fZ66kp241uTZrOcE8Kpfu12qfSzwq8kyPDJy4emR+Bw+80A/VTFSEH7kCntZfNWJYnoobp5j7kY7oALIHlIXDrrnbPmV58oL5gbZUpxf1V+YL3Zsj7TqfcXhwppGVv+xuMsuwixIgKyXbcBhSn1Vcr+x4QHzArM1lBljIkXw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752470546; c=relaxed/simple;
	bh=pAb5wRbhQET+kmUSyBJ7QX6Te7INTWO7qdGK9VkXql0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9DIj59t/0BOu+OmHBr8Tds+DPOnaKja7sSr2cjDS0fHRZ2+B/506MSURdvTwJPYNlc9w4uWn2/6n89ikvFMuPmPa/oFoBav2H2sUfvD8PRcJyjeLIKXFx1KJ4zZm15to0X2M3aIyoGumRLe3F4g8E4ij7oX7ML/3KaUY5ec6L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lzd55PdU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EE0C4CEF0;
	Mon, 14 Jul 2025 05:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752470545;
	bh=pAb5wRbhQET+kmUSyBJ7QX6Te7INTWO7qdGK9VkXql0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lzd55PdUdq+c+mAd5uySwMSoUH+kaA4A1+lO4Bp2rWjPOuURmtFTKJqiu8+7oHe/2
	 IWd04Cz6zEMUQGxVCULy4y7Pt258a8kqHbqQ9KRbbYTL89XmaCBSNKFzrQ4lSDmxz6
	 Tn1fhnyzKHfp0lVx3oVYAYX0CFijcSHtacycMNx1oM1cSeYl06AGSSe68K4TL24j/q
	 SndjW3Hf+al+rTdChZ/5v3b+HTWeEzWXggdgAGknnrTSFiaHT1uky0a6o1NuEQsFmJ
	 hO719WuReX0D1U/zm/1TrSO2KoWdJXzHoRvgs2M7wj2fT/zaF4pcbrq0ecVLli1GES
	 XIeDW4bt8QHAg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so48453551fa.1;
        Sun, 13 Jul 2025 22:22:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVlXWO/lkTxZMENufNd7XnbDdLuTOSoEcj+3HM4fKrBaod9C+Sz4K2qPjupVphR0srYoNP9TeEE1iSzxV4=@vger.kernel.org, AJvYcCW+PVyHLgLyinnft1PaZuEwSGT4e5XuF4/sKKTzV1JYnCz48k61H+f+wYjreHlxD17a6FCnc+BtG0K/jg==@vger.kernel.org, AJvYcCWrnhbw68hBNmq77pCaun+lUYkhvVnh34wZwQL6m6Nh1+I2KWc1rGo9y3m+Q/rax+zWJ0BHhtbgV/R9AA==@vger.kernel.org, AJvYcCX2CRINcat4lJJH+yaIIpD6K1VfpmftiS7lUqwWPiMM9GoXxNBgTuyUcQYFf+xyIR67nZ1MogcEQ3O6bA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyozEcLBuVrJ4CewM920lv1DncONOAUgSR+VolhXOoaPpDHiMXo
	68I1ujX+WgAXKVXxUIQBQKYGPlrR/oLgSSTFAiPsgZz7oTryEMpFeKuywW85HWkGCI1Y+wdL5eL
	SKWiBU8DqM0YVgDELJpQs2Q7a9K8+iek=
X-Google-Smtp-Source: AGHT+IF8eKcSow8wXiBWe1ZtHXBbfzA+mJh/QYc9UT+26PKpYbp48jE/SYcyCuO5sRz/aNI8XoUCHiEWvfP2lMj1cew=
X-Received: by 2002:a2e:b894:0:b0:30d:c4c3:eafa with SMTP id
 38308e7fff4ca-330520af931mr41229641fa.7.1752470543799; Sun, 13 Jul 2025
 22:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250712232329.818226-1-ebiggers@kernel.org>
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 14 Jul 2025 15:22:12 +1000
X-Gmail-Original-Message-ID: <CAMj1kXHUY_1nF8_Yiqn9K-G7nkOPQgH5rkmhcHem2pPsxKaQVQ@mail.gmail.com>
X-Gm-Features: Ac12FXyawDsE4qmZuudtL0JGLEW7eYqwCyaWBTQgeIZfWtrJNQHxtUbS816vJ3g
Message-ID: <CAMj1kXHUY_1nF8_Yiqn9K-G7nkOPQgH5rkmhcHem2pPsxKaQVQ@mail.gmail.com>
Subject: Re: [PATCH 00/26] SHA-1 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Jul 2025 at 09:26, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series is also available at:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha1-lib-v1
>
> Patches 1-14 reorganize the kernel's SHA-1 code to be consistent with
> the way the SHA-2 code is now organized:
>
> - Add SHA-1 and HMAC-SHA1 library functions.
> - Make the SHA-1 (and HMAC-SHA1) library functions use the existing
>   architecture-optimized SHA-1 code, which is moved into lib/crypto/.
> - Reimplement the old-school crypto API's "sha1" and "hmac(sha1)"
>   algorithms on top of the SHA-1 and HMAC-SHA1 library functions.
>
> The diffstat for that part is:
>
>     65 files changed, 1052 insertions(+), 1582 deletions(-)
>
> This hopefully should look quite boring and familiar by now, as
> essentially the same cleanup was already applied to SHA-2.
>
> Patch 15 adds sha1_kunit.
>
> Note that while SHA-1 is a legacy algorithm, it still has many in-kernel
> users for legacy protocols.  So it's not like we'll be able to remove
> the SHA-1 code from the kernel anytime soon.  And some of these users
> are currently having to jump through some *major* hoops to work around
> the limitations of the old-school crypto API.  The library API greatly
> simplifies things, and it makes the SHA-1 code consistent with the SHA-2
> code.  So, IMO it's well worth doing this reorganization of the SHA-1
> code, even though SHA-1 is a legacy algorithm.
>
> To show this even more clearly, patches 16-26 convert various users to
> use the SHA-1 library API (or both SHA-1 and SHA-2, in the case of some
> users that use both algorithms).  The diffstat for that part is:
>
>     27 files changed, 169 insertions(+), 903 deletions(-)
>
> For 6.17, I'd like to take patches 1-15 at the most.  Patches 16-26
> would be for later, and I'll probably resend them individually later for
> subsystem maintainers to take.
>
> Eric Biggers (26):
>   crypto: x86/sha1 - Rename conflicting symbol
>   lib/crypto: sha1: Rename sha1_init() to sha1_init_raw()
>   lib/crypto: sha1: Add SHA-1 library functions
>   lib/crypto: sha1: Add HMAC support
>   crypto: sha1 - Wrap library and add HMAC support
>   crypto: sha1 - Use same state format as legacy drivers
>   lib/crypto: arm/sha1: Migrate optimized code into library
>   lib/crypto: arm64/sha1: Migrate optimized code into library
>   lib/crypto: mips/sha1: Migrate optimized code into library
>   lib/crypto: powerpc/sha1: Migrate optimized code into library
>   lib/crypto: s390/sha1: Migrate optimized code into library
>   lib/crypto: sparc/sha1: Migrate optimized code into library
>   lib/crypto: x86/sha1: Migrate optimized code into library
>   crypto: sha1 - Remove sha1_base.h
>   lib/crypto: tests: Add KUnit tests for SHA-1 and HMAC-SHA1
>   bpf: Use sha1() instead of sha1_transform() in bpf_prog_calc_tag()
>   sctp: Use HMAC-SHA1 and HMAC-SHA256 library functions
>   ipv6: sr: Use HMAC-SHA1 and HMAC-SHA256 library functions
>   tee: Use SHA-1 library instead of crypto_shash
>   lib/digsig: Use SHA-1 library instead of crypto_shash
>   drm/bridge: it6505: Use SHA-1 library instead of crypto_shash
>   nfc: s3fwrn5: Use SHA-1 library instead of crypto_shash
>   ppp: mppe: Use SHA-1 library instead of crypto_shash
>   KEYS: trusted_tpm1: Use SHA-1 library instead of crypto_shash
>   ipv6: Switch to higher-level SHA-1 functions
>   lib/crypto: sha1: Remove low-level functions from API
>
...
>  92 files changed, 1472 insertions(+), 2474 deletions(-)

Again, the diffstat speaks for itself.

For the series,

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>


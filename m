Return-Path: <linux-mips+bounces-9447-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E62FBAE2441
	for <lists+linux-mips@lfdr.de>; Fri, 20 Jun 2025 23:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ACAA1C219EB
	for <lists+linux-mips@lfdr.de>; Fri, 20 Jun 2025 21:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB08238C19;
	Fri, 20 Jun 2025 21:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sKmi1RUP"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793DF223DCE;
	Fri, 20 Jun 2025 21:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750455743; cv=none; b=fqfICg/dXcEjof9+JVMb/SmKvxzB0kFUWWGhAp5RTMxr2s+hkuLXhUmPMdL81gDrKCNE68yVZvUnHvXrXOwOV1wGuo219f8D90NGpGAtMWC+WTfDE3pzCYfs1nBGNvxXpepHFNn5H0nZPyjcpfbskyQZ+shnWUcEEk1ot1uwbf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750455743; c=relaxed/simple;
	bh=MDo5BKeBcgPmn7NbWD5LBoZwmlxlCqcmLzLHc7Iu6cI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbLQ8stLcV1Q6vr+dSbhG9J7qtpWKW8PXzC1beCHiffAp/P1yqNjIIT7Vjd7ZjJev7qb5FLr0GFJGvWhyQmTYyEuS9ku8MM5f+KbfbTiM5IVQ3LuHxZkcjMKaIFZHCrzYpAeCVhEGe+hiMQPbXHRy9lOZZLOgDBKNhNJkM4QQWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sKmi1RUP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12075C4CEF2;
	Fri, 20 Jun 2025 21:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750455743;
	bh=MDo5BKeBcgPmn7NbWD5LBoZwmlxlCqcmLzLHc7Iu6cI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sKmi1RUPHyAecYUQbi/pwabxNAlkzVrYy6AqvldSnOqjnXiM9ah+WBuLx7p589i8B
	 Go9hOZzmo6SL1mXIwf5oNijBXoOkBIpS4Bddo1vN5mK5C3J94IcjGCIDbwax1Cslxr
	 Am4iJZS1nWf2FLdVmjPKpNrcv9keYcbFNRfgqiCusKYbwnqb03m793abgSaehaySoe
	 +7xY52/d6D2lfCxehbI7Efw3pPUcbBESZp1+/9FIoJaHnRh7uNLOG8VETApljsEq5E
	 UHT44cYBnfsXUJ3v1R6G2oLonLdTTDn7UZNm5+n0E0fzknE2tlOPILY8j0ROsnY5PG
	 MW6O2Q8TSWK6g==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5533303070cso2227524e87.2;
        Fri, 20 Jun 2025 14:42:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8+s9ZRnGSAfopNJayTsaeq6XvMT/TF4+mpRk/hg1YGP5I/308rIhYlt9sGx7dNTLOmfHhYZQS0UGlig==@vger.kernel.org, AJvYcCWnLqbu3NcJwtJqXTZJ3fltiSfAVlo6kp0WjsxQnnmH0js8ZVyzIOh2zJEmdv0rpBOfeCzpFWuqqg9VCA==@vger.kernel.org, AJvYcCXDS8chZU4s63eWTvZ1Dm3z/GwX7gHH2golwJ09KvtpF783uThLiuFdM31oObC2pY9JBFtNjmTeR2Tpbw==@vger.kernel.org, AJvYcCXbYtk47KhG2YhoYinGeamXD/vx9OCx3aviPrlhLx6xYldoGab1n4vTKKbK/MgZCMD6x1dCvH10F0jSh/A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl3hsOJlKoylU+urbAevXlaVRqwC6uShRMaii1paDSd5cgtIgI
	I+Zx5LNd4BAAZ7JO0/kBlGXIgAxOSoRCc3gA1TvYC6vW112y6LYPcY039VLZM8c42TygQLgIzQN
	TF+hMp8raSrUSpOMH8U7V7TaJsUUgpQU=
X-Google-Smtp-Source: AGHT+IF4zL8HzdSoyp3X55tccHF1RCClcd5RW2imn5+lno/a8Scx+LS0VpX+b6I1a2EEkQVz388BFVI8Z0Ese3QFfg0=
X-Received: by 2002:a05:6512:3f22:b0:553:a32a:6c2 with SMTP id
 2adb3069b0e04-553e3b99756mr1583899e87.6.1750455741405; Fri, 20 Jun 2025
 14:42:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org>
In-Reply-To: <20250616014019.415791-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 20 Jun 2025 23:42:09 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEun-5OnM9tUEkG31aHjhAJn=fXrdQTqSJTBC1idZhoqQ@mail.gmail.com>
X-Gm-Features: AX0GCFv7xLQ-CGFr1i8AgPSK06Jy3OHs0QlN0RpC7Mpe2EtNiMuW6iQTuZTZV3s
Message-ID: <CAMj1kXEun-5OnM9tUEkG31aHjhAJn=fXrdQTqSJTBC1idZhoqQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Jun 2025 at 03:41, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series applies to v6.16-rc1 and is targeting the libcrypto-next
> tree.  It is also available at:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha512-lib-v2
>
> This series adds support for SHA-384, SHA-512, HMAC-SHA384, and
> HMAC-SHA512 to lib/crypto/.  The new functions take advantage of the
> kernel's existing architecture-optimized implementations of the SHA-512
> compression function.  The new functions are fully tested using KUnit.
>
> To avoid duplicating all arch-optimized implementations of the SHA-512
> compression function (~3000 lines of code total), they are moved into
> lib/crypto/ rather than copied.  To make the "sha384", "sha512",
> "hmac(sha384)", and "hmac(sha512)" crypto_shash algorithms in the
> old-school crypto API continue to be properly optimized after that, they
> are reimplemented on top of lib/crypto/, which is straightforward.
>
> The following lists some of the design choices and conventions that I've
> followed in more detail.  Where these differ from the code or APIs for
> other algorithms (e.g., SHA-256 in some cases), I'd like to do it this
> way going forward and plan to fix up the other algorithms accordingly:
>
> - APIs are fully documented with kerneldoc comments.
>
> - APIs cannot fail, and return void.
>
> - APIs work in all contexts.  This doesn't mean that they *should* be
>   called in all contexts, but rather they always just work as expected.
>
> - Tests are KUnit tests, and they are fairly thorough (more thorough
>   than crypto/testmgr.c) and also optionally include benchmarks.
>
> - Architecture-optimized code is integrated the same way I'm doing it
>   for lib/crc/: it's in subdirectories lib/crypto/$(SRCARCH), it's
>   enabled by default, and it's inlined into the same module as the
>   generic code.  This solves a number of problems; for more details, see
>   https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org
>
> - HMAC support is a first-class citizen.
>
> - APIs handle zeroization, when applicable.
>
> - Message contexts are *_ctx instead of *_state.  It's shorter, avoids
>   ambiguity with the compression function state, and matches OpenSSL.
>
> - Length arguments are size_t, are in bytes, are named len or *_len, and
>   immediately follow the corresponding buffer.  "Object" being operated
>   on is first argument; outputs otherwise follow inputs.
>
> - The structures for different algorithms use different types, which
>   prevents usage errors where functions are mixed up between algorithms.
>
> - The compression function state is strongly typed, not a plain array.
>
> Changed in v2:
> - Added "crypto: sha512 - use same state format as legacy drivers"
> - Fixed build on user-mode Linux
> - Fixed W=1 build warning by adding <linux/export.h>
> - Optimized __sha512_final() and __hmac_sha512_final() slightly
>
> Eric Biggers (17):
>   crypto: sha512 - rename conflicting symbols
>   lib/crypto/sha512: add support for SHA-384 and SHA-512
>   lib/crypto/sha512: add HMAC-SHA384 and HMAC-SHA512 support
>   lib/crypto/sha512: add KUnit tests for SHA-384 and SHA-512
>   lib/crypto/sha256: add KUnit tests for SHA-224 and SHA-256
>   crypto: riscv/sha512 - stop depending on sha512_generic_block_fn
>   crypto: sha512 - replace sha512_generic with wrapper around SHA-512
>     library
>   crypto: sha512 - use same state format as legacy drivers
>   lib/crypto/sha512: migrate arm-optimized SHA-512 code to library
>   lib/crypto/sha512: migrate arm64-optimized SHA-512 code to library
>   mips: cavium-octeon: move octeon-crypto.h into asm directory
>   lib/crypto/sha512: migrate mips-optimized SHA-512 code to library
>   lib/crypto/sha512: migrate riscv-optimized SHA-512 code to library
>   lib/crypto/sha512: migrate s390-optimized SHA-512 code to library
>   lib/crypto/sha512: migrate sparc-optimized SHA-512 code to library
>   lib/crypto/sha512: migrate x86-optimized SHA-512 code to library
>   crypto: sha512 - remove sha512_base.h
>

For the series,

Acked-by: Ard Biesheuvel <ardb@kernel.org>


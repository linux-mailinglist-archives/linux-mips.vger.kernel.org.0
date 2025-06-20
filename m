Return-Path: <linux-mips+bounces-9446-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 951DAAE2428
	for <lists+linux-mips@lfdr.de>; Fri, 20 Jun 2025 23:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2469F17E3DC
	for <lists+linux-mips@lfdr.de>; Fri, 20 Jun 2025 21:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812AD23A997;
	Fri, 20 Jun 2025 21:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJfZU4Vl"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFF9239E9D;
	Fri, 20 Jun 2025 21:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750455578; cv=none; b=kqcfm8/EtETJdOSFDdvGHIPlP6PrFxB5o8rFdogiJw4UcwIRHFJldQjCa4zUY3UjjcK0YlXw43pOX1MXxCA7RAjQhcDQPJWHuLk1KskvlV0o5NJ1sdeAyGIfRfBBoaUUqmtCJQtBgwPGIWYcCB5HvdPFFcoNYwwKVD7DZm6b1hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750455578; c=relaxed/simple;
	bh=HvoFMsnVPaebNolXyEd0amy4ilKaPCQCYOjaJT3HRfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVgTOVIky9xFrusfGUyqQXnOOfHZYJPeb9rIjhdEybhWrbRJY+1Os8gYjtDkF/7BYNUfnYnf55u8NdWte7ucUcHjnhjfAbAGshfaiacdIizpqV6/bEmtKlHC51r7HcD6wbBRsAWi4baGcdWXnJwOc0MGmJ27o/M/6kgnm2ZJ8EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJfZU4Vl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89DDC4CEF0;
	Fri, 20 Jun 2025 21:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750455577;
	bh=HvoFMsnVPaebNolXyEd0amy4ilKaPCQCYOjaJT3HRfw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jJfZU4Vlyv60JLf4iYDzXyYj/nNjhRcuRyHNx/9hf1bvjOsD/F3//RsHPhpBnMvu1
	 sHOuMaZNHrm1NP/OmRnsAsoiIfuN6NQdHRux1JYZKklSHFNo3QRkWEmGXQhA9bQ1Pt
	 7Je39+LmoAGcqvDoPPqBsDnIYV9O0mez0OCndPDKcLPSYZm4s9atUB+OzHNXTpIsWk
	 BFDevwltARm0TQJUc0KDj4xt99mrgD5pveawyhxsuMTTJtSOfhBaUXVRX8RtDN+haj
	 5jImxo/vKcxFVFTcWmRi9pN5JK/XeV0v4p2sCz/ECpyw8qTB0/Oo9ixY3eo5cEIrfp
	 Ycg1/VMY7bIYw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-551efd86048so2322431e87.3;
        Fri, 20 Jun 2025 14:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVskR6e2eNLOTS6+ZN17przHxe0GkaX7kHPCOefbvoXArD9UK9H+QdTidp4suffj/JjZ32QDMGZMc8Yjg==@vger.kernel.org, AJvYcCVyTp/3p0jOvCad0RUa2z6+TPmgYyJVQ1mW/sOtfQLpIikvtvX3vfd+VWmeGh34eB12ia41Y4cbT0y/vg==@vger.kernel.org, AJvYcCXOcW7DKArg7Jw6aewOTxSDWn3x8LPyvrqP+3S/FxehdqOkHOEaotzWnrSCA5KZd6/aJ2YgD8aWcph5MvA=@vger.kernel.org, AJvYcCXRPRBItysM/icgDRt3NNbhEjW+0M50eComB9bFRgwx6r04Rm/GbviluVyn4bXhvGxW1+WihdSstNMM6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys5djXJLEF2gEu+cw+F6rrIbZc7QLTFmgHr5n2+ssJ9C0vEO0I
	+EOA0da2zmzYeAhVl5oRWqAIICY2evwQLqCk7KD+oogDXMPp/4Iz8JQxzyIYQmFr7ATp8Ecq4Y6
	DzvQEnqLh3L4d4pg8ORRsBqPeldyoLC4=
X-Google-Smtp-Source: AGHT+IFlzPdW/TAjB41pWNx+EWn0IQNKfWjtbAPkCDzwR/Cmxb5FPmWfpoRjKRGa+GebEYrhPkOrWG7ilfOzIslgaJA=
X-Received: by 2002:a05:6512:15a2:b0:553:510d:f464 with SMTP id
 2adb3069b0e04-553e3be0118mr1238378e87.25.1750455576146; Fri, 20 Jun 2025
 14:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619191908.134235-1-ebiggers@kernel.org>
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 20 Jun 2025 23:39:24 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHMjG77Q9WxwqACekQNnEU0DdQPsamt5v5PjtmgguWDuw@mail.gmail.com>
X-Gm-Features: AX0GCFsPzv-r5KhW4GCiBgsxcKQ8jDKA8HBlXZ_WU75HnhkUOj_Q-bl9RCm5Y74
Message-ID: <CAMj1kXHMjG77Q9WxwqACekQNnEU0DdQPsamt5v5PjtmgguWDuw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] lib/crypto: move arch/$(ARCH)/lib/crypto/ to lib/crypto/$(ARCH)/
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Jun 2025 at 21:22, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series applies on top of
> https://lore.kernel.org/r/20250616014019.415791-1-ebiggers@kernel.org/
> and is also available in git at:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git arch-to-lib-crypto-v2
>
> This series moves the contents of arch/$(ARCH)/lib/crypto/ into
> lib/crypto/$(ARCH)/.
>
> The new code organization makes a lot more sense for how this code
> actually works and is developed.  In particular, it makes it possible to
> build each algorithm as a single module, with better inlining and dead
> code elimination.  For a more detailed explanation, see the patchset
> which did this for the CRC library code:
> https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
> Also see the patchset which did this for SHA-512:
> https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/
>
> This is just a preparatory series, which does the move to get the files
> into their new location but keeps them building the same way as before.
> Later patch series will make the actual improvements to the way the
> arch-optimized code is integrated for each algorithm.
>
> Changed in v2:
>    - Instead of keeping arch/*/lib/crypto/.gitignore, instead add entry
>      for now-removed crypto directory to arch/*/lib/.gitignore.
>    - Adjusted commit messages and titles.
>    - Added Reviewed-by.
>
> Eric Biggers (9):
>   lib/crypto: arm: move arch/arm/lib/crypto/ into lib/crypto/
>   lib/crypto: arm64: move arch/arm64/lib/crypto/ into lib/crypto/
>   lib/crypto: mips: move arch/mips/lib/crypto/ into lib/crypto/
>   lib/crypto: powerpc: move arch/powerpc/lib/crypto/ into lib/crypto/
>   lib/crypto: riscv: move arch/riscv/lib/crypto/ into lib/crypto/
>   lib/crypto: s390: move arch/s390/lib/crypto/ into lib/crypto/
>   lib/crypto: sparc: move arch/sparc/lib/crypto/ into lib/crypto/
>   lib/crypto: x86: move arch/x86/lib/crypto/ into lib/crypto/
>   MAINTAINERS: drop arch/*/lib/crypto/ pattern
>

For the series,

Acked-by: Ard Biesheuvel <ardb@kernel.org>


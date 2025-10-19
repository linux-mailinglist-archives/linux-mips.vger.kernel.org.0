Return-Path: <linux-mips+bounces-11779-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18669BEE049
	for <lists+linux-mips@lfdr.de>; Sun, 19 Oct 2025 10:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A86733B5EBC
	for <lists+linux-mips@lfdr.de>; Sun, 19 Oct 2025 08:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC7C22DFA5;
	Sun, 19 Oct 2025 08:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccTdEhIo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3578154654
	for <linux-mips@vger.kernel.org>; Sun, 19 Oct 2025 08:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760861463; cv=none; b=qTxXwixzBZg9CVZmS71qqP3L/t9O8bAnZNoAJHuKqZNIv+oVv0D+S7SFpN69GlendlnvQk6qGkzZr0rWHD1sAsZfPDjjJbvZkgsuVcQGKsJ9H+myQvmGEWlYveDHA7b01UBwOecZpHhvdngTn7mzBx10onfC2WU+kF2DKDphifE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760861463; c=relaxed/simple;
	bh=0JD5EhU3dMvt2TzDGGngYx4VWjKCENlPlTrXXievwr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=py6fZnQnZovV641eJ2c8G/EtrhiB+ouKQSvAJUG34mHP6nTVKbb6P7vkVxWaLEhfCNZlRQZQ5KvM2fqRtDmHdL7DhV8NPsezLNswalbi09mVysBxFwHL+bpIVkoPndfBlDJe54EOZiDgXcXP/dZPgPL5nRBUUTo1ZCAm5i4KgsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccTdEhIo; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-63e0dd765a0so2990214d50.3
        for <linux-mips@vger.kernel.org>; Sun, 19 Oct 2025 01:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760861461; x=1761466261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JD5EhU3dMvt2TzDGGngYx4VWjKCENlPlTrXXievwr0=;
        b=ccTdEhIopdhypwI8L3JBil5M4STne8SmRaQFfCBM02l9LkTDCeY07VksMZS734XIYW
         fSr9E0vMaFgWvM5hpUfvHCdQwXqN1rLdg7uGpCmcE1a8p73wsSFiGM9KgaCUVorU2bB4
         QXlk0k/rKjfCpslj0HWJBncYE9y9o12Mjtf9KUBJxsuzUFBzDISvTP/UdlOzuowk2O9I
         i6m0bPW8oTEyUXCgLGFGHisuLGD8VhQ1MKnYlEu61P8OxgXOJsE/nO9c7FNSYyLg97yE
         4ySn5cXO9k6TDK22f8AGkED3Ks52VuOYFicnSfjIjvJlszMjZfsukHxg61ULY8iC4TUN
         9kxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760861461; x=1761466261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JD5EhU3dMvt2TzDGGngYx4VWjKCENlPlTrXXievwr0=;
        b=sLvKgmV3kRTxU5UYqQqADL/Ilx2amhYCL4Hoxz1uL9xXQ4djfZziN7gbY6gThzh8KS
         dV2oYu62zqO04U2ujB2Ar4zT4oq+dHheue/6urfBBTgvS1/NGq6GfvPbUW+S4GcN2LXy
         dDu/Zy1eSOo7Us+VsXXcNtFnCjQC7G6enPkiq+elScoLUPKP93zm+JRYXNFaGKrLuqOQ
         n6kqulcD4/5kfHnuQOQv51mwNiZfs5skqbIcnconVCzyA5eDJGiCEMRX666NK9iJFvb2
         oLP5mApPMreCe7hquEQGertfSMO3f6tnmkrjIq8PdetXE34KzPdYSqhRt87/dgmcWBVb
         M7Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXHmJd4XWP9rTWRYHcQrh5grIqr1XUbqXS283dbfmPAwkQL7lNWl+XeBCuGz/Tdq7zQsE1s8yWF+s5A@vger.kernel.org
X-Gm-Message-State: AOJu0YwCHofJLmkiL00+dlhqy+QnI38V2+NI6pGId3W4eQnjk3jzYeGs
	Fbq8b076Lm7YNdIpMgXz5p+xLtusm2C+EgA5/rGA6b98024n8dT6fG9OW0fGMoXRnh9ccGthFYx
	5yNV4XU7DJtEPMsAhW3Uaf4TSHDAXQ10=
X-Gm-Gg: ASbGncthp9RsYkEUCeoBJKa7IeDxRgtGlK0U4J4pnpOe7OQGgZVoIKbT3tqzqmdFvfK
	G5tV2D81WKj1ZInEZ5EVGHwRJq2z6/kaLZhaio1o6um188XbwxJc/HEV8MG/UQbKKDN39apuMKb
	FDtkgFmTDgL0jnSXVQzleeWB3Ku+DVuMF+pgR6Wd3YvXd0J4cMBSOXeFSuK3iwTff8qT066Wrhs
	3EctssnvKnM7gr837j0OdUbobhftMCcDgn+Z3So66Pkdn6Q8xYrVn6YoEvFAXRE3W7ARcDvQYs=
X-Google-Smtp-Source: AGHT+IEDp/usYEtVSaz10lwwm2/rh8YYcBuxag2F0nuBjSfSMoio/EijPl9t2f1PGKCDHr/mRoxnx6oC2CKJ7h3r2Ic=
X-Received: by 2002:a05:690c:31e:b0:782:9037:1491 with SMTP id
 00721157ae682-7837780ba2dmr109813007b3.42.1760861461100; Sun, 19 Oct 2025
 01:11:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202010844.144356-16-ebiggers@kernel.org> <20251019060845.553414-1-safinaskar@gmail.com>
In-Reply-To: <20251019060845.553414-1-safinaskar@gmail.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Sun, 19 Oct 2025 11:10:25 +0300
X-Gm-Features: AS18NWAhDVf2aU8hB0qWERPwO9zi-ils_dPukaoQchmqqRauvEb3B93Zz-69KFg
Message-ID: <CAPnZJGAb7AM4p=HdsDhYcANCzD8=gpGjuP4wYfr2utLp3WMSNQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/19] lib/crc32: make crc32c() go directly to lib
To: ebiggers@kernel.org
Cc: ardb@kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 19, 2025 at 9:09=E2=80=AFAM Askar Safin <safinaskar@gmail.com> =
wrote:
>
> Eric Biggers <ebiggers@kernel.org>:
> > Now that the lower level __crc32c_le() library function is optimized fo=
r
>
> This patch (i. e. 38a9a5121c3b ("lib/crc32: make crc32c() go directly to =
lib"))
> solves actual bug I found in practice. So, please, backport it
> to stable kernels.

Oops. I just noticed that this patch removes module "libcrc32c".
And this breaks build for Debian kernel v6.12.48.
Previously I tested minimal build using "make localmodconfig".
Now I tried full build of Debian kernel using "dpkg-buildpackage".
And it failed, because some of Debian files reference "libcrc32c",
which is not available.

So, please, don't backport this patch to stable kernels.
I'm sorry.



--=20
Askar Safin


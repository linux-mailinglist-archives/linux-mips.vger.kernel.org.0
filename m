Return-Path: <linux-mips+bounces-8764-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F399A9DBCC
	for <lists+linux-mips@lfdr.de>; Sat, 26 Apr 2025 17:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C3341BA6943
	for <lists+linux-mips@lfdr.de>; Sat, 26 Apr 2025 15:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DEB025D1EF;
	Sat, 26 Apr 2025 15:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GFfa5EIf"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA75221FC1
	for <linux-mips@vger.kernel.org>; Sat, 26 Apr 2025 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745680676; cv=none; b=ckx5deWGg6bps2wo6dwVJA7QaXcgHQ3oWtw2yLeEkQpaBpQ3Jy3iQBuiVp5IMRQxeUBwqytEgFN2JPF5g4KkAnfxKSsQNnxhHwsWb5N2WqcAuxsrmB1tQtRVx4Ea8ZV/nLn1PrGfJtcutg94GuJ2ECnzzBa7KCeCoK+TkDCbVOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745680676; c=relaxed/simple;
	bh=lwUT3Iv8t9p6mwjxLMSSqUxpKJyupbTKnPyyqPO3ZNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ca0fXqlqU05m/R15N613opIBTHG7YhgIqkZVT1Oz7Gq/ovByhvbLdDEgwVrbw+k9cSyYx+KDBMT07n037CSRRV4TZQ3LCluy7zL4M4ptING6EMIHih/tUkpTHiwMPj4iAaAK0ZfrECPEReHFKHEriG15yKtDobxc63Gsf9dwMws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GFfa5EIf; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f435c9f2f9so4310926a12.1
        for <linux-mips@vger.kernel.org>; Sat, 26 Apr 2025 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745680672; x=1746285472; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BNlY1Kyobnrt/7plmlszUhTRPyZa/aNAr5+UYAUEWpg=;
        b=GFfa5EIf2St03hFCcTCErav4/8fHMSzg55cjpzu3/ZspmEy+9eVcq35NWPidR5F+Nr
         VIsnUMp+Y4v1efVipXvyOyex6WrKfCgyN2QI9OpQegIjcVDtkfpi6M3ssHBKhYJNRMfi
         SRZVMg7aXPANkyWImpE8OzEUYf64QvhEbdsIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745680672; x=1746285472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNlY1Kyobnrt/7plmlszUhTRPyZa/aNAr5+UYAUEWpg=;
        b=NEfzVpoCplG4EgA12KeARCnsXOovw6PBmh8YwNv7AITQl/wkQ2RN45sXSalBBCQa+V
         gzg+b9w3mIHsQ3Epn+JJWFTuRnLn7xviCEKOHngY5GpiFGF5Lb3odXmtaDDGfB0iUclQ
         PuCtpeo0F5Xe1MFKbzmSyOY4AbhueHhk40vxPv26d+pQamPi4CR9uYf6W4BRvttnYp49
         kmJj+DAyf27UcNOImMP3Ol029eUP1wndh+6EEEgi6efvj+unesvLaLARawq8ETwVcHcL
         0NX+AmBr9tOvhTkkTlTPPk0CBG8/0/LK/TsUZH7ORsiPcknrxSIsnYuMmn6WwUuosIo+
         zYBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4zegcV8PPPzlUitfB0NvP3Z1M+KsAamz6lhR6XHBVfNQV2iPAH9hzFTV/futli3uGXF/rj/ZMEb9I@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4DLw9VGaMXZoR+cc8lvCaYLAWN7g2KqQuT/aQpKpuGJKl6bjf
	00sLLjUzv5Hh80ujUszHSFtDvXJmppaKUl9L5r+5FyP7Fa54fThd/IwXzJaKpiphsjk2v0NgmJL
	zU8A=
X-Gm-Gg: ASbGncuB9077bANOf6wvEI/tSQAswYw6R0/flQtcXgpyUuVEwebKpmWufR97pcm2sFN
	rlxB1NvajxYX32gThRjMG7B6r7LjRtdaxKpFA2R5DoGbcE1IpO12R0+ffNqJp55hSQ6WSVGMfy5
	4X4rVwUlfsKLYK31rg4YFCyuSw/oJYaq7j6ufvxktrqqyvGrHuik3tN4g+DSYNGdIU0HBO+bri5
	LEsrY6zNIOy4Lug9MCJTfkgMxO1RhDtbKzzVX9QL6F2jUlZ6WZv3sMaKX1q30QaYp7qdZTYEMf+
	gEACEuiP8eDuf4E6JGuKHzerqOWTsFRCHO6D3YdOz5K13leQAWGhoRpUEJwMgDne8wsDBa9tVGu
	8HeSakNPz4a7CZNY=
X-Google-Smtp-Source: AGHT+IEEKWzgjDhDI+S1RDgWrMxNf1jnJRbv6AD6EJBhE44Ymv9HctfnQDBiQsibP5Dcp+u63jHiTw==
X-Received: by 2002:a17:907:9725:b0:ac2:49b1:166f with SMTP id a640c23a62f3a-ace84b4c0b9mr266358566b.52.1745680672590;
        Sat, 26 Apr 2025 08:17:52 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8304sm299069066b.111.2025.04.26.08.17.51
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 08:17:51 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac3b12e8518so567628566b.0
        for <linux-mips@vger.kernel.org>; Sat, 26 Apr 2025 08:17:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUixSy8wJY8M7YBjCFJe3/Lteq5SYZQU3Q5ZiKccJNi/kTJd2u2ErdVSgsj+lu0Bn8ZIymqHmSaeaqV@vger.kernel.org
X-Received: by 2002:a17:907:7e95:b0:ac3:8895:2776 with SMTP id
 a640c23a62f3a-ace848c0439mr259814066b.5.1745680670908; Sat, 26 Apr 2025
 08:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426065041.1551914-1-ebiggers@kernel.org>
In-Reply-To: <20250426065041.1551914-1-ebiggers@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 08:17:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_ArMFL9E9SehR2Z3pfV5QPut0XwbJs9mYWkRvcZcSRw@mail.gmail.com>
X-Gm-Features: ATxdqUFbLPq86s-2TFMi3kWckNkp7TWtoBPlYGSlRtiuXxSXCOJQKui7bzYM-j0
Message-ID: <CAHk-=wg_ArMFL9E9SehR2Z3pfV5QPut0XwbJs9mYWkRvcZcSRw@mail.gmail.com>
Subject: Re: [PATCH 00/13] Architecture-optimized SHA-256 library API
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, 
	linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Apr 2025 at 23:51, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Following the example of several other algorithms (e.g. CRC32, ChaCha,
> Poly1305, BLAKE2s), this series refactors the kernel's existing
> architecture-optimized SHA-256 code to be available via the library API,
> instead of just via the crypto_shash API as it was before.  It also
> reimplements the SHA-256 crypto_shash API on top of the library API.

Well, this certainly looks a lot simpler, and avoids the duplicated
crypto glue setup for each architecture.

So this very much seems to be the RightThing(tm) to do.

               Linus


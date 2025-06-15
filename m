Return-Path: <linux-mips+bounces-9311-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10347ADA12D
	for <lists+linux-mips@lfdr.de>; Sun, 15 Jun 2025 09:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 423593AE67F
	for <lists+linux-mips@lfdr.de>; Sun, 15 Jun 2025 07:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD307202C40;
	Sun, 15 Jun 2025 07:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHOYBjaS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED4B16FF44;
	Sun, 15 Jun 2025 07:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749972185; cv=none; b=E7+joPWWd6TcR4j2xDZ1cvn7lxvOlQ2RPtE5Ny82T1TKErW6tC8okMi0ByHBW0z2SzcxW+heuPexcIX+Lx4kA2B3Z8rfEZ4AW12g5ltxCEwrBcR8H2w3EMOxeaqRoektzB9YDgtJPxoim5QlT9BvzePd8vBvZd+56/NPrmvBT+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749972185; c=relaxed/simple;
	bh=JWX10x0tUiGyirZtdUuM+U6VGu/piK3QA70v8Z35YDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fa5HWBC0rcq3cu6aAU/f86yjVOESiCfvUHXJvXbLa8AAHM2R0btwNci3hZ9eUFuz3ayqK3GOY3ngGEoZG44qcuYDjNtXUCO/wVLYALGKfqYTtvclyzGAsT5ZgffB1gl6W7TFM4Vc+MwWgfEC7UM8RzPxgWKQjEOPVtZfygQ3HFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHOYBjaS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC817C4CEEA;
	Sun, 15 Jun 2025 07:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749972185;
	bh=JWX10x0tUiGyirZtdUuM+U6VGu/piK3QA70v8Z35YDs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mHOYBjaS6N/P3MQVSPNDgkB2ZPVndEKFhnLyvzv/fasdndLB/ZfnRqO3HO9tbl5Hz
	 ASOS4PllJ4N3B0Jty2tMB5EVYST9S/KbGE6aR0wcSRi2I6SFiNX+uD/Aer+vTXFVSG
	 x1SjiUOG84xT0MtsQsVLROPIGEwMbeUdOpRAHXsPaIX7y+FgpvhAEzunmHZiKTEumw
	 2OnwztHAw0xiyxCfjZ34QTAiziJzN5kNnMFuPVWBTWiUQme1zt5chpnJPVlRaJ5OQ8
	 aZq5Ey6tYWoKshCvB3PNrqq9B4bN/nRfYtL/Hew7nI3Yydc8D+/uY7ABTIzUl8Cz8W
	 gCbad41CUqXwg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553644b8f56so3535156e87.1;
        Sun, 15 Jun 2025 00:23:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU84TnjfWQGwUCZhXqpDNDwYTtMLEhtQ6GZ8qccRWIEDtzdh4NuXkbsUhEMjZmjzBpn76L/DjfB9G7kSw==@vger.kernel.org, AJvYcCVHw3AzRLpjeWwR2OyvQpPH2BwrJhqeobuO/4w9O9PVm7XmA531MYDDWbT2IwYGypJ8Z7icBD4QtTalh7I=@vger.kernel.org, AJvYcCWsPDFnhEXB3w5pQu6BC7bEdeC9GR0cyboS7ALPK9LbbTNRJf2pU6/wrvpt7VTK0NZ0fWiq2W+QGsL4zA==@vger.kernel.org, AJvYcCXRpEB6gYbBVR8APS5QeianR++4A69GznMl55/2xYd1kixJInK9RCKJ5mIAsPWqXc+Qapr5d8tFe5893w==@vger.kernel.org, AJvYcCXY+SsY0a9af1G3iO4XfUCCssyM4+l/IZNhN4uYg0zgzG3ENvg7i28w+TmluCQ0ppGVHvTBu3wy24glMYpA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlf/h8yFbxalgrBMAQkRmCTeRrEnvXbaBbEp5mXnJzqtFWs0gK
	0AL76/3uN5LvReHDLmGKNNYvWtevS4FhRMPO09eygIHumfRJMe8Uvg4uyqJTwBF5QlqSYKsTRCd
	spjMuxi/XglRe5+bFYQsQXMXAsnhWCyA=
X-Google-Smtp-Source: AGHT+IFn3BKZ/4LSxVR5KXcXwLoaa2Kdc1AeLDkxaymXoA6lOBMJ71ueZOjsj/pywa+41S2R3jXWsdX5Y53gLyxvvYg=
X-Received: by 2002:a05:6512:691:b0:553:2759:7db4 with SMTP id
 2adb3069b0e04-553b6f0b1aamr933983e87.26.1749972183272; Sun, 15 Jun 2025
 00:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611020923.1482701-8-ebiggers@kernel.org> <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol> <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol> <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au> <20250613055439.GB163131@sol>
 <aEvmmr0huGGd2Psv@gondor.apana.org.au> <20250615031807.GA81869@sol>
In-Reply-To: <20250615031807.GA81869@sol>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 15 Jun 2025 09:22:51 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGd93Kg0Vs8ExLhK=fxhRBASU9sOPfgYUogv+rwVqgUsg@mail.gmail.com>
X-Gm-Features: AX0GCFvXujBEz2gg1idEYRihdjR7urozsbmjreTha85WA-Kix9z2xocGepFq-cI
Message-ID: <CAMj1kXGd93Kg0Vs8ExLhK=fxhRBASU9sOPfgYUogv+rwVqgUsg@mail.gmail.com>
Subject: Re: [PATCH] crypto: ahash - Stop legacy tfms from using the set_virt
 fallback path
To: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, 
	Jason@zx2c4.com, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Jun 2025 at 05:18, Eric Biggers <ebiggers@kernel.org> wrote:
>
...
> After disabling the crypto self-tests, I was then able to run a benchmark of
> SHA-256 hashing 4096-byte messages, which fortunately didn't encounter the
> recursion bug.  I got the following results:
>
>     ARMv8 crypto extensions: 1864 MB/s
>     Generic C code: 358 MB/s
>     Qualcomm Crypto Engine: 55 MB/s
>
> So just to clarify, you believe that asynchronous hash drivers like the Qualcomm
> Crypto Engine one are useful, and the changes that you're requiring to the
> CPU-based code are to support these drivers?
>

And this offload engine only has one internal queue, right? Whereas
the CPU results may be multiplied by the number of cores on the soc.
It would still be interesting how much of this is due to latency
rather than limited throughput but it seems highly unlikely that there
are any message sizes large enough where QCE would catch up with the
CPUs. (AIUI, the only use case we have in the kernel today for message
sizes that are substantially larger than this is kTLS, but I'm not
sure how well it works with crypto_aead compared to offload at a more
suitable level in the networking stack, and this driver does not
implement GCM in the first place)

On ARM socs, these offload engines usually exist primarily for the
benefit of the verified boot implementation in mask ROM, which
obviously needs to be minimal but doesn't have to be very fast in
order to get past the first boot stages and hand over to software.
Then, since the IP block is there, it's listed as a feature in the
data sheet, even though it is not very useful when running under the
OS.


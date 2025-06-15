Return-Path: <linux-mips+bounces-9313-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB62ADA330
	for <lists+linux-mips@lfdr.de>; Sun, 15 Jun 2025 21:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF69E1696DF
	for <lists+linux-mips@lfdr.de>; Sun, 15 Jun 2025 19:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8CD27C15A;
	Sun, 15 Jun 2025 19:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q+mLk1y/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7D0264FB4
	for <linux-mips@vger.kernel.org>; Sun, 15 Jun 2025 19:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750016271; cv=none; b=Tpp4RVkRkovU3HrH5bCVAz0+Q8ND/neTNUovXrLKEUh5460DTyWNqm92ENbNyie4yHcTsml1lWBCIBm+F59NqpU5pLgDvEXn3Yvl0uQgSU9FYxUjVY7CYt0Y7WOXV7WyuiZpzenVMBn7tjuvBxme/h55d5Ku4snujw7TowF/BvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750016271; c=relaxed/simple;
	bh=+DdLJhNZpkF0mq6V6riPNHi40jkfNk/Fbp6sB9glqNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O/ktLraFDqONgUclRt6ZPWRuqwyYelan5etIHPMtzT4gb7rwvBYqjsFD7y07OQXZzym5sJezwxqomZphgQSIKW9BbP7WaAXu9fdgpVmn8n1wKZDpdjWEtXKG2IwG1Y0NVXFDoZj3Da4WV7AgP8DGwak91kCHjO7iS7BdtB6RcUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Q+mLk1y/; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ade30256175so736758166b.1
        for <linux-mips@vger.kernel.org>; Sun, 15 Jun 2025 12:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750016267; x=1750621067; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Bm1Ypz9xIQ9oSWoxmBY5SZFvMd6ktsJLpK/MNzMMqc=;
        b=Q+mLk1y/m9VlZYsSy1XdhmgGGlLHhLY1VR4lmaI5GGLnin39R+lnnmOq7ocbyItRtZ
         5hmw/tR50iPd5HvT9d9YNs2r3EfNb3FVxtVxq+J77nc5ALX1gJ81cqXb7/zAx3ExaVw2
         Sdl4G25y8JSd7Qh/fsPulb2uiaNEbRbrRz1uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750016267; x=1750621067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Bm1Ypz9xIQ9oSWoxmBY5SZFvMd6ktsJLpK/MNzMMqc=;
        b=CgGHth6MwdzsYZtqYuLxQ95Z5vhdwDGUIFaO62qUt9I4Gvvioi3t4yEVKEuEYte88v
         gk8/6gl40i2QMNOvE4MDC+EtjlR90QrO69Ek27He4NlI6gHZ7JuWrfgfvAixBDrXl2Gu
         OxUCPw+qVhLRugh4eLFX4xDkOstKAM2dyRlZ6365Ek4XEgbXs73l9xyyi3jJ8Ec36sdp
         +k5JerV5u7OhBGzjxxBwEmaJYU6ifOqALi9zRksDGCo3s4JAGoq+VaA4s9KNFEqCGS7X
         hLxHQTf89jNQc1TBxLKrtkZhditgi2IK8hOT+I1/i9VP/3RUaojIcANXIfT6ZbxJ0YN4
         p7Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXXxMFEnZGHKxfU7n34KnGuFo1w71q4s2yukiNeqwr2XP9K7mJN4AHYfRkCbtp0pugpl+NZ6l+NyXQ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx63KyHn6KQCUIWZJ5L7BRV7usDtQBDA+BApIBq6OxTgxSky0da
	ntdDEls+uHwITuQtcszALRB5jliyj/7YucUhhwgY2+7dV2FB3tFUTHK7xgSw4U1aoSV998fOKtp
	RyCCwzeQ=
X-Gm-Gg: ASbGncs7oA7QrAvweSrK3zjltOyL9q/IqrC0T178pi6EGPL3KbxvuYtY8cll2hEmsRa
	rDNGpmmxpXgei9hFaTf2tGdz+XNtis56tJJxyMPA2o0GBC74NcvsX4MxrP5zrH2Fa9fhLlpKwqc
	MmNPMHRvYdmoSZ3Co4hK9MzPZlvAQCaMPFHfM0BJ9qbnP8Jw+MinczElqihV8EwIGQisEG2r12B
	RBvFAvamnjGDcmTYTlyNmDTX+d6D+YU1Htb0/OIdmWqWLizEaMM2ifBZNQXS4HOUYFIo7kSm9L4
	DQI5sikzhQvGRhkWLD/+gtZJWJISQbaqV+zMWmhxoZlOOPD7c2csvdeXuOFIJ7JeR3bNi+5olrL
	yL2Ner6ZqZ22PDCBjsxJ2kXn5rW+d1vTjA6ix
X-Google-Smtp-Source: AGHT+IGmB2iiJ7t/+fOMuL0mlq+dj56Mfw+v6Evh4dx4bWQfjELzY4M6ohVQNy5NqQAFHc6kccp4Dg==
X-Received: by 2002:a17:907:72c2:b0:ade:4339:9367 with SMTP id a640c23a62f3a-adfad34accdmr622824566b.26.1750016267116;
        Sun, 15 Jun 2025 12:37:47 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88ff5ffsm531220166b.106.2025.06.15.12.37.46
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 12:37:46 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-606ddbda275so7500985a12.1
        for <linux-mips@vger.kernel.org>; Sun, 15 Jun 2025 12:37:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUx2hnAb7BVqj2JW5my/sxKdOg+PfQ9C9hNXz3+cIaTxVJ6lYNR0IlmGrqNHrqr41N7Ai5zsHktuIxl@vger.kernel.org
X-Received: by 2002:a05:6402:50cc:b0:5f3:26bb:8858 with SMTP id
 4fb4d7f45d1cf-608d09a2d16mr6285703a12.34.1750016266135; Sun, 15 Jun 2025
 12:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aEjo6YZn59m5FnZ_@gondor.apana.org.au> <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au> <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol> <aEu5cyDOMcKteW_b@gondor.apana.org.au>
 <20250613055439.GB163131@sol> <aEvmmr0huGGd2Psv@gondor.apana.org.au>
 <20250615031807.GA81869@sol> <CAMj1kXGd93Kg0Vs8ExLhK=fxhRBASU9sOPfgYUogv+rwVqgUsg@mail.gmail.com>
 <20250615184638.GA1480@sol>
In-Reply-To: <20250615184638.GA1480@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 15 Jun 2025 12:37:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiAh0fnfm-LomMWDV=OGhCHCp0C_7xZASE_8pZ3ZP0CXg@mail.gmail.com>
X-Gm-Features: AX0GCFsirgA8Ga0u26X0ToUgNd-a86j5gL8Na8fIUJo1Hy2_joO0gogaJwm_iSM
Message-ID: <CAHk-=wiAh0fnfm-LomMWDV=OGhCHCp0C_7xZASE_8pZ3ZP0CXg@mail.gmail.com>
Subject: Re: [PATCH] crypto: ahash - Stop legacy tfms from using the set_virt
 fallback path
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Jason@zx2c4.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Jun 2025 at 11:47, Eric Biggers <ebiggers@kernel.org> wrote:
>
> So yes, QCE seems to have only one queue, and even that one queue is *much*
> slower than just using the CPU.  It's even slower than the generic C code.

Honestly, I have *NEVER* seen an external crypto accelerator that is
worth using unless it's integrated with the target IO.

Now, it's not my area of expertise either, so there may well be some
random case that I haven't heard about, but the only sensible use-case
I'm aware of is when the network card just does all the offloading and
just does the whole SSL thing (or IPsec or whatever, but if you care
about performance you'd be better off using wireguard and doing it all
on the CPU anyway)

And even then, people tend to not be happy with the results, because
the hardware is too inflexible or too rare.

(Replace "network card" with "disk controller" if that's your thing -
the basic idea is the same: it's worthwhile if it's done natively by
the IO target, not done by some third party accelerator - and while
I'm convinced encryption on the disk controller makes sense, I'm not
sure I'd actually *trust* it from a real cryptographic standpoint if
you really care about it, because some of those are most definitely
black boxes with the trust model seemingly being based on the "Trust
me, Bro" approach to security).

The other case is the "key is physically separate and isn't even under
kernel control at all", but then it's never about performance in the
first place (ie security keys etc).

Even if the hardware crypto engine is fast - and as you see, no they
aren't - any possible performance is absolutely killed by lack of
caches and the IO overhead.

This seems to also be pretty much true of async SMP crypto on the CPU
as well.  You can get better benchmarks by offloading the crypto to
other CPU's, but I'm not convinced it's actually a good trade-off in
reality. The cost of scheduling and just all the overhead of
synchronization is very very real, and the benchmarks where it looks
good tend to be the "we do nothing else, and we don't actually touch
the data anyway, it's just purely about pointless benchmarking".

Just the set-up costs for doing things asynchronously can be higher
than the cost of just doing the operation itself.

             Linus


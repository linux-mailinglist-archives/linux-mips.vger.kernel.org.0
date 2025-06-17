Return-Path: <linux-mips+bounces-9361-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A2FADDDAC
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 23:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A41BD189DBAC
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 21:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543FF2ECD0C;
	Tue, 17 Jun 2025 21:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HMsC5FfB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11D92EFD88
	for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 21:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194637; cv=none; b=Wk8fIYWCHbxoVDd2rSdj3QMeRfRhO3d13VAri/Ua8wlHNEBMix4D5/24MQJsFpP4XV3FHwZDZ4zCvTSRxtqUe5S7jt15AJlnX+9TKMxCYNS9ifg/G8zscvTJI4q/KPhxs6ywxpuJe2UUOgjJ+79ul6aK6SRCHSca1xg2c9RKQTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194637; c=relaxed/simple;
	bh=ir2qXEQz0ITQfoN65/zED7gUfzbFZUXr94ByJGJvwQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SUw4IXJgQy/Ui/Owxip44mBVu9jNjCHqA3DtWvfNShGRifWDqPWvcWYCJWLvd300MTzoZxwrHuXlPGt1TKRGBSKjzi0tH994UwD4Z4x96CUOORKn4lEWnkFLlqPt5F1kWsTTWJHHaID9qXZdSeupziPMRGDCMFiJ/pADR84JL0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HMsC5FfB; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-adb5cb6d8f1so1135433766b.3
        for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 14:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750194633; x=1750799433; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NscEjg9Y1LWinfHLpsahI5dfBkkxck14FsEzSEH/mHM=;
        b=HMsC5FfBBK8m1OzFzla6fblWwkNIzUHDmGhhJ8yI7xn5y17BmMGS+n9v0OX3/0ZUok
         05Ye3ty1blfiv0qAEkOtr0rGdneAksgoWTKeUx1NmzyaJCi2GjCR2iMXQ3sjkl0sGEcj
         uxMct+ygdjDVcBLicGWBCL8TFCeFJsYuQOOG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750194633; x=1750799433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NscEjg9Y1LWinfHLpsahI5dfBkkxck14FsEzSEH/mHM=;
        b=nd49Ax2KmukEsM/LzAKeYd0hJgQxHDBe2fAAMqb2dGPt0kT+uboXbSqdmgUTTnm8qV
         7a64N/kpWmzskkcOKBO9glZ7oNjI2+wgy2rmgWqgXtIDec9ZfeYXFlnWY0PRRI5UZusl
         7dN9+4vbRuCtlm20ffwdxfus+OJoT1g/iFNCx5Edwdn++FEwu7pwmZGn0uVn/0YozGmt
         h8YrkV9reRsBH3sbtYlMeLGWrDlExkCelv55+NwzAgNiQd18zLL2Qewn6RQ+AHJjBXVg
         43IjYerfZ9/b3+UByIqAt9WidTHHlPayh0ja2rL4MGwyN2Zf55CS9WEHjRpd+ixrN7Tg
         xCfA==
X-Forwarded-Encrypted: i=1; AJvYcCUZcl58lE1kcOQrb1b/aM+17hFZQc2VQYx79AtV9WQ+pZC10Uqq/KVg7fPMlbp2slchGg0zVdJX1bEa@vger.kernel.org
X-Gm-Message-State: AOJu0YzsQ9acX0XiSg4+qj2LHnAPkKCGN4kdmbdAsHM0AcuBztv+hIik
	NKqd1yJCByYHDX/upAcs2i0XPK8WXmphKQDiKUYliPHQmm+82qjwzdBpw23UTUXN4KZVoz0fsnV
	D+Z0xiG8=
X-Gm-Gg: ASbGncsOkx+sPUki6eJCQSB+eseFYXmQB5frwvTarkbM8Gb8IP0lzfp4x3bYmbpapUG
	EkJrLZheE7YEIeKX2HGosJDlSQeOYwpoNYsBuEoH0FxoZX+Pf7vLtJ6pJb4XPxLBjEaYF+oYHYi
	Lv76zyYmBrG6fkVw3YSFbYZ7LUBif9S2PRbZLpWDq9imxRdHha1hSzrWMpikideSSyo5i/in52v
	eI9JgaZW18+jck/IRpoLKxAOxP5n0PIZeOkhj0zoWU420ejJdMKOqyDbJw4iXIYgR6Djv5BqqxQ
	KGQRb0tLQN6z+1XvgedGPzsyXGSq0EyNpL+BzGSF1fpf7v7DSKl6Fwe5w6yQlSJosNuVd4QXJha
	GTAlblbAg6K3080Kcj6ZW6Rsa21JzO+kOHJGdYTr1YAFLU84=
X-Google-Smtp-Source: AGHT+IHP5m9m9js7wrAacUPnhK1+t1Bn6mKCCKfl5SXBUhmDMgyb3fkLEoULeT8nvifYAzpVzYyNCw==
X-Received: by 2002:a17:907:3da0:b0:ad8:9257:571c with SMTP id a640c23a62f3a-adfad326f1bmr1540738866b.20.1750194632823;
        Tue, 17 Jun 2025 14:10:32 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8158d33sm923863666b.31.2025.06.17.14.10.32
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 14:10:32 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so9004383a12.0
        for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 14:10:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0kUI942YTiIcJIk3Rt7QXNUPeyua6i0Aw7M9BOza2lNEwS01EkLZ7bVzMW6QGIn1qY5PEyHUIEyh5@vger.kernel.org
X-Received: by 2002:a05:6402:5188:b0:607:f55d:7c56 with SMTP id
 4fb4d7f45d1cf-608d097a0a3mr14798722a12.25.1750194632040; Tue, 17 Jun 2025
 14:10:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org> <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
 <20250617192212.GA1365424@google.com> <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
 <20250617195858.GA1288@sol> <CAHk-=whJjS_wfxCDhkj2fNp1XPAbxDDdNwF1iqZbamZumBmZPg@mail.gmail.com>
 <20250617203726.GC1288@sol>
In-Reply-To: <20250617203726.GC1288@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jun 2025 14:10:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=whLENPVgWtHg5jt42he8Eb2pFzZngbvfSWXUmq64cyaAw@mail.gmail.com>
X-Gm-Features: AX0GCFteh8AxHdG-O3SktB-Vd7hTjMUC_EBJsHwrbakY8eEhqvV4OBO-zVcDyV4
Message-ID: <CAHk-=whLENPVgWtHg5jt42he8Eb2pFzZngbvfSWXUmq64cyaAw@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 13:37, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Okay.  For now I'll keep the test commits last and plan for a separate pull
> request with them, based on the first.  I fear I'll quickly run into
> interdependencies, in which case I'll need to fall back to "one pull request and
> spell things out very clearly".  But I'll try it.

Thanks.

Note that this "split it out" is really _only_ for when there's big
code movement and re-organization like this - it's certainly not a
general thing.

So you don't need to feel like I'm going to ask you to jump through
hoops in general for normal crypto library updates, this is really
only for these kinds of initial "big code movement" things.

> Just so it's clear, this is the diffstat of this patchset broken down by
> non-test code (patches 1-3 and 6-17) and tests (4-5):
>
>     Non-test:
>          65 files changed, 1524 insertions(+), 1756 deletions(-)
>
>     Test:
>          14 files changed, 2488 insertions(+)

Looks good. That's the kind of diffstat that makes me happy to pull:
the first one removes move code than it adds, and the second one very
clearly just adds tests.

So yes, this is the kind of thing that makes my life easy..

> Note that the non-test part includes kerneldoc comments.  I'll assume you aren't
> going to insist on those being in a separate "documentation" pull request...

Naah, they're relatively tiny, and don't skew the diffstat in huge ways.

             Linus


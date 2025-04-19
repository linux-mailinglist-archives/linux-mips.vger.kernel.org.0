Return-Path: <linux-mips+bounces-8663-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67353A9412D
	for <lists+linux-mips@lfdr.de>; Sat, 19 Apr 2025 04:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE3241B6268E
	for <lists+linux-mips@lfdr.de>; Sat, 19 Apr 2025 02:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EF02AEED;
	Sat, 19 Apr 2025 02:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdUrag4f"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4BD136E;
	Sat, 19 Apr 2025 02:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745031422; cv=none; b=LzhbrdOWZ9f4Gva7rDuZ+TIcNo9bLzK84ewvQe/7ILtkvEtluv8NNLXOYI5eiqaxOhdk59DOEsKtk+pvoT61CRNm+W8Rt2sN7mPJoa1+rbu0+9Ut/6CEk328lqzU3QJhfmKKxa694ms07Ojwj81PadoQH2s7aF4tH0DX8u/N5cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745031422; c=relaxed/simple;
	bh=9LvENVGoNKnJj1A2Fi3gOOQ054fliCzHJnQI2PP2B58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gOe97mo+eHIZX+1FpCEwlf9A3Oo/MDnRnb9GRwKRLrd0G47YG4cY0tAEVuyUAsyFG8XMT/s+SdIcvrIZj9tQhneLV1SY8oDiKwpDm0wrtfhaOsDB4yult+JaesMhHB2tfcy453qDwNKnbOysHeMIOQXhe33Z0wrek2gX1K/t7U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdUrag4f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCEFDC4CEEA;
	Sat, 19 Apr 2025 02:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745031421;
	bh=9LvENVGoNKnJj1A2Fi3gOOQ054fliCzHJnQI2PP2B58=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pdUrag4fcCPCUevWWssqQ3oNXC2BUxv6/cda5J9AKxzr+AdhdS0zAGZ/DT2QZY+qf
	 aLBrZjfDSZL3ZyoX/2t8KEBIFN5xGeF5CQS/JWxFz5nfVPO3JI3an1eEdHosvcB0i2
	 BnZgWQHrlQ51ol1kNkcdn/gwzYIxqLS26n+NEXddE+eJQYd6LxGvi01DQRa0vr7I8h
	 kGYDWAJd0EIYEty77ChyR7vS84yeMRdjtUa7PaXrN9MtJfL9ceWNAS3/rO9iNtA+CM
	 VrQIn0ioN1Ro7Pm3Tur7vD7W5nH1uuAtLcmUNgTsAigN+J7k6F8XuuFkN9RemtudPR
	 +dvctez4PUP0w==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso3824557a12.0;
        Fri, 18 Apr 2025 19:57:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJIGmr3edA3EPPEb5GM6CAnCfzMuyp+W96vF1MVQ060FsZz/LepzfYMyUbtromXk0YJavJJffqq3fyWxY=@vger.kernel.org, AJvYcCX5Clp8pgw/qX8rFeDSdl7q0DMB4CNyF+ODKzU9WZi5oe7R3Xu3Vm2+KpC40FHqieFpdpTVdFxtic0Tqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwArdl4sxUKtGNrjqQc65jzD0/EKnrF3jufuL+dXf16rL8nCmhX
	iKOU77uhyMGTsRwhClI615rIx/QuBSni3tooi0ke1aeAbTgkZSySQEaNDJTDZh5kRaEEj19i+58
	WiQJyyJ4kAcN3h0b7dDggZxqG6j4=
X-Google-Smtp-Source: AGHT+IGhmmy0M1FNCzQnSD4N/IVQ4o9mFSDKT+1+P5O1DB7cmFmnnqYTSvE9wO1v4U1sDB5wtYVxF8bO8IKd1iE/fL8=
X-Received: by 2002:a17:907:9622:b0:ac2:d6d1:fe65 with SMTP id
 a640c23a62f3a-acb74d9aeb6mr466223366b.41.1745031420495; Fri, 18 Apr 2025
 19:57:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417174712.69292-2-thorsten.blum@linux.dev>
 <aAIF_kEFlOOVNDaE@alpha.franken.de> <DAD22E95-6D33-43D5-B5E5-3A7B45A63944@linux.dev>
 <alpine.DEB.2.21.2504181108170.18253@angie.orcam.me.uk> <EC98BAE8-8269-4169-B3A2-5F426E77C223@linux.dev>
 <alpine.DEB.2.21.2504181337350.18253@angie.orcam.me.uk> <B71034AC-B0FC-4C5F-8562-661D6AD11056@linux.dev>
 <alpine.DEB.2.21.2504181608420.18253@angie.orcam.me.uk> <9F6CA7CB-B36A-4F79-B78C-7ED63E39260D@linux.dev>
 <A08BC566-5F6D-4FA5-B315-34D2FCA55A6E@linux.dev>
In-Reply-To: <A08BC566-5F6D-4FA5-B315-34D2FCA55A6E@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 19 Apr 2025 10:56:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4x4oQEtvk4Ah0WNBWtaQysj00k_Pybs=+r37oriJxVPA@mail.gmail.com>
X-Gm-Features: ATxdqUGFZLLWAMZCWJu3dCZDa5XXtflEeZmWRMtc1ZY2sVDTcBrlSLM2u8DRWMQ
Message-ID: <CAAhV-H4x4oQEtvk4Ah0WNBWtaQysj00k_Pybs=+r37oriJxVPA@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: Fix MAX_REG_OFFSET and remove zero-length struct member
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Oleg Nesterov <oleg@redhat.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 4:22=E2=80=AFAM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> On 18. Apr 2025, at 22:18, Thorsten Blum wrote:
> > On 18. Apr 2025, at 17:14, Maciej W. Rozycki wrote:
> >> On Fri, 18 Apr 2025, Thorsten Blum wrote:
> >>>>> Does regs_get_register() even work for CPU_CAVIUM_OCTEON when acces=
sing
> >>>>> the last two registers because they're both ULL, not UL? (independe=
nt of
> >>>>> my patch)
> >>>>
> >>>> Or rather two arrays of registers.  With 32-bit configurations their
> >>>> contents have to be retrieved by pieces.  I don't know if it's handl=
ed by
> >>>> the caller(s) though as I'm not familiar with this interface.
> >>>
> >>> Ah, CPU_CAVIUM_OCTEON seems to be 64-bit only, so there's no differen=
ce
> >>> between UL and ULL. Then both my patch and your suggestion:
> >>
> >> So it seems odd to use `long long int' here, but I can't be bothered t=
o
> >> check history.  There could be a valid reason or it could be just slop=
py
> >> coding.
> >>
> >>> I still prefer my approach without '__last[0]' because it also silenc=
es
> >>> the following false-positive Coccinelle warning, which is how I stumb=
led
> >>> upon this in the first place:
> >>>
> >>> ./ptrace.h:51:15-21: WARNING use flexible-array member instead
> >>
> >> So make `__last' a flexible array instead?  With a separate patch.
> >
> > No, '__last[0]' is a fake flexible array and the Coccinelle warning is
> > wrong. We should either ignore the warning or silence it by removing th=
e
> > marker, but turning it into a real flexible array doesn't make sense.
> > I'd prefer to just remove it from the struct.
> >
> > Stefan or Oleg, do you have any preference?
>
> Sorry, I meant Thomas, not Stefan.
In my opinion just changing __last[0] to __last[] is OK, no other
actions needed.

Huacai
>
>


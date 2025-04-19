Return-Path: <linux-mips+bounces-8665-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA96A942D9
	for <lists+linux-mips@lfdr.de>; Sat, 19 Apr 2025 12:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48985188CE40
	for <lists+linux-mips@lfdr.de>; Sat, 19 Apr 2025 10:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4641C1F13;
	Sat, 19 Apr 2025 10:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DRwGSjmZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E1A198E76
	for <linux-mips@vger.kernel.org>; Sat, 19 Apr 2025 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745058957; cv=none; b=kXGP6qpg+S2jHrvD1XdaooEnRqxE4fJoAuWGGYA9dtY3hBZ32EZelDXJWv4rdq/BEGVT1uBwxV2rHSvwFil70nANytgxYjpG9A6TXPjUNvFoj02YD8T9HdkMe/ToQF9/laKHQl5OgFn6k2PFOFe/QyRRVjyD9Gi8wrMGxf32bOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745058957; c=relaxed/simple;
	bh=bVCR+fA30tF4GjVlZMJHRBKnbcj87eua+ehlMiAJLg0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=O1E6D1mp+BQxU+cC61vGX0wmoxStGuTJPP+kgzP8erF2DDLcnZoJwe+xV5nmqGCh2RPBozx1hsaSqUfbWNCt1IzqZibHrLkn6IuKufANlrTdqFiqMuZ7roDme9AaJD+pMB2c+kA0YgGudBrv/yulOZUZCKcBxtWlvPmn2Wyr1vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DRwGSjmZ; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745058953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E0cjA398QKtX5LZgMG38M1nQogQDA0zqD26aOnhTivM=;
	b=DRwGSjmZk2oQXGeMn8E0tYGgzibZ/Vgc0lCTc7VGLaa8Ilv9RFP6NawIZGiKHGIHWWUqCK
	efHZmMs3D9aWsPNEr9qsc1ua0ZFDYNFe1HRhdU0yrKcimQpLzn71kxtlxo23WlMJuoQmhg
	8cV8dEIEy4U7yvGTexVh/BkgUXz7Q3A=
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [PATCH v2] MIPS: Fix MAX_REG_OFFSET and remove zero-length struct
 member
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <CAAhV-H4x4oQEtvk4Ah0WNBWtaQysj00k_Pybs=+r37oriJxVPA@mail.gmail.com>
Date: Sat, 19 Apr 2025 12:35:38 +0200
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Oleg Nesterov <oleg@redhat.com>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <505DF3CB-F7E2-4233-B39E-654FB5BEB811@linux.dev>
References: <20250417174712.69292-2-thorsten.blum@linux.dev>
 <aAIF_kEFlOOVNDaE@alpha.franken.de>
 <DAD22E95-6D33-43D5-B5E5-3A7B45A63944@linux.dev>
 <alpine.DEB.2.21.2504181108170.18253@angie.orcam.me.uk>
 <EC98BAE8-8269-4169-B3A2-5F426E77C223@linux.dev>
 <alpine.DEB.2.21.2504181337350.18253@angie.orcam.me.uk>
 <B71034AC-B0FC-4C5F-8562-661D6AD11056@linux.dev>
 <alpine.DEB.2.21.2504181608420.18253@angie.orcam.me.uk>
 <9F6CA7CB-B36A-4F79-B78C-7ED63E39260D@linux.dev>
 <A08BC566-5F6D-4FA5-B315-34D2FCA55A6E@linux.dev>
 <CAAhV-H4x4oQEtvk4Ah0WNBWtaQysj00k_Pybs=+r37oriJxVPA@mail.gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>
X-Migadu-Flow: FLOW_OUT

Hi Huacai,

On 19. Apr 2025, at 04:56, Huacai Chen wrote:
> On Sat, Apr 19, 2025 at 4:22=E2=80=AFAM Thorsten Blum wrote:
>> On 18. Apr 2025, at 22:18, Thorsten Blum wrote:
>>> On 18. Apr 2025, at 17:14, Maciej W. Rozycki wrote:
>>>> On Fri, 18 Apr 2025, Thorsten Blum wrote:
>>>>>>> Does regs_get_register() even work for CPU_CAVIUM_OCTEON when =
accessing
>>>>>>> the last two registers because they're both ULL, not UL? =
(independent of
>>>>>>> my patch)
>>>>>>=20
>>>>>> Or rather two arrays of registers.  With 32-bit configurations =
their
>>>>>> contents have to be retrieved by pieces.  I don't know if it's =
handled by
>>>>>> the caller(s) though as I'm not familiar with this interface.
>>>>>=20
>>>>> Ah, CPU_CAVIUM_OCTEON seems to be 64-bit only, so there's no =
difference
>>>>> between UL and ULL. Then both my patch and your suggestion:
>>>>=20
>>>> So it seems odd to use `long long int' here, but I can't be =
bothered to
>>>> check history.  There could be a valid reason or it could be just =
sloppy
>>>> coding.
>>>>=20
>>>>> I still prefer my approach without '__last[0]' because it also =
silences
>>>>> the following false-positive Coccinelle warning, which is how I =
stumbled
>>>>> upon this in the first place:
>>>>>=20
>>>>> ./ptrace.h:51:15-21: WARNING use flexible-array member instead
>>>>=20
>>>> So make `__last' a flexible array instead?  With a separate patch.
>>>=20
>>> No, '__last[0]' is a fake flexible array and the Coccinelle warning =
is
>>> wrong. We should either ignore the warning or silence it by removing =
the
>>> marker, but turning it into a real flexible array doesn't make =
sense.
>>> I'd prefer to just remove it from the struct.
>>>=20
>>> Stefan or Oleg, do you have any preference?
>>=20
>> Sorry, I meant Thomas, not Stefan.
> In my opinion just changing __last[0] to __last[] is OK, no other
> actions needed.

That doesn't fix the value of MAX_REG_OFFSET - you might be missing some
of the context here.

Thanks,
Thorsten



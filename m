Return-Path: <linux-mips+bounces-8655-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 056BAA9380E
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 15:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA11519E4578
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 13:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E4E224F6;
	Fri, 18 Apr 2025 13:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FN5WuKtR"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6579827815B
	for <linux-mips@vger.kernel.org>; Fri, 18 Apr 2025 13:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744983538; cv=none; b=DBDC0sf1w0aENdwvWUwbo5oiyCJVT3lSmQjl63BH6zzA/KiKW2VTGKytyw4EBy8JPGg9SmLhyZuwrdzedPpIM5P266bwi56+E9drePvGDrAQopBolRoHzQ1dbP7ccvwoWerLEWFZAPONLvP5vgyoY7+1PS8EvO6houu8wZTBcD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744983538; c=relaxed/simple;
	bh=kO4TXd++hwBZjQzMQD8U4pT9kvAlCLy5AyPwOyL8EdY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=kwK/4nsCTgX4cCm6vEzs0qWQvno5uTEAjxbk9pQSMLuKM7H+Z2pavkB2XhpAbHxDK40dYUnMyT0wB8hv3UdaelivCsOSq2rQaoFQ7rsoDGNLpCWXiU1Kl4dQ5/oSnw7gQbuTt1wdVjdYvSiL9JwjxOLfj7sLFqzptSQLJT0mn6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FN5WuKtR; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744983531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dy7lELUhQzZeH0YxMXpaENO/bwqMeT5wgclou8Qfa9M=;
	b=FN5WuKtRsGjJ09ISH7BoU/8XuIVp85PiVjEyTK/8ZbPSXZiuk1jOXXBY6t4QfwTkI9pjom
	7nx/u41qykECMTov+qKU0TFxDD4aAT7FvVUuwFCou9qDz6GNlPrNj4YU395QnEmrTykOl6
	jiumYN2lLSGzC7VKAmy1s4h+NdYp37E=
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
In-Reply-To: <alpine.DEB.2.21.2504181337350.18253@angie.orcam.me.uk>
Date: Fri, 18 Apr 2025 15:38:36 +0200
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Oleg Nesterov <oleg@redhat.com>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B71034AC-B0FC-4C5F-8562-661D6AD11056@linux.dev>
References: <20250417174712.69292-2-thorsten.blum@linux.dev>
 <aAIF_kEFlOOVNDaE@alpha.franken.de>
 <DAD22E95-6D33-43D5-B5E5-3A7B45A63944@linux.dev>
 <alpine.DEB.2.21.2504181108170.18253@angie.orcam.me.uk>
 <EC98BAE8-8269-4169-B3A2-5F426E77C223@linux.dev>
 <alpine.DEB.2.21.2504181337350.18253@angie.orcam.me.uk>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
X-Migadu-Flow: FLOW_OUT

On 18. Apr 2025, at 14:44, Maciej W. Rozycki wrote:
> On Fri, 18 Apr 2025, Thorsten Blum wrote:
>>> Though the fix is incorrect for CPU_CAVIUM_OCTEON, because it =
doesn't=20
>>> allow one to access the second half of the last register, and I find =
it=20
>>> exceedingly complex anyway.  Just:
>>>=20
>>> #define MAX_REG_OFFSET \
>>> (offsetof(struct pt_regs, __last) - sizeof(unsigned long))
>>>=20
>>> will do (as `regs_get_register' operates on `unsigned long' =
quantities).
>>=20
>> Does regs_get_register() even work for CPU_CAVIUM_OCTEON when =
accessing
>> the last two registers because they're both ULL, not UL? (independent =
of
>> my patch)
>=20
> Or rather two arrays of registers.  With 32-bit configurations their=20=

> contents have to be retrieved by pieces.  I don't know if it's handled =
by=20
> the caller(s) though as I'm not familiar with this interface.

Ah, CPU_CAVIUM_OCTEON seems to be 64-bit only, so there's no difference
between UL and ULL. Then both my patch and your suggestion:

  #define MAX_REG_OFFSET (offsetof(struct pt_regs, __last) - =
sizeof(unsigned long))

should be fine.

I still prefer my approach without '__last[0]' because it also silences
the following false-positive Coccinelle warning, which is how I stumbled
upon this in the first place:

  ./ptrace.h:51:15-21: WARNING use flexible-array member instead

Would it make sense to also change the register arrays 'mpl' and 'mtp'
from ULL to UL? ULL seems unnecessarily confusing to me.

Thanks,
Thorsten



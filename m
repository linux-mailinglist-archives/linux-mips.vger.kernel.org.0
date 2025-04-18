Return-Path: <linux-mips+bounces-8660-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8405CA93EC0
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 22:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA14B4640B8
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 20:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E049E1FF1C9;
	Fri, 18 Apr 2025 20:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NCzJ1JyW"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6272A1C9
	for <linux-mips@vger.kernel.org>; Fri, 18 Apr 2025 20:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745007509; cv=none; b=lQiejBHfQqowyY1dPMucgZLYI4ht3e1NpTPWN1+wSwKz/J8RyPlc+J+bxD2aGN20yFaWxwAbm7D2gSM9jtS0VYg3p8S6L05MSA3JrpDK4fPO4afRsmIdq/yY16ZZ8RBdoeBLcOFD84AZWVCa2VxAbatW7n1CR8+zBWhtDs16LDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745007509; c=relaxed/simple;
	bh=+gExOPpVQD+TPcximZ18kwEUIasrdH/8AW2aqjpYadI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=oZIkl8d3LZ5QpKSn2eiFq5WGB2PV90wJ715vPVO5f0N7HRwG0IIETI+X9bCa0gjg0GlbcaVjzvjeaT3QdJmAxoGKF1q6raVYHnf1HAA+lLSwSZUhpiB0R+Qek3YLCodaZ0va+Q+FlxNgvTMStogHMf5XHuafHd4I+pR99HbvfZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NCzJ1JyW; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745007505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m267KMnh11eY/E2lG6dYUeTKE5+TBuSQ9Wkb2jjQV1Q=;
	b=NCzJ1JyWUOzC/SID6RwGjFZRyL7Rm5u7wEbRL58XWGTJKGDv+LvXmu3Vi1Crn81LURoGbq
	A1IGuzdZ6VOydFo2PkzHBvBwjqCbOYQbz+y9QSM2Yz2GLIb7C1RbIowBs5XUh8iF2wFktd
	CrykejhEKsgWsdkQRh5TvtQ8dOjlqt4=
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
In-Reply-To: <alpine.DEB.2.21.2504181608420.18253@angie.orcam.me.uk>
Date: Fri, 18 Apr 2025 22:18:10 +0200
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Oleg Nesterov <oleg@redhat.com>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9F6CA7CB-B36A-4F79-B78C-7ED63E39260D@linux.dev>
References: <20250417174712.69292-2-thorsten.blum@linux.dev>
 <aAIF_kEFlOOVNDaE@alpha.franken.de>
 <DAD22E95-6D33-43D5-B5E5-3A7B45A63944@linux.dev>
 <alpine.DEB.2.21.2504181108170.18253@angie.orcam.me.uk>
 <EC98BAE8-8269-4169-B3A2-5F426E77C223@linux.dev>
 <alpine.DEB.2.21.2504181337350.18253@angie.orcam.me.uk>
 <B71034AC-B0FC-4C5F-8562-661D6AD11056@linux.dev>
 <alpine.DEB.2.21.2504181608420.18253@angie.orcam.me.uk>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
X-Migadu-Flow: FLOW_OUT

On 18. Apr 2025, at 17:14, Maciej W. Rozycki wrote:
> On Fri, 18 Apr 2025, Thorsten Blum wrote:
>>>> Does regs_get_register() even work for CPU_CAVIUM_OCTEON when =
accessing
>>>> the last two registers because they're both ULL, not UL? =
(independent of
>>>> my patch)
>>>=20
>>> Or rather two arrays of registers.  With 32-bit configurations their=20=

>>> contents have to be retrieved by pieces.  I don't know if it's =
handled by=20
>>> the caller(s) though as I'm not familiar with this interface.
>>=20
>> Ah, CPU_CAVIUM_OCTEON seems to be 64-bit only, so there's no =
difference
>> between UL and ULL. Then both my patch and your suggestion:
>=20
> So it seems odd to use `long long int' here, but I can't be bothered =
to=20
> check history.  There could be a valid reason or it could be just =
sloppy=20
> coding.
>=20
>> I still prefer my approach without '__last[0]' because it also =
silences
>> the following false-positive Coccinelle warning, which is how I =
stumbled
>> upon this in the first place:
>>=20
>>  ./ptrace.h:51:15-21: WARNING use flexible-array member instead
>=20
> So make `__last' a flexible array instead?  With a separate patch.

No, '__last[0]' is a fake flexible array and the Coccinelle warning is
wrong. We should either ignore the warning or silence it by removing the
marker, but turning it into a real flexible array doesn't make sense.
I'd prefer to just remove it from the struct.

Stefan or Oleg, do you have any preference?

> Would it make sense to also change the register arrays 'mpl' and 'mtp'
>> from ULL to UL? ULL seems unnecessarily confusing to me.
>=20
> Maybe, but I'm not familiar enough with the Cavium Octeon platform to=20=

> decide offhand and I won't dive into it, sorry.

Everything I've found about Cavium Octeon indicates it's 64-bit only, so
whether we use UL or ULL doesn't matter - they're both 64-bit values.

Thorsten



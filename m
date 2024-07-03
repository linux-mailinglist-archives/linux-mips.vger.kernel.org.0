Return-Path: <linux-mips+bounces-4126-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0BB92696D
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 22:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20F571C2430F
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 20:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C294A185095;
	Wed,  3 Jul 2024 20:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="FsKj0PrA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PTFaLboR"
X-Original-To: linux-mips@vger.kernel.org
Received: from flow5-smtp.messagingengine.com (flow5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADB04C6C;
	Wed,  3 Jul 2024 20:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720037760; cv=none; b=aHzX7JpsQZMtYoPg7mj8pBtsQ9+lAqVZ2617YuC8SsSL7y/PkIlq3qUi2ZpXPx5b9Fgw6rsU6GXN4cBm0l7mo54FD65kUe8nvj/cDIR8t64Jxy6cVWIpt4zN3ffWkKKDwmvRmeoTyMyVMGGUHamzKg1XGo/T+0b8cpudnzGWJyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720037760; c=relaxed/simple;
	bh=P5wNJ9gsyoEKAcFfUB01DuXV2qGlNcanG72NtYGP7D0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=Y9JGxS2V5xPJH8vmFR+nLL1IWZYsg4f6JRtVO4d+cz6bEozLOqeDPNDsYlUTeStevO8IBNeodgil2qxDJUE2rRfg5E4KHTVLqGIcMitxHEuNJ6mHjnFcrBLhdqwwKKR5q5WmICms58oFMQwMnkDr6SgYLDaqOHnLW75aU46bhow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=FsKj0PrA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PTFaLboR; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailflow.nyi.internal (Postfix) with ESMTP id 16DA02004F9;
	Wed,  3 Jul 2024 16:15:58 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 03 Jul 2024 16:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720037758;
	 x=1720044958; bh=HSAxzquXwRyiEDZ1fHQ9wErG/hRJ0VszrFLvyboz7pM=; b=
	FsKj0PrAQdMspVUqpD508lLSglz0iLYOgBTBSrM7fWFhnALm/407EOascTQelCsF
	cVSJMh9v71IC7mJ24JOobMW3XjGzaWmWssqgR7qg6PCwmMY3tJMJhXkaEI95oU1h
	xyfluu6S7wsZf/p/PjGgC6Ayu4MwJlE4Fdr3EfWYp0pn0d95PHl6MiG0bLIHbVU5
	9OLK61yI5iiv1HqvyYuqfECcmZJWVz4zV4h8/1zPhgY+Em55MWPFYaKiUm+VUlev
	zfKSnLFNuf4LmMtA4q5qkDNrp9uia/hpk0FPwarh61oTTgMouqj39jv5HAqNQOao
	hpATt8sTcodwkiLze5wOdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=ifd894703.fm2; t=
	1720037758; x=1720044958; bh=HSAxzquXwRyiEDZ1fHQ9wErG/hRJ0VszrFL
	vyboz7pM=; b=PTFaLboRWbeKSMCZKRiBvGtQMhtn6alstkDy9HZwIeZMBzJAntf
	8gEsQ3gP6CHKe2uawnWM6wwkQ0aWlDQOw7e4ylsHlpZDK6dyRdq/5fdMI5nRtTc+
	Ss6KR/iG1UDCbblpkBYxhA+QElW8KZuKjd2zbhKCZG8ial9iwwoqxtOky9JYQfG4
	YqWSm0omEgHgIbAAV9Uf5YFZCw/qOhqEY45BMDa5n6oFRW0VPzNab9egcwXrmP1A
	HQ49ryL6/2n1qRfxPtxFSL03OKBknv0Zws5h2B7Q0Np5yQrjEHYShjpVYb5WuVQ3
	uHcfC/27zr5Zk15xo609dWFqG9wy2uZXYiQ==
X-ME-Sender: <xms:fbGFZoaRwMIc9S9DAGnzzFGZ0INzuWfX0FQsVQPud9BQcGpflI1JAw>
    <xme:fbGFZjZ2OpLVmzv4Pc5mRMOcPH4AjZg65tVlud_l7NUXLcW0L0wJJAADI1Qa3cFqv
    JPKlzBNDojWOxPJdwU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgddugeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:fbGFZi8xQY5CAiTowXYdV8rr12CSDweSU11YOXFJkJ9GUOUZ7HWJYw>
    <xmx:frGFZiqXKYLbMzPz2nUj8ybvGsUx6cbzMoZgJ6lsrtRPc0jI8AnySg>
    <xmx:frGFZjrdgMwax36NjNOrtdJ8KsTO4XmE5YJRLM8i_0usSsLwyqus1g>
    <xmx:frGFZgTq_pcyW5Mww6MkOX9JNOSI4wtQUQrJ6eK2Nmf5zYcjTqL9ww>
    <xmx:frGFZjrNFmRMHJBUhYorFqSLVZPTMVqkgXm4jbOI_E4KB_tJFP0NBLY_>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DC33436A0074; Wed,  3 Jul 2024 16:15:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <7a822a33-dd67-4827-bbd0-01e75e203951@app.fastmail.com>
In-Reply-To: <ZoVokcDYqZnuqd2X@alpha.franken.de>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
 <20240616-b4-mips-ipi-improvements-v1-1-e332687f1692@flygoat.com>
 <ZoVokcDYqZnuqd2X@alpha.franken.de>
Date: Thu, 04 Jul 2024 04:15:21 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] MIPS: smp: Make IPI interrupts scalable
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B47=E6=9C=883=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=E5=
=8D=8811:04=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=BC=9A
> On Sun, Jun 16, 2024 at 10:03:05PM +0100, Jiaxun Yang wrote:
>> Define enum ipi_message_type as other architectures did to
>> allow easy extension to number of IPI interrupts, fiddle
>> around platform IPI code to adopt to the new infra, add
>> extensive BUILD_BUG_ON on IPI numbers to ensure future
>> extensions won't break existing platforms.
>>=20
>> IPI related stuff are pulled to asm/ipi.h to avoid include
>> linux/interrupt.h in asm/smp.h.
>>=20
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  arch/mips/cavium-octeon/smp.c   | 109 ++++++++++++------------------=
-----
>>  arch/mips/include/asm/ipi.h     |  34 +++++++++++
>>  arch/mips/include/asm/smp-ops.h |   8 +--
>>  arch/mips/include/asm/smp.h     |  42 ++++++--------
>>  arch/mips/kernel/smp-bmips.c    |  43 +++++++-------
>>  arch/mips/kernel/smp-cps.c      |   1 +
>>  arch/mips/kernel/smp.c          | 124 ++++++++++++++++++++----------=
----------
>>  arch/mips/loongson64/smp.c      |  51 +++++++++--------
>>  arch/mips/mm/c-octeon.c         |   2 +-
>>  arch/mips/sgi-ip27/ip27-smp.c   |  15 +++--
>>  arch/mips/sgi-ip30/ip30-smp.c   |  15 +++--
>>  arch/mips/sibyte/bcm1480/smp.c  |  19 +++---
>>  arch/mips/sibyte/sb1250/smp.c   |  13 +++--
>>  13 files changed, 236 insertions(+), 240 deletions(-)
>
> you are touching a lot of platforms, how many did you test ?

As mentioned in cover letter:

```
It has been tested on MIPS Boston I6500, malta SOC-It, Loongson-2K,
Cavium CN7130 (EdgeRouter 4), and an unannounced interaptiv UP MT
platform with EIC.

I don't really know broadcom platforms and SGI platforms well so
changes to those platforms are kept minimal (no functional change).
```

Thanks
- Jiaxun

>
> Thomas.
>
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not necessa=
rily a
> good idea.                                                [ RFC1925, 2=
.3 ]

--=20
- Jiaxun


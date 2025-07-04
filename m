Return-Path: <linux-mips+bounces-9632-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC48AF969E
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 17:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E49CE7ACF3C
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 15:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AD014D29B;
	Fri,  4 Jul 2025 15:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OjYSZsw8"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63A214B08A;
	Fri,  4 Jul 2025 15:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642246; cv=none; b=Saq8iAaRF9nTxERlSZTYYL8g+Ij36iMdpCL7WovxmFQKhHky/mj24Ot/8ZIqcPTt7PFPKbKHD9fQx+05KVCeU0YX+dpziPQRgGM6rynlC+3tq3UKHJ4h0VEvP9pVIEprxq6G+fNbYPvnYFATemjSrF8T8gPYJGg3G96Om6tDhGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642246; c=relaxed/simple;
	bh=n7LOfSsjXE2FVStfZuw4MIKye9uX/BCPm/v95WafbBg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IS1JNecey6xJDRPZM3NsnEzkFL3wwPROwZnSbli3O3R0liYcIo3lqcWcKYiZHnxask5xrPvmQS+g5mIoPlI1QJDyk8D0MJlxMEf6EWpSBaVzuo5/s2u3iNAmho4DJ3W4EKH0kU2i8zoHHsuDeg8sqJJaU9hwyFPR096WasRXttQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OjYSZsw8; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BC48444D5;
	Fri,  4 Jul 2025 15:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751642235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/vPDsl7h2Bce2nbFPpZwQgcXwb0DMKbxlxKdGJMWDlk=;
	b=OjYSZsw8Bn/lPEEuZ/zT/ZWBMzACf1NkagEE6r3RmYhuXncRqUKcozz8UbibxN8M+UM53w
	5KCH3FY+8+bYmUYW8qJTughgWJ+1qgywUibS0SjsnHWskADrYiNSCOnjiLt7hzAtHvuLb9
	P+buEXUFLCp+TU4+Wtd2PWVTE+8gCZdWzSaI8WTQAjlbHr83pVLyYctwf7z/LVEK7pMhIX
	Pz2sArh5UPnXVepkpVIJtW0zCYkqV++Ds+VTdCkP0Lo54B2E8UfDpSJu0Ces4HB22tZQvH
	RBenF7bqjxNeDa3klct1EFjGEI+SHFRnEtgsVaJHgCMFKDJKR6oofzU3VD+khQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: disable MMID if GINVT is not usable
In-Reply-To: <aGUhUM1y-ZLGWZg-@alpha.franken.de>
References: <20250625-mmid_disable_no_ginv_on_noc-v1-1-38a3902607a7@bootlin.com>
 <808e21d2-1212-4358-9ba6-29f9d097be8a@app.fastmail.com>
 <aGUhUM1y-ZLGWZg-@alpha.franken.de>
Date: Fri, 04 Jul 2025 17:17:14 +0200
Message-ID: <87h5zsgf45.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfeehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffffkgggtgfesthhqredttddtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfegvdehgfdtjedvtefhvdeikefgteeuhfeukeettefgvdeuueettddtkeegveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegurgdtugemjedtheehmegutdduvgemudegkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegurgdtugemjedtheehmegutdduvgemudegkeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtohepvhhlrggui
 hhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtrgiffhhikhdrsggrhihouhhksehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: gregory.clement@bootlin.com

Thomas Bogendoerfer <tsbogend@alpha.franken.de> writes:

> On Wed, Jun 25, 2025 at 03:44:00PM +0100, Jiaxun Yang wrote:
>> =E5=9C=A82025=E5=B9=B46=E6=9C=8825=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=
=E5=8D=882:27=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>>=20
>> Hi Gregory,
>>=20
>> > If System-level Interconnect (aka Network on Chip) does not support
>> > the global invalidation, then MMID feature is not usable. Indeed the
>> > current implementation of MMID relies on the GINV* instruction.
>>=20
>> Yes, it is the case if the NoC IP can't handle AMBA ACE DVM requests.
>>=20
>> >
>> > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> > ---
>> >  arch/mips/Kconfig                    | 6 ++++++
>> >  arch/mips/include/asm/cpu-features.h | 5 ++++-
>> >  arch/mips/mobileye/Kconfig           | 2 ++
>> >  3 files changed, 12 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> > index=20
>> > 1e48184ecf1ec8e29c0a25de6452ece5da835e30..05ce008459b89f03fa71d9442960=
7feb9d06526f=20
>> > 100644
>> > --- a/arch/mips/Kconfig
>> > +++ b/arch/mips/Kconfig
>> > @@ -2575,6 +2575,12 @@ config WAR_R10000_LLSC
>> >  config WAR_MIPS34K_MISSED_ITLB
>> >  	bool
>> >=20
>> > +# Some I6500 based SoC do not support the global invalidation on their
>> > +# System-level Interconnect (aka Network on Chip), this have an
>> > +# influence on the MMID support.
>> > +config GINVT_UNSUPPORTED_NOC
>> > +	bool
>> > +
>>=20
>> I believe this should be a DeviceTree property of CM node instead of Kco=
nfig
>> hack.
>
> Either that or by a runtime check, if possible.

Unfortunately we can't detect at runtime this (lack of) feature on the
NoC, so it has to be a device tree property.

Gregory

>
> Thomas.
>
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 ]

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


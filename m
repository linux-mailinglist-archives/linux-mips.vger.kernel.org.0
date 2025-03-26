Return-Path: <linux-mips+bounces-8370-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8C8A71461
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 11:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C7043ACFFA
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 10:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A8C1B0F0B;
	Wed, 26 Mar 2025 10:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UnhEVOve"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0F58C1F;
	Wed, 26 Mar 2025 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742983462; cv=none; b=QhUxQ+S8VQarIfQB1yZFVb7mZg2vMiW6lA4L8Ge3he3twjaXKcLWQwG5Z/iXJz5zLVUY0bb0qRXtl1LIvtGiSllcgnivNPQsoe4RLZTBlHXlu24Ou/65LuVMie1iIoKKKnnaf/HcZ3RXN/gcQW7i04cR6LXmzCfG72zX9V8yTlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742983462; c=relaxed/simple;
	bh=OSQzX4kBNdMJcD7vMO1kOYwadCccPeHTBGPWcJm7IY0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=gdaq6eP1qBJS97vkWQ32rZuWTl3il3t7vIC9/U4Os6JHXIvUJT728iOOU87KqaC7umn/iqL88zMkstEQW866QhdU9PKtQ4YTuWNLn35+AFPAgi7IoTdKiiNi7jyFampFjkJW1xFbEjlFyPtzZOG8gKs8cJWV/dHh2/HRtKOyKX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UnhEVOve; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 159D420483;
	Wed, 26 Mar 2025 10:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742983456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6SJe1q7HnXDWNnYhZ89APQIhGwWw4epexqG70iweUg=;
	b=UnhEVOveRNaKW893lMfVvlDfa3mHmkxnR4jwgXzcsSN7fbcT78GzLuvdmauZlL98E+SY/w
	gn2nY2B5yosz8Jpi6HOz+/IYsp9tNQfKceIoojhV6xJJUFrE2i2TuG3clP1w7HwYyMXP8K
	g5IcszNCc1wdYrGeCSdyDP8Z5yc8MI17tVSv9ax4u+gi/Ifd76NQA9lpARaC+c0E1FE3xx
	uNkHhFAjlJeX+PvLp4wBhJTwujuUtCdQKHoIKKlxJZZ0WnR3FU5KwFknwtX6UP1IO2hGGr
	GsQGgAZjsIqA40iFtfASlu7vSv/TCQFfjWBzqX9d7HhjIQqfl/5DUwkDofpjEg==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Mar 2025 11:04:14 +0100
Message-Id: <D8Q42H2O4AC0.1HV63W6F5L45U@bootlin.com>
Subject: Re: [PATCH net-next 05/13] net: macb: add no LSO capability
 (MACB_CAPS_NO_LSO)
Cc: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-mips@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Claudiu Beznea" <claudiu.beznea@tuxon.dev>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Samuel
 Holland" <samuel.holland@sifive.com>, "Richard Cochran"
 <richardcochran@gmail.com>, "Russell King" <linux@armlinux.org.uk>, "Thomas
 Bogendoerfer" <tsbogend@alpha.franken.de>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-5-537b7e37971d@bootlin.com>
 <3e6cb322-bc8d-471c-87c8-286b98f12ad9@tuxon.dev>
In-Reply-To: <3e6cb322-bc8d-471c-87c8-286b98f12ad9@tuxon.dev>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevvffhofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduteeltdevjedvkeelueejhfdvleeiueetvdfgveffffekueeghffhieduleejveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrddufeehrdekuddrieehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvjedprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Claudiu,

On Mon Mar 24, 2025 at 9:18 AM CET, Claudiu Beznea wrote:
> On 21.03.2025 21:09, Th=C3=A9o Lebrun wrote:
>> LSO is runtime-detected using the PBUF_LSO field inside register
>> designcfg_debug6/GEM_DCFG6. Allow disabling that feature if it is
>> broken by using struct macb_config->caps.
>>=20
>> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>> ---
>>  drivers/net/ethernet/cadence/macb.h      | 1 +
>>  drivers/net/ethernet/cadence/macb_main.c | 5 +++--
>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/=
cadence/macb.h
>> index 3b43cb9468e3618754ff2bc6c5f360447bdeeed0..e9da6e3b869fc772613a0d6b=
86308917c9bff7fe 100644
>> --- a/drivers/net/ethernet/cadence/macb.h
>> +++ b/drivers/net/ethernet/cadence/macb.h
>> @@ -739,6 +739,7 @@
>>  #define MACB_CAPS_MIIONRGMII			BIT(9)
>>  #define MACB_CAPS_NEED_TSUCLK			BIT(10)
>>  #define MACB_CAPS_QUEUE_DISABLE			BIT(11)
>> +#define MACB_CAPS_NO_LSO			BIT(12)
>>  #define MACB_CAPS_PCS				BIT(24)
>>  #define MACB_CAPS_HIGH_SPEED			BIT(25)
>>  #define MACB_CAPS_CLK_HW_CHG			BIT(26)
>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethe=
rnet/cadence/macb_main.c
>> index b5797c1ac0a41e9472883b013c1e44a01092f257..807f7abbd9941bf624f14a5d=
dead68dad1c8deb2 100644
>> --- a/drivers/net/ethernet/cadence/macb_main.c
>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>> @@ -4373,8 +4373,9 @@ static int macb_init(struct platform_device *pdev)
>>  	/* Set features */
>>  	dev->hw_features =3D NETIF_F_SG;
>> =20
>> -	/* Check LSO capability */
>> -	if (GEM_BFEXT(PBUF_LSO, gem_readl(bp, DCFG6)))
>> +	/* Check LSO capability; capability is for buggy HW */
>
> The comment here is a bit confusing to me.

Proposal:

+  /* Check LSO capability; runtime detection can be overridden by a cap
+   * flag if the hardware is known to be buggy */

I'll use that in V2, or feel free to reply if it's still unclear.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



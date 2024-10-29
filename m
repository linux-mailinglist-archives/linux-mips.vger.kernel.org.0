Return-Path: <linux-mips+bounces-6548-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 801909B4EE2
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2024 17:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD6751C22792
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2024 16:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BCE194C8B;
	Tue, 29 Oct 2024 16:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ha3cgDFY"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FF03234;
	Tue, 29 Oct 2024 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730218103; cv=none; b=fvr3T2J3zGX1Lb3o4oQzXiQgMXQIwJ0VHxDbBFaw8VcBuH6N2lOZ/DOWjHw4FSFseKrwNdHEdxbyeOJhMbKU3fRTkXD1PZ7J1YwWYCIceZpox7JQ7QcgFQuvXeHGbs2jDUr231P/NlAvFmrQDCzIgMRn1mTxfn6DsZIVZNDjcms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730218103; c=relaxed/simple;
	bh=pEEgmKqffQFzmqj8ykis15Zi9V5UO7HzvrRctrtoxYo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EVCTz90MdGpVM+PXRCactco8gcFsOGevi6uUJjeeblA6CN2gYN9FNyg9DqC9Tn6aQTMgrkiWPZ54eiM2X+1RJJcOiDliBhMfiyU29fr2SUOQjAPtvXahXn1l7LsSEAq1PmSYH5WvLBEfckCuwIqncN8x1zixOcRv+meN1SjQPIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ha3cgDFY; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC47840004;
	Tue, 29 Oct 2024 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730218098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cI5BMuCDHsewocfKBe4gRnPXoUqLm4C3ekGqPWG2gTY=;
	b=ha3cgDFYJjhtYoY84v8mDRpNZJcf8lSlgV+G3FZb5/Ki1vm4Z8hV340MfeCojpT0qlmFih
	e9ZRib6y8DzPfWrJUiKKHpiYqofls/q6NAzDtcWqegQT9gUo8xMXLKSs3D6S+mtacmHifd
	QoAF5KndjHJv1WZ7esKTCaUeXPCcDJy3qBt4GQA9KH/irQ+I8OFD3Pu7R1BWBWyUrnc3jn
	YCKwBe61qfF5skMLvshatWrqZCKG+taKhQt9INw3smK2pVWT2Y/PqIy9MJEbs3eFUazHfj
	NLtDaFuZQle7VXvEr9tzCCp0v9Oj8mc1YgPbUiKQnt/WZAHgxQtTT7p8Th2nag==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Aleksandar Rikalo <arikalo@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Theo Lebrun <theo.lebrun@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Djordje
 Todorovic <djordje.todorovic@htecgroup.com>, Chao-ying Fu
 <cfu@wavecomp.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@kernel.org>, Hauke
 Mehrtens <hauke@hauke-m.de>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Paul Burton
 <paulburton@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Serge
 Semin <fancer.lancer@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v8 10/13] dt-bindings: mips: cpu: Add property for
 broken HCI information
In-Reply-To: <CAGQJe6p6QgSQKByVQ8G+HpWbdEHnfNb8vRureOrS2VZa6Lk74A@mail.gmail.com>
References: <20241028175935.51250-1-arikalo@gmail.com>
 <20241028175935.51250-11-arikalo@gmail.com>
 <avz4crm2yrk3fg7r4qxkgkt3ka5hmk54v2wtcms453tsnewu5w@jzjxmyd4b7yg>
 <CAGQJe6p6QgSQKByVQ8G+HpWbdEHnfNb8vRureOrS2VZa6Lk74A@mail.gmail.com>
Date: Tue, 29 Oct 2024 17:08:16 +0100
Message-ID: <87seseao3z.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

> On Tue, Oct 29, 2024 at 8:03=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
>
>> > diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Docume=
ntation/devicetree/bindings/mips/cpus.yaml
>> > index a85137add668..57e93c07ab1b 100644
>> > --- a/Documentation/devicetree/bindings/mips/cpus.yaml
>> > +++ b/Documentation/devicetree/bindings/mips/cpus.yaml
>> > @@ -47,6 +47,12 @@ properties:
>> >    clocks:
>> >      maxItems: 1
>> >
>> > +  cm3-l2-config-hci-broken:
>>
>> Are these names - cm3, l2, hci - obvious and known in MIPS? HCI usually
>> means something else - see drivers/bluetooth/ and drivers/nfc/
>
> I would say yes. At least the name "CM3" (Coherence Manager 3) is
> common knowledge.
> L2 HCI (L2 Hardware Cache Initialization) is a feature of CM3 that is
> non-functional on some systems.
>
>> Is this property applicable for all MIPS vendors? There is no vendor
>> prefix here, so this is generic for this architecture, right?
>
> I'm honestly not sure if this is something that only one vendor will use.
> Theoretically, there could be more. Perhaps Gregory CLEMENT can give a
> more precise answer.

All I know is that this property is needed because of an issue in this
CPU designed by Imagination. So, to my knowledge, it is present at least
on some Imagination CPUs, but since it is an issue, I think any other
MIPS designer could encounter the same problem.

Gregory

>
> Best Regards,
> Aleksandar

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


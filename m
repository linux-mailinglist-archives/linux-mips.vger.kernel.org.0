Return-Path: <linux-mips+bounces-6578-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 143529B761F
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 09:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 808BB281108
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 08:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3F9154C0D;
	Thu, 31 Oct 2024 08:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ur6j9tUU"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E33F1531C0;
	Thu, 31 Oct 2024 08:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730362453; cv=none; b=VPzctUVbftxHC8hT0JKaOL9tNTQx8yU2G7vy049znkus0OuG9sAUEPjHKmQeiu8VCSYJfr9xIjTtz+03Y2drn9097GnfVK8Lc/ghHMiIm01yE2xudP2G2vuUFJrKZvqk0e52XpLuzBeY0LUjfUtNa3zWWttnsGohHcaORJtMX1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730362453; c=relaxed/simple;
	bh=yHVx56kdklX6a6WjIJViALRYiu1NFmOidLIkcT/rSnk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dHBOH/Oqb1aNPJoEZr017FD+jf/gq6vWA0jv9cZtJYiW3MLS5IhbYNN55pKDyI/xvvXeqqlOeHpezbT5vbd7OZ+yreKh7+F9GD51A17VxqZ64MwPu0KD7nVKzPt1SLTYxdFnBX0nfCiq0wOo5zESCrIXdHxVJz/E1Pna5Sducxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ur6j9tUU; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15ED1E0002;
	Thu, 31 Oct 2024 08:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730362442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yHVx56kdklX6a6WjIJViALRYiu1NFmOidLIkcT/rSnk=;
	b=Ur6j9tUU4ZhbyRKqUfVHQ3jArwWtmk9Xn2jBMAiYT4BUAKxd9GPgd95GmNvH5foMwnZPb3
	A8tzAY/dlFoaZxqyyvE9hyWunygPFYVoPRr7RQbYQYqkvcdBtQeTusz11pUcFfow8f0F0C
	DznNnW1x1cDi4E0E+eHMsdW7Njq2MGbIwwnVi8+ZD3j1I+a7pLUItUZY1jGAJD4O1Q9Ku5
	T9yXadtxw86RarC07Vc+PmrFEZ+/PP8ATpUEiO4wnmS58uHWzJswG1tkcTiPC/eUDVJu3d
	nyqXlTxPZ3l6+8emdKkGEbsJJ7ucr/QyUbs3nQd4JbfRlTdV7PsLfvSfU2mSaQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Theo Lebrun <theo.lebrun@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Djordje
 Todorovic <djordje.todorovic@htecgroup.com>, Chao-ying Fu
 <cfu@wavecomp.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@kernel.org>, Hauke
 Mehrtens <hauke@hauke-m.de>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 linux-kernel@vger.kernel.org, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Serge Semin <fancer.lancer@gmail.com>, Tiezhu Yang
 <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v8 10/13] dt-bindings: mips: cpu: Add property for
 broken HCI information
In-Reply-To: <378f8b70-12d9-4ec3-a1e5-35bd992bfc90@app.fastmail.com>
References: <20241028175935.51250-1-arikalo@gmail.com>
 <20241028175935.51250-11-arikalo@gmail.com>
 <avz4crm2yrk3fg7r4qxkgkt3ka5hmk54v2wtcms453tsnewu5w@jzjxmyd4b7yg>
 <CAGQJe6p6QgSQKByVQ8G+HpWbdEHnfNb8vRureOrS2VZa6Lk74A@mail.gmail.com>
 <29d7688e-5fac-4821-8764-bdc760112370@app.fastmail.com>
 <378f8b70-12d9-4ec3-a1e5-35bd992bfc90@app.fastmail.com>
Date: Thu, 31 Oct 2024 09:13:57 +0100
Message-ID: <87jzdoadve.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hi Jiaxun,

> =E5=9C=A82024=E5=B9=B410=E6=9C=8829=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8B=
=E5=8D=884:11=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
>> =E5=9C=A82024=E5=B9=B410=E6=9C=8829=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8B=
=E5=8D=8812:21=EF=BC=8CAleksandar Rikalo=E5=86=99=E9=81=93=EF=BC=9A
>> [...]
>>>
>>>> Is this property applicable for all MIPS vendors? There is no vendor
>>>> prefix here, so this is generic for this architecture, right?
>>
>> I'd say the best vendor prefix is mti in this case.
>>
>> CM3 IP block is supplied by MIPS Technology, it is not a part of MIPS
>> architecture spec.
>
> I just tried to revise this problem and I think a better approach would
> be picking my CM binding [1] patch and add this as a property to CM bindi=
ng.
>
> You don't need to pick rest of that series, this binding alone is suffici=
ent,
> and it's already being reviewed.
>
> Thanks
> [1]:
> https://lore.kernel.org/all/20240612-cm_probe-v2-5-a5b55440563c@flygoat.c=
om/

I had a look at your series and it seems that all the issues raised were
solved, so why wasn't it merged?

Regarding the binding in particular: If we add the property
"cm3-l2-config-hci-broken", then it should be optional. However, the reg
property also should be optional. Indeed, if we can detect the CM
address, we shouldn't use a reg property.

If we go in this direction, not only will the binding be modified but
also code in arch/mips/kernel/mips-cm.c to handle this new property and
manage the case where the reg is not needed. Additionally, we'll need to
modify code in arch/mips/kernel/smp-cps.c to retrieve information about
the HCI.

I can write a series to illustrate it, if needed.

Gregory

>>
>> Thanks
>> --=20
>> - Jiaxun
>
> --=20
> - Jiaxun

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


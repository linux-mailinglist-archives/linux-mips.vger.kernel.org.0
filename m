Return-Path: <linux-mips+bounces-7100-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E439F8600
	for <lists+linux-mips@lfdr.de>; Thu, 19 Dec 2024 21:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D28F116A28F
	for <lists+linux-mips@lfdr.de>; Thu, 19 Dec 2024 20:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70ABF1BD9CB;
	Thu, 19 Dec 2024 20:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="jqEFdJVO"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F063C19F13B
	for <linux-mips@vger.kernel.org>; Thu, 19 Dec 2024 20:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734640608; cv=none; b=tlK1K2lc2vsOhKvnsoU+X1PVK9VcYTIikREBcsrSzjGefLk2DOBPvpaLrrVB5k3M4Ud3xDygT/1ny7ngIcBg5eKmZ2xHJoPj8grOg2jHwcRgR29Ik+lBwotU5ep/15SilGpyPLzS2isivoYce2Cdyz6VfYSJG7vuwBwFJLVjPdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734640608; c=relaxed/simple;
	bh=wda/lOi/x8S8oGXon3Gu91m7K9vSKbCp+D1/y3DYncA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dPfUnU0jyqLM/No9dMg4j4gGAY9PHEhga1CFLr7PKHQTP1Ffvw6oGEhLtM8lLdN7HfdpjwpIHkx4F7LJlGLS2um/WIFCZrtXhRGVu2oSOf3GjrXIVynqDlUUqc8+cJOMKWVZJMIxivTo2w0JOdYdVtd2BKfsSALcv8OryMn4//Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=jqEFdJVO; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C375F2C07BD;
	Fri, 20 Dec 2024 09:36:37 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1734640597;
	bh=8beJoOU5Nrta/GXSMFPY+yvlk7KJmBRMZB0sO9Gd+Ro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jqEFdJVOq6Df+bjKIhfgMOLjctChMcKvTbYs8PHUtnLpfZGHn7w/8zVcTIP7moPxB
	 odBUo1Ekh2zZODP3gutiiEDziPjZRxEDphGwbaEkUW7xTVTnYX+6zbH+XIhHa2b0Hy
	 ujZukwsR/X4uhOhJiPfrk8Of3IgryH0hNTXBd6efKMvPfq9eYddXKoSQNAF1dxq9lO
	 RJLbkssXvY5Lv9qhJ1XOrQ52QMZ9mzN4p/vPQjB2ngYcLDYu7Y7IDGSo8V9lDw29qF
	 qV3YYmTRy2S2+kDGiJrc2clnMq8CH2Ye9lLRDZ551tHv4IZxJH5L/4hi8r5C5gigOy
	 oVZYPZZvsKTRw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B676483d50000>; Fri, 20 Dec 2024 09:36:37 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id A90AE13EE00;
	Fri, 20 Dec 2024 09:36:37 +1300 (NZDT)
Message-ID: <fe34b6b0-01fd-4dc7-a1b4-6c27ad2c9e74@alliedtelesis.co.nz>
Date: Fri, 20 Dec 2024 09:36:37 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 4/4] net: mdio: Add RTL9300 MDIO driver
To: Andrew Lunn <andrew@lunn.ch>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de,
 hkallweit1@gmail.com, linux@armlinux.org.uk, markus.stockhausen@gmx.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org
References: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz>
 <20241216031346.2626805-5-chris.packham@alliedtelesis.co.nz>
 <CAJq09z49uBPPZqDyc3O+4nVppKoKdrJunQnQKBUfQmwzdV+ZFQ@mail.gmail.com>
 <07073382-df51-4064-9802-cdbfcf732523@lunn.ch>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <07073382-df51-4064-9802-cdbfcf732523@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=676483d5 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=TaXqMiGPp3LDd7P4VpYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat


On 19/12/2024 22:40, Andrew Lunn wrote:
> On Thu, Dec 19, 2024 at 01:46:41AM -0300, Luiz Angelo Daros de Luca wro=
te:
>> Hello Chris,
>>
>>> +++ b/drivers/net/mdio/mdio-realtek-rtl.c
>> I wonder if the name might be dubious in the future with other realtek
>> products with MDIO. Realtek is quite a large company with many
>> products. Would a version/model/family/usage in that name help a far
>> future reader to identify what this file is about?
> Isnt rtl the family name? Or would you prefer mdio-realtek-rtl9300.c?

Yes my intention was that "rtl" was the family name. I'm happy to change=20
to rtl9300.

I suspect this probably will be compatible with the rtl9310. I've just=20
received a RTL9313 based board so will probably start looking at that in=20
the new year.

>>> +static int realtek_mdio_wait_ready(struct realtek_mdio_priv *priv)
>> All those realtek_mdio_* prefix might collide with realtek_mdio_* from
>> drivers/net/dsa/realtek/realtek-mdio.c. This realtek_mdio_* is about a
>> Realtek SoC MDIO interface with the switch. The other realtek_mdio_*
>> is about the interface (MDIO or SMI) between (the other vendor) SoC
>> and the switch. I don't know if the maintainers are OK with it but
>> listing those symbols in alphabetic order from both sources might be
>> confusing.
> rtl9300_ as a prefix?

I'd happily=C2=A0 change to rtl_ or rtl9300_

>>> +static const struct of_device_id realtek_mdio_ids[] =3D {
>>> +       { .compatible =3D "realtek,rtl9301-mdio" },
>>> +       { .compatible =3D "realtek,rtl9302b-mdio" },
>>> +       { .compatible =3D "realtek,rtl9302c-mdio" },
>>> +       { .compatible =3D "realtek,rtl9303-mdio" },
>> Do these different compatible strings really matter? AFAIK, compatible
>> are not for listing all supported models/variants but to describe
>> devices that have a different behavior and indicating that (with
>> different strings) is needed to decide how the driver will work. If
>> the driver does not use which compatible was set, it might indicate
>> that we don't really need 4 compatible but 1.
> It can be useful when we initially think they are compatible, but
> later find out they are not, and we need different behaviour.

The way I've written the dt-binding any board should include=20
"realtek,rtl9301-mdio" and may also include one of=20
"realtek,rtl9302b-mdio", "realtek,rtl9302c-mdio",=20
"realtek,rtl9303-mdio". For the MDIO driver the specific chip could=20
possibly tell us the maximum SMI bus number. Unfortunately I've only got=20
a block diagram of the RTL9302C, I know that does have 4 SMI interfaces,=20
the others may have fewer. Things would probably work fine for now with=20
just "realtek,rtl9301-mdio" but is there any harm in including the others=
?



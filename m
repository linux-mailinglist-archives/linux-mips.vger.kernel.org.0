Return-Path: <linux-mips+bounces-7997-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48123A46CD3
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 21:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DE0116A5C3
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 20:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DB524BBF7;
	Wed, 26 Feb 2025 20:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="Aa6QASK0";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="YpQV3ZIU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF67227560B;
	Wed, 26 Feb 2025 20:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740603536; cv=pass; b=ShzM+P2Hnfbmgz8UjOxW9dbP2/3N/M21nJGKzm+ywHeEqRKPe9OwNlazcQa33s+Bp43lb/zzpdvMUqkes2cQfN72QaGsxFt1ltdz/Gq63D2k7q28eesB4se3Dap/4Lf5GsSAeY4GyrqGbeZeokGS+ZkyFz2VeQ/4snPvLW41MNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740603536; c=relaxed/simple;
	bh=ItMIEect07iZrce8OqfHopyNgKyjZYgYrqhgxBBlGjA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=efykqYgJ12X+Vx9we7oAPWzscsGzaZodxhszDv+OQeFtyGWU2H+TqP+GEi9UKZDQJ78d5P27Jm74tOfB06hP9N8SHig05EHeeu3Cx0sgN7+VqkCS65fgadwH+TRsMd8vFPnefed7vMtWVlKtbjO408M4VTBPYdnObuK5ZLE8x50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=Aa6QASK0; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=YpQV3ZIU; arc=pass smtp.client-ip=81.169.146.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740603349; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=TmnStTm7F9jfKZQAE26BHIjR7RdXSkpIJRGr2DQIoGYTZQP874+pXY59Ilv2f/SpZx
    bKi5xQrYc9brfDAAzw6lnsJdPg8bk+wyGCO/YYcr1ilnubJnHJUtNTfLztmysR8ufjTu
    eKcexDupQAMrRF0UJ30v5LdVXyqbwh/Ki4HJfV5RcEqjBLBvZmU7qLYQQo/jyCaMgwSM
    v1OEt9Vk2rHO8otg1EilqmnsQBLRIemzcHraYNfqYc9tkYN9VCRPfGYFVkuL7EGge0zy
    wEeOZAomlqJ+ijRtpKbBOzbHXrK6V/ImD7oCuanhtkOpGGsyEkgj7RX0PoCsRO/Nci8U
    uDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740603349;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=h3kwnl84GKFzcYqD2MZXAD5G+Hc11YASNteYVcGkOjw=;
    b=DZN3SJxWWnVLVSpP76zQ5Z2uVDNJedT9sLF353DH+m1U311Z3d+VF1FeEmTC2AEG15
    tz4nyFxNd3fjcl5yjw8KFBykqmwk6ORrwIJ3RbdWP6eTxKF3VEHhMyaIHO1TcxyAZmCD
    IHQ1GdaYPeBzEQztaRKtsAxRzMighbj9hV13UwyFk38sUE7gM4CHQBDKNKVo2MMiCdzg
    v4PYvnq6PW80IbliD4U0cSO0qhFw05PL70kGE0uOyxrAhoarfW2hlb+C9KdBC1jlOp5+
    MKoWO8l11XP4/PG4U2mGezgI/yL57rGHrdxkTtznS9eHd64kDQ5mxtEaWn4N9SOs6ml5
    DPbw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740603349;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=h3kwnl84GKFzcYqD2MZXAD5G+Hc11YASNteYVcGkOjw=;
    b=Aa6QASK0lqZbPyqq+kwDc28DXnlwgUXsQGKhYAb0ihUmWJKe7xLIE4NQFMB9sF4OTI
    gyYzvN3WIf0sSfVrrJnpz0xaB8kYYdP/Y+0ZqL4UMV0HfsBgFwmaZ+DpIdFTTnJvOjNQ
    qwrShwWy1Xoa+PW/RPxzqEnkZkvUlVL/f/y6l7JnKxO33CfFZVp2r86hf4y6C/VvGCi7
    3ReQonUM1FrkwRWZ805H2m3KVIPJ7j8GI61xIHslcUG67YkejYM3TwAUaUntG1dIlXGs
    B221ApdYu0clk5BmhI41Tz77QY04X86M+MY8tB6NXdXro6CvcAi5rMwoUFHlaG8LsPio
    41Xw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740603349;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=h3kwnl84GKFzcYqD2MZXAD5G+Hc11YASNteYVcGkOjw=;
    b=YpQV3ZIUiPaYJtPqOQmucq9zNX0Y0s0RCOTaRO7ceLqtebmcXUKsjUmZ7S/ze5ZKpx
    awLD6ZkE+fIoAqCzjAAA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeD0Z"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.23 DYNA|AUTH)
    with ESMTPSA id Qe5b2211QKtnizH
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 26 Feb 2025 21:55:49 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH RESEND] phy: ingenic: fix unbalanced regulator_disable()
 warning
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <ab308c135c3ea5e050bbfb0b94a832c8d52d5380.camel@crapouillou.net>
Date: Wed, 26 Feb 2025 21:54:52 +0100
Cc: Zhou Yanjie <zhouyanjie@wanyeetech.com>,
 linux-phy@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 kernel@pyra-handheld.com,
 linux-mips@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AF49A39E-0534-4ADC-8E50-606A636D167A@goldelico.com>
References: <96da5fe557f3b2501447358895bd78decc4633ef.1735482146.git.hns@goldelico.com>
 <ab308c135c3ea5e050bbfb0b94a832c8d52d5380.camel@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>,
 Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi,

I just wonder if anyone is picking this up?

There seems to be no MAINTAINER specific for drivers/phy/ingenic.

BR,
Nikolaus

> Am 02.01.2025 um 13:53 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le dimanche 29 d=C3=A9cembre 2024 =C3=A0 15:22 +0100, H. Nikolaus =
Schaller a
> =C3=A9crit :
>> if ingenic_usb_phy_exit is called the regulator is already disabled
>> through ingenic_usb_phy_power_off() leading to
>>=20
>> [    5.367301] WARNING: CPU: 0 PID: 20 at
>> drivers/regulator/core.c:2953 _regulator_disable+0x200/0x230
>> [    5.368209] unbalanced disables for regulator-dummy
>> [    5.370364] Modules linked in: phy_ingenic_usb
>> ...
>> [    5.373441] [<8054601c>] regulator_disable+0x40/0x80
>> [    5.372952] [<c02450f8>] ingenic_usb_phy_exit+0x48/0x60
>> [phy_ingenic_usb]
>> [    5.374283] [<8050839c>] phy_exit+0xd8/0x104
>> [    5.373104] [<80657a24>] __dwc2_lowlevel_hw_disable+0xe0/0xe8
>> [    5.373393] [<80658ad4>] dwc2_driver_probe+0x818/0x834
>> ...
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>=20
> Looks good to me. The regulator is not enabled in
> ingenic_usb_phy_init(), so it should not be disabled in
> ingenic_usb_phy_exit().
>=20
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
>=20
> Cheers,
> -Paul
>=20
>=20
>> ---
>>=20
>> Notes:
>>     Resent because linux-mips@vger.kernel.org was not automatically
>> added by
>>     get_maintainer.pl (drivers/phy/ingenic missing in MAINTAINERS
>> record?)
>>=20
>>  drivers/phy/ingenic/phy-ingenic-usb.c | 1 -
>>  1 file changed, 1 deletion(-)
>>=20
>> diff --git a/drivers/phy/ingenic/phy-ingenic-usb.c
>> b/drivers/phy/ingenic/phy-ingenic-usb.c
>> index eb2721f72a4c1..35984dd8a1bd7 100644
>> --- a/drivers/phy/ingenic/phy-ingenic-usb.c
>> +++ b/drivers/phy/ingenic/phy-ingenic-usb.c
>> @@ -124,7 +124,6 @@ static int ingenic_usb_phy_exit(struct phy *phy)
>>   struct ingenic_usb_phy *priv =3D phy_get_drvdata(phy);
>> =20
>>   clk_disable_unprepare(priv->clk);
>> - regulator_disable(priv->vcc_supply);
>> =20
>>   return 0;
>>  }




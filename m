Return-Path: <linux-mips+bounces-6961-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B599EE10C
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 09:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 237331883508
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 08:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB08320C018;
	Thu, 12 Dec 2024 08:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="lxhE+TWe"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890F6126C01;
	Thu, 12 Dec 2024 08:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733991502; cv=none; b=SLF5jRg/tLub1ibBaMfM8sUuEpR8myNBY2N1JKAsax/cgMbjHg3eGHwhOGC0MVqisTe5hziOzsxVbct2K8+HH/7KSEwctqVgc6b25wZ/JU0uEScEk0hHvysUHDhhaPDyWEa3sAR/kjs2+6+BSiidfRwdgS9HSah8lR/ILjETVVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733991502; c=relaxed/simple;
	bh=9u0EssyiR9jPCJXXENhMiwaH0C7px6oEo+PfyB7UW9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwfHc4aqINDzhDLnJI2v8VHk+ZWP/xDOI4Ic5yldAiKtDZV+W166T+CO61BF7zvEbOekp807up1nm7VZWHOWQ1l+1qi/JgHWIVA1e0S9rGpqOq8EnvyPWXKoO7fI9N3OSdgc9zzF78PMHWpYh5l4skNs2mRq2toB3C1NDkO+PyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=lxhE+TWe; arc=none smtp.client-ip=80.12.242.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id LeOatTTIgshnBLeObtEztn; Thu, 12 Dec 2024 09:18:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733991489;
	bh=00Te5LkHVNFFflrQpCPuLSqGbddJ7mVyn5/l4cEM7RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=lxhE+TWej8depxWvfP6sIBSAshiRXQiOXDFWjYfE9kuLSQQfff1Cs/8R1tcmPfFEC
	 O6FkK6gtt5zr9de2K6DZ+xwkeOms6NfisLex3Ytcc7/2Wbw5C+UAFmAHtUbukAliW+
	 mNPuyYcLY8zvtM4YFweUzbhS0uUIrUZhpd5XWKbvybwilv26KasVgwUFwASTAzkT5V
	 GCDnU/E7C4dXbBVrdroSijReZQBG45fpD3waUIqdfSv4Yoixvs7wrmw1jVaR3eAQ0E
	 tYiQXSfLT/H6uo3yJ5SQ2VfQyh3qrpQ0XORLmFOZDgsOBrUbxdZ4Fiu0SvfLKZB094
	 ZXfkUTi77H3mA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 12 Dec 2024 09:18:09 +0100
X-ME-IP: 90.11.132.44
Message-ID: <a50f9f86-b0f4-484a-85ef-9dd1e5737d83@wanadoo.fr>
Date: Thu, 12 Dec 2024 09:18:04 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] net: mdio: Add RTL9300 MDIO driver
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, lee@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de,
 hkallweit1@gmail.com, linux@armlinux.org.uk, markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org
References: <20241211235342.1573926-1-chris.packham@alliedtelesis.co.nz>
 <20241211235342.1573926-5-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241211235342.1573926-5-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 12/12/2024 à 00:53, Chris Packham a écrit :
> Add a driver for the MDIO controller on the RTL9300 family of Ethernet
> switches with integrated SoC. There are 4 physical SMI interfaces on the
> RTL9300 but access is done using the switch ports so a single MDIO bus
> is presented to the rest of the system.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

...

> +	err = regmap_write(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL_1,
> +			   PHY_CTRL_RWOP | PHY_CTRL_TYPE | PHY_CTRL_CMD);
> +	if (err)
> +		return err;
> +
> +	err = regmap_read_poll_timeout(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL_1,
> +				       val, !(val & PHY_CTRL_CMD), 10, 100);
> +	if (err)
> +		return err;
> +
> +	if (val & PHY_CTRL_FAIL) {
> +		err = -ENXIO;
> +		return err;

Nitpick: return -ENXIO; and remove the { }

> +	}
> +
> +	return err;

Nitpick: return 0;

> +}
> +
> +static int realtek_mdiobus_init(struct realtek_mdio_priv *priv)
> +{
> +	u32 port_addr[5] = { };
> +	u32 poll_sel[2] = { 0, 0 };

Nitpick: Why {} in on case and {0,0} in the other one?

> +	u32 glb_ctrl_mask = 0, glb_ctrl_val = 0;
> +	int i, err;
> +
> +	for (i = 0; i < MAX_PORTS; i++) {
> +		int pos;
> +
> +		if (priv->smi_bus[i] > 3)
> +			continue;
> +
> +		pos = (i % 6) * 5;
> +		port_addr[i / 6] |=  priv->smi_addr[i] << pos;
> +
> +		pos = (i % 16) * 2;
> +		poll_sel[i / 16] |= priv->smi_bus[i] << pos;
> +	}

...

CJ



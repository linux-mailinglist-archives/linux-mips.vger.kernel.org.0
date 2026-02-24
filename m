Return-Path: <linux-mips+bounces-13199-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kA1QA0benWmuSQQAu9opvQ
	(envelope-from <linux-mips+bounces-13199-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 18:22:14 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B14F18A7C7
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 18:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5FAD3045008
	for <lists+linux-mips@lfdr.de>; Tue, 24 Feb 2026 17:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32783876AF;
	Tue, 24 Feb 2026 17:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="izeIcZpv"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF9027E04C;
	Tue, 24 Feb 2026 17:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771953632; cv=none; b=nDIhjc+2Sg+DdKT/pbM8t5DeXetoEVCFZtlwMO+b+QFkpjO7nKSoxh2fyNYoBV8wojRN0mOUB5YMKSNBaPvAVWnRjqWYIxSO/yOjIsxM4HVZDQ9wtbONg/bIpaB2b56RITfXWB1G2VTklZ/habvvxdn//+3JFXCtxzyoKs7XBvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771953632; c=relaxed/simple;
	bh=DUVNcM4ZpiXdZoj7Fqc0w7Z8CDbVSGq7Er36MdyuXgc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=LcQCdgnhcEoU7ZOdIMAfPP9OXZRYZSA9YmwdkwT3ftwsfIj9xoBRH95vGQcF5DLKxQyEQH0CLJbu3kKj+LmByO7QJ530cHLR/JihqVA/74mCOCR8OB1YF6l7VdvTBQecqsOG7IcTeZ+Ev2LS4cacYN9/w9erv65F8JNNlEE9goo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=izeIcZpv; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1C3F04E41097;
	Tue, 24 Feb 2026 17:20:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD97C5FD9D;
	Tue, 24 Feb 2026 17:20:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B5B6103691E0;
	Tue, 24 Feb 2026 18:20:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771953626; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yExKHNVxFpAWclIgqpsx9aPnPMbndULosVf0raAPb3E=;
	b=izeIcZpv+zsH5ELNbOIzYlKCtln4IHs8bL9rxTlwSelk/V31o5uggfMUVFBKn/HZkqFQR1
	B3EjMM2VOo2QAZCf/5hybFnRzacICR/WOCQrqVciux9Lq2xZgTHaatWPJcjfaQNE0sgObT
	nIsEl/tqis/DAsnbs/ghu2yJMekY4WC3aTFFIXCkF4T+ygxoCDG2Re9mFpwqQjJxU20qbw
	zuulRut0W17M1O+/7iOa8dWt/Mpc0IZnQfwkZsHLddTE7c5R4h2tdH2iJRlNwMhiF/TCkc
	l8wXwmQ52SmerOLUpdQELx1AQ/Rac3tknpWBCfrgvCjLbb+O0rJionLKZUXTag==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 18:20:21 +0100
Message-Id: <DGND4VXM9X0N.2CP1VBD8E128M@bootlin.com>
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
To: "Vladimir Oltean" <olteanv@gmail.com>, =?utf-8?q?Th=C3=A9o_Lebrun?=
 <theo.lebrun@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v6 3/8] phy: Add driver for EyeQ5 Ethernet PHY wrapper
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
 <20260127-macb-phy-v6-3-cdd840588188@bootlin.com>
 <20260210193516.temrg46yozxma7xb@skbuf>
In-Reply-To: <20260210193516.temrg46yozxma7xb@skbuf>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13199-lists,linux-mips=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[theo.lebrun@bootlin.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	NEURAL_HAM(-0.00)[-0.992];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7B14F18A7C7
X-Rspamd-Action: no action

Hello Vladimir,

On Tue Feb 10, 2026 at 8:35 PM CET, Vladimir Oltean wrote:
> On Tue, Jan 27, 2026 at 06:09:31PM +0100, Th=C3=A9o Lebrun wrote:
>> +static int eq5_phy_init(struct phy *phy)
>> +{
>> +	struct eq5_phy_inst *inst =3D phy_get_drvdata(phy);
>> +	struct eq5_phy_private *priv =3D inst->priv;
>> +	struct device *dev =3D priv->dev;
>> +	u32 reg;
>> +
>> +	dev_dbg(dev, "phy_init(inst=3D%td)\n", inst - priv->phys);
>
> Nitpick: can you please remove the debugging prints and maybe add some
> trace points to the PHY core if you feel strongly about having some
> introspection?

Ack!

>> +
>> +	writel(0, inst->gp);
>> +	writel(0, inst->sgmii);
>> +
>> +	udelay(5);
>
> Could you please add a macro or comment hinting at the origin of the
> magic number 5 here? You could also place these 3 lines in a common
> helper, also called from eq5_phy_exit(), to avoid minor code
> duplication.

ACK, something named `eq5_phy_reinit()`.

I don't have precise explanation for the 5=C2=B5s value; I only know it is
time to let the PHY settle before further register config writes.
Is this enough?

   udelay(5); /* settling time */

>> +
>> +	reg =3D readl(inst->gp) | EQ5_GP_TX_SWRST_DIS | EQ5_GP_TX_M_CLKE |
>
> When you write 0 to inst->gp and then read it back, do you expect to
> (a) get back 0 or
> (b) are some fields non-resetting?
>
> I see both as inconsistent, since if (a), you can remove the
> readl(inst->gp) and expect the same result. And if (b), it also
> shouldn't matter if you write zeroes a second time, if it was fine the
> first time?
>
> Shortly said, is readl(inst->gp) really needed?

Some fields are non-resetting (BIT 30).
Will drop. I was trying to play it safe for no good reason.

>
>> +	      EQ5_GP_SYS_SWRST_DIS | EQ5_GP_SYS_M_CLKE |
>> +	      FIELD_PREP(EQ5_GP_RGMII_DRV, 0x9);
>
> Quick sanity check on your proposal to use #phy-cells =3D <1>. This is no=
t
> a request to change anything.
>
> What if you need to customize the RGMII drive strength (or some other
> setting, maybe SGMII polarity if that is available) per lane, for a
> particular board? How would you do that if each PHY does not have its
> own OF node?

I have no knowledge of what that 0x9 stands for, I didn't see the point
exposing it to devicetree. We could plan for the future and add a cell
or create subnodes, but here I kept it simple stupid. Is it OK?

>> +	writel(reg, inst->gp);
>> +
>> +	return 0;
>> +}
>> +
>> +static int eq5_phy_exit(struct phy *phy)
>> +{
>> +	struct eq5_phy_inst *inst =3D phy_get_drvdata(phy);
>> +	struct eq5_phy_private *priv =3D inst->priv;
>> +	struct device *dev =3D priv->dev;
>> +
>> +	dev_dbg(dev, "phy_exit(inst=3D%td)\n", inst - priv->phys);
>> +
>> +	writel(0, inst->gp);
>> +	writel(0, inst->sgmii);
>> +	udelay(5);
>> +
>> +	return 0;
>> +}
>> +
>> +static int eq5_phy_set_mode(struct phy *phy, enum phy_mode mode, int su=
bmode)
>> +{
>> +	struct eq5_phy_inst *inst =3D phy_get_drvdata(phy);
>> +	struct eq5_phy_private *priv =3D inst->priv;
>> +	struct device *dev =3D priv->dev;
>> +
>> +	dev_dbg(dev, "phy_set_mode(inst=3D%td, mode=3D%d, submode=3D%d)\n",
>> +		inst - priv->phys, mode, submode);
>> +
>> +	if (mode !=3D PHY_MODE_ETHERNET)
>> +		return -EOPNOTSUPP;
>> +
>> +	if (!phy_interface_mode_is_rgmii(submode) &&
>> +	    submode !=3D PHY_INTERFACE_MODE_SGMII)
>> +		return -EOPNOTSUPP;
>
> Both PHYs are equal in capabilities, and support both RGMII and SGMII,
> correct? I see the driver is implemented as if they were, but it doesn't
> hurt to ask.

Datasheet indicates 0 can do SGMII/RGMII and 1 can do only RGMII.
Did you imply that the driver code should reject SGMII on PHY 1
if it ever gets asked for?

>> +
>> +	inst->phy_interface =3D submode;
>
> Short story: don't rely on the phy_set_mode_ext() -> phy_power_on() order=
.
> Implement the driver so that it works the other way around too.
>
> Long story:
> https://lore.kernel.org/netdev/aXzFH09AeIRawCwU@shell.armlinux.org.uk/

I wouldn't mind, but what should phy_power_on() do if no submode has
been provided through phy_set_mode_ext() yet? Guess one? Fail?

Also our PHY will need to be reset to change its mode if we do
power_on() followed by set_mode(), which in practice is never something
we want. Maybe there is a flag to indicate that we require a submode to
power on?

Thanks for the extensive review Vladimir,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



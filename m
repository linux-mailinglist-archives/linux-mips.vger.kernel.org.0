Return-Path: <linux-mips+bounces-13213-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LYCIW8dn2lcZAQAu9opvQ
	(envelope-from <linux-mips+bounces-13213-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 17:03:59 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2726119A323
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 17:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 86058309754E
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 15:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADD63D7D77;
	Wed, 25 Feb 2026 15:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TYNnSyRS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6AD33ADA1;
	Wed, 25 Feb 2026 15:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772034900; cv=none; b=dGeROqC5zqsdTbfMMSJfsi+z+NwpPNVOsofABI/CYyVpOc3qRXGjl9Bi8WyXzCvTTLxh1Qcprek5ztdYxtyKqdu7T/nczBbztTA1EwHBTWNSsM6VYnS+cR41t+94q/FGIfkDzCdabSUeV40GotRV6xGC+wjHyCsTdxl2AGWbgUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772034900; c=relaxed/simple;
	bh=ge6UTwvXMplsfdme0Epvy2rnYNGulSdprPlOI0qZezw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Au+orUiZhAW1AESNw5Xc3ES1WL5FWrngvttsE6PBlL62oXvaEoADGkv6AP5psJl8yKvVqIdFcA3Nad7G8RsVvp62h8gPb9pFnp5agYjKX3U43ICuSmXNvpgEwFRGu7OaEYHrSEjt4dN9/MVfWfacL+dRvkHNzUF+qk2AKu8TOJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TYNnSyRS; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C3ABB1A1342;
	Wed, 25 Feb 2026 15:54:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9603A5FDE6;
	Wed, 25 Feb 2026 15:54:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45B1110368F3E;
	Wed, 25 Feb 2026 16:54:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772034895; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pdiq6mn6L4gxkJn25+xNcL5IvX0bPmpsgCBQ2Uh6ltY=;
	b=TYNnSyRSm0vvWR9fe118q3WyE1KpARLT0IIj9bvMXW5/f531Lt5fhC2BzBgQypo6IHGKXc
	sCCwhpVReuEqTdgOYdQ79eKkfXCtAcgOpSXNDKvMDvNc6pUBS8UCmppcCjPt5hFBuzFpSk
	DkM6aARSfRPrPSg24Fl0drbqnYsE7qvMHvRSwxb/1Nu17Yc/+/r0vYJZ/b3dGKQf4yB+/6
	ASD/ak+Nw2Ovh+4HRhOWZFFBlg9qhS0QS8oFa0swXyC4PJDah1LRk4Hsc6UePn5KYb5PSt
	+RgCk7uPPL2seQyctqbVhjacGut0vUY5JZOfncEouaUNZmPXpJ6VXAr/jyZ8fw==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 16:54:50 +0100
Message-Id: <DGO5XYKELMA3.14FPOZ2FCD8NN@bootlin.com>
Subject: Re: [PATCH v6 3/8] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Kishon Vijay Abraham I"
 <kishon@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
To: "Vinod Koul" <vkoul@kernel.org>, =?utf-8?q?Th=C3=A9o_Lebrun?=
 <theo.lebrun@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
 <20260127-macb-phy-v6-3-cdd840588188@bootlin.com> <aZ8OkJ4BH0-sVSHS@vaman>
In-Reply-To: <aZ8OkJ4BH0-sVSHS@vaman>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13213-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[theo.lebrun@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	NEURAL_HAM(-0.00)[-0.954];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:url,bootlin.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2726119A323
X-Rspamd-Action: no action

On Wed Feb 25, 2026 at 4:00 PM CET, Vinod Koul wrote:
> On 27-01-26, 18:09, Th=C3=A9o Lebrun wrote:
>> EyeQ5 embeds a system-controller called OLB. It features many unrelated
>> registers, and some of those are registers used to configure the
>> integration of the RGMII/SGMII Cadence PHY used by MACB/GEM instances.
>>=20
>> Wrap in a neat generic PHY provider, exposing two PHYs with standard
>> phy_init() / phy_set_mode() / phy_power_on() operations.
>
> Is there a dependency of this patch with rest of the series. If not
> please post different series for subsystems.

ACK. It felt sensible to keep patches close together to understand their
reasoning.
 - clk patches are there because they imply we get a dev->of_node.
   Without them we don't and therefore the driver is useless.
 - DTS/MIPS patches are there because they exploit this new driver.
   They show the first users of this driver.

Will split for next revision.

>> +static int eq5_phy_init(struct phy *phy)
>> +{
>> +	struct eq5_phy_inst *inst =3D phy_get_drvdata(phy);
>> +	struct eq5_phy_private *priv =3D inst->priv;
>> +	struct device *dev =3D priv->dev;
>> +	u32 reg;
>> +
>> +	dev_dbg(dev, "phy_init(inst=3D%td)\n", inst - priv->phys);
>> +
>> +	writel(0, inst->gp);
>> +	writel(0, inst->sgmii);
>> +
>> +	udelay(5);
>
> This is _same_ as exit. Why not call that routine here and document
> why...

ACK!

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



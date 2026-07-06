Return-Path: <linux-mips+bounces-15550-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8M0lDQzQS2rxagEAu9opvQ
	(envelope-from <linux-mips+bounces-15550-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 17:55:56 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CF5712E0F
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 17:55:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=j5hgDtth;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15550-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15550-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57C1436F58B6
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2026 14:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C6C432BD4;
	Mon,  6 Jul 2026 14:39:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465A13FE369;
	Mon,  6 Jul 2026 14:39:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348776; cv=none; b=noxbZI1nrFuG780WPjI43f+AOHxt2wabmGYDWis5JA6mWxvGtO8yX3OhJTV6bMR7k09CE9x7SFTIAt1lhWScjG/9WLKlstD6aQdYxD1sQqoU5cH1Z6I90H6XZs9tx4qiSztflSoys0sdxp31S7yLpLsIBnAKAb5vbOuybcZ80Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348776; c=relaxed/simple;
	bh=XtbXxotRn4eonCuXI7S2La3x2DD6roUS8w7lR6Aocns=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lMdJJ2Iu67n4dpWr9NIE68p82Jgj5lM61GKlchI1pRPAfNOLddcgdu6ZN+qnXc2JSMwfEaPfcMxDaHaYNtd+k5CQ8ld4AaHZgA3gQoi/5A6SRzK3EGVObmBEw3zHyYppObiewBwo9QwOiAdyE2Vo00MMvXAuihGfLhZ38iO3PaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=j5hgDtth; arc=none smtp.client-ip=80.241.56.152
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gv6Sc3JlwzKrrB;
	Mon, 06 Jul 2026 16:39:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783348768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTWGfLdwlWAV/LMkx8q6n+16+BLtwX+Uw6eFuSY1pwE=;
	b=j5hgDtthz8XCNdelXgr2Njc2HaTruqIkCO//JWKxiT4W2gEybWyIlcK2aQ1bxIe+BwUJVp
	sosZFgtgjTYiKegpajhDS7wAQRa5vbGhsdYsOBErEWcCcj6imJ3WhTyng3CLWaw/u/6S/u
	Ia++ekOByRWNtL6C0p1KPkAMQ78opS9K6p4731SNIh3G/Gtr0smcjJ5LSbWseUhYMLmi5g
	bSnkIEWLW+D0H8udCi/rtV6GiUxmmd3h/zBT1zxIEz9pUZOsZhePq4tVuE6vy2STKylPsN
	pNYuSZntPPijS4W0+CuI8ZBjLVluSsSHTtbS9e6dlXfCM6eF2pFoZi1CDk9EnQ==
Message-ID: <fbc50f89e0c3bb148656a3b8d96974f591576dec.camel@mailbox.org>
Subject: Re: [PATCH v3 02/20] driver core: platform: provide
 platform_device_set_of_node()
From: Manuel Ebner <manuelebner@mailbox.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Lee Jones	
 <lee@kernel.org>, Thierry Reding <thierry.reding@avionic-design.de>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller"	 <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski	 <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Srinivas Kandagatla	 <srini@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul	 <vkoul@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich	
 <dakr@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan	
 <saravanak@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)"	 <chleroy@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Andy Shevchenko	
 <andriy.shevchenko@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Doug Berger
 <opendmb@gmail.com>,  Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, Ulf Hansson <ulfh@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team	 <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Matthew Brost	 <matthew.brost@intel.com>, Thomas
 =?ISO-8859-1?Q?Hellstr=F6m?=	 <thomas.hellstrom@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>,  David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Peter Chen <peter.chen@kernel.org>,  Paul
 Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,  Maximilian Luz <luzmaximilian@gmail.com>, Hans
 de Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	driver-core@lists.linux.dev, devicetree@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 iommu@lists.linux.dev, 	linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, 
	linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	mfd@lists.linux.dev
Date: Mon, 06 Jul 2026 16:39:00 +0200
In-Reply-To: <20260706-pdev-fwnode-ref-v3-2-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
	 <20260706-pdev-fwnode-ref-v3-2-1ff028e33779@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: ca569d00ad7df478929
X-MBO-RS-META: 1q71yutefcf1nyjzwoom4gu47fi8rss3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15550-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:lee@kernel.org,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:b-liu@ti.com,m:p.zabe
 l@pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:mfd@lists.linux.dev,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-mips@vger.kernel.org];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[66];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,vger.kernel.org:from_smtp,mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0CF5712E0F

Hi Bartosz,

On Mon, 2026-07-06 at 14:44 +0200, Bartosz Golaszewski wrote:
> Encapsulate the reference counting logic for OF nodes assigned to
> platform devices created with platform_device_alloc() in a helper
> function. Make the kerneldoc state that this is the proper interface for
> assigning OF nodes to dynamically allocated platform devices. This will
> allow us to switch to counting the references of the device's firmware
> nodes, not only the OF nodes.
>=20
> Reviewed-by: Manuel Ebner <manuelebner@mailbox.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> =C2=A0drivers/base/platform.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 18 ++++++++++++++++++
> =C2=A0include/linux/platform_device.h |=C2=A0 4 ++++
> =C2=A02 files changed, 22 insertions(+)
>=20
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index fb9120b0bcfe0e7dd9dfc0d29b91e0ad40a01440..3188d5aba5f90622f821c6950=
49cacda030204fb
> 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -693,6 +693,24 @@ int platform_device_add_data(struct platform_device =
*pdev, const
> void *data,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(platform_device_add_data);
> =C2=A0
> +/**
> + * platform_device_set_of_node - assign an OF node to device
> + * @pdev: platform device to add the node for
> + * @np: new device node
> + *
> + * Assign an OF node to this platform device. Internally keep track of t=
he
> + * reference count. Devices created with platform_device_alloc() must us=
e this
> + * function instead of assigning the node manually.

I did some more pondering about this patch and concluded the right place
for a warning would be the lines been read right before or after assigning
a node manually.=20
I think this would be in platform_device_alloc() (as I suggested in v2).

BUT my knowledge in C isn't sound. So if it's good as is keep it. If it isn=
't
add or move the remark.

Either way Thanks and
 Reviewed-by Manuel Ebner.

---
Note:
I removed Mark Brown <broonie@opensource.wolfsonmicro.com> from recipients =
because:
=E2=80=9CRCPT TO <broonie@opensource.wolfsonmicro.com> failed:
<broonie@opensource.wolfsonmicro.com>: Recipient address rejected: Domain n=
ot found=E2=80=9D.


> + */
> +void platform_device_set_of_node(struct platform_device *pdev,
> +				 struct device_node *np)
> +{
> +	of_node_put(pdev->dev.of_node);
> +	pdev->dev.of_node =3D of_node_get(np);
> +	pdev->dev.fwnode =3D of_fwnode_handle(np);
> +}
> +EXPORT_SYMBOL_GPL(platform_device_set_of_node);
> +
> =C2=A0/**
> =C2=A0 * platform_device_add - add a platform device to device hierarchy
> =C2=A0 * @pdev: platform device we're adding
> diff --git a/include/linux/platform_device.h b/include/linux/platform_dev=
ice.h
> index 8c566f09d04efe420d85ffa046f92c44c6d08526..e9f7baceeb4c8269dbc0143c4=
d8fc9d73ba024ca
> 100644
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -19,6 +19,8 @@
> =C2=A0struct irq_affinity;
> =C2=A0struct mfd_cell;
> =C2=A0struct property_entry;
> +struct platform_device_id;
> +struct device_node;
> =C2=A0
> =C2=A0struct platform_device {
> =C2=A0	const char	*name;
> @@ -262,6 +264,8 @@ extern int platform_device_add_resources(struct platf=
orm_device
> *pdev,
> =C2=A0					 unsigned int num);
> =C2=A0extern int platform_device_add_data(struct platform_device *pdev,
> =C2=A0				=C2=A0=C2=A0=C2=A0 const void *data, size_t size);
> +void platform_device_set_of_node(struct platform_device *pdev,
> +				 struct device_node *np);
> =C2=A0extern int platform_device_add(struct platform_device *pdev);
> =C2=A0extern void platform_device_del(struct platform_device *pdev);
> =C2=A0extern void platform_device_put(struct platform_device *pdev);


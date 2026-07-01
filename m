Return-Path: <linux-mips+bounces-15399-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zCtOOIMuRWo/8QoAu9opvQ
	(envelope-from <linux-mips+bounces-15399-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 17:13:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6717F6EF25C
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 17:13:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=pcd0PeJh;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15399-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15399-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 553D930EBAEC
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jul 2026 15:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0096E480346;
	Wed,  1 Jul 2026 15:06:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13FA421F12;
	Wed,  1 Jul 2026 15:06:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782918384; cv=none; b=SZTtCaacJfF2yqVkJWyTOvnRVXVYS6xyx7i2CpouB0SV/3kxsL8q9upGvDU8GyfVHwd9pdhAUqRUB2PXyb2xO8a73c/FoAT3yY/JRmQZqOtIjo/0knHVFiUqUOg6eu5PNY+Y61gmjq1QHT7BJ22hK9VGnBLqm4Gr0PwD43if418=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782918384; c=relaxed/simple;
	bh=7iK4BGNHJy0tB94tmLVRjvi1Oe1FniGBRLtTBxRpX9I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AOtI4OI2prGXRxMpFF/LwUjvJqICEcnpJrIoRgSQdKTke0cMBJt/dYJRp+N6mBk0hYmlk7mJPQRTONZBk/j1RHS/qqQpOsABs+1eN24QUqbGztmPut3KDr6fDrqnDw3s8reFnOBJ8iMExW+sUUjPa4zeigwyWxu0HGWvovz1MjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pcd0PeJh; arc=none smtp.client-ip=80.241.56.172
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gr3Hr4RnZz9tCX;
	Wed,  1 Jul 2026 17:06:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782918376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7iK4BGNHJy0tB94tmLVRjvi1Oe1FniGBRLtTBxRpX9I=;
	b=pcd0PeJh7Iv8r/KVTFH5oFdA/lvvSyvuvKi3if55cztI2n/XSqmRdnZKteH85HKKVV85yU
	j9HVmz2EWbdR6s0CcET0z1vhIRn4hJ25bjWnCJwEuRpc0w/NW+iGM63mTUN/npapcFcSR/
	fvTXXtkA/gTpkwn7ezESk2MSMTKfcqmvoICSsIiJierSEvXB9xwtVzbElgLSVNcJv+Ritx
	B8K9i27AJIekT+XY6QmKpjCphMf9LuJwlimFmayP7Cy6geBGJUxhP+KSpU8c/IrGtSWTsI
	iKUJjdFVYMmR+verObzbMA+hWZMieIpK2Ln1S3xxLh3nAIF0DvnMe971s5Fifw==
Message-ID: <f6ce9878f3528dd026e6ca8ff56ac773a264e476.camel@mailbox.org>
Subject: Re: [PATCH v2 02/19] driver core: platform: provide
 platform_device_set_of_node()
From: Manuel Ebner <manuelebner@mailbox.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	driver-core@lists.linux.dev, devicetree@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 iommu@lists.linux.dev, 	linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, 
	linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Lee Jones
 <lee@kernel.org>, Thierry Reding	 <thierry.reding@avionic-design.de>,
 Sebastian Hesselbarth	 <sebastian.hesselbarth@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Srinivas Kandagatla <srini@kernel.org>, Greg
 Kroah-Hartman	 <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Rob Herring <robh@kernel.org>,  Saravana Kannan
 <saravanak@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman	 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andi Shyti
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
Date: Wed, 01 Jul 2026 17:05:49 +0200
In-Reply-To: <CAMRc=MdQURjypSn+QjSDJfEiOMC8bbEZmZLgjpt=EquAM1Q1pw@mail.gmail.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
		 <20260629-pdev-fwnode-ref-v2-2-8abe2513f96e@oss.qualcomm.com>
	 <263f58b418a27a2339fc2478f93234e0208b0ad9.camel@mailbox.org>
	 <CAMRc=MdQURjypSn+QjSDJfEiOMC8bbEZmZLgjpt=EquAM1Q1pw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 37tty84b1zxogwptawjudbroswqcnaqn
X-MBO-RS-ID: 0ac2dd9424902710d49
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15399-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:lee@kernel.org,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:ch
 leroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:b-liu@ti.com,m:p.zabel@pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-mips@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[65];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,mailbox.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6717F6EF25C

On Tue, 2026-06-30 at 09:22 -0400, Bartosz Golaszewski wrote:
> On Tue, 30 Jun 2026 13:37:54 +0200, Manuel Ebner <manuelebner@mailbox.org=
> said:
> > On Mon, 2026-06-29 at 11:12 +0200, Bartosz Golaszewski wrote:
> > > [...]
> > >=20
> > > +/**
> > > + * platform_device_set_of_node - assign an OF node to device
> > > + * @pdev: platform device to add the node for
> > > + * @np: new device node
> > > + *
> > > + * Assign an OF node to this platform device. Internally keep track =
of the
> > > + * reference count. Devices created with platform_device_alloc() mus=
t use this
> > > + * function instead of assigning the node manually.
> >=20
> > Doesn't it make sense to add a remark to the kernel doc of platform_dev=
ice_alloc()?
> >=20
> > Thanks
> > =C2=A0Manuel
> >=20
> > > =C2=A0[...]
> >=20
>=20
> Sure, will do in the next iteration.

then you can add
Reviewed-by: Manuel Ebner <manuelebner@mailbox.org>

 Manuel
>=20
> Bart


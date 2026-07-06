Return-Path: <linux-mips+bounces-15556-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qv/RIsnoS2qPcgEAu9opvQ
	(envelope-from <linux-mips+bounces-15556-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 19:41:29 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE49714013
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 19:41:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nCLYqWUv;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15556-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15556-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49ACE301B017
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2026 17:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32143B0AE9;
	Mon,  6 Jul 2026 17:26:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905F03AA4E7;
	Mon,  6 Jul 2026 17:26:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358805; cv=none; b=Lkfg0e9cfwdYTczR+onuEotRl/oeq2oKiR/bzAIU2C3uEJfs19tCBBUVvZwJ/z6xHmOY4Z9b8vCtq79Y9Fng84yda0pcwOzD1qfD917/bY3a8RF3oMfp4jGQ19ILY7Ud9RZ3RYz8wSpZfmeJHxY7C/JVh4MeRIa7wC8RbYIBABY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358805; c=relaxed/simple;
	bh=7IM4zAo6wp30fIKOD7ytq7OyqjlyWEMupcdMTPpFk2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgVPf43xcAN5wHmAYmQGcLYzttDmEYxOQwX55SFSZwIYNZaesgjZo8WJf/U4wKrPyQaFZeNRap/jzwDmAyy5UpSUhc1u9Cr9R5UYR6B7IwRklz2IOUhuW00j9swVhTlqSlL9daBjrlhJArvLxmC+0KMzoGLc0eJt1MTZNVB4RYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCLYqWUv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160F11F000E9;
	Mon,  6 Jul 2026 17:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783358804;
	bh=6Q0tvr2GvB7IdKSisCRev74pEI09lUCKAJRHUpFa0u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nCLYqWUvGJM2k6XDnnND9naY7BS0FeW4Fu5CyITqesk4/FYtYFs2v+CdsAT/O073Y
	 GtZ8t7rZu7alxOIECS486DbL4kafAvJYppDKfefXQcxPJWSm50Z5xEB87XflCdnqI0
	 dI9I5Vp+VbNytWapWIsBYtTNmQpIQ3PSkrb5u0vxywEuxj1U2BwNjyu/B89xGJdNtD
	 G/Odw4daeVaAAUZb5GsfrnhN7yZ/7dsR9qtpRXxY65g9kYlYkQBfw49iWquOtCkMjk
	 tJfNZXyAVgeg0oDBCZxb/20tfctRWrUO672g92oAd9zuNBOetu0kFzrqAf+966bE2y
	 VRCYCAEaqRrlQ==
Date: Mon, 6 Jul 2026 18:26:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Lee Jones <lee@kernel.org>,
	Thierry Reding <thierry.reding@avionic-design.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Peter Chen <peter.chen@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	driver-core@lists.linux.dev, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v3 02/20] driver core: platform: provide
 platform_device_set_of_node()
Message-ID: <e40d0bd0-0e3d-4c01-bffc-8e0075213c45@sirena.org.uk>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
 <20260706-pdev-fwnode-ref-v3-2-1ff028e33779@oss.qualcomm.com>
 <fbc50f89e0c3bb148656a3b8d96974f591576dec.camel@mailbox.org>
 <akvOo2EeERLYPh72@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FWksib/oYWGW6VVm"
Content-Disposition: inline
In-Reply-To: <akvOo2EeERLYPh72@ashevche-desk.local>
X-Cookie: Did I do an INCORRECT THING??
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mailbox.org,oss.qualcomm.com,kernel.org,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,linux.intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15556-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-mips@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:manuelebner@mailbox.org,m:bartosz.golaszewski@oss.qualcomm.com,m:lee@kernel.org,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.n
 et,m:b-liu@ti.com,m:p.zabel@pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:mfd@lists.linux.dev,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[67];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sirena.org.uk:mid,vger.kernel.org:from_smtp,wolfsonmicro.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EE49714013


--FWksib/oYWGW6VVm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2026 at 06:49:55PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 06, 2026 at 04:39:00PM +0200, Manuel Ebner wrote:
> > On Mon, 2026-07-06 at 14:44 +0200, Bartosz Golaszewski wrote:

> > I removed Mark Brown <broonie@opensource.wolfsonmicro.com> from recipie=
nts because:
> > =E2=80=9CRCPT TO <broonie@opensource.wolfsonmicro.com> failed:
> > <broonie@opensource.wolfsonmicro.com>: Recipient address rejected: Doma=
in not found=E2=80=9D.

> Perhaps he needs to send a patch to update .mailmap?
> Cc'ed to Mark.

If it's for something that old I can't imagine I actually care.  If it's
important enough I'm sure someone can work out how to get hold of me.

--FWksib/oYWGW6VVm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpL5UUACgkQJNaLcl1U
h9D67gf9GIugTh4PUXTgcv4IEO00hqfPt914zzGolWrW61nvCfBK/txok59PvoKw
vaWiJIxtHNcqLXDHoH9/3oPWkqxrKq0RGWEX19nr124zN/T2SihiMa5RjzAr4UAG
G9JAS2GOF29xF1Ml9KH8x5l5WduP6RUHVJqKK9vuJFpCloREcnnpMQVxJVgKEKpI
TrKQpiKRZtTm5InBsTccxeXVDL2+bhnLHZaD4LbIziWok/tCyYnCw9VEJ/iUb7PJ
bFLwu3JxUS7p7Kr/hStWapPyxi5fyw+V/ZQ8u+J5GE8g493f9A3rBarS4fJCZi8e
cIRN6GhgNtdUL6L3p77EqAzlsDTheA==
=WSwF
-----END PGP SIGNATURE-----

--FWksib/oYWGW6VVm--


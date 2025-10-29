Return-Path: <linux-mips+bounces-11914-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD08FC1BDB1
	for <lists+linux-mips@lfdr.de>; Wed, 29 Oct 2025 16:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E1B46E5217
	for <lists+linux-mips@lfdr.de>; Wed, 29 Oct 2025 15:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B612133F8DA;
	Wed, 29 Oct 2025 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1wwya0A+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB90C33B6E6;
	Wed, 29 Oct 2025 15:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752575; cv=none; b=tdnc+FDbVrQ99m47ej3h2q0IHR6liiImgckTHbxnxcPwL6Z1J1mzSJbu6R5LCXdmhZcUxnlUcHHJVc7vvkVmI42aLPIdp/YglwJGuxxRxY+H/4jhbaXfqQXgZ1itgyz1mdE9AkO8J99TjpYthdVx+GsM0GxYPM0g6KKBUvgCzfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752575; c=relaxed/simple;
	bh=mTyubcT0QXbiYSYuJBtiOy+znibfDRYqoP4/3JvVdrk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hM5DmvdnAf+RseShOIVXXehhN1t1mkymFM91yXbYtJtrWNUGXYfpBmDajVahXQso1W4G3oc4wQ//AlRT6bs6VRMi3jd69/b6RICG8xAaPDe11FaDJIkPAwIoYrxH9xuSck2WNJtnjmDX1waJy+GScP/kW9aD0r7UZdbQCx969d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1wwya0A+; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2B48AC0DA8B;
	Wed, 29 Oct 2025 15:42:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CDF3606E8;
	Wed, 29 Oct 2025 15:42:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FA7D117F82C5;
	Wed, 29 Oct 2025 16:42:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761752565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mTyubcT0QXbiYSYuJBtiOy+znibfDRYqoP4/3JvVdrk=;
	b=1wwya0A+6J55bXJZ9i9zxIM9ypamlJUH+c9TrZ/M9MZrRukaDz3uACmVjIVbMqScFwybpX
	+S1t9r/X8A5FxjJQ053o1+VlfzT3sEbVrL9J0es/RK8clpfRafAF8jipRoU09A/j6G83e0
	KmO/BC2JWXI9sRkx3UMyDpVuAL53/ksHYqNY23lNEGTOPL7FiGaYlWKGjtejhbGoeeqRLL
	LXAPhJ+uKDc9cuVFCeCJ/0ZpB+dJrh/DhvGl3nxA+Vc6dAG7aA+HjsGzZ3tt8+FE1eMcWU
	xn7FnhuyfnKVUZqcN+FRdcG3NiFj6jA8J4HcsVPAP7QAGUlsr9Q0RHQkbRjWJg==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 16:42:41 +0100
Message-Id: <DDUX5TR1VIR9.1KDDNA4XZ6JYW@bootlin.com>
Subject: Re: [PATCH 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Cc: <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251022-macb-phy-v1-0-f29f28fae721@bootlin.com>
 <20251022-macb-phy-v1-2-f29f28fae721@bootlin.com>
In-Reply-To: <20251022-macb-phy-v1-2-f29f28fae721@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello all,

On Wed Oct 22, 2025 at 5:39 PM CEST, Th=C3=A9o Lebrun wrote:
> EyeQ5 embeds a system-controller called OLB. It features many unrelated
> registers, and some of those are registers used to configure the
> integration of the RGMII/SGMII Cadence PHY used by MACB/GEM instances.
>
> Wrap in a neat generic PHY provider, exposing two PHYs with standard
> phy_init() / phy_set_mode() / phy_power_on() operations.

I am curious if anyone has feedback on this generic PHY driver? Patches
on MACB landed in net-next [0]. If the phy-eyeq5-eth driver approach
doesn't fly then I should sync with net land to revert MACB patches as
they are useless unless we have phy-eyeq5-eth merged.

V2 changelog at the moment (will wait a few more days before sending):
 - Acked-by: Conor Dooley on dt-bindings patch.
 - ptrdiff_t is printed using %td not %ld; warning on 32-bit archs [1].

[0]: https://lore.kernel.org/lkml/176166121351.2249512.7238254409117352079.=
git-patchwork-notify@kernel.org/
[1]: https://netdev.bots.linux.dev/static/nipa/1014126/14277857/build_32bit=
/stderr

Thanks!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



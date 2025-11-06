Return-Path: <linux-mips+bounces-12086-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5C4C3A6C6
	for <lists+linux-mips@lfdr.de>; Thu, 06 Nov 2025 12:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18145463FAD
	for <lists+linux-mips@lfdr.de>; Thu,  6 Nov 2025 10:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD432E8DFC;
	Thu,  6 Nov 2025 10:51:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983A52DF3E7
	for <linux-mips@vger.kernel.org>; Thu,  6 Nov 2025 10:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762426306; cv=none; b=d9PaM1c0EsEvuNjHu5yVky6OyPfaQMopUQNHmD2f5aGPjdj3h7b/DcB9sDNlkHjGoZjKzw0BA5hL6VUhizViJXcBisOWWSorAQ14buPFBuXjFuId9SnfufE7EDD+nreCJ4HGlhveUZ71UxXRWXcwSv/5GD9dle10XM7zSjdUL4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762426306; c=relaxed/simple;
	bh=X3Kcq41e22aVvFcL+aCsb9T1Yc89cQd1pHhT/wWGrgE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W1FEwfST6AjxrIffPNv+joDukg9nbv8/G5nqDZrNmNdBzcVcGJ+NlrIUNXE/cVdUhzjLqzuxQyl/79h1YPsLECDOaMlop1mWqzDGP7LTyLwnBf/hyZ0oj8U756/Qy6EYjWh6EOEJnZQeK6DmvChzjXSrDWiEIzXw+MFJvCPk1l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGxaS-00027b-CG; Thu, 06 Nov 2025 11:51:28 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGxaS-007LZm-0V;
	Thu, 06 Nov 2025 11:51:28 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vGxaS-000000004Pb-0Gcb;
	Thu, 06 Nov 2025 11:51:28 +0100
Message-ID: <9506997c56808cc9fd58fe0d384976421d6c9bfc.camel@pengutronix.de>
Subject: Re: [PATCH v2 5/7] reset: eyeq: drop device_set_of_node_from_dev()
 done by parent
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir
 Kondratiev <vladimir.kondratiev@mobileye.com>, =?ISO-8859-1?Q?Gr=E9gory?=
 Clement	 <gregory.clement@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,  Kishon Vijay Abraham
 I	 <kishon@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd	 <sboyd@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-clk@vger.kernel.org, =?ISO-8859-1?Q?Beno=EEt?= Monin	
 <benoit.monin@bootlin.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>,  Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Jerome Brunet	 <jbrunet@baylibre.com>
Date: Thu, 06 Nov 2025 11:51:27 +0100
In-Reply-To: <20251101-macb-phy-v2-5-c1519eef16d3@bootlin.com>
References: <20251101-macb-phy-v2-0-c1519eef16d3@bootlin.com>
	 <20251101-macb-phy-v2-5-c1519eef16d3@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org

On Sa, 2025-11-01 at 09:53 +0100, Th=C3=A9o Lebrun wrote:
> Our parent driver (clk-eyeq) now does the
> 	device_set_of_node_from_dev(dev, dev->parent)
> call through the newly introduced devm_auxiliary_device_create() helper.
>=20
> Doing it again in the reset-eyeq probe would be redundant.
> Drop both the WARN_ON() and the device_set_of_node_from_dev() call.
> Also fix the following comment that talks about "our newfound OF node".
>=20
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

and

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

to be merged via the clk tree together with patch 3.

regards
Philipp


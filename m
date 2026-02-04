Return-Path: <linux-mips+bounces-13107-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uER7Hs0Tg2nBhQMAu9opvQ
	(envelope-from <linux-mips+bounces-13107-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Feb 2026 10:39:25 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CF7E3F48
	for <lists+linux-mips@lfdr.de>; Wed, 04 Feb 2026 10:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57CCF3010D9E
	for <lists+linux-mips@lfdr.de>; Wed,  4 Feb 2026 09:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6C33AE6F4;
	Wed,  4 Feb 2026 09:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gI/B9DSi"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96383A1D01;
	Wed,  4 Feb 2026 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770197737; cv=none; b=qC3vVGZD/3v02RfV2lC9qWaFCmYMkquOz/uzqdgWGsRwsqkJyeKmOl+oYZCDHYOKsnZK9fL24qM4oCbFtZ0xBym41fO6Tw4vLuYxfDxE59LJeUM2q2JspJ4FjDY5veJnDFhiUoztv0RbjbKrMRG+NE2cDhZpIrJVHdxD9kHTshk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770197737; c=relaxed/simple;
	bh=jf4RgzlGdwbUlzDUpBSHMOUi07m+ktoWuB1ArPzud1s=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Nt7UVc7VdrOfbfWIUApTWcnZAEIkPzmahclwhHWQBOL3+CZo3+KMIh0JFdlOqPCJ2Y2J6oJL8LXPDZIpl0z72UlqcnbD4ZsydUYfIV4tn6aGwzGf5hLKoCQDuryJrQlk9MKcqXsWsUwnI4La4UoWSOcz0dLP8gRzYVFzxr9OFvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gI/B9DSi; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 332361A2BE7;
	Wed,  4 Feb 2026 09:35:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F111160745;
	Wed,  4 Feb 2026 09:35:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62843119A88F7;
	Wed,  4 Feb 2026 10:35:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770197733; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jf4RgzlGdwbUlzDUpBSHMOUi07m+ktoWuB1ArPzud1s=;
	b=gI/B9DSiD6lHoSUUDety76BjmYRcoVrTdad7OK55xLgm9VECyd9yLcCSJfjEWVongW5vHU
	RVB/mmg3SdU526tmo7jeUa7rGi2NU9M6fkDWYiyYB/skpem+AnO9UqdnYzOlJJb+wl29iC
	RI4RUKnAr16Vl0dnEITApJuiAvK/+gc6Beo/DXjMbIiL0dmYgDh7yVUKd0wSj1t1e1nAYE
	LZxhC7Es54T1lRSIVnuwGGRx6iItGi+3wzPbNdzd7yTJjxF2IFyETnPRMZk0QbZhGeaDw/
	fkTbomwvIiTeYgZha5Zv2HudnPMw5xeegeO1m/fZC8Mu3OnqGT3OLBTAky4Pfg==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 10:35:27 +0100
Message-Id: <DG62Q1L5RK1Y.22BS02J31LJV4@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v6 0/8] Add generic PHY driver used by MACB/GEM on EyeQ5
Cc: <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Conor Dooley" <conor.dooley@microchip.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>, "Andrew Lunn" <andrew@lunn.ch>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>, "Neil Armstrong" <neil.armstrong@linaro.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
In-Reply-To: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13107-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[theo.lebrun@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:url,bootlin.com:mid]
X-Rspamd-Queue-Id: D2CF7E3F48
X-Rspamd-Action: no action

On Tue Jan 27, 2026 at 6:09 PM CET, Th=C3=A9o Lebrun wrote:
> EyeQ5 SoCs integrate two GEM instances. A system-controller register
> region named "OLB" has some control over the Ethernet PHY integration.

Is the plan to take this for the v6.20 merge window or await v7.0?
The driver has seldom changed since its first revision 3 months ago.

Thanks!
Have a nice day,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



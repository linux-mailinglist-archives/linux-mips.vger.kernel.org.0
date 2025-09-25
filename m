Return-Path: <linux-mips+bounces-11559-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AADE1B9F005
	for <lists+linux-mips@lfdr.de>; Thu, 25 Sep 2025 13:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A928178D67
	for <lists+linux-mips@lfdr.de>; Thu, 25 Sep 2025 11:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD092FB983;
	Thu, 25 Sep 2025 11:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UuKt3ahY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6942F2E7BBA;
	Thu, 25 Sep 2025 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758801104; cv=none; b=s5Jrb/7iRBB6DRioKV/X72qa7F0Dx7BZxoCu1VM3gMhOXaIjlE7wt1O/ZGXYxStEwRHJo52AuTy4wq4yYhUtBM5PQSucGt0g+oXygRKqJZzmdBjtpxO+OJspqGnF7yPdq3VmTNqUaDPDVtnQWbdmHnYZMGhmZRQViIDysgMMik0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758801104; c=relaxed/simple;
	bh=nLHjkE5hAMTv1oaGUbSSFMNTVYmSwIDxixTqgDQXIjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EWTD4hX62mu6Zce24PrardlUD9SNAkeK7mx89uoV6SKQe8AOva/awaINrHD1Mmc/yUr/7cmWz4oJn5NVsdXd3/JQ/ajUJuLb4DUIpoLnnflaZncnjLF+hnfTnB/s104B5V3B1nPomzyFe91/LWHjuVWkC0ZnzOvD9RZiYxeQvac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UuKt3ahY; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 53F7BC011DF;
	Thu, 25 Sep 2025 11:51:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 969016062C;
	Thu, 25 Sep 2025 11:51:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2200102F17C2;
	Thu, 25 Sep 2025 13:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758801099; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nLHjkE5hAMTv1oaGUbSSFMNTVYmSwIDxixTqgDQXIjU=;
	b=UuKt3ahYgLfeGmya7N7uvliTPxrMU72Vm/+WXOMpD0FC23HafBetBxlk+3edEsUiAYND+M
	iIRZKdMDS5GR59/TnJtUuBCfsbC3KwnCoDtVA0dxiS9wBi836FKqLBxNrBllwMBJ/EZxa0
	GKk5k/NxJCHJxNxZe1GpkW2VBaukxFN6W2VEu3bqm9grAULhGuoOruvUH4TmH84HkLe31p
	hB40yf79QIjXiz7trUGG6IkAVMqSevwn7+MqG1CszD7jRpCiqEP+g/h4iyioRkfXHGuCyj
	ejhDAVJTRvTrtwIwBud1RVgHK/M1LxefekmTpGvJTnTesuZUXcc62zaNGjWqpQ==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Conor Dooley <conor+dt@kernel.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Sari Khoury <sari.khoury@mobileye.com>
Subject:
 Re: [PATCH 08/19] clk: divider: check divider validity for
 CLK_DIVIDER_EVEN_INTEGERS
Date: Thu, 25 Sep 2025 13:51:37 +0200
Message-ID: <6823295.MDQidcC6GM@benoit.monin>
In-Reply-To: <175834534592.4354.10788427255141071676@lazor>
References:
 <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
 <20250903-clk-eyeq7-v1-8-3f5024b5d6e2@bootlin.com>
 <175834534592.4354.10788427255141071676@lazor>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Saturday, 20 September 2025 at 07:15:45 CEST, Stephen Boyd wrote:
> Quoting Beno=C3=AEt Monin (2025-09-03 05:47:15)
> > Ensure that the divider is even when the flag CLK_DIVIDER_EVEN_INTEGERS
> > is set, similar to the power of two check for CLK_DIVIDER_POWER_OF_TWO.
> >=20
>=20
> Is this a fix?
>=20
This was found during code review, nothing prevents divider_get_val() to
compute an odd divider, but we have not hit a bug caused by that.

Should I add a Fixes tag to=20
6a136805e3c15 ("clk: divider: IntroduceCLK_DIVIDER_EVEN_INTEGERS flag")
or drop this patch since it does not fix a bug per se?

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com





Return-Path: <linux-mips+bounces-4104-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F959263D8
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 16:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19108280F78
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 14:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7571717B401;
	Wed,  3 Jul 2024 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J6mfbvdE"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17384409;
	Wed,  3 Jul 2024 14:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720018330; cv=none; b=CYJqV3SaVUMWidFjJCdWXBYlZ6mp7xICcOyAInW0xumB1GsUKwI88li5kkj4xjIb1t75SR2M1vqTY1/0UPbyJXQcQb4E5LjOUpq24+R2mnraZfVCB14nu1a509o6xUtCPgkVZpbzKui9Ui+lpaLnvIWLnHpZg8awx27V4CjTjYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720018330; c=relaxed/simple;
	bh=opuYPOBO3CpJ/UR87r0PwPENZCJ5lJ2kN2zlHDHZooc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=mrHGoO1AhQ623ubAnCvm83DAYbZxOUhNW+zhKC2l481wD++98ysOSWoKFZMWLDgqgebHMCmBgcrCj6wdonMA9FQqerMC+P6TUxFATbvvJRS3/8K9pscweJlK6sovdZGin+WG1D4DPTd6R938I0kOZJHhh1/7eTCZRtMMBZfTcvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J6mfbvdE; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72851240008;
	Wed,  3 Jul 2024 14:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720018326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=opuYPOBO3CpJ/UR87r0PwPENZCJ5lJ2kN2zlHDHZooc=;
	b=J6mfbvdEQcsGLS3MQ/y3pHy6zksWvA521a7dcQT+652pasbVLH3I7a8WdzbA5AwaYd7hIK
	gu//wwGdPcqBgYvQpLSP5Mw4tDjWK9OF6wxGptBb+QhhGm1nCDvODbj1gjHOpmWb4kgBap
	yN/gW2Ddu8sWw0uqQLrIK4HgKpH5Jjklwzk2/V9texg7lXB9TRy/nqDYlPKjSXNo9fz0SV
	NPmUFQzKo1+1EzTTOAgqWBwVSSXMr0zFdXoLoy6ELWg57skFitEUDF2TiMOJ9LYKKv1ypV
	MEZzSRFCwj23ChOLs4fVVw9CW1osH7vceBjXpU2+I1lGOi2RIW2HPt5eD7bv7g==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jul 2024 16:52:04 +0200
Message-Id: <D2FZLXUX4HHW.1R8U2P6JBH758@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 0/3] MIPS: Add Mobileye EyeQ OLB system-controller
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, =?utf-8?q?Gr=C3=A9gory_Clement?=
 <gregory.clement@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240628-mbly-mips-v1-0-f53f5e4c422b@bootlin.com>
 <ZoVhry8VFRx8x3w/@alpha.franken.de>
In-Reply-To: <ZoVhry8VFRx8x3w/@alpha.franken.de>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Thomas,

On Wed Jul 3, 2024 at 4:35 PM CEST, Thomas Bogendoerfer wrote:
> On Fri, Jun 28, 2024 at 06:11:49PM +0200, Th=C3=A9o Lebrun wrote:
> > This is a new iteration on the Mobileye system-controller series [0].
> > It has been split into separate series to facilitate merging.
> >=20
> > This series contains a dt-bindings defining the system-controller
> > (called OLB) used on EyeQ5, EyeQ6L and EyeQ6H. It then modifies the
> > EyeQ5 devicetree to exploit that system-controller.
>
> just to be sure, this replaces the v3 series ? And it's the only
> series, which should go through the MIPS tree ?

Sorry it was not clear enough. I confirm this replaces the V3.
It is the only series that should go through the MIPS tree.

The remaining three series have had their V2 sent a few minutes ago.
Each series contains the removal of the old dt-bindings and the three
clk/reset/pinctrl drivers.

https://lore.kernel.org/lkml/20240703-mbly-clk-v2-0-fe8c6199a579@bootlin.co=
m/
https://lore.kernel.org/lkml/20240703-mbly-reset-v2-0-3fe853d78139@bootlin.=
com/
https://lore.kernel.org/lkml/20240703-mbly-pinctrl-v2-0-eab5f69f1b01@bootli=
n.com/

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



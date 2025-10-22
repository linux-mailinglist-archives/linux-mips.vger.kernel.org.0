Return-Path: <linux-mips+bounces-11841-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F072DBF96F5
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 02:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B0B244E2CA9
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 00:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A852BD03;
	Wed, 22 Oct 2025 00:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjDDTk4e"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA932A1BA;
	Wed, 22 Oct 2025 00:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761092073; cv=none; b=QxlIvQf4Uhqe0gW0WUkeI80ANKrVXPdjl7uAWFpleVsVmJk/fb9kJ/rrQEG9XfV2IOAOA4u60KU18k/00tuYxPOyoWhKQxpPh+EQm2xgfc0jLOLVUw/DHdLcdCy97+iGLqVqw4lqny1XFsLN3NHCYindG6Q9QOQsWWcP3BUTl1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761092073; c=relaxed/simple;
	bh=qdTemEah2ZwUDwzRjVNCeMAn63LZUADIEQLUkKwzNvI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EZOj6q5pSOQrlcFNdFeAiGvrEVtayUwkCBk+joZ3aR0PfeKUjAVLw9AeASJCmKqb6QGrDECIoxU36loUbTiu9+xfSdE5lqF5s00+MaUTl/UeA1JukZadPtBnN3cQilFg6NpKsWeNgOsfuLXExcd3nd5INl47kGsezEPyHbnRxMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjDDTk4e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51B0C4CEF1;
	Wed, 22 Oct 2025 00:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761092073;
	bh=qdTemEah2ZwUDwzRjVNCeMAn63LZUADIEQLUkKwzNvI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZjDDTk4eNS2NWwQItnYm4fEAytnHF94dLxeWHleQAHpVRxYO4gR618BunjzSts/2O
	 dQKqqrIV5MJGXQ/6mnrDgLrC2lO/VX54XFyZFwL22MXxAE4jk9KBetXZzfrETjpiJk
	 Pak39RSQ+mhEPeaRRFm4AAthCEgbZQBchmbu8Tfn13r7F/PH7AtCMCuAPnZ7VlWj4E
	 uTLCKhBi+lf2M5oetDe5qycSvbmjc9HqXTAaF9P8DHxpr6iSUwSEbvGbbr3XAy0ghc
	 komcG6/Aozv8TU8zbF40bGCR81K3WWokPJN7sqoZSVk/F05NaiL1aYQ4fBxgFQrxIa
	 +H7lZe6V8z7Fg==
Date: Tue, 21 Oct 2025 17:14:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?UTF-8?B?R3I=?=
 =?UTF-8?B?w6lnb3J5?= Clement <gregory.clement@bootlin.com>, Russell King
 <linux@armlinux.org.uk>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?B?QmVub8OudA==?= Monin
 <benoit.monin@bootlin.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Jerome
 Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH net-next 00/12] net: macb: EyeQ5 support (alongside
 generic PHY driver in syscon)
Message-ID: <20251021171430.579211b2@kernel.org>
In-Reply-To: <20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com>
References: <20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Oct 2025 18:32:41 +0200 Th=C3=A9o Lebrun wrote:
> Merging all this won't be easy, sorry. Is this split across trees OK?
> The net-next part is pretty evident, it is the rest that appears
> complex to merge to me. I can resend the series exploded if useful
> (or at least split net-next versus the rest).

Yes, please respin just the patches that need to go via net-next
for us (1,3-6?). The rest I don't car^W know :)
--=20
pw-bot: cr


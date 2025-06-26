Return-Path: <linux-mips+bounces-9514-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA286AEA347
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 18:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AF5B188C33D
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 16:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82DF1F5413;
	Thu, 26 Jun 2025 16:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0LYeaLtA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rtm8Mhjq"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD711F0E26;
	Thu, 26 Jun 2025 16:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750954353; cv=none; b=FZJMbizfsm2b2I2kgpN1ccn3FcOWj3+vY/WFdmrc0P/vm7DN+tDsHRfx0W3LgIlFW/XXn+dMlH5UVf4YT+zbNr8PxT/4YRyFtATmQuxSU9aWvsX0GdDdQ7Xb+y+/7bQC+zXUhsvJejy43AncrcXBlu6peFsAYbi/BLDiwT5rbeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750954353; c=relaxed/simple;
	bh=UaVlcT2aXpH7MAMwcuQNDl3D3nNK53Euejp2CqccUmY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfBoM/hSRqRIMKjAfZ2EWteYFF6rIC5/4+vE3NScAx7SWJMGLAQ/+8VGnLm5bd4ffkPzgccl92bq7bTC05nNlXjTMjYN37SyriXfWL4LHtWKuN1cv1wzTuG2PsWg+1bSCSLvpz20jxpnRPeVavBzUWOONUM45EQCUY7Ww0AOgBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0LYeaLtA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rtm8Mhjq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 26 Jun 2025 18:12:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750954350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eljFHNeyDYyRzp+O8F4KzsegQjKW9C3yujFh6Fsq1Qk=;
	b=0LYeaLtAJ5FAMG3LKAeKdLDltJhvOW1WHfMGoLPpHniE2OZI85uX1GQ2ey33i0w2d3okwY
	y8RJdyrEW9ZY/cT+ZjwXRpUAjWJ0kCU+X2/JsCqHsZ9U3aZ2TChCv+CCVSJp+KV+L4Zxa2
	z1/e8Cw6EEDWNScScFvdTo+JFjdypZBGw3uOzxDCwl0rK8PijcEKtHTsbEtaOJrOY79zE+
	lyYrnQXacHleQNfDRVYS/oxCSupzyLsGdaUVpCsib+pW7FPXQCOPPYoVqYsGycNLqIR0Mq
	0QXD62rY8oOCAC9hVds/VEowvpYLNn7GWPeodcQRkAMgY2ncXFVKyAVu6ZobjA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750954350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eljFHNeyDYyRzp+O8F4KzsegQjKW9C3yujFh6Fsq1Qk=;
	b=rtm8MhjqrOGX+yu466ihurQqBVjxnH6Q7AddtO63t9athnBOj9mUFoMRtFMFVGiDMnsQtE
	sk4IQPJV0R8iU4AQ==
From: Nam Cao <namcao@linutronix.de>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Antoine Tenart <atenart@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 02/12] irqchip/bcm2712-mip: Switch to
 msi_create_parent_irq_domain()
Message-ID: <20250626161228.N6byQ97v@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
 <92a6d68db014e945337c10649a41605da05783da.1750860131.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92a6d68db014e945337c10649a41605da05783da.1750860131.git.namcao@linutronix.de>

On Thu, Jun 26, 2025 at 04:48:59PM +0200, Nam Cao wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Switch to use the concise helper to create an MSI parent domain.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Nam Cao <tglx@linutronix.de>
                          ^ oops, that's not my email

I will send v2, but let's wait for a few days if there is something else I
should fix.

Nam


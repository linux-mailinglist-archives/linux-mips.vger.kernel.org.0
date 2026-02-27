Return-Path: <linux-mips+bounces-13288-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB++IYSpoWm1vQQAu9opvQ
	(envelope-from <linux-mips+bounces-13288-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 15:26:12 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE4F1B8E1C
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 15:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A347A31F645D
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 14:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA97B4219EF;
	Fri, 27 Feb 2026 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDgpHXgu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B064C3EFD0A;
	Fri, 27 Feb 2026 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201298; cv=none; b=RLp5BJpj6Hb5dWMi5YCY8xuXSlx8n+SjvorgKaCZDkWw+SRaY4UE/szlLNTtaJzIHeQ1hY15skNQilN5JUBtNig+RtY+IKaKdq/Utj96tOb/6xPQWFCNXsaDVam0OYJHobzHF+QIwxhI7bAAEPMXgLDpS3S1kvgCL7NBQmjiu54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201298; c=relaxed/simple;
	bh=TiA19B2029SlmlVMXMVhf5Vhssf3HDX9ajqPqZqlpZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maQHIu2uJ5ARnTXcvEgHCGMtncKROKsiug3kmHaWnl8wiMSqoN6m2jJaGf1vsYSLCEOzKL/oIOLvjYwmb3JdJR9ljlTbUgxIhgvahH4V+fE37CJ7HqiGqacJycf+05wdmshyVW4WdJeQS0H6rlszUBs0Ala5bsoKTN1SfYuwW/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDgpHXgu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6710EC116C6;
	Fri, 27 Feb 2026 14:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772201298;
	bh=TiA19B2029SlmlVMXMVhf5Vhssf3HDX9ajqPqZqlpZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gDgpHXguuDtFsPLvt5L9lwMfiCQOf/4HSL46ZN/ED0LkW0DDIeeNy0IcBYLH3G+zt
	 Xy+JzTjYjLuzYkpyESSr6Pe0x7jw/epDMI3WmgXLUUDhX/Zy98NE1+6Keli7o9uujt
	 8Lj4oI5UgrgmKV4goxcXJGzjiHm+9ATKk8ZOgE1aj5eukLpIgbe/lBikFD0Cf+7jGZ
	 ogHin5ey692vHtyNAV982Sxha7gL+0r07DiHjFxe7qzSIGsYQjjx/xaiDutXe+ZZwU
	 XYgZ9U8HIc83spzcoBHQ9dDqr790NXaAOan3kyYMd2xTsR06HUYN9kJ8/TCPvIVNFk
	 AQkVA5GPcKwYw==
Date: Fri, 27 Feb 2026 19:38:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 3/8] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Message-ID: <aaGlTqjgRgIvB_O5@vaman>
References: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
 <20260127-macb-phy-v6-3-cdd840588188@bootlin.com>
 <aZ8OkJ4BH0-sVSHS@vaman>
 <DGO5XYKELMA3.14FPOZ2FCD8NN@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGO5XYKELMA3.14FPOZ2FCD8NN@bootlin.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13288-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EFE4F1B8E1C
X-Rspamd-Action: no action

On 25-02-26, 16:54, Théo Lebrun wrote:
> On Wed Feb 25, 2026 at 4:00 PM CET, Vinod Koul wrote:
> > On 27-01-26, 18:09, Théo Lebrun wrote:
> >> EyeQ5 embeds a system-controller called OLB. It features many unrelated
> >> registers, and some of those are registers used to configure the
> >> integration of the RGMII/SGMII Cadence PHY used by MACB/GEM instances.
> >> 
> >> Wrap in a neat generic PHY provider, exposing two PHYs with standard
> >> phy_init() / phy_set_mode() / phy_power_on() operations.
> >
> > Is there a dependency of this patch with rest of the series. If not
> > please post different series for subsystems.
> 
> ACK. It felt sensible to keep patches close together to understand their
> reasoning.
>  - clk patches are there because they imply we get a dev->of_node.
>    Without them we don't and therefore the driver is useless.
>  - DTS/MIPS patches are there because they exploit this new driver.
>    They show the first users of this driver.

You can add that in cover letter for people interested to read. It is
easy for me to pick a series rather than find which patches to review
and apply

> 
> Will split for next revision.

Thanks

-- 
~Vinod


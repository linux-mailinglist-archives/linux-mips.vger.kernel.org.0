Return-Path: <linux-mips+bounces-13212-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PzjMZcOn2neYgQAu9opvQ
	(envelope-from <linux-mips+bounces-13212-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 16:00:39 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 261CA1991D7
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 16:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADCB83034298
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 15:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C7E3D410A;
	Wed, 25 Feb 2026 15:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBCvffqh"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF6A3B961D;
	Wed, 25 Feb 2026 15:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031636; cv=none; b=l0HVW27cJhWtXT+wQQgM/eNavRe5A7I99qUj8NkP3ZvsT+PPbev8pQe5AnpzeBKAgFfY2GmvJ+zGT8fh9F8PtznqlWtIbmEmQvv8GbbabyKJLNA4X9jutQQ5TePXwVU5g4K6nRGN+H8s5tbks/XkfIwd4gYqcNJVjD/6leu/SGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031636; c=relaxed/simple;
	bh=qolp+34050B6CVS9hDfpeLf/AaTldYW8+jpHIvJTLic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJnAtLfjzgb6ijrpxbND8y0NO92DXkT1ArPTYS3p0QmyTfxQ7SC4xhmlCvBvZO2spbRwCWLRK6AqZZF8ZOuhFBExpUuRedhWlUY4QT89ywShA2qiZJDWLLiwSW6xyN5MGdx47U4npIMHcKAIbSnuVl1LOdxYYFRKhXFuSkRQxlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBCvffqh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639AFC2BC87;
	Wed, 25 Feb 2026 15:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772031635;
	bh=qolp+34050B6CVS9hDfpeLf/AaTldYW8+jpHIvJTLic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fBCvffqhmtxRH0tkNdXLSmpENugxf8ooGK7/5+UWF8qDQZF+hmLP5ERpnBBQJ9IPE
	 ZvhezlEilReZUBD/uBgvOXIzyAyq6xpNtnQg7XMQ2cTTQB3lI6KAwEgOLsdssCx2Rb
	 mKmmF3HMQu/3ve0SOfUKRA6pn7Td+zRHiCshz9fGIp1lI9DgRW+Iau7NcsoG3+vkOS
	 iYrNNSXYFunokGnuW9FLMdb9YTSgymhklmxMtWgywLO2q/ZnTNn+FimSUkBhD3rLIf
	 rvljGT9ttNWOBsNvs1piKN4VHgoVK94L1ammlpOdwlxEX8OH2riGw9qNqE3ahLLZmj
	 usuScrbUMpyLA==
Date: Wed, 25 Feb 2026 20:30:32 +0530
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
Message-ID: <aZ8OkJ4BH0-sVSHS@vaman>
References: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
 <20260127-macb-phy-v6-3-cdd840588188@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127-macb-phy-v6-3-cdd840588188@bootlin.com>
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
	TAGGED_FROM(0.00)[bounces-13212-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: 261CA1991D7
X-Rspamd-Action: no action

On 27-01-26, 18:09, Théo Lebrun wrote:
> EyeQ5 embeds a system-controller called OLB. It features many unrelated
> registers, and some of those are registers used to configure the
> integration of the RGMII/SGMII Cadence PHY used by MACB/GEM instances.
> 
> Wrap in a neat generic PHY provider, exposing two PHYs with standard
> phy_init() / phy_set_mode() / phy_power_on() operations.

Is there a dependency of this patch with rest of the series. If not
please post different series for subsystems.

> +static int eq5_phy_init(struct phy *phy)
> +{
> +	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
> +	struct eq5_phy_private *priv = inst->priv;
> +	struct device *dev = priv->dev;
> +	u32 reg;
> +
> +	dev_dbg(dev, "phy_init(inst=%td)\n", inst - priv->phys);
> +
> +	writel(0, inst->gp);
> +	writel(0, inst->sgmii);
> +
> +	udelay(5);

This is _same_ as exit. Why not call that routine here and document
why...
-- 
~Vinod


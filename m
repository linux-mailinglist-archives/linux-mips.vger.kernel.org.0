Return-Path: <linux-mips+bounces-7061-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBAC9F48F9
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 11:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F38DF165627
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 10:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981821E22F0;
	Tue, 17 Dec 2024 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3T0rn98"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639701DF965;
	Tue, 17 Dec 2024 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734431716; cv=none; b=CcRxcHdxN9DsSrJJqAyd+GQuXmiHpW/FHfrJ4lef0AkDTjbnwW3NnXC+kYbfLL/Gm4lFk3RVAgMuQygSNCRcKmTgRnf2hb/gOHdbUgCzw1ia/Wg8QYyPDa0rf/gmni8xHnhoUibII4UklEZ/kM5RLq7Bp4V2ExkXSOSg2ROkz6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734431716; c=relaxed/simple;
	bh=yDjkBFyqDhWA0hUrGZUYVCNVEP+dZZGyN7HiHVpaSMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rL+VGhF/Qej0tBXQVKo0zIPlxi7+KQ0U4utk24WeeCviZC9/nugh25bxx7UAaMCevD0mcl7AiiwGMjMKWYMv8hkFprR9dQUqxdJA9WFmH7hgyJoNTRbe4m35a2SAyNB6OTSeKm+Acp/OcYx5y6TSdap3WyiNpo00m4+bC7aFO9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3T0rn98; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B086BC4CED3;
	Tue, 17 Dec 2024 10:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734431715;
	bh=yDjkBFyqDhWA0hUrGZUYVCNVEP+dZZGyN7HiHVpaSMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P3T0rn98p7PSCmN15nKpKFHWpMt1SUb4PDGaEFALSwbhHe6wVoSfClUJiXOMDe4Ab
	 Pv1nn+CxhIO3vP/Z6qnkyALCPB9SRxgLeLRPkKIYbtWFxM7DFIELRH3tYPT+iG05Yy
	 ovD2E/soNrbdfVx+oPRaSY5xq0otKd0KLRTYwlleKiGGSJbrPgxOcT6KerupBDPrDA
	 heuiHKigf3IQ+sZLfYfDlL6SiRsdfFR7vVtxkdZBE8RAT1AlO89rhEyPqM3AOYqskc
	 JrTnGdQnHiHH+suk4oa5+GEbFmMlWkt1jHT4cOE2tSAnhOVHtDjIcRMMwkQ0ayOLRu
	 hDvDlPX/Gdw7w==
Date: Tue, 17 Dec 2024 10:35:09 +0000
From: Simon Horman <horms@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	tsbogend@alpha.franken.de, hkallweit1@gmail.com,
	linux@armlinux.org.uk, markus.stockhausen@gmx.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-mips@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2 4/4] net: mdio: Add RTL9300 MDIO driver
Message-ID: <20241217103509.GO780307@kernel.org>
References: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz>
 <20241216031346.2626805-5-chris.packham@alliedtelesis.co.nz>
 <20241216164814.GH780307@kernel.org>
 <cf77f08d-0516-4adf-a701-9589f0d99eb5@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf77f08d-0516-4adf-a701-9589f0d99eb5@alliedtelesis.co.nz>

+ Dan Carpenter

On Tue, Dec 17, 2024 at 10:47:10AM +1300, Chris Packham wrote:
> 
> On 17/12/2024 05:48, Simon Horman wrote:
> > On Mon, Dec 16, 2024 at 04:13:46PM +1300, Chris Packham wrote:
> > > Add a driver for the MDIO controller on the RTL9300 family of Ethernet
> > > switches with integrated SoC. There are 4 physical SMI interfaces on the
> > > RTL9300 but access is done using the switch ports so a single MDIO bus
> > > is presented to the rest of the system.
> > > 
> > > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

...

> > > +		if (smi_addr[0] > MAX_SMI_BUSSES)
> > Hi Chris,
> > 
> > Should this condition be
> > 
> > 		if (smi_addr[0] >= MAX_SMI_BUSSES)
> Yes. You are correct.
> > > +			return dev_err_probe(dev, -EINVAL, "illegal smi bus number %d\n",
> > > +					     smi_addr[0]);
> > > +
> > > +		if (smi_addr[1] > MAX_SMI_ADDR)
> > > +			return dev_err_probe(dev, -EINVAL, "illegal smi addr %d\n", smi_addr[1]);
> > > +
> > > +		if (fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45"))
> > > +			priv->smi_bus_isc45[smi_addr[0]] = true;
> > Otherwise it seems that smi_bus_isc45 may overflow here.
> > 
> > Flagged by Smatch.
> 
> Sounds like something I should start looking at for myself. Have you got a
> link to share?

Hi Chris,

Smatch is here: https://github.com/error27/smatch
And my usage of it is informed by
https://blogs.oracle.com/linux/post/smatch-static-analysis-tool-overview-by-dan-carpenter

FWIIW, I run it usking kchecker on individual source files.

I've also CCed the author, Dan Carpenter, for good measure.

...


Return-Path: <linux-mips+bounces-7575-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA1FA19A82
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2025 22:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E45B188D429
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2025 21:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB44A1C5D66;
	Wed, 22 Jan 2025 21:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="TSnStr1+"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C352E1BBBFE;
	Wed, 22 Jan 2025 21:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737582483; cv=none; b=Au7FllsVKPvwIFH8Bj3P+ca+FaHQc37yMReOdAC6P7FK/ec5UAralf8QQCidDh4HeVf4AS8edp0H9HD09BwMLIh3s6mm2nwC1ABRTAO2veOgcJuCudpOQpnT4R3Kd0bwVBUAP7Nz2HkLgzV4MbzfF8XiUC35OKpX4aCVHGO1zO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737582483; c=relaxed/simple;
	bh=GPlfb11rOU6vCBYyW3bI+G5qk0hd7ZBJuNpDeCGekd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnZLfjNd8zurvg4t5du1xPyXeNqZPPDVpDBCGYEPUFKJXwNIJrh4RQvB+JACi6Jwg0eYPOdoLlDX/v0c71Qh2M/oNBIeGnFmuxIOy+hQvsZwAtL6ktelvFp3gehtiUN2XMqaa8LwkOWz7sz2/VtTNN+hd/3l1JDS0PSb78GZxnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=TSnStr1+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VYXUx+AVF3PXMJC09B4TMHWpe5id2+ynaWftNZKLMSg=; b=TSnStr1+4mQCngN52RvjzOMJQ/
	ZfU1kSvRjQ7opGOUWICvSpwWuiISgyLXY+O8/KeHeg98/ZsX5ndPGl8xMrAKIax17sndiKG2wRFe0
	7hlhPddb9RuUwRfal30RWQaRTvY9W4d3tRXPHixmCI4h9MhQh08TLkgYs1gbL/r82zzA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1taiZW-0074Cp-BL; Wed, 22 Jan 2025 22:47:38 +0100
Date: Wed, 22 Jan 2025 22:47:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Sander Vanheule <sander@svanheule.net>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, tsbogend@alpha.franken.de, hkallweit1@gmail.com,
	linux@armlinux.org.uk, markus.stockhausen@gmx.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 4/4] net: mdio: Add RTL9300 MDIO driver
Message-ID: <faa4cf6e-40eb-4509-b3f0-198a9a45ccbd@lunn.ch>
References: <20250120040214.2538839-1-chris.packham@alliedtelesis.co.nz>
 <20250120040214.2538839-5-chris.packham@alliedtelesis.co.nz>
 <d4194a1560ff297e5ab3e6eae6d51b7c9d469381.camel@svanheule.net>
 <63d6cf16-9581-4736-8592-bc5836fa51af@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63d6cf16-9581-4736-8592-bc5836fa51af@alliedtelesis.co.nz>

> I believe the POLL_SEL configuration actually affects an internal port
> polling unit. From the datasheets I have it seems pretty configurable, you
> can tell it which phy registers to poll and what values indicate link
> up/down (the defaults are conveniently setup to match the Realtek PHYs).

You need to disable this. The linux PHY driver is driving the PHY, and
the hardware has no idea what Linux is doing. Say the driver has
changed the page to read a temperature sensor, when the switch does a
poll. Rather than reading the link status, it gets some random value
from the page containing the temperature sensor.

	Andrew


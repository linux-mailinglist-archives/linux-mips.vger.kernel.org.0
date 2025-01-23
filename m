Return-Path: <linux-mips+bounces-7578-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D87AA19D5E
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 04:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1C593A63ED
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 03:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26612126C02;
	Thu, 23 Jan 2025 03:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="VT3UG3Xv"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A783A8D0;
	Thu, 23 Jan 2025 03:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737603723; cv=none; b=oW9Cmg9j3zUjjofn7Rt47k1p4m0VvmMbf4YED7gbvA9MgZ7jkRKc0vKkQg1D6ptruB6SsZIY067QXoOLRAFi0/WoYWql9pZ82yvC5huOdQt4a1tarS/UrpUKCP+fFUph5g1qMOnXBaIRPpKUU8380ZK2T3FdIOHMBK4LokfOgx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737603723; c=relaxed/simple;
	bh=3RY4k2zboVV5daIxlBEkCjdDsAZaLavxRnGu8nEYbec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugba9sDAOAS3LjSJAaeqzcYWKg4A8zGnpyN6DmXtGmc+3ZKujAMQQjGHwKx234vuDNXLSBNoLAFJPlpzSOa7Nrv9p1+vzo/NIVebWBMIXT5xh2F+pBPr+HMEZbj0eE/Sm/cgAvAYO1D3kcvvTpylBQlN8glUYaxMV0w6ZT/lUwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=VT3UG3Xv; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nxV6h48oOYNUXilv2b43vdsiPZOgrDsSq3hXRcY+eoY=; b=VT3UG3XvlCtX+ofHf2rAlwAlGk
	Eg1t/wU6mPNFAxoymJ2dNMDPTLpf86x/ZLPF6018Q/qpmJH5grMNzIdgyCwQ2QNxJpBOLlvZfEwQ9
	vhlzgRl0sM6S5go6ZxogW8bkU2jGoDEuZ2+YdrG3PlVunEPfs9+NFMvravK5IBcMDvnc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tao66-0078OE-Du; Thu, 23 Jan 2025 04:41:38 +0100
Date: Thu, 23 Jan 2025 04:41:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Sander Vanheule <sander@svanheule.net>,
	"lee@kernel.org" <lee@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"markus.stockhausen@gmx.de" <markus.stockhausen@gmx.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v4 4/4] net: mdio: Add RTL9300 MDIO driver
Message-ID: <11d7fe78-958d-409f-a979-25cc1bc933a2@lunn.ch>
References: <20250120040214.2538839-1-chris.packham@alliedtelesis.co.nz>
 <20250120040214.2538839-5-chris.packham@alliedtelesis.co.nz>
 <d4194a1560ff297e5ab3e6eae6d51b7c9d469381.camel@svanheule.net>
 <63d6cf16-9581-4736-8592-bc5836fa51af@alliedtelesis.co.nz>
 <faa4cf6e-40eb-4509-b3f0-198a9a45ccbd@lunn.ch>
 <09bd2f04-96d6-4dba-92ee-22ccbd7f584f@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09bd2f04-96d6-4dba-92ee-22ccbd7f584f@alliedtelesis.co.nz>

On Wed, Jan 22, 2025 at 11:02:14PM +0000, Chris Packham wrote:
> Hi Andrew,
> 
> On 23/01/2025 10:47, Andrew Lunn wrote:
> >> I believe the POLL_SEL configuration actually affects an internal port
> >> polling unit. From the datasheets I have it seems pretty configurable, you
> >> can tell it which phy registers to poll and what values indicate link
> >> up/down (the defaults are conveniently setup to match the Realtek PHYs).
> > You need to disable this. The linux PHY driver is driving the PHY, and
> > the hardware has no idea what Linux is doing. Say the driver has
> > changed the page to read a temperature sensor, when the switch does a
> > poll. Rather than reading the link status, it gets some random value
> > from the page containing the temperature sensor.
> 
> There's a mask that can be set via a register that can disable polling 
> for a port. The trick will be deciding when to do so.

On probe. And leave is disabled. phylink will provide you with all the
information you need about link up, what the link speed is etc. There
is no need for PPU.

	Andrew


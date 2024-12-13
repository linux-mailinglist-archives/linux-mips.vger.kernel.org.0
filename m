Return-Path: <linux-mips+bounces-7017-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED7D9F0BC4
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 12:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A351166F2C
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 11:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF4B1DF273;
	Fri, 13 Dec 2024 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="OCbwOEvR"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642D81632F0;
	Fri, 13 Dec 2024 11:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734091128; cv=none; b=l55jZpwZym+WZ044H0/YNqu/NpHEJfNO3+P1MSPeEYGSxkDyhglXYbV9ZcCpOSQsEHLZMWaX2hDt01E9FL9QAJ0yvHMeNZo7C4UjRm5059+GVAj1Uj9E7LpS3Qqr/RdcUDzzxR3WXchUnOK/mhZoSWDg4A8D9hzlXFu9n+7SU/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734091128; c=relaxed/simple;
	bh=5tvzRyGSgNg65FwD8qDrypX5Mq3UwsWmp5Fljw5JJdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQ5y34RTLpRL5J1i9UHQ9398ylO+GAuKXM8b9HOpyYwTIdW0D+xDfIVdYNTWzX6KbRgw2vGK2YsmbWOXkjes2ZZ43n3mv68y4oXNM8hfEWNQqxiZWKcQ/dO8hIR7wxpkEzwknpul7SRCpHp564m0VT2Cx+vMAfRZb3X6FvOjdJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=OCbwOEvR; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=i8HO5rW1wL+pECUU1j/nn4RV1iSO1nA/SHoNQVntgJc=; b=OCbwOEvRhVNXsBOp8Da45bcXxJ
	FDlyI/CD7xfMwjFT0CIOMBu2zbhGPBMUWi1oTWnfZBC1HxWmQBW6WrADTupM5kPxwX9rvLz3J5GqN
	fpOiS7nb9QuzUEn/izL7GXMxrJdAnlD7NiwWYbkrShohMcabtJTiYoTcx1usQTQMBkgk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tM4JN-000Knr-Fu; Fri, 13 Dec 2024 12:58:25 +0100
Date: Fri, 13 Dec 2024 12:58:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	tsbogend@alpha.franken.de, hkallweit1@gmail.com,
	linux@armlinux.org.uk, markus.stockhausen@gmx.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: net: Add Realtek MDIO controller
Message-ID: <b1117d56-87d9-46b2-b6aa-e6ca20bac322@lunn.ch>
References: <20241211235342.1573926-1-chris.packham@alliedtelesis.co.nz>
 <20241211235342.1573926-2-chris.packham@alliedtelesis.co.nz>
 <77817fd0-cf79-4c4f-b09f-8ee9b3b136f9@lunn.ch>
 <4e59d81c-4af1-407b-a9c5-4b36eee35f96@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e59d81c-4af1-407b-a9c5-4b36eee35f96@alliedtelesis.co.nz>

On Fri, Dec 13, 2024 at 01:56:52PM +1300, Chris Packham wrote:
> Hi Andrew,
> 
> On 13/12/2024 06:13, Andrew Lunn wrote:
> > > +      realtek,smi-address:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +        description: SMI interface and address for the connected PHY
> > > +        items:
> > > +          - description: SMI interface number associated with the port.
> > > +          - description: SMI address of the PHY for the port.
> > Is the hardware really random here with its mapping of PHYs?
> > Generally, hardware is pretty predictable, logical. I'm just wondering
> > if this property is really required, or if it can be replaced with
> > some logic, avoiding typ0s.
> 
> The hardware is pretty flexible in this respect. You can pretty arbitrarily
> arrange your PHYs. Not all ports support the same kind of SERDES interface
> but as far as the MDIO interface goes you can arrange things however you
> like.

Is there a reason to not just statically define it, maybe with a table
in the driver? Does a DT developer actually need this flexibility?

	Andrew


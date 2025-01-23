Return-Path: <linux-mips+bounces-7599-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A837A1AC71
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 23:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57E01161375
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 22:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4581E1CBE95;
	Thu, 23 Jan 2025 22:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="V+0Kwpzh"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AD71C5F26;
	Thu, 23 Jan 2025 22:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737670157; cv=none; b=MMOeAutIifvsOOW7IlkCC8ILBKhMR2G0uACtzjY6uoJiDah8YVAc020nae6JeVpVkEorCkBChNT4VLelRL42oG/8+27agGXw5MDcTNQO4AhUYg4xzvl+BR4te6/1ooaJc64w3IKuu1gILDmu2CbTpl4N5qnER+HQB/RkbkCICvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737670157; c=relaxed/simple;
	bh=IuQh4hT3L/qUrsgJ79Lakle1pBHc2wT8MiSLNoLUORo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxmKF50b89vzGf66PXFowydiUYqyst6q8HpWRuCYg95ABb5fhffGQwnbE6ZkheSs6EvnW4dUOzdvsMUuLP4fl1VHRQW3PDRuoUQ2zXotBNWONlSUG6fq3r8qvQQQsflIXQOixJJtRoxWO1DwNGwEg6Xvjt0bB7jPtdJlJFTwZR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=V+0Kwpzh; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=i7W0+D7OmrzJ+/mV8STt4tTPqf5Ys668103VYyhmepE=; b=V+0KwpzhktigBTBIpergSLBO58
	5Z42QjoRUeppbs6OzNdaE3F7QzuEnhJLKzH4e6TJ56UyaoH5IG8XGuiV5jT+8IQvlnDK1XsB5an8f
	9S9dGDg7bY2RHQXa8aA06dHS+30Ov3YbJ+deM+F6j2ETubVNC9V9ltD3rg5ZhVsne7ig=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tb5Nc-007Nyf-7p; Thu, 23 Jan 2025 23:08:52 +0100
Date: Thu, 23 Jan 2025 23:08:52 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
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
	"sander@svanheule.net" <sander@svanheule.net>,
	"markus.stockhausen@gmx.de" <markus.stockhausen@gmx.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: net: Add Realtek MDIO controller
Message-ID: <95923d9b-bf37-4256-a342-f71f4d814383@lunn.ch>
References: <20250120040214.2538839-1-chris.packham@alliedtelesis.co.nz>
 <20250120040214.2538839-2-chris.packham@alliedtelesis.co.nz>
 <20250122-obedient-owl-from-ganymede-4a8343@krzk-bin>
 <6b026af2-62bc-4b7d-abc7-d4c6a99bd848@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b026af2-62bc-4b7d-abc7-d4c6a99bd848@alliedtelesis.co.nz>

> >> +        properties:
> >> +          realtek,port:
> >> +            $ref: /schemas/types.yaml#/definitions/uint32
> >> +            description:
> >> +              The MDIO communication on the RTL9300 is abstracted by the switch. At
> >> +              the software level communication uses the switch port to address the
> >> +              PHY with the actual MDIO bus and address having been setup via the
> >> +              parent mdio-bus and reg property.
> > I don't quite get why this cannot be the 'reg' property. I understood that
> > 'reg' of this node is not really used? Or you meant here this 'reg', not
> > parent's 'reg'?
> 
> It's is a bit confusing (any suggestions for improving the description 
> and/or commit message are welcome).

I don't know if it will actually help, but....

We have two entangled configurations here.

1) You have 4 MDIO busses which you need to describe using mdio.yaml
   In this binding, reg is the address of the device on the bus, in
   the range 0-31.

2) The hardware was a pool of PHYs which you can map to address on the
   MDIO busses.

Rather than combining them, maybe it would be better to keep them
separate. It is probably more error prone, but simpler to
understand. And hopefully errors result in PHYs not being found during
probe, so the problems are obvious.

Maybe you can actually use phandles. You have the usual MDIO bus
nodes:

    mdio@5c030000 {
        #address-cells = <1>;
        #size-cells = <0>;

        ethphy0: ethernet-phy@1 {
            reg = <1>;
        };

        ethphy1: ethernet-phy@3 {
            reg = <3>;
        };
    };

    mdio@5c040000 {
        #address-cells = <1>;
        #size-cells = <0>;

        ethphy2: ethernet-phy@1 {
            reg = <1>;
        };

        ethphy3: ethernet-phy@3 {
            reg = <3>;
        };
    };

    mdio@5c050000 {
       ...
    }

    mdio@5c060000 {
       ...
    }

    And then a node which is a list of PHY phandles:

    [&ethphy0, &ethphy1, &ethphy2, &ethphy3, ....]

The 0th entry in the list tells you have to map the 0th PHY in the
pool to an MDIO bus and address. Follow the phandle to get the MDIO
bus and the address on the bus.

	Andrew


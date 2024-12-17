Return-Path: <linux-mips+bounces-7071-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD449F5ACD
	for <lists+linux-mips@lfdr.de>; Wed, 18 Dec 2024 00:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0E0B1883925
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 23:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C001FA84A;
	Tue, 17 Dec 2024 23:54:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B401E489;
	Tue, 17 Dec 2024 23:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734479698; cv=none; b=KMqVuPKLyQrHz+Ij9HnC7SZyXIB0d6VBrHxiLn10rnx4erJ01GyfAoCi1bj8tbS2rTx0OhlaowWyXeNm0VQr/7SODOVAvn+JvzBrtbFSH+8nUbNYK4c6hJTVhkbeDwX/Bef84xjhhb/22B1zDaOMEiMfVpFLI/12rZ2nu3RzfJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734479698; c=relaxed/simple;
	bh=ZIU/bSBdZIgbL+/3JkG45Oi9vsoLON8STKjcg0GvWUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EA9VSRrmlyTt7LI6FgW14gF0lxGI+VE52NJtk5Pk527FxuRh+gB1dAHDGP5kCd+nnlj4O/xtDvt63a7h6DDZKs0wKsUBh5JK9zG3W8e2e7yPUsAUweo/6RxtNZMtCx+PnspPc5vjmJl+OGmVWUcAm1/yGJSghb9hjkggB/tgfYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1tNhOi-000000005JX-0zK8;
	Tue, 17 Dec 2024 23:54:40 +0000
Date: Tue, 17 Dec 2024 23:54:34 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	tsbogend@alpha.franken.de, hkallweit1@gmail.com,
	linux@armlinux.org.uk, markus.stockhausen@gmx.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: net: Add Realtek MDIO controller
Message-ID: <Z2IPOkMsI4ufGQpQ@makrotopia.org>
References: <20241217224501.398039-1-chris.packham@alliedtelesis.co.nz>
 <20241217224501.398039-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217224501.398039-2-chris.packham@alliedtelesis.co.nz>

On Wed, Dec 18, 2024 at 11:44:59AM +1300, Chris Packham wrote:
> [...]
> +patternProperties:
> +  '^ethernet-phy(@[a-f0-9]+)?':
> +    type: object
> +    $ref: ethernet-phy.yaml#
> +
> +    properties:
> +      reg:
> +        description:
> +          The MDIO communication on the RTL9300 is abstracted by the switch. At
> +          the software level communication uses the switch port to address the
> +          PHY with the actual MDIO bus and address having been setup via the
> +          realtek,smi-address property.
> +
> +      realtek,smi-address:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: SMI interface and address for the connected PHY
> +        items:
> +          - description: SMI interface number associated with the port.
> +          - description: SMI address of the PHY for the port.

What speaks against describing the actual MDIO busses and addresses (ie.
the hardware) in Device Tree and setting up the hardware mapping between
ports and SMI bus and address by parsing the DSA switch port description
in the MDIO driver?

In that way you would not need the additional vendor-specific property
and on switches with high port density also avoid having to deal with
bogus "MDIO addresses" greater than 31.


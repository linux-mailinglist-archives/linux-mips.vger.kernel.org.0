Return-Path: <linux-mips+bounces-6978-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DE49EF697
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 18:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E513C189C31C
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 17:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DA1223338;
	Thu, 12 Dec 2024 17:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="RwKKIrNB"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6349E2210DB;
	Thu, 12 Dec 2024 17:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734023623; cv=none; b=ARr9juBGdT2+BZ2vnesZe7+gowmcsfGAGFafz2t3Hrt10YsX6MwlL3//9PJNh6GJFSqkFRFfL3b03Oqc20W0NsrNSlZ0vOVfMN3AadkzD4/ezmXi2I0GOr8Z/92kQE3qGYx/qkLKuPfo3yNzHQBi5SX2W2DiyBfIziQRKxlnqzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734023623; c=relaxed/simple;
	bh=TU4Atp3xw3sNd3X+Ksrq/CI/MSf/mtoPSGERKj4eB0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOnme9heEzic4lC8K4hWlSDim+RuhPl3H+HwPm7lfLiDxOnO5WHiZjvsQRHMKczSSKkc2rPtC6ctCrLUHoP6FByJKYd4y/XRJZ0DG5Ysh0CSt4wnZAfl+kmlAe9PAGI5nSWxysCbPgyDPr68AGjvpq7DrT30Bh1WaQnGtFUlBco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=RwKKIrNB; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=X8q2rrm1SuS3vpSan9xVzw55JIuApZMl/xTXFlxS3L0=; b=RwKKIrNB9/Trt2hKXqhBi2StpC
	iO1Zp9U5KD7eeRCHkEnCdLnQLE0YKTiwBCJtiVa/kop133DWouBD4xmRXs2tjUHIoThPqDX1smuu7
	4LyBvuYU83VWKpX1Sn0tFkjoBFOpHUhtmPQCyoe8tGsu0CkezR8CjqTCIzpkbHzNDRyU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tLmkZ-000EYk-86; Thu, 12 Dec 2024 18:13:19 +0100
Date: Thu, 12 Dec 2024 18:13:19 +0100
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
Message-ID: <77817fd0-cf79-4c4f-b09f-8ee9b3b136f9@lunn.ch>
References: <20241211235342.1573926-1-chris.packham@alliedtelesis.co.nz>
 <20241211235342.1573926-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211235342.1573926-2-chris.packham@alliedtelesis.co.nz>

> +      realtek,smi-address:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: SMI interface and address for the connected PHY
> +        items:
> +          - description: SMI interface number associated with the port.
> +          - description: SMI address of the PHY for the port.

Is the hardware really random here with its mapping of PHYs?
Generally, hardware is pretty predictable, logical. I'm just wondering
if this property is really required, or if it can be replaced with
some logic, avoiding typ0s.

	Andrew


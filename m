Return-Path: <linux-mips+bounces-7179-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC759FACF8
	for <lists+linux-mips@lfdr.de>; Mon, 23 Dec 2024 11:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A5AB1630E4
	for <lists+linux-mips@lfdr.de>; Mon, 23 Dec 2024 10:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8DF19066B;
	Mon, 23 Dec 2024 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="meqrg3L9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4847C2AF1D;
	Mon, 23 Dec 2024 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734948510; cv=none; b=bzlFzbjLKkZ1x0FTxZ8eTfRSvA8r8AzMEO92FwELUMhVXgEhrMS4j0hn/EY4odb3jUSd5R1zPEl4pklXxHDdsJZKq/UHpy1lyv3rhuBRTO8X98eGAHkNKecEcS2Rehd9A0Baj2uySLH+YEtBwibefyoaIgufD3Y8ezvHmQs/QjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734948510; c=relaxed/simple;
	bh=w9k/XAILwSjvY+mzO+vcyPTCSKT8DFqBEj4aMr/XdmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ru/21jkIIwq3haoqu/nifqgn8QPKl9R3Y9QX0E++QjlVkgRF+ZADUqnPzMVynDrXvQVzfasZMutuqjSDelj5h3dbG2SPCLBB23Q+uFjCnuBvjuw5rRMhrC24ZJzmYeyG+drxrcZEEbLkNemAFHV5VG0/U7nL9iEI7WimLyC4TSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=meqrg3L9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8E0C4CED4;
	Mon, 23 Dec 2024 10:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734948510;
	bh=w9k/XAILwSjvY+mzO+vcyPTCSKT8DFqBEj4aMr/XdmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=meqrg3L9/7owPhFiT2QP3uLxZzOpzo9x67rAzqV30Gapwi6SaWp5KQcG+hiN68G4B
	 ReyB0ESJRTFwrJ5QFt6AXT7RUhy4KVwDan/9sSUukp8ga+pdkqeUaZ8WWiKzEnJDUN
	 rhRGVhqAnVEUEv5VWaj7G3shDJPOhXF7Htp7wJFMufogY+16dibPb+A3ZfUfwZ60I5
	 BcEyy6C3jTUfc31enYym01LoiHRIAtqQikgmRVhdm1he3qt961Ng2vfqVUNujI/jMH
	 sSOKLcgnTwO9YCc0r2rB88+n1cftosGPozz2IeIj2qbCLIDk3lBfnXsCXt2kOGOdxg
	 jPcB8/SJ6bQKA==
Date: Mon, 23 Dec 2024 10:08:23 +0000
From: Lee Jones <lee@kernel.org>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "robh@kernel.org" <robh@kernel.org>,
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
Subject: Re: (subset) [PATCH v2 2/4] dt-bindings: mfd: Add MDIO interface to
 rtl9301-switch
Message-ID: <20241223100823.GA7933@google.com>
References: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz>
 <20241216031346.2626805-3-chris.packham@alliedtelesis.co.nz>
 <173444803631.1901572.15614847167551978147.b4-ty@kernel.org>
 <5f863db8-1c9b-4bed-ab14-f5aafbcc9378@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f863db8-1c9b-4bed-ab14-f5aafbcc9378@alliedtelesis.co.nz>

On Thu, 19 Dec 2024, Chris Packham wrote:

> Hi Lee,
> 
> On 18/12/2024 04:07, Lee Jones wrote:
> > On Mon, 16 Dec 2024 16:13:44 +1300, Chris Packham wrote:
> >> The MDIO controller is part of the switch on the RTL9300 family of
> >> devices. Add a $ref to the mfd binding for these devices.
> >>
> >>
> > Applied, thanks!
> >
> > [2/4] dt-bindings: mfd: Add MDIO interface to rtl9301-switch
> >        commit: 1061081cbe930f97ad54e820ad1996f55d93c57f
> >
> > --
> > Lee Jones [李琼斯]
> Is it too late to drop this out? I think I'm probably going to change 
> the MDIO binding a little which may change how it fits into the overall 
> switch mfd.

Unapplied, thanks.

-- 
Lee Jones [李琼斯]


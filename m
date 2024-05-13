Return-Path: <linux-mips+bounces-3256-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 101378C432D
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 16:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71F0BB23068
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 14:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C42153BC5;
	Mon, 13 May 2024 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Auyuy2WF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F89A153836;
	Mon, 13 May 2024 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715610131; cv=none; b=Dt4DZAeUtGy8GWbnlpX9mc6eYOkMPBDUSbRfzvV2tmQrIdCeZp8vwa235kZqiSadXE06GmmpeLvej8WTLz+fDdh36zODRrLfbeVMiSV4XNrnqXos4mbGSrlRzSONG0Li4oC9hrgSJSwtb7DfWdGmYe/MzEosJUOf3TwizOw6uPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715610131; c=relaxed/simple;
	bh=6jdNF2KpN0y0ePpZt+sgmETT40KcoCWQYb9Tf8hveWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9V1gFhU0UBz7OcCcyFYtaXf+IWZSzOfodxBgCtZHAbu2DbbBzk0AtzfEEY/M/FfD5DbbZZgc3/U0k36+fNRsS4j2dHsO35rGeaXvMrSiiymlVRDVkh6bcvIdQP6wtJJ1pKQ7bf5UEBbPkZwymvkcGKSEFeBjjPr9kNrFnN6ILY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Auyuy2WF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1C5C4AF16;
	Mon, 13 May 2024 14:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715610131;
	bh=6jdNF2KpN0y0ePpZt+sgmETT40KcoCWQYb9Tf8hveWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Auyuy2WFi3EvkpyyeBBkVzzM0qGGMpmnOT4RzFqbkn5d1/p9eLmiXhD4Q8KeL2tdv
	 Ot/RuaeYXiovbg3aiyuKpfq6Cc0ZWJbRFjjLZD+KMX3sS/aNYXun7yJzutTsLHifJv
	 eFJnJGmgMD41qJWhvFK1SvqxeBNcpTwyjCdDogcU2aQnALYsOD3wypVpoe0jEUQVjC
	 xyxw5ih243707XQd/vXL5QmrqUeoOCAVp5w8cWPfLrVNnh6pLyL5ujwtemW2etmtis
	 HACnJvKqydaqxxQQn0WR5xqn+Xebiga/fzpwvGt3TE9MyDDMK+phYRqSqVV4b05P34
	 gmSw9UEwS99kg==
Date: Mon, 13 May 2024 09:22:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>,
	Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v5 2/4] dt-bindings: mips: brcm: Document
 brcm,bmips-cbr-reg property
Message-ID: <171561011347.2545021.3034844776042580743.robh@kernel.org>
References: <20240511130349.23409-1-ansuelsmth@gmail.com>
 <20240511130349.23409-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240511130349.23409-3-ansuelsmth@gmail.com>


On Sat, 11 May 2024 15:03:46 +0200, Christian Marangi wrote:
> Document brcm,bmips-cbr-reg property.
> 
> Some SoC suffer from a BUG where CBR(Core Base Register)
> address might be badly or never initialized by the Bootloader
> or reading it from co-processor registers, if the system boots
> from secondary CPU, results in invalid address.
> 
> The CBR address is always the same on the SoC.
> 
> Usage of this property is to give an address also in these broken
> configuration/bootloader.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/mips/brcm/soc.yaml    | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



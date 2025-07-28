Return-Path: <linux-mips+bounces-9929-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C253B13608
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jul 2025 10:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD54E178A4B
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jul 2025 08:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB09F225784;
	Mon, 28 Jul 2025 08:05:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F406221FB1;
	Mon, 28 Jul 2025 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753689944; cv=none; b=Yn5em0cOLittQQWcpWVPUl7O35WcBC2RB1RdvRI5BIIRBCIiDYlAyOB6lf8L77+VEDbmtSYODDqAO7DsKgYJy/Q02WfzpwY9lZX3k9EqnR23RDsfiQ+Uov0zXNdIOZo37W6ha7owDTSUW5qFZgCB/f2dvv+TguBeNndBh4biQYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753689944; c=relaxed/simple;
	bh=umY4FbrJZ63pZ+s7MGbqHnu0d0Jm/XjP55voYolmCt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGyR1g/dG9DXKC+XgM1rz9d1fKWqGKdFMN1AwjwZYiGLqmAIizJNYes1cFqvbs10dKSNr1EvSFAmVazVYSfsQqW2++UPxQAV4JETf8lcom/RnfqposcN52r/W4Fv4QLZq/dhcKpA6QOMN7vBELoFUuZXBYRBr3RTKv6y7Pydw6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1ugIrY-0003qR-00; Mon, 28 Jul 2025 10:05:36 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7B684C035D; Mon, 28 Jul 2025 10:01:07 +0200 (CEST)
Date: Mon, 28 Jul 2025 10:01:07 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/2] MIPS: mobileye: dts: rename the emmc controller
Message-ID: <aIcuQ-Qr2OJbB0YO@alpha.franken.de>
References: <20250722-mmc_dts_warnings-v1-0-8a8a1594dfd2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250722-mmc_dts_warnings-v1-0-8a8a1594dfd2@bootlin.com>

On Tue, Jul 22, 2025 at 05:15:19PM +0200, Benoît Monin wrote:
> I somehow missed running dtbs_check with W=1 but the kernel test robot
> did...
> 
> This patchset change the name of the SDHCI controller to match the
> expected pattern from the mmc-controller binding in the eyeQ5 and eyeQ6H
> device trees.
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
> Benoît Monin (2):
>       MIPS: mobileye: dts: eyeq5: rename the emmc controller
>       MIPS: mobileye: dts: eyeq6h: rename the emmc controller
> 
>  arch/mips/boot/dts/mobileye/eyeq5.dtsi  | 2 +-
>  arch/mips/boot/dts/mobileye/eyeq6h.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> ---
> base-commit: 05adbee3ad528100ab0285c15c91100e19e10138
> change-id: 20250722-mmc_dts_warnings-ae5c40a23a85
> 
> Best regards,
> -- 
> Benoît Monin, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

applied to mips-next with both patches squashed into one

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]


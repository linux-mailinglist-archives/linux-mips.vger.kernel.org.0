Return-Path: <linux-mips+bounces-7897-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D96A3FD43
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 18:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82D02424F74
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 17:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F41D24FC0D;
	Fri, 21 Feb 2025 17:19:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C512424FBE8;
	Fri, 21 Feb 2025 17:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740158389; cv=none; b=P1FEvQw/6hUcyyz2uFfInzUV+vjt3/jaXKo8IJnXZs5QxLggiJZ+qveigJEOHAJqr1qxH6FZde6oLDDgJa8MZ3wFlocccqmjO0Ac0rIT/2RXMETqNQZ41J6m7c1iq8VPwARbp0Xuwk6D4gkdB9sXOlFYgCest+h4PHzo0oLfAOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740158389; c=relaxed/simple;
	bh=sPJHQfpUupiT6nv3HxYQj2vh/Kzsci4cr5S3NYoTg+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SowsPYnV8xVC1PhWJcdzxDiEDS2nYTpmrj5SUE/p4grlugnbmFEdG0Bch/bBAtfGQkCCdQK4cNKe4kcsW6x99MnSyxRDDUGXvrYPmjhCsxOinz5MCRmspKQzJ2LQYYPPY9zaMO3btG7tRVVaTPqbAd+Mdo28tXZKjtgYvX0GnIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tlWgj-00028K-00; Fri, 21 Feb 2025 18:19:45 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 17851C03B4; Fri, 21 Feb 2025 18:18:57 +0100 (CET)
Date: Fri, 21 Feb 2025 18:18:57 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] mips: dts: ralink: update system controller nodes
 and its consumers
Message-ID: <Z7i1gV3tlcR22u-W@alpha.franken.de>
References: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120092146.471951-1-sergio.paracuellos@gmail.com>

On Mon, Jan 20, 2025 at 10:21:40AM +0100, Sergio Paracuellos wrote:
> Hi all!
> 
> Ralinks SoCs have a system controller node which serves as clock and reset
> providers for the rest of the world. This patch series introduces clock
> definitions for these SoCs. The clocks are registered in the driver using
> a bunch of arrays in specific order so these definitions represent the assigned
> identifier that is used when this happens so client nodes can easily use it
> to specify the clock which they consume without the need of checking driver code.
> 
> DTS files which are currently on tree are not matching system controller
> bindings. So all of them are updated to properly match them.
> 
> I'd like this series to go through kernel mips git tree if possible.
> 
> Thanks in advance for your time.
> 
> Changes in v3:
> - Address Krzysztof comments in v2 (Thanks!):
>   + Drop reset include file since what it was defined there were hardware
>     constants and no binding related indexes at all.
>   + Update patches for not referring to this reset removed file.
> 
> Changes in v2:
> - Redo commit messages in all the patches in the series to clarify why the changes
>   are needed asked by Krzysztof in v1.
>   
> v2 of this series:
> - https://lore.kernel.org/linux-clk/20250119154447.462857-1-sergio.paracuellos@gmail.com/T/#t 
> 
> v1 of this series:
> - https://lore.kernel.org/linux-clk/20250115153019.407646-1-sergio.paracuellos@gmail.com/T/#t
> 
> Best regards,
>     Sergio Paracuellos
> 
> Sergio Paracuellos (6):
>   dt-bindings: clock: add clock definitions for Ralink SoCs
>   mips: dts: ralink: rt2880: update system controller node and its
>     consumers
>   mips: dts: ralink: rt3050: update system controller node and its
>     consumers
>   mips: dts: ralink: rt3883: update system controller node and its
>     consumers
>   mips: dts: ralink: mt7620a: update system controller node and its
>     consumers
>   mips: dts: ralink: mt7628a: update system controller node and its
>     consumers
> 
>  .../bindings/clock/mediatek,mtmips-sysc.yaml  |  11 +-
>  arch/mips/boot/dts/ralink/mt7620a.dtsi        |  10 +-
>  arch/mips/boot/dts/ralink/mt7628a.dtsi        |  38 +++--
>  arch/mips/boot/dts/ralink/rt2880.dtsi         |  10 +-
>  arch/mips/boot/dts/ralink/rt3050.dtsi         |  10 +-
>  arch/mips/boot/dts/ralink/rt3883.dtsi         |  10 +-
>  .../dt-bindings/clock/mediatek,mtmips-sysc.h  | 130 ++++++++++++++++++
>  7 files changed, 196 insertions(+), 23 deletions(-)
>  create mode 100644 include/dt-bindings/clock/mediatek,mtmips-sysc.h

applied patches 1-5 to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]


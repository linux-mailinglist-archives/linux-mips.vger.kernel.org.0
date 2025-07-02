Return-Path: <linux-mips+bounces-9610-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A65BAF5894
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 15:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BE8F4E0BF5
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 13:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D95827702D;
	Wed,  2 Jul 2025 13:19:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D2F28541A;
	Wed,  2 Jul 2025 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462366; cv=none; b=TEI2splvfWZYBhZoE2VWl72BNQtzPSWYIaqORooy7q+lkjtbgGKmS7mSy91IniIJQPM4r1w1QHjyQWBBaU+f9KygL2WPcHaczN2q7NLkHARZwWcl5d8WRtJ85RzUcG5vbeBbNNktnANgx4x1KCa6KCtn378BiPi2TUauc8nP/4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462366; c=relaxed/simple;
	bh=za+ahsJl3QAV648TPMaYsd1GcjFiLAeapw44Eq/9I2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSo9/iY/ZGuIgIjxaHszm2jVAgNulmO7TozJ5QlAvi4Stoe3FeAEVAkham/iCAjvyVvhit9obZZ2GpnokLBWLDqN9pPGEcbmFQMJvntfa3baRf0KQicJx7EfH3TuOPkfTkoiq/PgQSozX9c3LZZAKwBb4LlFwT2+KD1ubgJYna8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uWwab-00058I-00; Wed, 02 Jul 2025 14:29:25 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D3D63C0B44; Wed,  2 Jul 2025 14:03:02 +0200 (CEST)
Date: Wed, 2 Jul 2025 14:03:02 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Ezra Buehler <ezra@easyb.ch>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Reto Schneider <reto.schneider@husqvarnagroup.com>,
	Rob Herring <robh@kernel.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Subject: Re: [PATCH v4 0/4] MIPS: dts: ralink: mt7628a: Tweak for GARDENA
 smart Gateway
Message-ID: <aGUf9sLDQgJHGy3M@alpha.franken.de>
References: <20250624115810.37851-1-ezra@easyb.ch>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624115810.37851-1-ezra@easyb.ch>

On Tue, Jun 24, 2025 at 01:58:06PM +0200, Ezra Buehler wrote:
> From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> 
> Various devicetree changes needed for the MT7688-based GARDENA smart
> Gateway.
> 
> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> ---
> Changes in v4:
> - Re-add ralink,mt7688-sysc to enum in mediatek,mtmips-sysc DT binding
> - Link to v3: https://lore.kernel.org/20250619203502.1293695-1-ezra@easyb.ch
> 
> Changes in v3:
> - Remove duplicate entries in mediatek,mtmips-sysc DT binding
> - Link to v2: https://lore.kernel.org/20250617103058.1125836-1-ezra@easyb.ch
> 
> Changes in v2:
> - Add patch for mediatek,mtmips-sysc DT binding
> - Add Reviewed-by tags
> - Link to v1: https://lore.kernel.org/20250611194716.302126-1-ezra@easyb.ch
> 
> Ezra Buehler (4):
>   dt-bindings: clock: mediatek,mtmips-sysc: Adapt compatible for MT7688
>     boards
>   MIPS: dts: ralink: mt7628a: Fix sysc's compatible property for MT7688
>   MIPS: dts: ralink: mt7628a: Update watchdog node according to bindings
>   MIPS: dts: ralink: gardena_smart_gateway_mt7688: Fix power LED
> 
>  .../bindings/clock/mediatek,mtmips-sysc.yaml  | 28 +++++++++++--------
>  .../ralink/gardena_smart_gateway_mt7688.dts   |  2 +-
>  arch/mips/boot/dts/ralink/mt7628a.dtsi        | 11 ++------
>  3 files changed, 20 insertions(+), 21 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]


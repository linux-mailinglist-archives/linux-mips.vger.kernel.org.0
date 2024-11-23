Return-Path: <linux-mips+bounces-6788-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 872159D68B0
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2024 12:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 175AE1613D4
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2024 11:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1629418A6B5;
	Sat, 23 Nov 2024 11:04:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3627417A597;
	Sat, 23 Nov 2024 11:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732359889; cv=none; b=T+eFZFLSAbyDYohlZrhRSMclurcTis2DuQDtS03MuoleAgfSMly3u0unGIqKG5ZAmJMuaiu4Txp/VtM18wOMoxbdGfXIVBNr51Lg97rlzqWQxvAvjtr85of/4Ys/nXXybseERHGppNQZOiUtdaxvLA0tCJDzo39S46q6xJQaCls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732359889; c=relaxed/simple;
	bh=r9TUH17IaqiaL45Bk2Wppfnh6MBLRfLGtZRFjibldSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eE2DNg7Y5OMCEgCpd8147VezXyP94furR0i2RHiN3nMhHG7588e770htnNdPNepvE1YmTdraaD3WJ8+sPo403SSvEo8uZ9yFY2c0RXfZx//q16ShDoAbL9lO0DigjB2tKuS5uyTh30NPcrXVFs2EKo4sO3hLtKZfexYNlAkLpds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tEnw5-0005um-00; Sat, 23 Nov 2024 12:04:21 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id DEAE8C013D; Sat, 23 Nov 2024 12:02:28 +0100 (CET)
Date: Sat, 23 Nov 2024 12:02:28 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: DTS: Really fix PCIe port nodes for
 ls7a
Message-ID: <Z0G2RBj2k+ZKU+ld@alpha.franken.de>
References: <20241123035737.24722-1-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241123035737.24722-1-xry111@xry111.site>

On Sat, Nov 23, 2024 at 11:57:37AM +0800, Xi Ruoyao wrote:
> Fix the dtc warnings:
> 
>     arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but node is not an interrupt provider
>     arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but node is not an interrupt provider
>     arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
> 
> And a runtime warning introduced in commit 045b14ca5c36 ("of: WARN on
> deprecated #address-cells/#size-cells handling"):
> 
>     WARNING: CPU: 0 PID: 1 at drivers/of/base.c:106 of_bus_n_addr_cells+0x9c/0xe0
>     Missing '#address-cells' in /bus@10000000/pci@1a000000/pci_bridge@9,0
> 
> The fix is similar to commit d89a415ff8d5 ("MIPS: Loongson64: DTS: Fix PCIe
> port nodes for ls7a"), which has fixed the issue for ls2k (despite its
> subject mentions ls7a).
> 
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 73 +++++++++++++++++++----
>  1 file changed, 60 insertions(+), 13 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]


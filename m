Return-Path: <linux-mips+bounces-10814-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8D6B3B8D2
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D9911C85328
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAA030DD0B;
	Fri, 29 Aug 2025 10:31:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F109F3093D2;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463485; cv=none; b=SI1BDyP5qSVNbVMSJG5C+ZmP8qG/vSdnGCv2lZ5s41neQ6rqPFtmx+vrwW7ddMlkcWZH1zRxoJpoILPsnGDUOy877n7I5QfW+T1f546qjTBkSpBe4Z2Gx0JAnsCx3JWRqboh1PKDXZ4ROejLmz3QQfR0CVNKYfyhtWHPSTgLlfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463485; c=relaxed/simple;
	bh=AjdTDBcwrGCgvUUyhpHQpskpGjSyj7OjU2jGrYsNAFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tc16K1ASO1DKBkRzzzmUSBq5Vvd4RB8NCr5w8/D9UgSEJ3B8UU8K2aizQyjMtKu8aeKwLlrVbJ//M+bHCA6UbVUpdnWyPRA3Qm2iy9q6ir58CY1slBCiVPrWfzFVY1iL5mfz/cJq+sphXO/gjtrvDApV4X7jbWKaX4bUH9ntdbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO2-0004Fh-00; Fri, 29 Aug 2025 12:31:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 4547FC09AF; Fri, 29 Aug 2025 12:23:40 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:23:40 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: lantiq: danube: add missing device_type in pci node
Message-ID: <aLF_rGqmA0VMEiyx@alpha.franken.de>
References: <20250811133417.840660-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811133417.840660-1-olek2@wp.pl>

On Mon, Aug 11, 2025 at 03:34:13PM +0200, Aleksander Jan Bajkowski wrote:
> This fixes the following warning:
> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: pci@e105400 (lantiq,pci-xway): 'device_type' is a required property
> 	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  arch/mips/boot/dts/lantiq/danube.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/lantiq/danube.dtsi b/arch/mips/boot/dts/lantiq/danube.dtsi
> index 7a7ba66aa534..9cba16dd5dae 100644
> --- a/arch/mips/boot/dts/lantiq/danube.dtsi
> +++ b/arch/mips/boot/dts/lantiq/danube.dtsi
> @@ -100,6 +100,8 @@ pci0: pci@e105400 {
>  				  0x1000000 0 0x00000000 0xae00000 0 0x200000>; /* io space */
>  			reg = <0x7000000 0x8000		/* config space */
>  				0xe105400 0x400>;	/* pci bridge */
> +
> +			device_type = "pci";
>  		};
>  	};
>  };
> -- 
> 2.47.2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]


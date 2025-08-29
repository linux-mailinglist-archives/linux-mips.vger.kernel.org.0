Return-Path: <linux-mips+bounces-10810-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD58B3B8CA
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2936E7B00AD
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420E230C365;
	Fri, 29 Aug 2025 10:31:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC163093C8;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463485; cv=none; b=O7WuP3n84wr5sr1ZcUxWCBFJyjUBBn3C5FNBxKvbuN/WVaE4XDt6tPAavdmaOb7Aev2cciE25DSxfR8RMWGvEwl83RDOnBD/a2JH0RO26oIwzWbxWixnrg3b15bgKWVhUN6J6rnhthazt8QV+N5pCVveVaR1aoFZGgzgd1wvE04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463485; c=relaxed/simple;
	bh=mKeCRhe0f/6G6Jn+o+AOJ6n+rr3wYmeAywchh2F85bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDpjY4mafXSO9G+nuEMwOd+aXwFhNcHgs2svv5na6FuqmWPpV2DjTAzH0rvHbGl9wnOx9dvtnPaDozQZiLgwvDdnpt5IkZJpX8bQC5SXQw60fGhOCSSqVfDoHqCMOX0De/U7OEhC602WJpgKMlUvU9BiQY4xdUFDNcWU38r5r3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO1-0004FW-00; Fri, 29 Aug 2025 12:31:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A2DC3C0905; Fri, 29 Aug 2025 12:22:57 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:22:57 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mips: cpu: Add MIPS 34Kc Core
Message-ID: <aLF_ga6E0joS89W6@alpha.franken.de>
References: <20250811092048.497087-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811092048.497087-1-olek2@wp.pl>

On Mon, Aug 11, 2025 at 11:20:36AM +0200, Aleksander Jan Bajkowski wrote:
> Document MIPS 34Kc device tree bindings. It is used in the Realtek
> RTL930x SoC.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  Documentation/devicetree/bindings/mips/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Documentation/devicetree/bindings/mips/cpus.yaml
> index 471373ad0cfb..d3677f53f142 100644
> --- a/Documentation/devicetree/bindings/mips/cpus.yaml
> +++ b/Documentation/devicetree/bindings/mips/cpus.yaml
> @@ -33,6 +33,7 @@ properties:
>        - mips,mips1004Kc
>        - mips,mips24KEc
>        - mips,mips24Kc
> +      - mips,mips34Kc
>        - mips,mips4KEc
>        - mips,mips4Kc
>        - mips,mips74Kc
> -- 
> 2.47.2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]


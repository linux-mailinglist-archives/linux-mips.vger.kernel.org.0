Return-Path: <linux-mips+bounces-10816-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 398D1B3B8D8
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 12:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DBDA56178C
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 10:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDA230E0FA;
	Fri, 29 Aug 2025 10:31:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0845D309DB1;
	Fri, 29 Aug 2025 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463486; cv=none; b=kNqrlW512dS2jRIGJd6ZDQ1fbqTI3edjzu7xxP2TELxnDS1k32OaAsxePRsTM82tK2UT8gl8XUrfx9sWoNXNhsXPicGGnyI2nccOLNlmI/QFF5JBbokHcO7COO/K4uAws96/2sTiRxlR92YoZrhSO173U1YV9oGSH9YE7x+lplg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463486; c=relaxed/simple;
	bh=UD6rHchI8RIPt2L32FB7OhcnFnZFxyijGVTuxA6DLB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=so8kAHh7N4I+7ZGf9FZjyO+75W+OhbcpYN2eWCjhnGoZKoVWltu8yybApm/mQUwLLcWrCQKPlm+wYHsSh4tRPuyqY2tp2ZCTB5u2nB3gtyAeJAXXE12Wj3qtKu4bDCueThvvmE+5q/8kXOz+XQYh0bUzGpKzNGNNRdIPXuTB5JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1urwO2-0004Fj-00; Fri, 29 Aug 2025 12:31:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id C0136C0AC9; Fri, 29 Aug 2025 12:23:56 +0200 (CEST)
Date: Fri, 29 Aug 2025 12:23:56 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: lantiq: danube: rename stp node on EASY50712
 reference board
Message-ID: <aLF_vFz7iB2turcr@alpha.franken.de>
References: <20250812101700.970879-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812101700.970879-1-olek2@wp.pl>

On Tue, Aug 12, 2025 at 12:16:57PM +0200, Aleksander Jan Bajkowski wrote:
> This fixes the following warning:
> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: stp@e100bb0 (lantiq,gpio-stp-xway): $nodename:0: 'stp@e100bb0' does not match '^gpio@[0-9a-f]+$'
> 	from schema $id: http://devicetree.org/schemas/gpio/gpio-stp-xway.yaml#
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  arch/mips/boot/dts/lantiq/danube_easy50712.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/dts/lantiq/danube_easy50712.dts b/arch/mips/boot/dts/lantiq/danube_easy50712.dts
> index 1ce20b7d05cb..aa7256ddd529 100644
> --- a/arch/mips/boot/dts/lantiq/danube_easy50712.dts
> +++ b/arch/mips/boot/dts/lantiq/danube_easy50712.dts
> @@ -91,7 +91,7 @@ etop@e180000 {
>  			mac-address = [ 00 11 22 33 44 55 ];
>  		};
>  
> -		stp0: stp@e100bb0 {
> +		stp0: gpio@e100bb0 {
>  			#gpio-cells = <2>;
>  			compatible = "lantiq,gpio-stp-xway";
>  			gpio-controller;
> -- 
> 2.47.2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]


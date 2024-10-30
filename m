Return-Path: <linux-mips+bounces-6556-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC739B6147
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 12:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B7A7B2275F
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 11:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46FE1E5000;
	Wed, 30 Oct 2024 11:19:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722661D278D;
	Wed, 30 Oct 2024 11:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287193; cv=none; b=uKxNr5LiKsjMB6aEcrwGcfWMdG30JPQVjKWMIL32tBxQj9UXs9B0fbC10LYPf8HkbCI28MUBybWnw2MRFIEAk8+ugNJzKnlZZrKnS9/BxL0idyxV9hY1NA6ydtjPAq3BIA97W7DUkxK/UHWrL906SOuoAk6rVDz9nZfr+kU9fE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287193; c=relaxed/simple;
	bh=Fbna4bP1cIwTssj9l7iPreZI3D9cBCqVMkc+E9TuU2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RH75EflO+wTh2peH1I4HkPedDZIuOKTtsiep1xYg+bPKB24wVvAi/5Wi1qWKny1jo3N31C2V20FO19pD3cqb4G3UxHRpy2cgm5dAmSC/6WszK+E0v9OM9PeP300i9y7a7i22HKyBFYL5yDYqHh1z6cdrceUvU9QKbuai++VQ7Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1t66jk-00061b-00; Wed, 30 Oct 2024 12:19:40 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 71C81C06A6; Wed, 30 Oct 2024 12:17:31 +0100 (CET)
Date: Wed, 30 Oct 2024 12:17:31 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] MIPS: mobileye: eyeq6h-epm6: Use eyeq6h in the board
 device tree
Message-ID: <ZyIVyw2SZ/dKRZsj@alpha.franken.de>
References: <20241008-eyq6h-dt-v1-1-b8a4df1e6a6c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008-eyq6h-dt-v1-1-b8a4df1e6a6c@bootlin.com>

On Tue, Oct 08, 2024 at 11:18:47AM +0200, Gregory CLEMENT wrote:
> There is currently no eyeq6 compatible string defined in the binding
> documentation. Only eyeq6h version is defined, so let's use it.
> 
> Note that there are actually no codes relying on eyeq6h; the purpose
> of this patch is mainly to be coherent with the documentation.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts b/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
> index ebc0d363fbf82..59a3e95050eb9 100644
> --- a/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
> +++ b/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
> @@ -8,7 +8,7 @@
>  #include "eyeq6h.dtsi"
>  
>  / {
> -	compatible = "mobileye,eyeq6-epm6", "mobileye,eyeq6";
> +	compatible = "mobileye,eyeq6h-epm6", "mobileye,eyeq6h";
>  	model = "Mobile EyeQ6H MP6 Evaluation board";
>  
>  	chosen {
> 
> ---
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> change-id: 20241008-eyq6h-dt-2c4ae1ec1157

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]


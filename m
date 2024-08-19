Return-Path: <linux-mips+bounces-4950-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C38D395696D
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 13:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 781691F2286B
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2024 11:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7022C166F11;
	Mon, 19 Aug 2024 11:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9+Rccfe"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA851607A4;
	Mon, 19 Aug 2024 11:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724067398; cv=none; b=R5Lxq8vMVc9Xu2JRihYjVgqfNaUvBxKsLSKp2wPh8tCx+Lvu2IqPoaFGZgSz+BWpyEowXH4nowxKSkQHlX7hkHhtCHp3DLpppzOIl+hdxem/qj0gavvwXcbh5nE8p0e07Xxdb6rYMo9UceeyxdLAq0y3KhNtlNeSZovnhPlvHDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724067398; c=relaxed/simple;
	bh=nh8Z1vzVZlI6E1oIQz7WWu2CltCui8IJxxLoORpEgOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvrcC9xz6+qaoeh4bzzV99z/iYKj+QIuFo7ucDf8Wo9whDRZoDNaHgF9QNbbl+JZiFUelQon2iuixzTusXJsyXwoDW9HtLMYv1p34FPVWvWtFtmUIRAcMLIj7Y3iG5INbwNuqxhTAyd3zD50t+ZBFt4w2OLN/wEGaKTqSflO7+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9+Rccfe; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52f0277daa5so5396013e87.0;
        Mon, 19 Aug 2024 04:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724067395; x=1724672195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=78zmWX1R2MuUu3oiZjb6yXmGNi5evk9tkG6fthqDCQk=;
        b=l9+Rccfe89R96NwGARk+6hNtXPrjhVj18YFIqYnu8wE52R9rx0IzVyN8n8qyEet2Hs
         TIdzbzXCyKlX+3/m4XXTiWcwktZBYqVnwVSNP5ikIPPsUNdXOB3H5SkBJWMlh6BaWDgq
         TmMdGDQllgcFsju+xO+Xu2TFQnXDNCpuijBXs39x8IWh4bu8j32B7MIetrEQDPD0+o11
         Nt3Yn2gcorllIqdAXIsUgt0pcnwuuVz/XRwdb+xd8LPcrxuN0crUbb7J2PuKURSkBJGc
         UZ7u/53amzZurbNPP7Zbt4+1uYgGuSZP8yuksgVJH35N2HlQ/n48EMFF0fwgshnCKSzc
         Dmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724067395; x=1724672195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78zmWX1R2MuUu3oiZjb6yXmGNi5evk9tkG6fthqDCQk=;
        b=Wmgpc8QQhKPRah01hrJorKLrQTGEikl4PBr/o4wgtvnkXU62S+NmwAfYInMEBg7vew
         veiRxX6tbBXhjv4SLFtpxuJa4oxEI0vYYllaZuwlMk07MUd6b7fuEXYTbrV/PMyqRv+N
         cbGBBNGpc7oxdNS2lEAFKZPfDOrHJTzxL0IeKGidmykw9oXd3eNAHcmuTnM6BJyToCgo
         onValorlvO5a5DKaSRHNaH0dDppWTzjvYtpHdw+433/jeNa869d2+f9ugcyss/Xnbnj8
         lr/V/zPhjMf8TrURyRz0lKZvvnmjcf41KotPhSVFNLidGN4O3Eu7ZmiPWhvuzDMPknQy
         N22Q==
X-Forwarded-Encrypted: i=1; AJvYcCUD6BM6cTJytl6yjVWy9m6tFiTVo5UGzOoXY2oU2xotqcbdhmlboSlUOM0skAlu9DaEHglFsyeqGazj@vger.kernel.org, AJvYcCVNkigaAGYIu1zeRvHK4Gc2yV8wfcS/ywndc4YfCEPe2s2rgtrsd5zdlFWXdDnp9L5UkFKL15GPG5Oe1w==@vger.kernel.org, AJvYcCVxHVV09OacCLqlcitusW4foZXsc2xxs5Movq0AHLfUyUJVIGNwzsfPQWCGbg5UjlFhFgfoZh/Nv4n+@vger.kernel.org, AJvYcCWALp9EeaIPCIoPRmCWd7uSgXBSqiTlgrQb3CTksoQ0GZygFM31mLDLeIZIP1U7ysoRpe9mhG5OcpCyUNrF@vger.kernel.org, AJvYcCXPkvjVM5pjipm833DI/+AIYR5PR9H3EHrXSw3/DJs1DEtRSrPSieXE3wJs2Vi7XflGtVNTrEdTkjWpoz1Evq8tdPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOucpzm1REeqOlUKnr96lop/Gg3i6OVgZEzsc/St00EAbg29hb
	ep72ujhrCC3UtTFislvWZq1J6WgCIli32GT6SNRua3bbnTA7VdsE
X-Google-Smtp-Source: AGHT+IGke4g9LG82CUNKo1MIdeBQBLiC7DEdwsR4e5fBnnlRlr1KhhwfUBeUlTP2WItRZy2ABzDO0w==
X-Received: by 2002:a05:6512:1096:b0:530:daaa:271c with SMTP id 2adb3069b0e04-5331c6a1a7bmr7372071e87.16.1724067394331;
        Mon, 19 Aug 2024 04:36:34 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d3afc45sm1469525e87.44.2024.08.19.04.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 04:36:33 -0700 (PDT)
Date: Mon, 19 Aug 2024 14:36:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Magnus Damm <magnus.damm@gmail.com>, patches@opensource.cirrus.com, 
	Elaine Zhang <zhangqing@rock-chips.com>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/5] dt-bindings: clock: baikal,bt1-ccu-div: add
 top-level constraints
Message-ID: <iszw753okcfn6nximo3rovz7plbeo6yrcaoai7mb7x5blmiilw@kean47lp6ipv>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>

On Sun, Aug 18, 2024 at 07:30:10PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  .../devicetree/bindings/clock/baikal,bt1-ccu-div.yaml     | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
> index bd4cefbb1244..30252c95700c 100644
> --- a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
> +++ b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
> @@ -134,9 +134,13 @@ properties:
>    "#reset-cells":
>      const: 1
>  
> -  clocks: true
> +  clocks:
> +    minItems: 3
> +    maxItems: 4
>  
> -  clock-names: true
> +  clock-names:
> +    minItems: 3
> +    maxItems: 4
>  
>  additionalProperties: false
>  
> -- 
> 2.43.0
> 


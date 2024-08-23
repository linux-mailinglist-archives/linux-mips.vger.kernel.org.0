Return-Path: <linux-mips+bounces-5038-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B67DF95C88E
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 10:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E9AA284FFE
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 08:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E34014D431;
	Fri, 23 Aug 2024 08:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBlF2LIF"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7165714B97B;
	Fri, 23 Aug 2024 08:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403420; cv=none; b=KakJ60gGn0HNM1iuxZZcsVuPl8ajZ8fuA4ylTxubBgh1So0SFp0eKZdAwaDj0PR7CFXI+71qsKDJrqi5+OMiftUdRsJLD9ZBikYv6O4zpW9/0IWE5TeGDONqo3NlnnKHPv1i/d0NM8kqrJ/x4PCaQrlTqXA7bwNjw3SpPxwrXmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403420; c=relaxed/simple;
	bh=FPA2LbjmMda9Z3hqjlA4MPD3nfJDM3A9haziHutdelY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2pPOOMnesuPSMfiqzUmQc6fvsl3jbnUKEiyJ7YOVDdGiGD7jzIR6X00kfa15JwjOnHocHij/I13NAYF2irB+h/Kn4WgBZmK+4x3TeVw4rT3skggFziKK0Gpxkjjs2YY5/TrXncVf2fsLotiznnmdRXMA+u6k+vkX+pt53GRV3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBlF2LIF; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f3f163e379so28506101fa.3;
        Fri, 23 Aug 2024 01:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724403416; x=1725008216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=idAJLD2w37nSdicsVCk5zam2KjZOsmHcn1q6N2TszYk=;
        b=mBlF2LIFaisoGGdUyzrxxqH5XL39zUBw5VouqKxFRhhTeD458IZ+a3ZBMXYhlPY3EJ
         RkPajeC6VL4CSPUjVCbAibVZOYY92WdagLxsDAstG0eFjgftAZ/y+81YmQm3jM6c6/A6
         hvjblTz2nQvi1MVVLBv+f1o4Tfrzm2fyLmMwbZ6SbF3/DVOPrOHMyT4XMa/jOEiBVtC+
         jcegqWy6I+F48nBzWad4/cpZmjGqYKt8usV102UnLJIu+SN+9d5BDD2s0hNEuyJlyZo/
         KCb0fLb2wM5iXSJd8R472ZluBAv+M3m6pkUsolIZ8R0ghW+RLnOzDMQdBxHzzNJv2VR0
         CL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724403416; x=1725008216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idAJLD2w37nSdicsVCk5zam2KjZOsmHcn1q6N2TszYk=;
        b=oJMTW8Jj19BXTLo1MhVgqYV6KSGi73QEoJvwZ5xql25G6sDrLgdBcwdalMOH5GWbwG
         nVdWu6o3uA7r/YIYVHrlOwHcVOfyrSzlS6PdvDVMCOjEGs9IxqpAzet9ANUXq3J9GWTy
         YzBWXKnKNz8jESZvgfjPqmDU21uLSd2jmWno4NfbOj1qSm+bAg/538KlA5fUYYh97FHK
         ipUw3sQuf+CevAoTgHwXuKdn4vdYCuMyNfnMq03ppVvpRq3Vb8ODUjs1zME34/OV3iv3
         wnNJJFoGTRopinCRiiIDgffCcKPy4hckJdUPuqpfSi02Pgo7rdgb+JAAXrzobMNORn8b
         R5vQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2gRG959yimw09vrHSXTK/NbFAhC0PAC2OqqEGVleZL6+FMG3N8ViRCpW0BScF9IMdAURx5lw+fhmL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9cqIooU63ose3RK9OfGN96Ld8TBK5fxePNaKAXoee4WbiYOGy
	il9D63XpjiDNmT0CAESYCdRXXsoNo8GOffEcDwmJRV+wygdEyR8b7iwPrw==
X-Google-Smtp-Source: AGHT+IGaWz24Aozq4D7VOTOmYTh/Fv8EN/2E+HgmUJu5BKO6ATGu/LKxCVfl8yD6ZVqN95lELSS6Ow==
X-Received: by 2002:ac2:4e06:0:b0:52e:936e:a237 with SMTP id 2adb3069b0e04-53438846debmr1157338e87.16.1724403415659;
        Fri, 23 Aug 2024 01:56:55 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea29626sm504746e87.17.2024.08.23.01.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 01:56:55 -0700 (PDT)
Date: Fri, 23 Aug 2024 11:56:52 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Wu Bo <bo.wu@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Wu Bo <wubo.oduw@gmail.com>
Subject: Re: [PATCH] bus: bt1-axi: change to use devm_clk_get_enabled()
 helpers
Message-ID: <jwspy5qbmtkl32wngiv7cgypy7sox3zeqks3wkqsuqra6vx7p2@3xg2rbc3lxp5>
References: <20240823023103.1984437-1-bo.wu@vivo.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823023103.1984437-1-bo.wu@vivo.com>

Hi Wu

On Thu, Aug 22, 2024 at 08:31:03PM -0600, Wu Bo wrote:
> Make the code cleaner and avoid call clk_disable_unprepare()
> 
> Signed-off-by: Wu Bo <bo.wu@vivo.com>

Awesome! Thanks.

Acked-by: Serge Semin <fancer.lancer@gmail.com>

Could you also apply the same change to drivers/bus/bt1-apb.c ?

-Serge(y)

> ---
>  drivers/bus/bt1-axi.c | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/drivers/bus/bt1-axi.c b/drivers/bus/bt1-axi.c
> index 4007e7322cf2..b0baae49aca6 100644
> --- a/drivers/bus/bt1-axi.c
> +++ b/drivers/bus/bt1-axi.c
> @@ -146,32 +146,15 @@ static int bt1_axi_request_rst(struct bt1_axi *axi)
>  	return ret;
>  }
>  
> -static void bt1_axi_disable_clk(void *data)
> -{
> -	struct bt1_axi *axi = data;
> -
> -	clk_disable_unprepare(axi->aclk);
> -}
> -
>  static int bt1_axi_request_clk(struct bt1_axi *axi)
>  {
>  	int ret;
>  
> -	axi->aclk = devm_clk_get(axi->dev, "aclk");
> +	axi->aclk = devm_clk_get_enabled(axi->dev, "aclk");
>  	if (IS_ERR(axi->aclk))
>  		return dev_err_probe(axi->dev, PTR_ERR(axi->aclk),
>  				     "Couldn't get AXI Interconnect clock\n");
>  
> -	ret = clk_prepare_enable(axi->aclk);
> -	if (ret) {
> -		dev_err(axi->dev, "Couldn't enable the AXI clock\n");
> -		return ret;
> -	}
> -
> -	ret = devm_add_action_or_reset(axi->dev, bt1_axi_disable_clk, axi);
> -	if (ret)
> -		dev_err(axi->dev, "Can't add AXI clock disable action\n");
> -
>  	return ret;
>  }
>  
> -- 
> 2.25.1
> 


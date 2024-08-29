Return-Path: <linux-mips+bounces-5196-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A74E1963E4F
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 10:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA7E81C21C4B
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2024 08:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BBA18C030;
	Thu, 29 Aug 2024 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVP3KTBO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC7E18C02E;
	Thu, 29 Aug 2024 08:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724919919; cv=none; b=EQZAhSFjnyG2GorKCZ9pKSAN3XIJFcViQevo88d0YQDdb08tX9sO3Gw//8nPWrXfd+yRiitCShzkjnjTMxCriukW7a0XcJoSJsfMEx6bmNu+A1Hgj8oix8a3vopgRp9/+htOE7S0V51EZ5fiqEFDjxECqOI85xWjOtJUPTNWrDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724919919; c=relaxed/simple;
	bh=q2hwVwv2WDLZeQCHH6XvDHGrMGeoHPiFYDSg7dTkA7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgL/ryD3VLFiMkLkols9d2jYQdT59yr+V1y1nv2MI4E2JO77fg4NK8ZHa9xfBwYNitN8SjsVdLF2UINRP2900JIOpoR5TyhNNcPLiPwT4GFUYRikFNf0WDSdzC8orTbuyuwDmHuRblD1kzMy3RmdTykqNKeUHQjj27w2UFY8kuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVP3KTBO; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f4f2cda058so13646701fa.1;
        Thu, 29 Aug 2024 01:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724919916; x=1725524716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VrChaKqfIfM1f79nhO58osjVezYJ5nD6IL8UKuDKIKs=;
        b=fVP3KTBObOuzYC7vBbzhfhRIu6SKJWtmQLZqi7PsKqC7hxysa75mbngPl1i2hLpuPK
         k68SqUxtsVn2e98h1HGaytv+d7t0hbM8MghaNatRI02RkI9Q61/dIuLPW3HrEdl+8uG0
         jobLxjOVu/fkBuGfnnsnqwwIfjgu+6I8eF6UMKRULpuJnB2awALvC08RLTwl+BOJfiEF
         fmCwVXP2O1G8hytDNXNRc6yx8iHEjuNKfA1vLZfDvYQKH5oYclUZOieRZiU39V9AxiUN
         EmkKyrJKI9PYnFCG+AntwZjfSUPaGqV9BYXQM2xAR+W76E7VBZNzMWH4JRsIX/PdnXaz
         9I8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724919916; x=1725524716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrChaKqfIfM1f79nhO58osjVezYJ5nD6IL8UKuDKIKs=;
        b=iUC6PM9cSSQTOLPJsRSeHbaA1igIIfHBx90W+T1S+sLKy9CFAmDCoDSCTrtFLJIMKf
         WEAC+40LkxilY278bJcBL92GEfxNFKg69YP2HbvLE5QYnxRtoBKjY3XWFtUq+/WVavBW
         zniANoTOktrnSWMOlrVW3rxWCPq/nJP6lbqEcVPFX03/zVYlnyl9qDIGFrWpnW+StzCJ
         b0xxXiSDvS3z/zjUdxSnsST34E1eWSiGqaIG1MG9HICPVtAu4Y3pZZUWzRGecYBH3wNT
         pHusD4K7WJyt7SXROi0PyRGH39HmqyV+v1OFwRxtWwktrZCA/iIfi2Eit8H48yx716pG
         WgIg==
X-Forwarded-Encrypted: i=1; AJvYcCVXz+MjuQk78kWIrQvk4OYWNAk7aYZIfqsm3tFGJfyJVqVLYlS5XBPPEJ8fWnPuaH55YQqn1sLksZ4E@vger.kernel.org
X-Gm-Message-State: AOJu0Yx62sj5dMsimR3MS+XBj0ALOWbaRW/hsXcbrV5u81X/X0MVa1xi
	W3s1smGKm25wBhjfHbaB1ciBbu1PTF+t/zwOBRyjF9J3mvhpN8hQ
X-Google-Smtp-Source: AGHT+IE34NRCLqH6yNsvq1RHXsvOftB95PyncrCgSCl0jMBJPaOUp+zwMBpL4/I21CaByqnviBbw2A==
X-Received: by 2002:a05:651c:1612:b0:2f5:140:929e with SMTP id 38308e7fff4ca-2f6129ab1f6mr6146261fa.7.1724919914884;
        Thu, 29 Aug 2024 01:25:14 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm1214901fa.8.2024.08.29.01.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 01:25:14 -0700 (PDT)
Date: Thu, 29 Aug 2024 11:25:11 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Wu Bo <bo.wu@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	wubo.oduw@gmail.com
Subject: Re: [PATCH v2 2/2] bus: bt1-apb: change to use
 devm_clk_get_enabled() helper
Message-ID: <y6wsowxr6my2kslhzt3iq6cwwu2gu65cdiwwrxhbkqmpmbmdqk@vhm5t54e3cdo>
References: <98e5fe3c7762f3c2cbf7b2f3b3461c0cef789dd6.1724726725.git.bo.wu@vivo.com>
 <2059e872cc9cb129752c1656be073b1a6beb4cc5.1724726725.git.bo.wu@vivo.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2059e872cc9cb129752c1656be073b1a6beb4cc5.1724726725.git.bo.wu@vivo.com>

On Mon, Aug 26, 2024 at 08:53:58PM -0600, Wu Bo wrote:
> Use devm_clk_get_enabled() instead of devm_clk_get() to make the code
> cleaner and avoid calling clk_disable_unprepare()

Great! Thanks.
Acked-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
> Signed-off-by: Wu Bo <bo.wu@vivo.com>
> ---
>  drivers/bus/bt1-apb.c | 23 +----------------------
>  1 file changed, 1 insertion(+), 22 deletions(-)
> 
> diff --git a/drivers/bus/bt1-apb.c b/drivers/bus/bt1-apb.c
> index 595fb22b73e0..7463124b6dd9 100644
> --- a/drivers/bus/bt1-apb.c
> +++ b/drivers/bus/bt1-apb.c
> @@ -185,34 +185,13 @@ static int bt1_apb_request_rst(struct bt1_apb *apb)
>  	return ret;
>  }
>  
> -static void bt1_apb_disable_clk(void *data)
> -{
> -	struct bt1_apb *apb = data;
> -
> -	clk_disable_unprepare(apb->pclk);
> -}
> -
>  static int bt1_apb_request_clk(struct bt1_apb *apb)
>  {
> -	int ret;
> -
> -	apb->pclk = devm_clk_get(apb->dev, "pclk");
> +	apb->pclk = devm_clk_get_enabled(apb->dev, "pclk");
>  	if (IS_ERR(apb->pclk))
>  		return dev_err_probe(apb->dev, PTR_ERR(apb->pclk),
>  				     "Couldn't get APB clock descriptor\n");
>  
> -	ret = clk_prepare_enable(apb->pclk);
> -	if (ret) {
> -		dev_err(apb->dev, "Couldn't enable the APB clock\n");
> -		return ret;
> -	}
> -
> -	ret = devm_add_action_or_reset(apb->dev, bt1_apb_disable_clk, apb);
> -	if (ret) {
> -		dev_err(apb->dev, "Can't add APB EHB clocks disable action\n");
> -		return ret;
> -	}
> -
>  	apb->rate = clk_get_rate(apb->pclk);
>  	if (!apb->rate) {
>  		dev_err(apb->dev, "Invalid clock rate\n");
> -- 
> 2.25.1
> 


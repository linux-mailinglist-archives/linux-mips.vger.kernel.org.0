Return-Path: <linux-mips+bounces-4697-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5FE947AAD
	for <lists+linux-mips@lfdr.de>; Mon,  5 Aug 2024 13:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DB011F22256
	for <lists+linux-mips@lfdr.de>; Mon,  5 Aug 2024 11:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E944156F2A;
	Mon,  5 Aug 2024 11:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGVGbFgq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3AB15575D
	for <linux-mips@vger.kernel.org>; Mon,  5 Aug 2024 11:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722858927; cv=none; b=ky8Ehkb9muooAXlJF1oy7/HoF97czLsAp7zNJYuIgk11Dt0Ci0sPo21hgeu/k/xGOq3Ws5EyPOzDs3jjBGRx2IC71AnLu0AZKpzQSNduBtYt/5q57HYUTHTe97tl8OZrGTiRN951BTS/aWLUrKqkgieioX+2Y0bhaoICRqMPfJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722858927; c=relaxed/simple;
	bh=NBlOdXOH/biQ36ezF/zn2d+VM69yWNQCH492iT5+/fI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwPiDnoNSS/xmJAls03cVwngkX05f7PLFXbM66Ivpg5dg3sJA+rZKxLmMaift0rBx8562Cnw7jYCz2EVctyolvRRDdv0DeNylysA37M0BY6n2lG9CVunkLPQWzmS7+bS3nlM0JzcjAPjKON4xUUf7OZNZH1o//das7T86rxC8co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGVGbFgq; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52efc89dbedso12341836e87.3
        for <linux-mips@vger.kernel.org>; Mon, 05 Aug 2024 04:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722858923; x=1723463723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u/OdbEbQ9htqQD+JqhHkWH/SthAorUF4PW8PhhCTCvc=;
        b=IGVGbFgqarV2tmACcSCX6GDSHw4J8NUW2X6fwOmBJxHPPEHZB+BMLi/ERRXRpazeGe
         BFiSKGasp9Q0jH8JaWdUFEayTq9ePd3NlFVDy/7S3bTMe0ziangnnwSK43LLWmHtYQGX
         kScEPLk6RPVKCc3SW+/YflLRpYR17rN5tRRRhw06L+gCbBy+kmk4kgLv2x0A8IGqVtac
         WwWwVu8bD0LPAxFPxev2f/uBCmBPCqpntM/lc6FtKcUp0fb4q+EIY3aYW18uNtchqZr6
         LRF+8X14Ikmb0urhY6/A9IcFMP/sZFgF4pJ1B7lJeYOPrOxusXp+CyzhDW5BGVm0Ok5V
         OXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722858923; x=1723463723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/OdbEbQ9htqQD+JqhHkWH/SthAorUF4PW8PhhCTCvc=;
        b=cJNkL69wlK/Dpovj/yliIvjw9s7EeytaEsbHNVz4zv8CY4bgS9h1KfPcnxTiq9J/QC
         LmTXGP2ClFK3zY8el+bnx+MKTUgnrhHQMgqt1PC7jAZorfpQ4128dtS66JXKIKvvH8uz
         vqFluHGDl8xJ62li4QRlPHUM7LfBeB7coXJCMxYPlPkDd3iwRqh6xihLZr1O4fE6gOKs
         jJMlCGkoRtEcOL3VT+upJBffxgGdvqonBeVwJOSfwfIzoXLELTCml2Q+UNFR55LcJH/I
         RA0wLnCdjRIDotyHD76qIB5UO2ww97Tu+BAt/5SMkYSBN9b6TZrslAa5+F6W3rs2AeKN
         CD1Q==
X-Gm-Message-State: AOJu0YyH2Qe9Yun4tI7o9SC7yiipQCoJ13al7cawxFMsKvZWNWePaolw
	FfbIEsQ+8URjqwr5Hu3nXWPja8xygRPbByeh0EuHnEMBEWj4ANmACOgSbg==
X-Google-Smtp-Source: AGHT+IHtPb7Ah5uSLo9JHEJttAchOAITbLk/K+XTGrjxi726ppqtQq2YqPEI5zp5BMH0n68nn3vreQ==
X-Received: by 2002:ac2:4e0d:0:b0:52c:896f:930d with SMTP id 2adb3069b0e04-530bb3b18a7mr8117369e87.57.1722858922829;
        Mon, 05 Aug 2024 04:55:22 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba10f27sm1114653e87.111.2024.08.05.04.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 04:55:22 -0700 (PDT)
Date: Mon, 5 Aug 2024 14:55:19 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: linux-mips@vger.kernel.org
Subject: Re: [PATCH -next] bus: bt1-apb: Add missing clk_disable_unprepare in
 bt1_apb_request_clk
Message-ID: <eas5l7ave5oipwnebewmbky3basphjnobutvqlkn6svnkju22f@xdkpqbuisonh>
References: <20240803065231.342695-1-cuigaosheng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240803065231.342695-1-cuigaosheng1@huawei.com>

Hi Gaosheng

On Sat, Aug 03, 2024 at 02:52:31PM +0800, Gaosheng Cui wrote:
> Add the missing clk_disable_unprepare() before return in
> bt1_apb_request_clk().
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/bus/bt1-apb.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bus/bt1-apb.c b/drivers/bus/bt1-apb.c
> index 595fb22b73e0..244f03988545 100644
> --- a/drivers/bus/bt1-apb.c
> +++ b/drivers/bus/bt1-apb.c
> @@ -210,12 +210,14 @@ static int bt1_apb_request_clk(struct bt1_apb *apb)

Thanks for the patch, but it's fully redundant.

>  	ret = devm_add_action_or_reset(apb->dev, bt1_apb_disable_clk, apb);

Please see the __devm_add_action_or_reset() method semantics. It
executes the passed "action" in case if the add-action procedure
fails.

>  	if (ret) {
>  		dev_err(apb->dev, "Can't add APB EHB clocks disable action\n");
> +		clk_disable_unprepare(apb->pclk);
>  		return ret;
>  	}
>  
>  	apb->rate = clk_get_rate(apb->pclk);
>  	if (!apb->rate) {
>  		dev_err(apb->dev, "Invalid clock rate\n");
> +		clk_disable_unprepare(apb->pclk);

If the rate getting fails for some reason, then the action registered above
will be called in the framework of all the device-managed cleanups
executed for the probe() method.

So to speak there is no need in the change suggested by you here.

But what could be done is the devm_clk_get(), clk_prepare_enable() and
devm_add_action_or_reset() calls replacement with a single
devm_clk_get_enabled() invocation. That simplification will also cause
the bt1_apb_disable_clk() method removal.

A similar change can be applied to the bt1_axi_request_clk() method
in the drivers/bus/bt1-axi.c driver.

-Serge(y)

>  		return -EINVAL;
>  	}
>  
> -- 
> 2.25.1
> 


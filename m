Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1E0437A54F
	for <lists+linux-mips@lfdr.de>; Tue, 11 May 2021 12:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbhEKK6k (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 May 2021 06:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231465AbhEKK6g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 May 2021 06:58:36 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38005C06175F
        for <linux-mips@vger.kernel.org>; Tue, 11 May 2021 03:57:30 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id t6so7501609vsp.13
        for <linux-mips@vger.kernel.org>; Tue, 11 May 2021 03:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7o/ikX3x+zDUi58t05jzcL4qo+BzUZcNfm/BTBIB96w=;
        b=V/hTWex6YSV2t9lnBUj+fn2bFebn4jwj9DPXV3B6vvpNl2EFm31ncCrDVzotRumQAc
         futXSOX0oSovFZpnj6YIPojyjmtJmZBWYLUMhkLPgpesEqfqbzdN2nWkPun+QLRPmB6T
         mFL+c2ImRjnVKp+K/DA8vnL56NjXkDfvdPgjTZRQPN90uz8Bet8cIiR0Q7yF8zmK+G7M
         IbK+nM7rn0Bx2cu8R7UM0y9yqfOr07NPL7qfua09fjWp0UYsn1U+khdScCPnti5UbT8H
         7PkNb/oltTZD3RKOEAb3VVTSFxMSEVJ2gJlqjlWbOg6KczPCIhaOzbwWrtTzJVgEv8+x
         hxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7o/ikX3x+zDUi58t05jzcL4qo+BzUZcNfm/BTBIB96w=;
        b=LXAo4ofDf5E71hNtjVe+Yb+ArtWh99Y4gY4cclYmhuh5DoeGYlntj+GvNpnbKki3Ey
         nH2UYXRJgC39WObZX60GF7s984blHHoNlSl9x7Gnxj2mGKj3N5tVf0Cj90qKByJ4i5VD
         w5RXlCvWttWhw3RqtK3gtbffqGi8jOQJpaYyLN2KmRF98/ZtGlvjscMTNl2hVRy6uUi0
         cEa852GmI7iclEqflCEZhKKrYmzhi3DZch0akjncbAw2gKbAgO3JiMAKPgkfsC+Jk3OO
         C8VG+jv90XEzBGA6G1liyzVUkOvjxHj5EATehq0VOJovOQ/ZWbhcVb+rvCYyX6V1Fga3
         f6Mg==
X-Gm-Message-State: AOAM531Ce9BgzpVs+yX5C4BeeRBneFnitMSKYM/xtBbnaLBzgCBd0Oss
        VDtZ7jqP7QDhb+j3RbbeqAl2Kr5y6ERDT+mxhBK1cw==
X-Google-Smtp-Source: ABdhPJxRa+22rNW41DGohHhO1QfeEsKMuDsW1BAxDLntQzm+NjcIn4whYfjMX0lVdHeGw3dKIlwbB8P3aHC/Q3xmYtY=
X-Received: by 2002:a67:2c03:: with SMTP id s3mr24305260vss.42.1620730649508;
 Tue, 11 May 2021 03:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210511093329.4670-1-thunder.leizhen@huawei.com>
In-Reply-To: <20210511093329.4670-1-thunder.leizhen@huawei.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 11 May 2021 12:56:52 +0200
Message-ID: <CAPDyKFp8rNurj9m45-223mzfihEuVesi3boY1E6VByCiHbbD6g@mail.gmail.com>
Subject: Re: [PATCH 1/1] mmc: jz4740: Remove redundant error printing in jz4740_mmc_probe()
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 11 May 2021 at 11:33, Zhen Lei <thunder.leizhen@huawei.com> wrote:
>
> When devm_ioremap_resource() fails, a clear enough error message will be
> printed by its subfunction __devm_ioremap_resource(). The error
> information contains the device name, failure cause, and possibly resource
> information.
>
> Therefore, remove the error printing here to simplify code and reduce the
> binary size.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/jz4740_mmc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
> index b3c636edbb4610d..861ff6d9661a908 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -1013,7 +1013,6 @@ static int jz4740_mmc_probe(struct platform_device* pdev)
>         host->base = devm_ioremap_resource(&pdev->dev, host->mem_res);
>         if (IS_ERR(host->base)) {
>                 ret = PTR_ERR(host->base);
> -               dev_err(&pdev->dev, "Failed to ioremap base memory\n");
>                 goto err_free_host;
>         }
>
> --
> 2.26.0.106.g9fadedd
>
>

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0586C67D3
	for <lists+linux-mips@lfdr.de>; Thu, 23 Mar 2023 13:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbjCWMOd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Mar 2023 08:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbjCWMOE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Mar 2023 08:14:04 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D7124CA3
        for <linux-mips@vger.kernel.org>; Thu, 23 Mar 2023 05:13:47 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id i6so24503566ybu.8
        for <linux-mips@vger.kernel.org>; Thu, 23 Mar 2023 05:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679573626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=piZ+PkFV5WvYTk12pZZbvmVa0DMKTZ0dY4RGfTiFlGE=;
        b=qChmhFMYb7uAmDl3c9o+/OEyiiJWrsLk9qH+fBrZelNVKUCYekFJExMGimfH9+++64
         UyOU0iHMtTi/9NJwDGZPeLR/fJwh4KRVGFrZDfxzaLxMdZLv+vkB3aPB+azsXDcr2+AB
         XaXp0/B5GOuzWC0stmEOFztjxGZLzZjnP71BwF0LYyIJ1mgjXPGUX8QhsZlfgpsm+AU5
         UJjl1b3COQw3wyB1FqX1o5OStmXkpNaF6UnrvUbiE1RPCmg5/OSuxMDmnuZCkWSoonL4
         znpcCkjRS44hkWcqprqvV7PLqGKjJEQWMBkDhU9V8RcAHl5SXZcDhjZfTAQ931ku3L3M
         NzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679573626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piZ+PkFV5WvYTk12pZZbvmVa0DMKTZ0dY4RGfTiFlGE=;
        b=PvFXHWcCUIB6Za6A1kGV5y7ar7QZQwLYZViK2SLtcjTbxxAU9sT06HPsuT2WGH7X5I
         63EMi2/JC85CXjmYyD86ZBKOllhOFJt0tOl6Og4rhAeynmKJBUuIH1NsAW1t1hDse+uW
         3SBDxXjCBuX8gw2BA6K7JxvmmXwXKyVAPcAVAEgPP8CST/IIuO5XYSfPfdwMpBdtVKIs
         XjE4XJtlppi5Gap/svf7tDNIvgYME8w7iOPNCjuvvu/NZnA6vMKA7SqnZvuz7LZY0Cue
         Od0/p0P6a8IWihDtP1CH7nLY3A4omyZTpwK9oTdmYfbWf9W7dlQ+3ze4NegSvOv9KTOB
         DrSw==
X-Gm-Message-State: AAQBX9f5EDL8K82m1WHColVIKiEi0OfLGWvRKSm6sQB/pOkl1OLVYb0d
        wZtb08/Wv8Uh2G3XFTmyoi8EFKNKYRne0j/ZXnpgYA==
X-Google-Smtp-Source: AKy350b/FzYTw51HnTYwc0uSjq0ZvicnZs9K3NgIj/elTpYm4gPt7nbklyB5sQoODjeWSl0pEldwGAuyF3GQvkpN0ws=
X-Received: by 2002:a05:6902:1705:b0:b75:8ac3:d5d8 with SMTP id
 by5-20020a056902170500b00b758ac3d5d8mr942368ybb.3.1679573626037; Thu, 23 Mar
 2023 05:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230315053127.33855-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230315053127.33855-1-yang.lee@linux.alibaba.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 23 Mar 2023 13:13:10 +0100
Message-ID: <CAPDyKFooj9uqAJZvcG-QYDRPoMngXsBC_6cu_0=9WnB=Y1xqLA@mail.gmail.com>
Subject: Re: [PATCH -next] mmc: jz4740: Use devm_platform_get_and_ioremap_resource()
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     paul@crapouillou.net, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 15 Mar 2023 at 06:31, Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> According to commit 890cc39a8799 ("drivers: provide
> devm_platform_get_and_ioremap_resource()"), convert
> platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/jz4740_mmc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
> index 698450afa7bb..1846a05210e3 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -1079,8 +1079,7 @@ static int jz4740_mmc_probe(struct platform_device* pdev)
>                 goto err_free_host;
>         }
>
> -       host->mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       host->base = devm_ioremap_resource(&pdev->dev, host->mem_res);
> +       host->base = devm_platform_get_and_ioremap_resource(pdev, 0, &host->mem_res);
>         if (IS_ERR(host->base)) {
>                 ret = PTR_ERR(host->base);
>                 goto err_free_host;
> --
> 2.20.1.7.g153144c
>

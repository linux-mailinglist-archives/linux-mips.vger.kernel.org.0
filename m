Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90884400B9
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 18:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbhJ2Q6K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 12:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbhJ2Q6K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 12:58:10 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE8DC061570;
        Fri, 29 Oct 2021 09:55:41 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id o14so17107721wra.12;
        Fri, 29 Oct 2021 09:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W9vJPcSbPLO7NfU0Ls6mVi7jOviGY9vm6tatJcjMExs=;
        b=CzihUPbiAJpBZyWWtjZ7IdT/CG7h9VI2FEf8IbvTMCQekwhaJSL8Gf/1BEBeyaDSgZ
         d2QYxjePqckZRujXjntZjiKuJvNLE/JhM1kt6TNXh9BvoQ5oEcYezhSfbJ2VSM8+c4ov
         mSuQiB2ehZngeh+fdATwmzbTMbNIJaCNgmqrlPCckWQtaFR0t1Y13kYmPE34apr+3EKQ
         f1bzItKYViT4a9usRNJWvDXEWZeWNWwiomErX9UZUdahsBINOuVJ5qwghzmPdCNSR1Cl
         +7WhalDqmXo9o/QnO73xoEt1wiPG1G9KdDdhgAK/ad1YWyFZ2V4w/bwfi8Ud43eSKldy
         A21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W9vJPcSbPLO7NfU0Ls6mVi7jOviGY9vm6tatJcjMExs=;
        b=bNSdFYusZaClieOl3zKI75XUHvinjC3MYcQ5fdzYP3zx+IW2kBmUcmNv32mlLYEuyh
         aK1OlkCOAY5xzMMLBAMuKjDxzCgHrI6uC0mUGZvt68k569HMAdSldrg1fiqzLhj0vF8S
         auD2k7E7AWOBn3enU+QjDfoQ5Aj5fh7myb60XCL90kR+VG7ezkq9PMLF1Bh3rfBb4F2z
         BqBOQ+R5AYfU42lSd0ZLEW0noKjFrPzTEYJfehKLVDSUD6iA0ePV76O37a4HI5bIZAlB
         rbSAnIvCNvugXOfyoDw4P94VytM0LOY0atD80nSnPChMw2QaKAPDaUiP2gmKBrRyx2mk
         VsJA==
X-Gm-Message-State: AOAM532NE5x7NO01ZyQ4aHklU2O/t5ZFSgiQkGpTRlRwgwaH+Qm2dh6F
        X1TskP4bGoHHrTslZm47t/nGkEUOS764uuE/a+U=
X-Google-Smtp-Source: ABdhPJzoQtwON+pjaqzIt16kK0/i80B+sZ5OLf0ZYarOLkk70Fag7712UVfnlBaW+YRp0t5vHQ5yOjPzFcfw8jkusoE=
X-Received: by 2002:a1c:2b85:: with SMTP id r127mr20691607wmr.134.1635526539897;
 Fri, 29 Oct 2021 09:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211026181240.213806-1-paul@crapouillou.net> <20211026181240.213806-5-paul@crapouillou.net>
In-Reply-To: <20211026181240.213806-5-paul@crapouillou.net>
From:   Christophe Branchereau <cbranchereau@gmail.com>
Date:   Fri, 29 Oct 2021 18:55:28 +0200
Message-ID: <CAFsFa8446UokrOkce_owwULgdhz_HMaWWj=jZ_witPQyZZSNcQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 4/6] drm/ingenic: Set DMA descriptor chain
 register when starting CRTC
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Christophe Branchereau <cbranchereau@gmail.com>

On Tue, Oct 26, 2021 at 8:13 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Setting the DMA descriptor chain register in the probe function has been
> fine until now, because we only ever had one descriptor per foreground.
>
> As the driver will soon have real descriptor chains, and the DMA
> descriptor chain register updates itself to point to the current
> descriptor being processed, this register needs to be reset after a full
> modeset to point to the first descriptor of the chain.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 5dbeca0f8f37..cbc76cede99e 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -186,6 +186,10 @@ static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>
>         regmap_write(priv->map, JZ_REG_LCD_STATE, 0);
>
> +       /* Set address of our DMA descriptor chain */
> +       regmap_write(priv->map, JZ_REG_LCD_DA0, dma_hwdesc_addr(priv, 0));
> +       regmap_write(priv->map, JZ_REG_LCD_DA1, dma_hwdesc_addr(priv, 1));
> +
>         regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
>                            JZ_LCD_CTRL_ENABLE | JZ_LCD_CTRL_DISABLE,
>                            JZ_LCD_CTRL_ENABLE);
> --
> 2.33.0
>

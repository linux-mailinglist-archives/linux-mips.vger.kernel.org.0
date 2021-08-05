Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D633E1702
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 16:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240801AbhHEOco (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 10:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236726AbhHEOcn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Aug 2021 10:32:43 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF14C061798
        for <linux-mips@vger.kernel.org>; Thu,  5 Aug 2021 07:32:29 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id pj14-20020a17090b4f4eb029017786cf98f9so9928112pjb.2
        for <linux-mips@vger.kernel.org>; Thu, 05 Aug 2021 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hxir+KJT92ne4sjUq07glKFb4339EmPmh/a5GVlr1ko=;
        b=k3719/z8eUSedQ6lU1Ji4Phj9b5Y8l0i6R93Er8eQtkwn8oV31S9CxSR/eMF8GtlH1
         xjWqTZwBxPmQfL0Fm2rHuHHJMLShvWbTxr8VBc2YiKbAHxEuCChtZvgmN3DTD0imxKK1
         oS6rtUVkpsmk2kEb9R0U4Csl2IWbJRtZsVqSOL202172DyPqWAoK0xb58hAC+b2bk0e9
         JPaySdp1odFbAvM3gJRsak/89lSYGKrBbDzA9kH+zTUYhV0ir3IlKnGeeARonQYLnqUJ
         mRH09CtOCUWg6lmFaIZdQKUR7lM5V4gSzK5N96JNSgwEQ48WmP5e+YtBxE/j4IRuEFNi
         xYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hxir+KJT92ne4sjUq07glKFb4339EmPmh/a5GVlr1ko=;
        b=nK90X6bERSlumPKb0wQfnQaRgPvpeU1oWpY26w+Tu4vzfh88s6OonEEzWxSAjOKPXO
         vVGirX6h+DQ61yHWDrB7lRrWEOCIzuEPz837uFjsNPEHxbAw2IVZLEO7f6tZrb9AY6il
         DmhRIh+V7lOai1SZ+OYzQgNKTMTmTI2zNiDSlkY0kcM0/8kmbdGIYm5GKPKy4DeLLIct
         mYVrZ+UEq98zel3tP+XE0gsOoqwNwafBUCNiOSLRZkkFXUB+tTUhjSOooqchX0FoJVd2
         mOoM9u+wsVQ+5fISKlSxV9T5uLHjUBoj5zHS525p5UJdspidCcx5kzp0xrnh+JEPyTMH
         gzqw==
X-Gm-Message-State: AOAM532kpG98tBhPPjfCWcMQK8v6K3ZanOX9tGVC9JwQJLweep+aLq4t
        6ftKGMXcvzu2limyHbvIJiuUl/hj55z66YYdkJg7sQ==
X-Google-Smtp-Source: ABdhPJzmKvsuXnbAiJTCr2Ie3c70evLDQtBHyeupRXjhU286jch5hsPG3GMDBTl8uNZmPk7w39U7rdBJi7Zo+CSGIZw=
X-Received: by 2002:a17:90a:604b:: with SMTP id h11mr4973185pjm.220.1628173948924;
 Thu, 05 Aug 2021 07:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628172477.git.hns@goldelico.com> <15187eccabf39561de226acd8be40b93503cac49.1628172477.git.hns@goldelico.com>
In-Reply-To: <15187eccabf39561de226acd8be40b93503cac49.1628172477.git.hns@goldelico.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 5 Aug 2021 16:32:17 +0200
Message-ID: <CAG3jFyu50h2oLW0U6hJSpxiKp3Hb5Ow8Ujvg2qdKRuy+uhaahw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] drm/bridge: synopsis: Add mode_fixup and bridge
 timings support
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        letux-kernel@openphoenux.org, Paul Boddie <paul@boddie.org.uk>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hey Nikolaus,

Thanks for submitting this series.

On Thu, 5 Aug 2021 at 16:08, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> From: Paul Boddie <paul@boddie.org.uk>
>
> The platform-specific configuration structure is augmented with
> mode_fixup and timings members so that specialisations of the
> Synopsys driver can introduce mode flags and bus flags.
>
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 16 ++++++++++++++++
>  include/drm/bridge/dw_hdmi.h              |  5 +++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index e7c7c9b9c646f..e8499eb11328c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2810,6 +2810,19 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
>         return mode_status;
>  }
>
> +static bool
> +dw_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
> +                         const struct drm_display_mode *mode,
> +                         struct drm_display_mode *adjusted_mode)
> +{
> +       struct dw_hdmi *hdmi = bridge->driver_private;
> +
> +       if (hdmi->plat_data->mode_fixup)
> +               return hdmi->plat_data->mode_fixup(bridge, mode, adjusted_mode);
> +
> +       return true;
> +}
> +
>  static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
>                                     const struct drm_display_mode *orig_mode,
>                                     const struct drm_display_mode *mode)
> @@ -2883,6 +2896,7 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
>         .atomic_disable = dw_hdmi_bridge_atomic_disable,
>         .mode_set = dw_hdmi_bridge_mode_set,
>         .mode_valid = dw_hdmi_bridge_mode_valid,
> +       .mode_fixup = dw_hdmi_bridge_mode_fixup,

mode_fixup() has been deprecated[1] in favor of atomic_check(), care
has to be taken when switching to atomic_check() as it has access to
the full atomic commit.

Looking at this driver, it's using mode_set as well, which should be fixed.

[1] https://lore.kernel.org/dri-devel/20210722062246.2512666-8-sam@ravnborg.org/

>         .detect = dw_hdmi_bridge_detect,
>         .get_edid = dw_hdmi_bridge_get_edid,
>  };
> @@ -3364,6 +3378,8 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  #ifdef CONFIG_OF
>         hdmi->bridge.of_node = pdev->dev.of_node;
>  #endif
> +       if (plat_data->timings)
> +               hdmi->bridge.timings = plat_data->timings;
>
>         memset(&pdevinfo, 0, sizeof(pdevinfo));
>         pdevinfo.parent = dev;
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 6a5716655619b..677137445d534 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -8,6 +8,7 @@
>
>  #include <sound/hdmi-codec.h>
>
> +struct drm_bridge;
>  struct drm_display_info;
>  struct drm_display_mode;
>  struct drm_encoder;
> @@ -140,6 +141,10 @@ struct dw_hdmi_plat_data {
>         enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi, void *data,
>                                            const struct drm_display_info *info,
>                                            const struct drm_display_mode *mode);
> +       bool (*mode_fixup)(struct drm_bridge *bridge,
> +                          const struct drm_display_mode *mode,
> +                          struct drm_display_mode *adjusted_mode);
> +       const struct drm_bridge_timings *timings;
>
>         /* Vendor PHY support */
>         const struct dw_hdmi_phy_ops *phy_ops;
> --
> 2.31.1
>

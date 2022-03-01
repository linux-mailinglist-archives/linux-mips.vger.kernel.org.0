Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB2E34C87A7
	for <lists+linux-mips@lfdr.de>; Tue,  1 Mar 2022 10:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232272AbiCAJSy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Mar 2022 04:18:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbiCAJSy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Mar 2022 04:18:54 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1D95C362
        for <linux-mips@vger.kernel.org>; Tue,  1 Mar 2022 01:18:12 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id c192so7135041wma.4
        for <linux-mips@vger.kernel.org>; Tue, 01 Mar 2022 01:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=TEYlXbvOWSupbAY8tVPqpr8CRR6na8Wr7aBD49DbKbw=;
        b=5XN30m4Ku6wsdOr1gXHxmASqPTvStwE7a9zlpqKAdBuXj5t51bUPPkLvAnB3wJfxFE
         2n6WDmPyE0FXui/5QAuK+WLOupUNijhsPIgHi2c+JlVBE6zalhCshibJt1ra+vi3Q+25
         VQaphmAdkKb8OqoYJ1kjv2qBPDOPgF7Km0qbSRQ+3cqqM/DLBu2mYVsvd4uwxe6hQCGx
         OqDxpjgre3klt1HNd2CAoZkhXtIkwrzuSmxK6J6v0+Oyb3UaWRHzwMiej/r3k7eGPml3
         mMnxtyIfuznRDSYGSaIzMK6mLtWZ1OAhGWwLF6Gn6j+ZD/4AIu/PbobEUboMBvtj7Tmm
         gkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=TEYlXbvOWSupbAY8tVPqpr8CRR6na8Wr7aBD49DbKbw=;
        b=zSeFLMXLJVgi6lqQHzV/EOjO1mIYll6D0xWa0p/6mQJo3joWMjYsLi5Hi/sQ8yAOdX
         4EBzxRtoAgljas20pna4uwgyDYzMxOcmzr5kyNwQUmgidCwMYAHOlPgKZ9R6NqzvtYvG
         n+RryKXLktoPfrDu6eZDBPzOHEbZ+/hg3H2Vh9fVOcimzFF0Xc3jPySjqWj8v7FD7ou7
         LE8HjKSsru7jdgYJAbf9OUyKgF3cTcLjbg7QKbDhtVqU/fNvGPA4mw/wE6FRo2rYAXxS
         Fs1RKD+s+VHvMW4cg91aM+w2kia/cQhwovchYuRjvkoD1u9u1BHnpdvUsYX5jCLS/VTL
         sKrw==
X-Gm-Message-State: AOAM533sbaZ6f7ToSoryIjFAjq/pRei8MyjytaNbdHBOVPAmGHAMFmDy
        ktxCaolSq1dTgyd/CwrKRasTNeI6gdcsawUI
X-Google-Smtp-Source: ABdhPJyohskPJWFDRxtZYJ+kAebH7Cv0B/YHuOe8uClSNBI+nEuErf2HD9GpDSk1fn9dmbLCrEcTbw==
X-Received: by 2002:a1c:e90a:0:b0:381:504e:b57d with SMTP id q10-20020a1ce90a000000b00381504eb57dmr9988213wmc.177.1646126291336;
        Tue, 01 Mar 2022 01:18:11 -0800 (PST)
Received: from [10.1.3.188] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f1-20020a5d4dc1000000b001eeadc98c0csm12710913wru.101.2022.03.01.01.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 01:18:10 -0800 (PST)
Message-ID: <5da069b6-8a99-79c2-109c-c85715165857@baylibre.com>
Date:   Tue, 1 Mar 2022 10:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v16 4/4] drm/bridge: dw-hdmi: fix bus formats negotiation
 for 8 bit modes
Content-Language: en-US
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Paul Boddie <paul@boddie.org.uk>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Paul Cercueil <paul@crapouillou.net>,
        Maxime Ripard <maxime@cerno.tech>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     letux-kernel@openphoenux.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jonas Karlman <jonas@kwiboo.se>
References: <cover.1645895582.git.hns@goldelico.com>
 <169afe64b4985c3f420177cd6f4e1e72feeb2449.1645895582.git.hns@goldelico.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <169afe64b4985c3f420177cd6f4e1e72feeb2449.1645895582.git.hns@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 26/02/2022 18:13, H. Nikolaus Schaller wrote:
> Commit 7cd70656d1285b ("drm/bridge: display-connector: implement bus fmts callbacks")
> 
> introduced a new mechanism to negotiate bus formats between hdmi connectors
> and bridges which is to be used e.g. for the jz4780 based CI20 board.
> 
> In this case dw-hdmi sets up a list of formats in
> dw_hdmi_bridge_atomic_get_output_bus_fmts().
> 
> This includes e.g. MEDIA_BUS_FMT_UYVY8_1X16 which is chosen for the CI20 but
> only produces a black screen.
> 
> Analysis revealed an omission in
> 
> Commit 6c3c719936dafe ("drm/bridge: synopsys: dw-hdmi: add bus format negociation")
> 
> to check for 8 bit with when adding UYVY8 or YUV8 formats.
> 
> This fix is based on the observation that max_bpc = 0 when running this
> function while info->bpc = 8.

In fact if bpc = 0, it should be considered as 8, so the issue is elsewhere.

> 
> Adding the proposed patch makes the jz4780/CI20 panel work again with default
> MEDIA_BUS_FMT_RGB888_1X24 mode.
> 
> Fixes: 7cd70656d1285b ("drm/bridge: display-connector: implement bus fmts callbacks")
> Fixes: 6c3c719936dafe ("drm/bridge: synopsys: dw-hdmi: add bus format negociation")
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 43e375da131e8..c08e2cc96584c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2621,11 +2621,13 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>   		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
>   	}
>   
> -	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
> -		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
> +	if (max_bpc >= 8 && info->bpc >= 8) {
> +		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
> +			output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
>   
> -	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
> -		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
> +		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
> +			output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
> +	}

It should not select YUV here if it's not possible, so something is wrong.

Can you check if https://lore.kernel.org/r/20220119123656.1456355-2-narmstrong@baylibre.com fixes this issue instead ?

Neil

>   
>   	/* Default 8bit RGB fallback */
>   	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 336204CC290
	for <lists+linux-mips@lfdr.de>; Thu,  3 Mar 2022 17:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233837AbiCCQXw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Mar 2022 11:23:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbiCCQXv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Mar 2022 11:23:51 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A934926B
        for <linux-mips@vger.kernel.org>; Thu,  3 Mar 2022 08:23:05 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id q7-20020a7bce87000000b00382255f4ca9so5135383wmj.2
        for <linux-mips@vger.kernel.org>; Thu, 03 Mar 2022 08:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=yp0lxWLjzc1AS8YDx4XUct8GVMQ3Pjn+j+MInVB+q7g=;
        b=mqUxNmMzpzSjAWsS0l1IMOn9mS28pOSZ7A8J2gD85d2RA2fu7jSAsu9+GhrDgYUbJT
         h+I67C0rVzPX5tX0I6awQVvpkBYK/9KG/q1G0zq60kbKa/xWpRmXzgffPZQ2i6y8J2kv
         /iF112WYNRFjiFYQq7kPXTxUGiYj7jRooDOfHNXMp8egLdRHqcFWnIOtbRSAZKQ3w/nd
         jX3uVm62NW/8WqXnm+kjNslND6GmzQ0i4QFGQ7+wrOPC6PQc7g7+tY5wJArJoqgjGJBr
         001ON1noqlz9nVPiVSF7A472spgf7CwMT6fwKYkCiSJ62H59ePsW5tu2iGK0zu83R8ox
         Fsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=yp0lxWLjzc1AS8YDx4XUct8GVMQ3Pjn+j+MInVB+q7g=;
        b=mf5RTsP4BhB9VvGjbNPWdLYInIH+x3/XMFD7LEHtkX5m4XyUyhkdmUQbWTShCokYES
         o74MUSsnwRURolaDvq7FQC2KbRlKVF2tE1U+7hVXAsG8OjKJ7w+W/5qux5m6DiUJGfJU
         lzO77lxUdcqK3tSHiJPNnDdrPi0WTA8qB8nVT5y5kipCIjFstj0rwB/c/sqHjVyDj50/
         Nwt6Cs0lncLX/gysC+7Zd5zntPhiFAJ57woazZ9mygu2zq8RnhFeMKo2xWqzVZRo9ZYS
         ZBNWpsrcIiRDXjhrZ+cVCgYNsuMQ76blfgzbC9A/mYMYcKjxXdg/PI8PPBtehm2B4/+a
         SMSw==
X-Gm-Message-State: AOAM530DaRKU6WTu9nzsL3lA9Ttm5bDnTJ/weYVfN2Md3rylZpv/UxSU
        FTzm/88DgFMC2b3o/xn/4Wmwyg==
X-Google-Smtp-Source: ABdhPJxoIlVHEkIE83zf7MVc/PoKn0SXWD2+bOVsG5E+wTzt6QuOeNX36sf7qDY/zytVXHTjOxnaAA==
X-Received: by 2002:a7b:c19a:0:b0:381:8495:9dd with SMTP id y26-20020a7bc19a000000b00381849509ddmr4406271wmi.33.1646324583923;
        Thu, 03 Mar 2022 08:23:03 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:2f5b:3553:677f:a39? ([2001:861:44c0:66c0:2f5b:3553:677f:a39])
        by smtp.gmail.com with ESMTPSA id q7-20020adfcd87000000b001e8a4f58a8csm2345170wrj.66.2022.03.03.08.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 08:23:03 -0800 (PST)
Message-ID: <983e9064-17ad-e646-f37d-ca9173ba0967@baylibre.com>
Date:   Thu, 3 Mar 2022 17:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v16 1/4] drm/bridge: dw-hdmi: introduce
 dw_hdmi_enable_poll()
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
 <e54838849f80454b863f9f5634dd10f79ef7bb8f.1645895582.git.hns@goldelico.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <e54838849f80454b863f9f5634dd10f79ef7bb8f.1645895582.git.hns@goldelico.com>
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

On 26/02/2022 18:12, H. Nikolaus Schaller wrote:
> so that specialization drivers like ingenic-dw-hdmi can enable polling.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 +++++++++
>   include/drm/bridge/dw_hdmi.h              | 1 +
>   2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 4befc104d2200..43e375da131e8 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3217,6 +3217,15 @@ static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
>   	return 0;
>   }
>   
> +void dw_hdmi_enable_poll(struct dw_hdmi *hdmi, bool enable)
> +{
> +	if (hdmi->bridge.dev)
> +		hdmi->bridge.dev->mode_config.poll_enabled = enable;
> +	else
> +		dev_warn(hdmi->dev, "no hdmi->bridge.dev");
> +}
> +EXPORT_SYMBOL_GPL(dw_hdmi_enable_poll);
> +
>   struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>   			      const struct dw_hdmi_plat_data *plat_data)
>   {
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 2a1f85f9a8a3f..963960794b40e 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -196,5 +196,6 @@ enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
>   void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
>   			    bool force, bool disabled, bool rxsense);
>   void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
> +void dw_hdmi_enable_poll(struct dw_hdmi *hdmi, bool enable);
>   
>   #endif /* __IMX_HDMI_H__ */

As I understand, this is because the IRQ line of the dw-hdmi IP isn't connected right ? and you use the display-connector ddc gpio instead ?

In this case I think the Ingenic DRM core should call drm_kms_helper_poll_init(drm) instead.

Neil

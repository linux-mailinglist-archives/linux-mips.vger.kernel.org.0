Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB9646194A2
	for <lists+linux-mips@lfdr.de>; Fri,  4 Nov 2022 11:39:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbiKDKjS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Nov 2022 06:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbiKDKjQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Nov 2022 06:39:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2CC2B272
        for <linux-mips@vger.kernel.org>; Fri,  4 Nov 2022 03:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667558292;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M88yz4GfmbUNq4mWECugnsnJkV6z34uCwDqL3DFZ74U=;
        b=X9/6b8rldhRlkUpmgYmLgpgyKzTITKrxN79vp81phcOinSHMxBjZU8x5YVdpGoLQdWF+XW
        BQ0s9DW5KFjRuZK/UlKybOu+B9UtgGHG1GI/NjGiEu23mabuRFISk0o5tu/IQ4//Se5CvC
        RgrGtrfsH82k6hw+HqNnKNekqRjuhaQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-315-pJYuDaCvPVCP9xvePeS0CA-1; Fri, 04 Nov 2022 06:38:10 -0400
X-MC-Unique: pJYuDaCvPVCP9xvePeS0CA-1
Received: by mail-wm1-f69.google.com with SMTP id c130-20020a1c3588000000b003b56be513e1so2164569wma.0
        for <linux-mips@vger.kernel.org>; Fri, 04 Nov 2022 03:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M88yz4GfmbUNq4mWECugnsnJkV6z34uCwDqL3DFZ74U=;
        b=dJG3QY9w9LkwThKS7CQJaifl+XifE9Bz65oZ/y89egaQEJwpewnic1tuzxfatobeG7
         KF9eGvWcBLMzw3naYdY/uURIlHFWtWS09gPAKOQUPSS4xMGIRn1UxGDLPpnWVwLoAHie
         R4QVyd09GnFcno9UCAC4Vf+P7Kl/2UW5ROFPNBvRUD5nM3v0iv1IX5C/nC9xUPkAd3RU
         BH6BLUo0tWzqXMuBIDs4Hq4DhEgG2YTFb8/SYsf7Nth+xyTZE/w4L/dOd9QmIHXu2p4e
         v4O5UjT8slIbOAX2l1vUU2TEEvwR3CUcMXJLYDK+KC+HRINd6qnQipWwXZRAlCSTW483
         5Tww==
X-Gm-Message-State: ACrzQf2Y1mcoLZx34URzgoY1eg+wcY4u4ceoCd3r8HuZgtdHo+Nt3O3e
        G9QkLfjIcclMwpgpq2DOC5gid+HDkmBORas8sR2QB+QV2MgOtZ2OS1efS7zjVBtTRqNkE3p1NQG
        ME8OX3LpxTQMk59TcLweJnw==
X-Received: by 2002:adf:bc51:0:b0:236:8fa1:47ea with SMTP id a17-20020adfbc51000000b002368fa147eamr218074wrh.77.1667558289570;
        Fri, 04 Nov 2022 03:38:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6s9MOXnwXonR8VOapq6d4n3ZU7IGA+EIjACuJbvHHOLIXD7EQUkeJV/V+5P7qnQBQKVLAVkQ==
X-Received: by 2002:adf:bc51:0:b0:236:8fa1:47ea with SMTP id a17-20020adfbc51000000b002368fa147eamr218064wrh.77.1667558289372;
        Fri, 04 Nov 2022 03:38:09 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k4-20020a05600c1c8400b003b4cba4ef71sm2534442wms.41.2022.11.04.03.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 03:38:09 -0700 (PDT)
Message-ID: <1f5e6de4-3fe2-7933-f8c0-5f13564595cc@redhat.com>
Date:   Fri, 4 Nov 2022 11:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 23/23] drm/fb-helper: Clarify use of last_close and
 output_poll_changed
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com
Cc:     linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org,
        spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20221103151446.2638-1-tzimmermann@suse.de>
 <20221103151446.2638-24-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221103151446.2638-24-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/3/22 16:14, Thomas Zimmermann wrote:
> Clarify documentation in the use of struct drm_driver.last_close and
> struct drm_mode_config_funcs.output_poll_changed. Those callbacks should
> not be said for fbdev implementations on top of struct drm_client_funcs.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


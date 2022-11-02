Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE12D616014
	for <lists+linux-mips@lfdr.de>; Wed,  2 Nov 2022 10:41:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbiKBJlY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Nov 2022 05:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbiKBJlX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Nov 2022 05:41:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D2B22BE8
        for <linux-mips@vger.kernel.org>; Wed,  2 Nov 2022 02:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667382020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BsLrquRWckXT1s1aby8jZXWvTG60TzDOu2w8x1+2PdY=;
        b=fUSRy8Zp8hL5ntlfmePj6zXKYgK0hNbpwaAPl4Rtr/L+NQKHNiQcaZetp03fJmOW/QFs+Q
        d44KFkqdGPiQPlcRHV2mBX8w0Ah9neKG1tBZadLpV9HHXYjDO0/SpMitiQ+nHz3fT7j2hH
        NBR7lAJaxX6PHFu1TleW+zbwALFhats=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-351-VBL-xFoyMKWygcp7IHUkcg-1; Wed, 02 Nov 2022 05:40:18 -0400
X-MC-Unique: VBL-xFoyMKWygcp7IHUkcg-1
Received: by mail-wm1-f69.google.com with SMTP id f62-20020a1c3841000000b003cf6d9aacbbso3520475wma.8
        for <linux-mips@vger.kernel.org>; Wed, 02 Nov 2022 02:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BsLrquRWckXT1s1aby8jZXWvTG60TzDOu2w8x1+2PdY=;
        b=P6khgTjN7ULNLYdyxaU0Ktj6qW/ZGW/v5PMbfWyj/jmlO9nOv3SSTSdYWr+V3uxPEL
         tmV0J8ENh4zqM3DWEkp7ZM7/8HQB/hpkFTSW5TBQRdI00vrBlttC0r5jK9Dq81shLF9O
         esL23AfbwFdKUrodOuQ92q/k1v61/On/35vUCCCJ0qtZCYrx949927wTXhadTiBFoC7U
         pdfoh8bb/QvD9qG/fUe46gYNYImozWo8ot8Ihmm2AniCoRmRlhqB+v4oknIVkpxLM9Ql
         JVbyaIikG2ccUAulHXwLLVbIJeU4xQCmFYjYprwaNdaMoKwAHOa58Nu5ocMY3/768ns1
         ys7w==
X-Gm-Message-State: ACrzQf0BLc2GX0L978jgAnD9vdJuB7cYVTxDukppHQbrfHzRGGQwUg7t
        QlyVdYvH8EdVIhFV/kGE9RQmHnZTASo3sMU6Tz4UN5GsAaLWrlN7bEOTr46vfkDdvAF48SSwgeW
        CbgLLiBBeumtJKdM13x/gAw==
X-Received: by 2002:adf:ba8f:0:b0:22c:def3:1179 with SMTP id p15-20020adfba8f000000b0022cdef31179mr14547797wrg.571.1667382017689;
        Wed, 02 Nov 2022 02:40:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5M29YlmTkXAEgNYduNYpaEq18eaSYaR/je5Gn7y2xNrovwH6Pttvb6rYpMLmmOPDm/qr+vag==
X-Received: by 2002:adf:ba8f:0:b0:22c:def3:1179 with SMTP id p15-20020adfba8f000000b0022cdef31179mr14547781wrg.571.1667382017447;
        Wed, 02 Nov 2022 02:40:17 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id j20-20020a05600c191400b003b47e8a5d22sm1924445wmq.23.2022.11.02.02.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 02:40:16 -0700 (PDT)
Message-ID: <7ac0da2c-0a43-4c02-4199-f48a50347171@redhat.com>
Date:   Wed, 2 Nov 2022 10:40:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 19/21] drm/fb-helper: Always initialize generic fbdev
 emulation
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com
Cc:     dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-20-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-20-tzimmermann@suse.de>
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

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Initialize the generic fbdev emulation even if it has been disabled
> on the kernel command line. The hotplug and mode initialization will
> fail accordingly.
> 
> The kernel parameter can still be changed at runtime and the emulation
> will initialize after hotplugging the connector.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


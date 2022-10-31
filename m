Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83D6961352B
	for <lists+linux-mips@lfdr.de>; Mon, 31 Oct 2022 13:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbiJaMAN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Oct 2022 08:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbiJaMAB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Oct 2022 08:00:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D891106
        for <linux-mips@vger.kernel.org>; Mon, 31 Oct 2022 04:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667217536;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NYUZwRg+lRYohe3+hrEekpmCQsb4LiBLuZ4BzJljYVc=;
        b=BnluX3X8GsMjE39xtb7rtw1Ndg9ZCCLi8YedJNnyuKCqyjOdUcz8WSj7wcsSNkuisPQ5/A
        OJq87MIBNGwdfJEfTK3bCeupYJ2OqO0XCTZuyU1PSUelD3tj2wmAqGisUotFINyPZN7ThJ
        BNIMwyFiIQU7DEdZT+GCbgvABTqjZ6Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-wZH3vBdwPWevOxMSg7440w-1; Mon, 31 Oct 2022 07:58:52 -0400
X-MC-Unique: wZH3vBdwPWevOxMSg7440w-1
Received: by mail-wm1-f72.google.com with SMTP id c5-20020a1c3505000000b003c56da8e894so8267017wma.0
        for <linux-mips@vger.kernel.org>; Mon, 31 Oct 2022 04:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYUZwRg+lRYohe3+hrEekpmCQsb4LiBLuZ4BzJljYVc=;
        b=KkyO96O+7X2DnyF2bRIeuN9gn9edwJXQywykr3pDhXElMRFRUZTYjUO/0/M7vaS7lP
         FPtQO10oaHg+z8KE/pWaTDkVTNQpBjA4Qq90KF78ez62gGt/mssMe3gBTPtsgACtCOcY
         evX4riwdFyi+TZDsTg2PZSW2UCxI4ov2f2gos29Yjrq/lCqwWYorUSWDyHxXDssZdB93
         z7YyNZJAEEOMKeYkQLJ/p0aEuDz9ZbLlRuJciOsFyzO4qDU5g3FzjsULd3gdBm5HEdg8
         R+LwBScbhbpr/4ixnCI34jRZJj++Xds9nu8FrngP7rNQ1u1tJHr5+mjqSMZ2tvT0aY0k
         SzmA==
X-Gm-Message-State: ACrzQf1YV6bk4+zJqL6fhQ6NpxS6IERLyBMoLKhKpF9ZuN8zR+o64jeF
        tsMWi1VrfZysZS3fCdbOswaDESkr5xTRo1ycK0b5ZGjm/iz6novEQV/qvhsFFbpXQ1hafQhD8Wy
        PN1Cz7YHoBUP+Hf6ZL/OBmw==
X-Received: by 2002:adf:ee46:0:b0:236:57e4:60d9 with SMTP id w6-20020adfee46000000b0023657e460d9mr7712411wro.208.1667217531292;
        Mon, 31 Oct 2022 04:58:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5NlG/EcNgth7sygR/Y2wmF3YkVg5o1INpxQYpcg5X49eIhA0omsq50HY00GhqtS98H3T4hUQ==
X-Received: by 2002:adf:ee46:0:b0:236:57e4:60d9 with SMTP id w6-20020adfee46000000b0023657e460d9mr7712386wro.208.1667217531117;
        Mon, 31 Oct 2022 04:58:51 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id cc14-20020a5d5c0e000000b00228d67db06esm7103664wrb.21.2022.10.31.04.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 04:58:50 -0700 (PDT)
Message-ID: <365e1467-7dc2-42b4-b985-53323741dea8@redhat.com>
Date:   Mon, 31 Oct 2022 12:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 01/21] drm/komeda: Don't set struct
 drm_driver.lastclose
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
 <20221024111953.24307-2-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-2-tzimmermann@suse.de>
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
> Don't set struct drm_driver.lastclose. It's used to restore the
> fbdev console. But as komeda uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See
> the call to drm_client_dev_restore() in drm_lastclose().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


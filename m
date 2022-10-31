Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF6CB613581
	for <lists+linux-mips@lfdr.de>; Mon, 31 Oct 2022 13:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbiJaMOr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Oct 2022 08:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbiJaMOp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Oct 2022 08:14:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A36255AB
        for <linux-mips@vger.kernel.org>; Mon, 31 Oct 2022 05:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667218423;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2H8Fq04+XbNugdc6Ty/YSDXQIs5WWNt9cW9u1MIkjOA=;
        b=LyZfO8oK7WZg4YiS9L3p0sPvSDxJCNdr2Me/YfWcIWtG3BRFZltcOhxxLIrtskFui509hE
        xsInseEH2yFmN84gB9WUs/gQuBrkKynCG9+fUX6R3pQXdXRJ3+3lDQY7Th6RTNKRybZc4i
        Jd+OU8QSZF05D6AMylsox0LmSDOrFXE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-301-j0xfU-rYNz-ywzLm3p3JWA-1; Mon, 31 Oct 2022 08:13:42 -0400
X-MC-Unique: j0xfU-rYNz-ywzLm3p3JWA-1
Received: by mail-wr1-f70.google.com with SMTP id u13-20020adfa18d000000b00236566b5b40so2988219wru.9
        for <linux-mips@vger.kernel.org>; Mon, 31 Oct 2022 05:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2H8Fq04+XbNugdc6Ty/YSDXQIs5WWNt9cW9u1MIkjOA=;
        b=hYIQvmIMKOEDueHewVKrRJhJ23AZhLAQajlLplFuc8bI1M8zFKxEWNKyJOdh1JY2Hn
         /zAGuTm6+dU2qKAM9W65nLR/2mhDBbAcoRhYshBPfmTbDYXNrhA9gCHFLfMMHUm9cLNX
         FQmNd/RlrtzKXTvQRFPhoRM2ORppjDp6hjvt2HLJzl/Muo/A7qGJ59Bp3nFhbza8OcVK
         Egt4E9dbyrNWB//yPuAWOay5TYxhI2Kk+/3zIKcb6jE2+tkTsj1qIYzXIUgc/RcUfYNa
         8mc0yKTcA36tf3mcR0LS4j629CnPHRbM8Kji7rRJPfLjVVlxr/vbDyGW8G7jM/CzekMs
         YXZA==
X-Gm-Message-State: ACrzQf2Rt6tO2x1OkTXYXkpo2w16m4afuf0sEkijfi3kSnSInznkXe94
        Y1jsQEU7ew9M/x23poTX+SWSQVGSAvpCF9iauuPMhKWagZORxW4hmvU7y32GXuzctcHW2fdVdwx
        j6n2XWStNxSln7016YXdx1A==
X-Received: by 2002:a5d:64cd:0:b0:236:6d1c:c1a2 with SMTP id f13-20020a5d64cd000000b002366d1cc1a2mr8196684wri.360.1667218420926;
        Mon, 31 Oct 2022 05:13:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+QX10ZDmjvc1IfL0XXmvBimtEQHEjFBrrHb50hNQes1zzurNnpW//og1SN1o9c/o5tX548g==
X-Received: by 2002:a5d:64cd:0:b0:236:6d1c:c1a2 with SMTP id f13-20020a5d64cd000000b002366d1cc1a2mr8196664wri.360.1667218420692;
        Mon, 31 Oct 2022 05:13:40 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id az29-20020a05600c601d00b003cdf141f363sm7207444wmb.11.2022.10.31.05.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:13:40 -0700 (PDT)
Message-ID: <231be619-96b7-b725-0735-0275e07477d8@redhat.com>
Date:   Mon, 31 Oct 2022 13:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 04/21] drm/amdgpu: Don't set struct
 drm_driver.output_poll_changed
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
 <20221024111953.24307-5-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-5-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Don't set struct drm_driver.output_poll_changed. It's used to restore
> the fbdev console. But as amdgpu uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See the
> functions drm_kms_helper_hotplug_event() and
> drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.
> 
> v2:
> 	* fix commit description (Christian)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


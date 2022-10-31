Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4E26135C9
	for <lists+linux-mips@lfdr.de>; Mon, 31 Oct 2022 13:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbiJaMTl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Oct 2022 08:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiJaMTl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Oct 2022 08:19:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BB1F6A
        for <linux-mips@vger.kernel.org>; Mon, 31 Oct 2022 05:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667218725;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y9o0NAEqIzltln/rJd0nXK88QZ5o4OnoHZo920P8Bvg=;
        b=gDJmJCaUqJ7Fm6o9o5aunIA5xfKid9ZLcI2R1r8DajuGUsufutJXLsks1ABDt97IrmjQXr
        rFHPAXjVvH2zt4OLa6y1XAHhEZomEUALKaONYArkpyjqGt47uZ3902Kpa/xZESRuV7066X
        8VkTIYOU1i6VKauEjV1TQZqcTnqptow=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-372-xSPcSj92MKWgOoSeGviTBg-1; Mon, 31 Oct 2022 08:18:44 -0400
X-MC-Unique: xSPcSj92MKWgOoSeGviTBg-1
Received: by mail-wm1-f69.google.com with SMTP id h204-20020a1c21d5000000b003cf4e055442so5233970wmh.1
        for <linux-mips@vger.kernel.org>; Mon, 31 Oct 2022 05:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9o0NAEqIzltln/rJd0nXK88QZ5o4OnoHZo920P8Bvg=;
        b=R1ME/VGc79ZRx1+e9l7OjNH0R6fXa9fqx0JvFjAzddxXi6o+tHyMrpFTwsV56bsQp6
         O8RhKVHgsBf+BWlCmK/rmIHf1+p7OYDF3AJos8MaP8qQxHJhVZNIURE5pAZCl9tR8ExD
         65+XxGLAJJ9+yQS3senVF4URF0H+p2THnBDGpU+Ht+u45n78EytXrUubN9FZbHs9ja3g
         du7G79YfqCOKwlbl4UHOT0o4/KmMt4IMtbrjqU0OwWVWJZowzPEF/6CPkIcrXhxY0rEt
         upO5ueOnRcyw+byEobgaQ1js2bKqm3lbBFmush3SDW+pbpw4cK5nyky7Hjsr3RxKepxe
         JrfA==
X-Gm-Message-State: ACrzQf0lI4834E0bReGwiBLzwUkH9Q87rnBEmcLi9HxPHADh7Zn64+cT
        T8UK0cd5sXp1fhP/oJiOlqiiBjNV1SvoAY4jRS9zTuHVNcE8a2agvexG+RLhtkI/Z60GIUzTTmy
        DHd3iHkVppxIgmXhtZWlQow==
X-Received: by 2002:a05:600c:1913:b0:3c7:32c8:20f1 with SMTP id j19-20020a05600c191300b003c732c820f1mr18174561wmq.81.1667218723530;
        Mon, 31 Oct 2022 05:18:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7l/GcAhTFdfukiyp7nV9yfjX7i/zfBGid5JfBMyP3xXFRWK8fegD9382/Cb8rQ8SeG7Fkrtw==
X-Received: by 2002:a05:600c:1913:b0:3c7:32c8:20f1 with SMTP id j19-20020a05600c191300b003c732c820f1mr18174541wmq.81.1667218723353;
        Mon, 31 Oct 2022 05:18:43 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c1d0700b003b505d26776sm1928473wms.5.2022.10.31.05.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:18:42 -0700 (PDT)
Message-ID: <05a2ad4a-b053-ba98-2547-520ab51d3e77@redhat.com>
Date:   Mon, 31 Oct 2022 13:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 07/21] drm/logicvc: Don't set struct
 drm_driver.output_poll_changed
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
 <20221024111953.24307-8-tzimmermann@suse.de>
Content-Language: en-US
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-8-tzimmermann@suse.de>
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
> Don't set struct drm_driver.output_poll_changed. It's used to restore
> the fbdev console. But as logicvc uses generic fbdev emulation, the
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


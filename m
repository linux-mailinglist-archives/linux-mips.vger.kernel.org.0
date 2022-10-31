Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 891E26135EB
	for <lists+linux-mips@lfdr.de>; Mon, 31 Oct 2022 13:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbiJaMU7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Oct 2022 08:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbiJaMUm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Oct 2022 08:20:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E5DF589
        for <linux-mips@vger.kernel.org>; Mon, 31 Oct 2022 05:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667218756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=riNVOBu8e2pIZERXBmAvmwAOPdhd6MsYxn78jTBB4dE=;
        b=OBolPdy1AF2o/wp/D6pjRilLNmLCu644iVdp5xYog2AGWhwfTXstwshmx++UNF4iRTd/IR
        jS9w5k7O4w9vyLefikbi3kfZncrS0YuBJ6WI0VA/zfuZcxwuMYDzb81+LuY9T31pd3vlIg
        mCYLNeoX02c0cqrZteXZnpM1aBeklys=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-8DDgQQZ0MTu6jBXLS5a7-w-1; Mon, 31 Oct 2022 08:19:14 -0400
X-MC-Unique: 8DDgQQZ0MTu6jBXLS5a7-w-1
Received: by mail-wm1-f70.google.com with SMTP id c130-20020a1c3588000000b003b56be513e1so5251156wma.0
        for <linux-mips@vger.kernel.org>; Mon, 31 Oct 2022 05:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=riNVOBu8e2pIZERXBmAvmwAOPdhd6MsYxn78jTBB4dE=;
        b=hmh3naBbbpiae1nt4NkiP/vXk51GLijHXJvQzOzeVdenDzJ7iGQrbVuxxTdKZcvfJI
         W6aT34IRyHgXkk1OchwkDjzNKfkxGJlOgx6zXzZCsXhXjgwhnkAcZ3ZN65NjxSWVbxLo
         AXqe26uTF0/GLw0Zk6NWuvncS/yT0rLjCfzC4LbsGxyR/ULZyn8vC6ZY4vBdNfwp95gs
         sHy5Fa0dYgeQw0Igi41LsJb9dTLm+3MAZ6NqDR4AFuCdF/DYrSgeGPsQ2mLpLKh48Pyo
         uzrX28z9jehSGedmUuMFGhFUg5dcnzJM2kpNwMh+hcqpY8t0o7XAXzuvyjC90XfVSSNI
         h27w==
X-Gm-Message-State: ACrzQf1nOwPByUg5FXaBjxLz0difp+0/ld3jUuAECIBje3UaplOHpOCJ
        26DgK6d4OWMAsVqrMn9MwV8NWk3joD70q4Kl/exrYCV/+hSQEX0GUKl9kJYkEo3wYDOg0L+fi+G
        4mEpjVrCTTZauXM/BBrAGeQ==
X-Received: by 2002:a1c:7405:0:b0:3cf:55ea:6520 with SMTP id p5-20020a1c7405000000b003cf55ea6520mr7948707wmc.46.1667218753685;
        Mon, 31 Oct 2022 05:19:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4oPDcyHgSUP9i1GOihR+fx3MXqkZeIX2xB6yE7P9f9dsxB6V14E0IWVQPIhFCjpfp7XUuGLg==
X-Received: by 2002:a1c:7405:0:b0:3cf:55ea:6520 with SMTP id p5-20020a1c7405000000b003cf55ea6520mr7948695wmc.46.1667218753455;
        Mon, 31 Oct 2022 05:19:13 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x11-20020adff0cb000000b0023660f6cecfsm7060089wro.80.2022.10.31.05.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:19:13 -0700 (PDT)
Message-ID: <01f85874-6beb-c325-8b94-7a7aeec30d5a@redhat.com>
Date:   Mon, 31 Oct 2022 13:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 08/21] drm/rockchip: Don't set struct
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
 <20221024111953.24307-9-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-9-tzimmermann@suse.de>
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
> the fbdev console. But as rockchip uses generic fbdev emulation, the
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


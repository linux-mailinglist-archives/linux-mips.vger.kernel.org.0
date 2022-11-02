Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39E21615FDB
	for <lists+linux-mips@lfdr.de>; Wed,  2 Nov 2022 10:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbiKBJda (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Nov 2022 05:33:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbiKBJd2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Nov 2022 05:33:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074B265D5
        for <linux-mips@vger.kernel.org>; Wed,  2 Nov 2022 02:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667381544;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qCDrX0xKXyu8erIDNjxDiJKuT0hxZZKKE3HXuUGBVDQ=;
        b=Fb9D+qyhHMPWLXtuGYw6Mefp6rWKvdLbwpBUqk2CBmEzt6ZMBhIiNdhp/IaLKphHxFnkx2
        sF3qeSncVi7cjGhVA4NzgTmOJdJxPDy5uAVvfeIXfM6zzPTz4GG2MaPBBwUWICoQk+js9F
        9f2gucladrqEU+Tm7StOvxPqoeI0rho=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-GySJXMk-PQaIGRgRbk5Vvw-1; Wed, 02 Nov 2022 05:32:15 -0400
X-MC-Unique: GySJXMk-PQaIGRgRbk5Vvw-1
Received: by mail-wm1-f70.google.com with SMTP id c10-20020a7bc84a000000b003cf81c2d3efso266833wml.7
        for <linux-mips@vger.kernel.org>; Wed, 02 Nov 2022 02:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCDrX0xKXyu8erIDNjxDiJKuT0hxZZKKE3HXuUGBVDQ=;
        b=N/ta+KrjSqCzOx0yFA+ArTpNrCcHPPEK+i3N4/jwN0J2xsHMpXM/TDippAR+KhVqpz
         yQbmSmRNPdf4jx014tLbV4XCnef0HVJ/hvWbNjxoG5u4C4bdroSUZEcv7h/LyFYrTX/F
         7eG7q6n/zQHWsCNWI9/gqB929dBmFcCrVhdhyvxhMj/3RuacHEVK2gteJwwF0Wvs4cfL
         aOWw2WF3O00D6w57zzo+5v/d5dD50GaWRyH6UPIiQxww8ruYrFa8auTc/ppak0I+ycvA
         39omBBI3ONMVpYVh5ndsfdxpKAyHWG0bJEF9j2VoR3CbV9imWNkJZXaSRxgUZQyYX7GG
         OwYA==
X-Gm-Message-State: ACrzQf1GTke2+ftIHvQ9tKokLL+vbQsUhyLopowt30lQf0HDdoHLiKVq
        JRNjCi3eGlulz2QE4r4xzgvQMbGrlgRW3ru+ROEVdtLPzzQ6N3ealk6e40I6aphNsLEzxvFTUvY
        2tKlLzfKdtrjVQNDHp3PryA==
X-Received: by 2002:a05:600c:6023:b0:3cf:7dc1:e08e with SMTP id az35-20020a05600c602300b003cf7dc1e08emr5443621wmb.154.1667381534285;
        Wed, 02 Nov 2022 02:32:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7iks5yFnak5X2iZPcs6wSoPN4c8RmVdgyjVaQzUQOEwDY0j8GZM7MD/vLKrS0XyFefd22bEw==
X-Received: by 2002:a05:600c:6023:b0:3cf:7dc1:e08e with SMTP id az35-20020a05600c602300b003cf7dc1e08emr5443583wmb.154.1667381533975;
        Wed, 02 Nov 2022 02:32:13 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x21-20020a1c7c15000000b003b492753826sm1361990wmc.43.2022.11.02.02.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 02:32:13 -0700 (PDT)
Message-ID: <3ab32fc3-f2aa-1b42-fd87-557482ab56d5@redhat.com>
Date:   Wed, 2 Nov 2022 10:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 17/21] drm/fb-helper: Perform all fbdev I/O with the
 same implementation
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
 <20221024111953.24307-18-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-18-tzimmermann@suse.de>
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
> Implement the fbdev's read/write helpers with the same functions. Use
> the generic fbdev's code as template. Convert all drivers.
> 
> DRM's fb helpers must implement regular I/O functionality in struct
> fb_ops and possibly perform a damage update. Handle all this in the
> same functions and convert drivers. The functionality has been used
> as part of the generic fbdev code for some time. The drivers don't
> set struct drm_fb_helper.fb_dirty, so they will not be affected by
> damage handling.
> 
> For I/O memory, fb helpers now provide drm_fb_helper_cfb_read() and
> drm_fb_helper_cfb_write(). Several drivers require these. Until now
> tegra used I/O read and write, although the memory buffer appears to
> be in system memory. So use _sys_ helpers now.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +static ssize_t __drm_fb_helper_write(struct fb_info *info, const char __user *buf, size_t count,
> +				     loff_t *ppos, drm_fb_helper_write_screen write_screen)
> +{

[...]

> +	/*
> +	 * Copy to framebuffer even if we already logged an error. Emulates
> +	 * the behavior of the original fbdev implementation.
> +	 */
> +	ret = write_screen(info, buf, count, pos);
> +	if (ret < 0)
> +		return ret; /* return last error, if any */
> +	else if (!ret)
> +		return err; /* return previous error, if any */
> +
> +	*ppos += ret;
> +

Should *ppos be incremented even if the previous error is returned?

The write_screen() succeeded anyways, even when the count written was
smaller than what the caller asked for.

>  /**
> - * drm_fb_helper_sys_read - wrapper around fb_sys_read
> + * drm_fb_helper_sys_read - Implements struct &fb_ops.fb_read for system memory
>   * @info: fb_info struct pointer
>   * @buf: userspace buffer to read from framebuffer memory
>   * @count: number of bytes to read from framebuffer memory
>   * @ppos: read offset within framebuffer memory
>   *
> - * A wrapper around fb_sys_read implemented by fbdev core
> + * Returns:
> + * The number of read bytes on success, or an error code otherwise.
>   */

This sentence sounds a little bit off to me. Shouldn't be "number of bytes read"
instead? I'm not a native English speaker though, so feel free to just ignore me.

[...]

>  
> +static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_t count,
> +				   loff_t pos)
> +{
> +	const char __iomem *src = info->screen_base + pos;
> +	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
> +	ssize_t ret = 0;
> +	int err = 0;

Do you really need these two? AFAIK ssize_t is a signed type
so you can just use the ret variable to store and return the
errno value.

[...]

> +static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf, size_t count,
> +				    loff_t pos)
> +{
> +	char __iomem *dst = info->screen_base + pos;
> +	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
> +	ssize_t ret = 0;
> +	int err = 0;

Same here.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


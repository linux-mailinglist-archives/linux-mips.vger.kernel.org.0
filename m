Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8435F66CEA0
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jan 2023 19:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjAPSTM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Jan 2023 13:19:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234885AbjAPSSi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Jan 2023 13:18:38 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA0A305DD;
        Mon, 16 Jan 2023 10:06:00 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id r205so23986328oib.9;
        Mon, 16 Jan 2023 10:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jS6lFIJFjFUtY3mw8cyMrgKm76WlKsu232wNoOu9BFI=;
        b=pJUbclSZ3i6Jdg01liLqHc4w2CrtWVSvaOfhA/DUvmwvBfI9LV/fSr9f0+RsBvfbLx
         mSuHpfqzVwUOvdgr8BT+nESWO/0QhJY7FYtEC48w4a2xddiPX+BPDav7qXMtorGbTXUq
         hjQMR/WAaB4ryPMo9lf54fjFLNek6uWrPFOwM6l8Xd/xDdB6xaxgevUnUfNn/0eWYNTc
         bKMw7E9OC5EgqTES2vcg5jM7PqToB0TgsIByf+obkVK3lyB6P/PcTiK4JkRpIAYBGTyB
         1Id0dsqzXGVrfVIItHtSGIEkdKnSeVlrgExRRUQaOVdZ/2a73hix4y96Jlu2eI2bS7Za
         OBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jS6lFIJFjFUtY3mw8cyMrgKm76WlKsu232wNoOu9BFI=;
        b=ou0DgIFS/L+8cUZEBXn8gYwDeRP4wrDXn4RlDuEVNmd57KtUXk2Nn6C33Y3ly21aut
         qYdpclRVvujM3E7EvoBn533jdQHQEWFUvGKpf1h/MUo3YsiPWQux2itbtPmaNbvILKHb
         vqn1hfTjjc/DPMet/TXGfe8wIWWhMy+aB0CvgQtbaSfryxzVv/CubfVGxDbe05kUMZq2
         ctl6uKJbOt+Heh1F46lwSd2AXahTOi8b/oDV0IQDxfBnmPf2jnJQTeJpcLmiNkVkuK1l
         5b0EZJ0znjuldwi6dMPVRTqSR1ojZFDqTmATArx9hISO2vwrBJJJXAv4o2fvkyNSV9N3
         vtdQ==
X-Gm-Message-State: AFqh2kpmD8Gf4mzHnsvR53jubw85lnQ91n/L1h/UtBYwA7iyQ5cnSKI7
        QZGSuXILgWOcXLHPm8MsH5gKLOtIxDS6qNID9CFkv3e4
X-Google-Smtp-Source: AMrXdXvrZGLO62Oo0eXSOIOLUZCvlkDtQzC8DtTWKD6P/g/Ade7N08+e9NEuxmouzOQHO07H0ArjVT5oqOGIBob8wbI=
X-Received: by 2002:a05:6808:4387:b0:35b:d93f:cbc4 with SMTP id
 dz7-20020a056808438700b0035bd93fcbc4mr8161oib.96.1673892358616; Mon, 16 Jan
 2023 10:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20230116131235.18917-1-tzimmermann@suse.de> <20230116131235.18917-2-tzimmermann@suse.de>
In-Reply-To: <20230116131235.18917-2-tzimmermann@suse.de>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 16 Jan 2023 13:05:47 -0500
Message-ID: <CADnq5_P4DgCi_JwXo2fJS=cCBmumsw5Og5ZYt+J4J_Lak74e0Q@mail.gmail.com>
Subject: Re: [PATCH 01/22] drm/amdgpu: Fix coding style
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     sam@ravnborg.org, daniel@ffwll.ch, airlied@gmail.com,
        linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
        linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Applied.  Thanks!
On Mon, Jan 16, 2023 at 8:13 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Align a closing brace and remove trailing whitespaces. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index e47058c2c294..0993ee91fe18 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5871,8 +5871,8 @@ void amdgpu_device_invalidate_hdp(struct amdgpu_device *adev,
>  int amdgpu_in_reset(struct amdgpu_device *adev)
>  {
>         return atomic_read(&adev->reset_domain->in_gpu_reset);
> -       }
> -
> +}
> +
>  /**
>   * amdgpu_device_halt() - bring hardware to some kind of halt state
>   *
> --
> 2.39.0
>

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE35302199
	for <lists+linux-mips@lfdr.de>; Mon, 25 Jan 2021 06:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbhAYFPH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Jan 2021 00:15:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbhAYFPH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Jan 2021 00:15:07 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4AC6C061573;
        Sun, 24 Jan 2021 21:14:26 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id s15so6862362plr.9;
        Sun, 24 Jan 2021 21:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ABv6Npwft06wwYJ2sZ6gyI2Q3JtICyjvaZei0vusIQI=;
        b=XWEqC0ysOo1iyRnPwpi8qD1NXyH2LMMBWteg0F0v40aDMhrhkGHNbQJ4Gwh0WBKgmJ
         OTJxPzExLs0FJXJOJS/y7ei3z8nrQQsAk1Aq2wqPgwn+IHBH4lePLMAo9XBgAUQUupt9
         dPI5zCn282w29T4LZ60/iVpCN8d+woXJy4a1zH7UciK//YltYUt4wR9DUGElLr62I2je
         JFhUPgXQwvO/LwP+b2zeQm9fBzNN5ozmhzft++4yl2bN4gjPKVJhasUha9wgHMnMI3/9
         srKk2wltT5TTFZbCLKdSd2lZFsqmwZIaPUQSEamVeWqsehqBY0DHad66/oFWnJ400Ud0
         waAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ABv6Npwft06wwYJ2sZ6gyI2Q3JtICyjvaZei0vusIQI=;
        b=R0yimvMSCOcI1MeCDz47kiUR/Nfw3H+NwpQv6yesuHqwvdVQLl3V5162Sl7fMmz21H
         RMADlKuaaTPisIUBjHABQxiKE0NM8icgCayZMVYYCOakImXFNQabKKQySe/G0Z9JxGKW
         2DoDaNWdu0nGK0sqLcrozNVUeyzw2N/xJvedt7rqzlzeAk7NMvytZEjFgTsXeCj8As1f
         M5NKDlZeeOEMT0OSG3qmpGxN2IkmSG90Yiirp2p2YDEbqrg/AUClabS8blsQlAruOkCl
         hDAHwHY6lNsCw8XkNRkNnvbopWzg+zrRa8L8xlAQ62dha+YLCopc5P89u7PhgjdmeK4Q
         NKcA==
X-Gm-Message-State: AOAM530tDq399FIw+tP2YXZSfoFnaVQqhYKOYBYhhmTggWcCbp8x5pIO
        y9X2B9dOVTfNXTA1cwx/Mkc=
X-Google-Smtp-Source: ABdhPJzXXhKstXh66Bq6Oj2s9mSclOsLOayNpHJzr+FARpbthjBUc3Z87qEz3AzY4P5pv3kLwOUVig==
X-Received: by 2002:a17:90a:c68d:: with SMTP id n13mr3768886pjt.71.1611551665851;
        Sun, 24 Jan 2021 21:14:25 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id mm4sm17129464pjb.1.2021.01.24.21.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 21:14:24 -0800 (PST)
Date:   Sun, 24 Jan 2021 21:14:22 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 1/3 v7] input: Add N64 controller driver
Message-ID: <YA5TrvVoZPsraXVO@google.com>
References: <20210115133408.0acd70163b582b77ad0a029b@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115133408.0acd70163b582b77ad0a029b@gmx.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Lauri,

On Fri, Jan 15, 2021 at 01:34:08PM +0200, Lauri Kasanen wrote:
> This adds support for the four built-in controller
> ports on the Nintendo 64 console. The N64 controller
> includes an analog stick, a d-pad, and several buttons.
> 
> No module support as the target has only 8mb ram.
> 
> Signed-off-by: Lauri Kasanen <cand@gmx.com>
> ---
> 
> v7: use devm_platform_ioremap_resource
> 
>  drivers/input/joystick/Kconfig  |   6 +
>  drivers/input/joystick/Makefile |   2 +-
>  drivers/input/joystick/n64joy.c | 343 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 350 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/input/joystick/n64joy.c
> 
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> index b080f0c..e1a8128 100644
> --- a/drivers/input/joystick/Kconfig
> +++ b/drivers/input/joystick/Kconfig
> @@ -382,4 +382,10 @@ config JOYSTICK_FSIA6B
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called fsia6b.
> 
> +config JOYSTICK_N64
> +	bool "N64 controller"
> +	depends on MACH_NINTENDO64
> +	help
> +	  Support for the four N64 controllers.

I expanded this help section with wording from your CL description.

> +
> +			dev->name = "N64 controller";
> +			dev->phys = n64joy_phys[i];
> +			dev->id.bustype = BUS_HOST;
> +			dev->id.vendor = 0;
> +			dev->id.product = data[i].data >> 16;
> +			dev->id.version = 0;

I added

			dev->dev.parent = &pdev->dev;

so that controllers are parented properly, and applied.


-- 
Dmitry

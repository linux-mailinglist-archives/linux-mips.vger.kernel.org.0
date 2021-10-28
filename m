Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40D2F43E831
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 20:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbhJ1SVx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 14:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbhJ1SVk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 14:21:40 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877D9C061745;
        Thu, 28 Oct 2021 11:19:13 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 107-20020a9d0a74000000b00553bfb53348so9892975otg.0;
        Thu, 28 Oct 2021 11:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+CRezQE1+16rUbwJAOKzOr+t4gMFD3koJCJNFyTOlV4=;
        b=HvlZ0EaAjf8RnzP11WU68zVTEkCYy9B4PYJkUuhrC+kfoJiQeMAqnwiEiUVxcfECZo
         VypQxvVg/C0V4L94f9WsmOHP9RL5NrWUaIX5rmBoD7+emrDIEm4spk8yqrLBHSZbTGZX
         PhRVhEWacK69/2lANIZsr0Pvd8yRAk/aSqe4Ep8VOWAERcrtMn2WczwpBI60Myk4P32X
         RMcVz4/R5PE43GQYVwziXW70AYi/+4LKaOmGOlSyrtHrIcJ36EIQht4BzUB0qZBzWyEG
         CWilQuG4lTh++NqV45oX1SnPXyQwD1wjzimNcaqpG1cUo5mpdv6GDAqVqtAN3GWwB6vM
         fCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=+CRezQE1+16rUbwJAOKzOr+t4gMFD3koJCJNFyTOlV4=;
        b=Uov7l9RWeFUTFKCRim9chmJ3voSVYt++nXS3rafn2QBJsKo23FwQEIw/8aVLEjRQGC
         LMoJanHbVfW5jVCN1fXuKfl0c/ARq5sn/nVxW2mIjZAAyDwZrqLaqgn9ZBaR+r4TDBLJ
         z+sdzwK0RUIGTjPy0MOoMg7TBwh0+rcFzUPFLrRDRUHFNt92Hvw/2nugC2/SOVKo52aY
         8nkY1ZO5CSgZO1l7zPb+HIboKYaCCgw+v9wMbC/j0Ekio4zYADvjaGC5Rv4aykXK4dww
         4JqwOVVqXYiCFS0leeGhEzFLhH6e1CKt7PcdJ2aLTHnceGUiBdDsOk3GwawLZvL3wD8/
         pwXA==
X-Gm-Message-State: AOAM5314koWPJTbm2rqPL+y8K3DsBc/tpXqDHHQIcoXmFlIILHbCFgnh
        /ta6xo/g8KGC7vchuCc7cMs=
X-Google-Smtp-Source: ABdhPJw0ewCS+ynNI18lx2mbJ4GnaZpKdXpLuyjGbGohJRMZllJNo8YJsdawunDor4QmPXynqHXr4Q==
X-Received: by 2002:a05:6830:3155:: with SMTP id c21mr4749527ots.104.1635445152769;
        Thu, 28 Oct 2021 11:19:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m7sm1174176oiw.49.2021.10.28.11.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 11:19:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 28 Oct 2021 11:19:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, rafal@milecki.pl,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "maintainer:BROADCOM BCM63XX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Justin Chen <justinpopo6@gmail.com>,
        "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "moderated list:BROADCOM BCM63XX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 5/7] watchdog: bcm7038_wdt: Add platform device id for
 bcm63xx-wdt
Message-ID: <20211028181910.GC705675@roeck-us.net>
References: <20211028172322.4021440-1-f.fainelli@gmail.com>
 <20211028172322.4021440-6-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028172322.4021440-6-f.fainelli@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 28, 2021 at 10:23:20AM -0700, Florian Fainelli wrote:
> In order to phase out bcm63xx_wdt and use bcm7038_wdt instead, introduce
> a platform_device_id table that allows both names to be matched.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/bcm7038_wdt.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
> index 506cd7ef9c77..2535f450e8a1 100644
> --- a/drivers/watchdog/bcm7038_wdt.c
> +++ b/drivers/watchdog/bcm7038_wdt.c
> @@ -223,6 +223,13 @@ static const struct of_device_id bcm7038_wdt_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, bcm7038_wdt_match);
>  
> +static const struct platform_device_id bcm7038_wdt_devtype[] = {
> +	{ .name = "bcm7038-wdt" },
> +	{ .name = "bcm63xx-wdt" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(platform, bcm7038_wdt_devtype);
> +
>  static struct platform_driver bcm7038_wdt_driver = {
>  	.probe		= bcm7038_wdt_probe,
>  	.driver		= {
> -- 
> 2.25.1
> 

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495AA2DF96B
	for <lists+linux-mips@lfdr.de>; Mon, 21 Dec 2020 08:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgLUHFT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Dec 2020 02:05:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgLUHFT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Dec 2020 02:05:19 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF3BC061282
        for <linux-mips@vger.kernel.org>; Sun, 20 Dec 2020 23:04:38 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id l11so21261462lfg.0
        for <linux-mips@vger.kernel.org>; Sun, 20 Dec 2020 23:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Q2FNlZen8Z3CefSVyQlwjKqykMaoBgbJuTLV2rj/z9Q=;
        b=HcUqFU3kmrArg7OBxP13O7muBazyNSuUfxT+zLtWjCbYaYkK/WQ4/5p6NjoE9m9lLp
         vm9BJIJipGvS0H3AHnBT3Mo6sdHz1H95hCVc0XcGOWFgMr/7M31bKjRo6MyGZ5jo15Tg
         oYVs2XUlCyKUhbyA21kEw6TbEDpMqscS2YXBXzkofJfa7H1VigO+2S/jq7gj/9kVssKm
         vvPBsQUlfTspVK6W7luJvNS45L4KmDDfbTy9daBqfw1z/aEzEBfp4rpOHgkyVAbj/KqZ
         jkSvVkrDzGoTZuJ1KHYcHuySgum7dIkx1EtzwJkX0NqvRxgAcm+CQhQpKd9YMxS6qgQW
         Mmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Q2FNlZen8Z3CefSVyQlwjKqykMaoBgbJuTLV2rj/z9Q=;
        b=EDf3f+hZxGgObrpSLEgjwH/x9a+k8dqpbn2ER5JTXI/Cl/ba6nqAM64rresHODbkVD
         naiSqXIsNFqWnRoZQ6GyDjGPhazteraFacPjliIErTRIu5fYVGKtmSAS/dLnHAhEYZtj
         +8fCf19AvqnbKuuylvqXbrr/8FAlM0Q0fGcDXxamo8GI0FSDqL35nd21XnOMEv0za1lU
         zhKZEFGPLP8fKvp+SBTkgRAcqLaHj4pXOfNJE3I6TV0Y2l/mACyOTB3ZI2mSNu3rJM8Y
         NkRz0NGQpO+iCxhJbhGbqifJVI0SW5bL1dr6CPH8Fc+rbuYSZyO/QAdAC2WZlUH58ODc
         IDBw==
X-Gm-Message-State: AOAM533HZ2WpO9GEAQST5wBBgDE70YHEY7OGkUWYJsF8YkXt79RDCIy/
        oBEKzhiVk240Jr/niNw3gAzcREZ63Cs=
X-Google-Smtp-Source: ABdhPJzz8dGr9ySyrPKkM8Sr+ivzYTC5+pEQnIN2iSE59t8cq5Ak2wVgkZZ/vGfaEHTjPTxw3+/YKQ==
X-Received: by 2002:a19:85c1:: with SMTP id h184mr5825067lfd.243.1608534277420;
        Sun, 20 Dec 2020 23:04:37 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id y20sm2086863lji.86.2020.12.20.23.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 23:04:36 -0800 (PST)
Date:   Mon, 21 Dec 2020 10:04:34 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org
Subject: Re: CPUs with EVA support
Message-ID: <20201221070434.yom3neoeir43ek2k@mobilestation>
References: <20201220193201.GA3184@alpha.franken.de>
 <d45cb374-f3dc-8c26-6b0f-27bec45854a9@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d45cb374-f3dc-8c26-6b0f-27bec45854a9@flygoat.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Thomas, Jiaxun

On Mon, Dec 21, 2020 at 08:38:00AM +0800, Jiaxun Yang wrote:
> 在 2020/12/21 上午3:32, Thomas Bogendoerfer 写道:
> > Hi;
> > 
> > I've started looking how to get rid of get_fs/set_fs for MIPS and
> > my current obstacle is EVA support.
> > 
> > Looking for CPUs supporting EVA I only found P5600, are there more ?
> 
> Hi Thomas,
> 
> It is a optional feature for M14k but nobody enabled it :-(
> 
> > 
> > Does someone sell boards with an EVA enabled CPU ?
> 
> Baikal-T1 supports EVA.

Yeap, Baikal-T1 SoC does support EVA since based on P5600 does.
Moreover the feature is enabled in my CSP code by default, but
the segments mapping is initialized to fully match the legacy
MIPS address space layout. 
          
Regarding the boards with Baikal-T1 to purchase. It's available and
demonstrated on the company site:
https://www.baikalelectronics.com/products/339/
        
Currently a single retailer selling the item is Russian-based:
https://www.chipdip.ru/product/bfk3.1?from=suggest_product
(Alas the site doesn't have an English version, so please use the
Goog-xlate.)
If for some reason you still won't be able to purchase it from there
please send me an email directly.

(Today I've got a suspicious message on my corporate inbox from a guy
- Yunqiang Su with email domain @cipunited.com, who stated that CIP
United wants to purchase one or more of them for you and requested to
give them the company sells contacts. I didn't response, because the
message structure looked more like a spam, than an official request.
It was also strange not to see you in CC.)

Regarding the Baikal-T1 boards being finally supported in the kernel.
I am still working on it. There are several more SoC-device drivers
to fix and I'll be ready to submit the CSP/BSP code to the MIPS arch
subsystem.
    
-Sergey

> 
> > 
> > How good is EVA support in qemu ?
> 
> EVA is functional in QEMU.
> I had tested it with P5600 malta system.
> 
> - Jiaxun
> 
> > 
> > Thomas.
> > 
> 

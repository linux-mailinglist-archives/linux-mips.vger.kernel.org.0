Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5A232FEA3
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 05:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhCGEOg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Mar 2021 23:14:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbhCGEOK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 6 Mar 2021 23:14:10 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B144C06174A;
        Sat,  6 Mar 2021 20:13:59 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id nh23-20020a17090b3657b02900c0d5e235a8so1293386pjb.0;
        Sat, 06 Mar 2021 20:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aNQ8It84bE/zbP5TAlSKFSi5Ijz+ILHaleTfFj87zv0=;
        b=bSux60A6elleCiFzeCr4s8KQuPi7mdyvy0RZdt+5FzTgDmhGOBJiogOYnAKSOXgc9J
         eMGSZ/RY9nb8wnt2wZITIsW1uE4LbpKZsOxD5iEKexjn/3JoG2IuBjeVtC/+ryaaZH3H
         hZAxPQoRedZHBc0QiZ5Xel96sox+6V3EdXd4tYryEon7p43//Nn9xsuUyvB9WVU27n4B
         4tgavUy36u0XVQgdU3opx/9BZdF/CP1g1Kbx4Pxs7cypMBDNPv9+ZnobXo8deJ6PJJ/L
         49rXBV2lq1d+qGSNoWhjEVfuog2iroFUu9pcswmu8Yt+Q6Xaa6MWrErLmMv5jwrozcvs
         1rUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aNQ8It84bE/zbP5TAlSKFSi5Ijz+ILHaleTfFj87zv0=;
        b=cUEyq71I9dleK7UadenXTAn5oZZF4EJYnXWxIv8pC5J4l1pegr2sZzIIPS83CyZlf3
         xxYF3F+S1uSpLKh+FgLkJTHh7N7c73nq9TzughvQWiuRiETstT/2UJLUO6bB6GQp2olv
         udXRjWUdFhRhZQ6tqPowkhM9Je5LyTwk88VdzACgVIc8neJ4/iieqqSxADiiYzYSeR6a
         tgO4vUEKTTPoElXc67XXooRzaLKUg5ho9uHJJtpeIlPS1NmsirEKXTqP6b644IiS+9Xr
         ZvUs+1McuzKQRpjRWaTfyU+kppcpNATwmwBODJkue/3yHjPWw9aOcxBrbjnBHK4B/MIc
         YJ2Q==
X-Gm-Message-State: AOAM532gGRVqXDOFnLbxOnOdpZGIbE3UZnXyqgokSJsAZB5pDNkD+Bzq
        1uL/15RjuY9bEcSCsgABVRvyZe1iWAs=
X-Google-Smtp-Source: ABdhPJxhsxF98tFFRzIb4w2pba4v2qI4qDw3ZSu5ZEdqJdjYJDIYjeYUPXlgOGZkG9eePU5xgnDKqQ==
X-Received: by 2002:a17:902:b711:b029:e3:71f1:e08e with SMTP id d17-20020a170902b711b02900e371f1e08emr15459859pls.18.1615090438531;
        Sat, 06 Mar 2021 20:13:58 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id s27sm6150227pgk.77.2021.03.06.20.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Mar 2021 20:13:57 -0800 (PST)
Subject: Re: [PATCH v2] MIPS: kernel: Reserve exception base early to prevent
 corruption
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Kamal Dasu <kdasu.kdev@gmail.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
References: <20210306082910.3472-1-tsbogend@alpha.franken.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b11d87e6-6665-7579-6334-f9e280dbf20b@gmail.com>
Date:   Sat, 6 Mar 2021 20:13:53 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210306082910.3472-1-tsbogend@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 3/6/2021 12:29 AM, Thomas Bogendoerfer wrote:
> BMIPS is one of the few platforms that do change the exception base.
> After commit 2dcb39645441 ("memblock: do not start bottom-up allocations
> with kernel_end") we started seeing BMIPS boards fail to boot with the
> built-in FDT being corrupted.
> 
> Before the cited commit, early allocations would be in the [kernel_end,
> RAM_END] range, but after commit they would be within [RAM_START +
> PAGE_SIZE, RAM_END].
> 
> The custom exception base handler that is installed by
> bmips_ebase_setup() done for BMIPS5000 CPUs ends-up trampling on the
> memory region allocated by unflatten_and_copy_device_tree() thus
> corrupting the FDT used by the kernel.
> 
> To fix this, we need to perform an early reservation of the custom
> exception space. So we reserve it already in cpu_probe() for the CPUs
> where this is fixed. For CPU with an ebase config register allocation
> of exception space will be done in trap_init().
> 
> Huge thanks to Serget for analysing and proposing a solution to this
> issue.

I made a typo on Sergey's name in my original version here.

> 
> Fixes: 2dcb39645441 ("memblock: do not start bottom-up allocations with kernel_end")
> Reported-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Debugged-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Tested-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks!
-- 
Florian

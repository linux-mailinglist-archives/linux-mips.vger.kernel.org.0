Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13DCD107A47
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2019 22:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfKVVyx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Nov 2019 16:54:53 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39661 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfKVVyx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Nov 2019 16:54:53 -0500
Received: by mail-pf1-f196.google.com with SMTP id x28so4125766pfo.6;
        Fri, 22 Nov 2019 13:54:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:subject:references
         :in-reply-to;
        bh=t2HwSc1htlVEI1Qu+RPZ9ikLWx9xCqbzSxq3Gf/JDYA=;
        b=p0HxhYa+nqQve7+U8ZN2Rl3v+id1j+gsVJHILYbXJFdYZYBRQIMK/qr/kXUBoeYxG6
         sv4mojKSZOn4qGiVctvbvjLGnTS7lOtYIfAjJUbafxGi34znJBjutNPiefiYLh5RxaD+
         jnzcg74tLU9ZMq3lqB/5J3rI3mNF73mRp54/AbgI3drlgbgfO2IoaBaBj/+z+5rzUFgp
         sujEJlD/BOYFTNuelcjTbv4WRiwmJSjCSW2vphBh6SQycOO4obWb4kTGtz4YeqUe9DFN
         PlSh3ypJqFvTFcBgWwTyk8pabn4Krqtr5KAMD2yUg190ADlvGL94JancceEOKD/2PWrb
         LqnQ==
X-Gm-Message-State: APjAAAWKEzRnTeTHzcNQ16sxiuwZOKUkiH5JpjW1gOJcwtqABBQoP50D
        CBv3zmA6TTzycRhghzL+xUc3S0fYk1elhw==
X-Google-Smtp-Source: APXvYqwAp31X8OGAuaNU4P5qXanMYeMu8/BD2s1kxMCsmk78mRey5lpTfkNng8lsZevBGKtOml6l2Q==
X-Received: by 2002:a63:ed4a:: with SMTP id m10mr18168890pgk.255.1574459691960;
        Fri, 22 Nov 2019 13:54:51 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id 7sm7779458pgk.25.2019.11.22.13.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 13:54:51 -0800 (PST)
Message-ID: <5dd8592b.1c69fb81.75c66.3b2a@mx.google.com>
Date:   Fri, 22 Nov 2019 13:54:50 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/2] MIPS: SGI-IP27: Fix crash,  when CPUs are disabled via nr_cpus parameter
References:  <20191119110857.28540-1-tbogendoerfer@suse.de>
In-Reply-To:  <20191119110857.28540-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> If number of CPUs are limited by the kernel commandline parameter nr_cpus
> assignment of interrupts accourding to numa rules might not be possibe.
> As a fallback use one of the online CPUs as interrupt destination.

Series applied to mips-next.

> MIPS: SGI-IP27: Fix crash, when CPUs are disabled via nr_cpus parameter
>   commit e3d765a941f6
>   https://git.kernel.org/mips/c/e3d765a941f6
>   
>   Fixes: 69a07a41d908 ("MIPS: SGI-IP27: rework HUB interrupts")
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: PCI: remember nasid changed by set interrupt affinity
>   commit 37640adbefd6
>   https://git.kernel.org/mips/c/37640adbefd6
>   
>   Fixes: e6308b6d35ea ("MIPS: SGI-IP27: abstract chipset irq from bridge")
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]

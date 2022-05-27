Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3E1A535EF0
	for <lists+linux-mips@lfdr.de>; Fri, 27 May 2022 13:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239082AbiE0LEe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 May 2022 07:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242043AbiE0LEb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 27 May 2022 07:04:31 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4467912E33B
        for <linux-mips@vger.kernel.org>; Fri, 27 May 2022 04:04:31 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id l7-20020a17090aaa8700b001dd1a5b9965so4078302pjq.2
        for <linux-mips@vger.kernel.org>; Fri, 27 May 2022 04:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sudomaker-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=Vb9dSzoN7S9/IleFzvRqSMn9sg/K3e6Rmqo4Pcrkqlc=;
        b=ZfM12dQGYsstf+4DpJ9C+Te2zKTOEipboS3OjplBBgWBuD9bGXvS71yt2sMXVROPpj
         SnM6zHJkCUM8Vg+Bo616H4VKeFAJ1LGS6vYSI629oRZASTg+jCejdhzJYJsYugXIs9Ne
         Vh5edYRtUPGDbuxTThVEYP+xpADd1OTidPKwzP92tn8E4EmvEtzCxOx5a2Xa8qI7rc2F
         Jpwcod+fpFWhee6Upw/Ed/GBqH9deXXN/QV8mFazq/lzEXevjPJ+fThMiK+oysyzMrxW
         akCqFrH/S+a4GJ4yL1PaUcHyMU+1IpY8WTxvzF14YTL6S8c23Jet/iV3V0yJtEqtH7sz
         dkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=Vb9dSzoN7S9/IleFzvRqSMn9sg/K3e6Rmqo4Pcrkqlc=;
        b=LHFudNxrj0bDwnVgH9Mvqi5OY4gPNBQBjMFeapEKsr7JNaptTfDqN/khwYkaKh/kar
         SRJBBUVnEiSu4ATxAYEhQXUh5YJ0W6966akwGgALQG6433FNtwte2mZjygQDWo7WTfcx
         zc4ZMfEcCkGBaZwgqdUKeXla2VJZcAiwkHsVg+/cdzI8q5PfAtLFSt6sQ9PV3WQHN6lh
         yye12svu088eNTHo/3ndWQd08Ie/Z00VamhGvqxd56RHbpONutkrB+oqeG7rBdVtATLP
         BI/LgSfZ/APcx5rEqaLBfYqCb6SlQVgVaIgbwJyLIERFlE8foCf0AGr10U7VljQmdGq3
         qxcw==
X-Gm-Message-State: AOAM532Wt8wLZ5BHGgi0vCIw2KYxHCXY31k31CF84aZb/s+Zqu+01/3p
        PDZUSl5GfmXMGCEYiCld7sW8N+2gPlQLUOJ+fKI=
X-Google-Smtp-Source: ABdhPJxHJ1Lx9DHUIk9SPezo7+ac37mejNtU5wdK9eEy3UIjmS3zGq05eZ8AT4NaZ8uf3+DG/pcNcw==
X-Received: by 2002:a17:902:db07:b0:163:5374:6732 with SMTP id m7-20020a170902db0700b0016353746732mr5720047plx.15.1653649470479;
        Fri, 27 May 2022 04:04:30 -0700 (PDT)
Received: from [172.16.24.11] ([91.219.212.219])
        by smtp.gmail.com with ESMTPSA id t7-20020a17090340c700b001616e19537esm3247022pld.213.2022.05.27.04.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 May 2022 04:04:30 -0700 (PDT)
Message-ID: <c102518f-3288-29fb-6653-0d39a53639df@sudomaker.com>
Date:   Fri, 27 May 2022 19:03:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To:     linux-mips@vger.kernel.org, paul Cercueil <paul@crapouillou.net>,
        zhouyanjie@wanyeetech.com
From:   Yunian Yang <reimu@sudomaker.com>
Subject: Ingenic X SoC cache problems
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello all.

In the past month, I was struggling with random memory corruptions and crashes on the Ingenic X1000. After some detailed testing, I need to point out, the current cache management routines seems to be incorrect for X1000, and maybe all X series SoCs. It mainly affects DMA operations. Every form of peripheral to RAM transfer will corrupt the RAM, and this includes the dwc2 and SFC's DMA and the PDMA controller. If all the DMAs are disabled (e.g. hard coding dma_capable = false in dwc2), it will be fine running CPU and I/O benchmarks for a week. If you have the hardware, you can enable the kernel data structures & memory debugging and see for yourself.

So I went back and looked at Ingenic's old 4.4 and 3.10 kernel sources. They used a separate file (sc-xburst.c) for the cache routines, which is based on an very old sc-mips.c. And there are two important macros, called MIPS_CACHE_SYNC_WAR and MIPS_BRIDGE_SYNC_WAR. They're both set to 1. However these macros are removed from the kernel long time ago. The line `mips_sc_ops.bc_wback_inv = mips_bridge_sync_war;' seems to be the key point. 

Do you have any recommendations of what could be done to fix this problem?

Thanks and best regards!

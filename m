Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD50535F24
	for <lists+linux-mips@lfdr.de>; Fri, 27 May 2022 13:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350411AbiE0LTi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 May 2022 07:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233963AbiE0LTh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 27 May 2022 07:19:37 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AF912698A
        for <linux-mips@vger.kernel.org>; Fri, 27 May 2022 04:19:37 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id q18so3869471pln.12
        for <linux-mips@vger.kernel.org>; Fri, 27 May 2022 04:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sudomaker-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+Q+uRLjmkd2V29Opg4thMQpi5opNYcK1M/SVT+u6ApY=;
        b=TjVdDQxxx93UrFcR0XwIccvWqec/9rpZIMpySEmLWsGe2uVS9NGpmRfkdbcfjmKCuA
         YMwtexuHwxw0ll9J28VGaXb9Gv15mUrkl/7yuDP8RwaoYSM3G9vQV0lskcS4tp7q4F6D
         sxBGUMg+xgugcZuvy2ve0LiR5wniTDvlFKMeCyYdLtIl8e72HucbD6YyDxDJOfQPmmmL
         VUv7dcvWFehgsiYs5fDWXFGAe5swhI86onn9j6s3ZwL/xX0brd5392r9Rg1JmW8codUT
         s+5znmizm0B6QBybBwOFCPe3C7vzRqfn4+VVSXxIAX2aPrsrhL1Bw7nNAcTwJ9z3hm/y
         TOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+Q+uRLjmkd2V29Opg4thMQpi5opNYcK1M/SVT+u6ApY=;
        b=xqxC7V1TO3hBYJ2VsY+Sre0sf7CsKnGe2EZOU7OCFq75QBMpN23cvFHDjwF0a8o8wk
         WidEV44tRfWhUA4L7xhuTk3Oq62g1KOdSBYdCE75q7YKV/exKJwRAVlp0H+1msN5LpOn
         Rsr4l/nMvqmth+w8O5+aaWt8mk0viZXL+dNiaJSWUPQ3HEqgyxH86S+TLiaEl6FPZcnC
         c2LqPyYuJ37Zsjz7nIq50vfwGzLKxah0MZdgGu3tpqm1TjCYVnF/uWlLFy+QTJgKzyaK
         Xx2wDN8QJt1KaJQzTbqIs2PhE5kJwR+c6YhV447x5TgkrOSrVHus/tYU7JxJnfDPyRbV
         JlRQ==
X-Gm-Message-State: AOAM5320cs69uv35YarGE2FdHzsEK0sWOPUl4fN9QzPcesMMtmPmQ7/E
        G4tvsaMMg4RiPhzKFRhopjNmogMp6oqRPCQiJmw=
X-Google-Smtp-Source: ABdhPJwSpy6TjAx4Y4wAZw28Y//e/2ULbH/8Zxywkpj89ktvvx8ZFseipuRhWQOwxa/AbScghfDkJg==
X-Received: by 2002:a17:902:ba97:b0:161:524d:5adb with SMTP id k23-20020a170902ba9700b00161524d5adbmr42118884pls.126.1653650376106;
        Fri, 27 May 2022 04:19:36 -0700 (PDT)
Received: from [172.16.24.11] ([91.219.212.219])
        by smtp.gmail.com with ESMTPSA id q6-20020a656246000000b003f84815f6bdsm3204561pgv.82.2022.05.27.04.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 May 2022 04:19:35 -0700 (PDT)
Message-ID: <7a60b6e8-49ff-4467-ab76-f0147179d697@sudomaker.com>
Date:   Fri, 27 May 2022 19:19:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Ingenic X SoC cache problems
Content-Language: en-US
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, zhouyanjie@wanyeetech.com
References: <c102518f-3288-29fb-6653-0d39a53639df@sudomaker.com>
 <VHGJCR.M60L1GIL1X4U1@crapouillou.net>
From:   Yunian Yang <reimu@sudomaker.com>
In-Reply-To: <VHGJCR.M60L1GIL1X4U1@crapouillou.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 5/27/22 19:13, Paul Cercueil wrote:
> Hi,
> 
> What kernel version are you using?
> 
> Do you have the commit 1660710cf5d8 ("MIPS: mm: XBurst CPU requires sync after DMA")?
> 
> Cheers,
> -Paul
> 
> 
> Le ven., mai 27 2022 at 19:03:56 +0800, Yunian Yang <reimu@sudomaker.com> a écrit :
>> Hello all.
>>
>> In the past month, I was struggling with random memory corruptions and crashes on the Ingenic X1000. After some detailed testing, I need to point out, the current cache management routines seems to be incorrect for X1000, and maybe all X series SoCs. It mainly affects DMA operations. Every form of peripheral to RAM transfer will corrupt the RAM, and this includes the dwc2 and SFC's DMA and the PDMA controller. If all the DMAs are disabled (e.g. hard coding dma_capable = false in dwc2), it will be fine running CPU and I/O benchmarks for a week. If you have the hardware, you can enable the kernel data structures & memory debugging and see for yourself.
>>
>> So I went back and looked at Ingenic's old 4.4 and 3.10 kernel sources. They used a separate file (sc-xburst.c) for the cache routines, which is based on an very old sc-mips.c. And there are two important macros, called MIPS_CACHE_SYNC_WAR and MIPS_BRIDGE_SYNC_WAR. They're both set to 1. However these macros are removed from the kernel long time ago. The line `mips_sc_ops.bc_wback_inv = mips_bridge_sync_war;' seems to be the key point.
>>
>> Do you have any recommendations of what could be done to fix this problem?
>>
>> Thanks and best regards!
> 
>

I'm using the 5.17.5 kernel, so yes.


Thanks and best regards!

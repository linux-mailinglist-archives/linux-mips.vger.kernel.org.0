Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4B85371B1
	for <lists+linux-mips@lfdr.de>; Sun, 29 May 2022 17:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbiE2PvS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 May 2022 11:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiE2PvS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 29 May 2022 11:51:18 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25FF8703C0
        for <linux-mips@vger.kernel.org>; Sun, 29 May 2022 08:51:17 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id v8so13442646lfd.8
        for <linux-mips@vger.kernel.org>; Sun, 29 May 2022 08:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sudomaker-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=s+tcnPY6RDs/I3tvYQalyNObieEk8xx2Fm0hBzJoj0g=;
        b=1DjUROjFkP/ZoCxf/jclBoiNYiQWGxjin9upYPKq5V0kg6xyvetuI7s48K8poZURLR
         Y1Im6p0tul4FyHnWLDddwogUi9U5OwcSJ93zdJlvu4I4HQ10pQHz9uk5zheS+sIoOmFO
         BOqsWlo3dhCYK3gOFTc/MD4kK6RW07RLZiHZkmqKyS3a8Em59PsGAHuJmhYR5+fDgJFQ
         2iEpyJRTF5k7f+Y68hlFLXHuf1wxY/AA8meMPLQ3dgKYWrvwIQ+wuD0zCx/IF4KD1Y7T
         We2bGmstXEyD8f8cGaVViMExDB6uX3VmfgfQMPiNH6/QBAhAd3/OT33zHQSsYPGSF+Vi
         wMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=s+tcnPY6RDs/I3tvYQalyNObieEk8xx2Fm0hBzJoj0g=;
        b=HZGV1X/qUmlLFylXOHO7L8n+ouIBwPgD4wn+A0ctd6pGhuHpvNc0C2LpkRlFGmWdap
         P8PMjJfClQkV2Wyvh+OmSeZBoHR3hTBtv0baJJMvXgU7+rQvRC0NHdKnx/7zCeRqRKXd
         51cZX0uYsu0BpPbQS3bup58mTYe9soGD4zsgJ8IuWRbpMluwS1lHENJcnPKfNpINuhIz
         U3oOojP4453Xb48ByxZc4/gnRKmG2WP65sz4IV3LEgBDUcORFRZMTr5vEGqs73kjfY1i
         WU69GPUpXaiHjMZGALR8MSUSTSkIEmIKMr4GZmA2kkgKGqMmrbsmhLhyUKFBy8Nyo2GA
         g7mA==
X-Gm-Message-State: AOAM530RXMscUkqJiXELaTLo66bcGB96ok+H7ZNer1qOSITGuBg7Moi3
        DkTPROk7bMeY4gKxYDxQZSmOKkogSVwyPpWLXMc=
X-Google-Smtp-Source: ABdhPJwBvGC6mPG38RqIOPz0gedGUX/AAzvzq2sNz8JOAAfaZ3nYweYfS/qDbJKr77xwvNpsYW0i8A==
X-Received: by 2002:a05:6512:2625:b0:478:5a51:7fe3 with SMTP id bt37-20020a056512262500b004785a517fe3mr29416853lfb.158.1653839475200;
        Sun, 29 May 2022 08:51:15 -0700 (PDT)
Received: from [172.16.24.11] ([91.219.212.219])
        by smtp.gmail.com with ESMTPSA id be10-20020a056512250a00b00478cd831077sm883605lfb.271.2022.05.29.08.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 May 2022 08:51:14 -0700 (PDT)
Message-ID: <6235834d-d6bf-1567-6b4b-4131515baabd@sudomaker.com>
Date:   Sun, 29 May 2022 23:50:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Ingenic X SoC cache problems
Content-Language: en-US
From:   Yunian Yang <reimu@sudomaker.com>
To:     linux-mips@vger.kernel.org, paul Cercueil <paul@crapouillou.net>,
        zhouyanjie@wanyeetech.com
References: <c102518f-3288-29fb-6653-0d39a53639df@sudomaker.com>
In-Reply-To: <c102518f-3288-29fb-6653-0d39a53639df@sudomaker.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Brief update on the current situation.

I have been working with Professor Zhou (zhouyanjie@wanyeetech.com) to diagnose this problem in the last 2 days. After multiple tests, we finally pinpointed the problem: the SLOB allocator.

Using unpatched 5.18 kernel, under stress test, all DMA operations worked like a charm w/ SLAB or SLUB, but not SLOB.

The stress tests were conducted using the CU1000-Neo board. DMA-enabled components were: SPI & MSC (using PDMA), and dwc2 & SFC (they're bus masters). Also, the memory & kernel data structures debugging were ALL enabled in order to catch more silent memory corruptions. It involves performing these operations together:
1. Continuously reading the eMMC storage via MSC0 (while :; do dd if=/dev/mmcblk0 of=/dev/null bs=1M 2> /dev/null; sleep 1; done&)
2. Continuously reading the SPI NOR storage via SFC (while :; do dd if=/dev/mtdblock0 of=/dev/null bs=1M 2> /dev/null; sleep 1; done&)
3. Continuously refreshing a ST7789V SPI LCD using the fb_tft driver (while :; do cat /dev/urandom > /dev/fb0 2> /dev/null; sleep 0.2; done&)
4. Enable the USB CDC ACM gadget and continuously transfer large amount of data (PC side: cat /dev/urandom > /dev/ttyACM0) (X1000 side: cat /dev/ttyGS0 > /dev/null)

With SLAB or SLUB, the X1000 survived these tests for more than 30 minutes. No silent corruptions were reported by the kernel.

With SLOB, it instantly dies at the boot process (before init). Sometimes it's a linked list corruption, sometimes it's a null ptr dereference, and sometimes it simply becomes silent.

I always used SLOB for devices with little RAM and thought it would be beneficial. But I never thought it would be a problem.

Should this be forwarded to the linux-mm mailing list?

Thanks and best regards!

On 5/27/22 19:03, Yunian Yang wrote:
> Hello all.
> 
> In the past month, I was struggling with random memory corruptions and crashes on the Ingenic X1000. After some detailed testing, I need to point out, the current cache management routines seems to be incorrect for X1000, and maybe all X series SoCs. It mainly affects DMA operations. Every form of peripheral to RAM transfer will corrupt the RAM, and this includes the dwc2 and SFC's DMA and the PDMA controller. If all the DMAs are disabled (e.g. hard coding dma_capable = false in dwc2), it will be fine running CPU and I/O benchmarks for a week. If you have the hardware, you can enable the kernel data structures & memory debugging and see for yourself.
> 
> So I went back and looked at Ingenic's old 4.4 and 3.10 kernel sources. They used a separate file (sc-xburst.c) for the cache routines, which is based on an very old sc-mips.c. And there are two important macros, called MIPS_CACHE_SYNC_WAR and MIPS_BRIDGE_SYNC_WAR. They're both set to 1. However these macros are removed from the kernel long time ago. The line `mips_sc_ops.bc_wback_inv = mips_bridge_sync_war;' seems to be the key point. 
> 
> Do you have any recommendations of what could be done to fix this problem?
> 
> Thanks and best regards!


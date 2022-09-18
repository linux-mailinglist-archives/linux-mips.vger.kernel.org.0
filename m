Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4AF5BBFD0
	for <lists+linux-mips@lfdr.de>; Sun, 18 Sep 2022 22:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiIRU3K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 18 Sep 2022 16:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiIRU3J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 18 Sep 2022 16:29:09 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EBED1401E
        for <linux-mips@vger.kernel.org>; Sun, 18 Sep 2022 13:29:08 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id f23so9928801plr.6
        for <linux-mips@vger.kernel.org>; Sun, 18 Sep 2022 13:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=o+Gxn2cPSSzd7lUTMPs9mUaoGflxYvHVdHLbNLyYS+Y=;
        b=XXAmHnzQSgECvZMu35YD5jk3Z0eWD8YM62so3RPjZi1ja3Tt0vpBx/uetUAVQ0iYVv
         OFK3gXvcgj0SuaIHrPZHPf0JnL7gISJWWeKoA06LsBLgYy+J5wqOBdWK3NvLBluf48Ih
         TSt7Qy13x2nmRQ3iWkkdeXpPBQm7Bg3n6uyopGzPR69v8AZLDp5fm7o5GgaCEc8eBZaj
         RLwWveplEFYHuB3K6HtkdDGlGrlRrae/VescqgkLjMCZ0TwcQBQI94pHktzyRIld45yY
         jejb280cpBSaCY/d9IW5PDUgj4nfFJzA2cutNu7Vb3C4F4jUTAA1nbMCDyqfCgNxZcQ+
         71ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=o+Gxn2cPSSzd7lUTMPs9mUaoGflxYvHVdHLbNLyYS+Y=;
        b=PwOPnZf1FNMuOzutNOlP36gTyL12qGJlap/LP3JCsSSux+vM/EQ+uOGKeOk+LgYqVe
         Z7ZHJdBl+myXntPTyAMPf1bHwgVYo1wxXD+DL3NHELAllC3IuTt+z5dpQf78sBc9AJY+
         HLK/js/Rkj2hy6cXFUCfrGTRgBqQWLvVQNxVQ4DgFb8Bxmf7fOtZFGSfr8SPQOMO3urU
         PaduL5qVJvvD1Zo19wjT84/3vSZuPKCFCM4dBX2XOKunL3dO5utJXlUJT26SIw6w5X9M
         2rO2pAJYjE3+rPMYVs/jitqHACarYUIcbuP61duqHCnU7vWd/YT1vGuyAQLIWzOUvbZE
         UR0A==
X-Gm-Message-State: ACrzQf3WlvbwEOr8C9yPumtZ5mYnpQmWSviC1vNRUR6lXLPDdG6fg2hE
        JWVg6+fB8Nh6qwErrSJJAGU=
X-Google-Smtp-Source: AMsMyM4eTtw8yTQykaSnXxiqUoGo5ckajeikrePQcfU+jhv9EKWOqd2TDNvif13RgpTUwWVuQgQUrQ==
X-Received: by 2002:a17:90b:388d:b0:202:be54:1691 with SMTP id mu13-20020a17090b388d00b00202be541691mr16851090pjb.31.1663532947694;
        Sun, 18 Sep 2022 13:29:07 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id c13-20020a170903234d00b0016f85feae65sm19205153plh.87.2022.09.18.13.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 13:29:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= 
        <philippe.mathieu.daude@gmail.com>
Message-ID: <3a2c8c5e-8cd0-62d5-9538-410db535dcc0@amsat.org>
Date:   Sun, 18 Sep 2022 22:29:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] platform/mips: Adjust Kconfig to keep consistency
Content-Language: en-US
To:     Huacai Chen <chenhuacai@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Hans de Goede <hdegoede@redhat.com>
References: <20220918101206.2381321-1-chenhuacai@loongson.cn>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220918101206.2381321-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 18/9/22 12:12, Huacai Chen wrote:
> Drop the "if MIPS" and "endif" drivers/platform/Kconfig. Instead add
> a "depends on MIPS" to "menuconfig MIPS_PLATFORM_DEVICES" in drivers/
> platform/mips/Kconfig, like all the other subdirs are doing.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   drivers/platform/Kconfig      | 2 --
>   drivers/platform/mips/Kconfig | 1 +
>   2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


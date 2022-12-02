Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10414640A53
	for <lists+linux-mips@lfdr.de>; Fri,  2 Dec 2022 17:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233782AbiLBQMG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Dec 2022 11:12:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233757AbiLBQL7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Dec 2022 11:11:59 -0500
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B63ACA5C
        for <linux-mips@vger.kernel.org>; Fri,  2 Dec 2022 08:11:58 -0800 (PST)
Received: by mail-ua1-x934.google.com with SMTP id q6so1817860uao.9
        for <linux-mips@vger.kernel.org>; Fri, 02 Dec 2022 08:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TAefJrRL7K4A+RMGngmdLs8YqkmKSbBIjbXCxnKmhbs=;
        b=OTdGscoyyXY4sJr8w9cmCX0xSvhEErZUBMdHPPKX/5+iYfWQdgtRA4jjcNYzRwCGFQ
         rU6lS4qgX5LkqwunFDKXyrFmNIkukP6ir/ILfkqTFuvG0gbbtlUSljSwUxGUOl2HDdET
         SwhUO7sNYmbE+qzpnT3fuzzUzQU/YUivMVuklk0khfLjB7pEbm1EvNDxRMGtRV1KIzC0
         zeEhRu5/xAlTU2/SPZ8ZHZNt+Z3ZT0Wg+Odu6EdGqbdqbwDF2yJz/eh/QzqqDYuXMEDk
         3VHckgxrYQUX1IKG4EAs/X+d4p66OEl+1gbN16LQZjnW4pULS6EOCE0G+0jvhUMmmWVG
         oCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TAefJrRL7K4A+RMGngmdLs8YqkmKSbBIjbXCxnKmhbs=;
        b=5w+1T3CzJdapdpiQXCmZOMiCrE3mW3AYKpbdRMXSY+1Ft4/G0qlH2RODQhgiSWqdUV
         JJYIKMmWEZGNgBcc7TnZFMnXh0Ek2LCOQWols5NIjYtzBOINQ4mNbYBKrPdQbiyetJ1+
         esOayGz4NVg22a8+loRXgef0qO8sF9K4UKBQqoZ7vPVk1kV6hvrSqbsj8pylzP+vN2DH
         YS517+/iGFF4NdCipam+JqTm09cv1+qDIu02gDTVOaEq91gIIgDT5FvlthPKPdm16T70
         fbF2fTkr8joSPHkqb5zr2QD1rpyC+LtcR5rwFwQFL8/7SJIx/+/jZ+U8F18gXsjG+1Ws
         wHfg==
X-Gm-Message-State: ANoB5pnEMMeYlTunBJvIy8C5ggsIneozASxNjQeFLEXGFSOWMCp/TOsn
        V7Did98i168CSCbmeSKKZ72NpFrsuGwaiZ34rILzoQ==
X-Google-Smtp-Source: AA0mqf6y8bCMPq1LTVZ8bKCUOnTJ4Vq1GPxxgwR2WlG4b/Lw466vVq5YLikadhKWjms/IOLGdHK46U6YPHGpuihZdkw=
X-Received: by 2002:ab0:734e:0:b0:419:18c7:58d with SMTP id
 k14-20020ab0734e000000b0041918c7058dmr17210680uap.119.1669997517287; Fri, 02
 Dec 2022 08:11:57 -0800 (PST)
MIME-Version: 1.0
References: <20221201123220.7893-1-zhuyinbo@loongson.cn>
In-Reply-To: <20221201123220.7893-1-zhuyinbo@loongson.cn>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 2 Dec 2022 17:11:46 +0100
Message-ID: <CAMRc=MdSfw2-qbcOReEKnhNj4QaTy4mkJL+fH3m7nTBuLhxZaw@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] gpio: loongson: add gpio driver support
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Bibo Mao <maobibo@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        Arnaud Patard <apatard@mandriva.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Hongchen Zhang <zhanghongchen@loongson.cn>,
        Liu Peibao <liupeibao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 1, 2022 at 1:33 PM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
>
> The Loongson platforms GPIO controller contains 60 GPIO pins in total,
> 4 of which are dedicated GPIO pins, and the remaining 56 are reused
> with other functions. Each GPIO can set input/output and has the
> interrupt capability.
>
> This driver added support for Loongson GPIO controller and support to
> use DTS or ACPI to descibe GPIO device resources.
>
> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
> Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
> Signed-off-by: Liu Peibao <liupeibao@loongson.cn>
> Signed-off-by: Juxin Gao <gaojuxin@loongson.cn>
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Both patches applied.

For the future: please reverse the order of patches and send dt
bindings before the driver code.

Bartosz

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05B4A4EBCFC
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 10:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237381AbiC3Iyq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Mar 2022 04:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244464AbiC3Iyq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Mar 2022 04:54:46 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC7ADFB2
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 01:52:59 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bt26so34579508lfb.3
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 01:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yKe7e9T0RaFZGB59JE9JfPGJ/lFJwLZyaREaWAho0Ck=;
        b=h22v51XIt1vj/wOy6v8dzb+yGjBLEoUWrlE/U0LX2QIW/BVcjBPEUJU20DeRgpr1a/
         +dzCJlbo8DfQWJLOKQUu8dT1Zwewq7+2LhuDa5HaWURT+p4wVt6Z5I0S59QeK9Bt4lrA
         NOzhWd0LGN46qNJ01DtydGDX1I5s6Bpo9PFD1lEs2bdm21L+sGVFoQYoMl3UorvMavoo
         8Kpnc6utxBvz9b6V57WfdQgcULXsZeXsenBJKaw/Ggfav3Mbvq3vGtxDWRNvGJhCH+Dt
         aRc4xLmOS1P8Ennvj222wIer4qx2Wq5/X45H0nfjQkXoqCRgtXD1vePgKlVp+0ucZdjC
         Fwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yKe7e9T0RaFZGB59JE9JfPGJ/lFJwLZyaREaWAho0Ck=;
        b=J0GeDKH/nZFNwQyK6BHoROqUGa2bxjnvoqJeewoJ5VUah/xLu9BAk6zj0sOsW5td8x
         jCT52AGejWkCxm8zwXrzlGOE65HTXCIwziveEcehz9tXY24lI8Vq1PtxXEaQ2seYQPxt
         GLTvvsjuws8GUpnrmmT5ryNzPz5WcLRAQoOOFizaI4XHUCWinMaizfvcTMMC8eWyKbq8
         3VMpXaUuYV0MCNI+6uHxZEqvXfcJ+q5fYjW1Xpb7mQ+gsi+FD0m2nYD4TVs+xHgqanyv
         IH+Iq94Fph6wEDlF/u3bR9ANpFMBIaCT9OIMa/HCNrqgbk+s4GxKM2FahRbDpasmVcPz
         LEfg==
X-Gm-Message-State: AOAM533OJRr7ny+UBpr3NeaiO0x3avdpfYBSLVoReUgbodS5riRm0kRA
        H41vdTNtxjMV3KEV+xrBL5E=
X-Google-Smtp-Source: ABdhPJxmT0sZEjAjEv4Y8Lwc9ikA1HFEXJ34v49gneLy6TGj3tzFqSIf5I2WE4wDmd5PDzjQuXsfIA==
X-Received: by 2002:a05:6512:4004:b0:44a:74de:f23e with SMTP id br4-20020a056512400400b0044a74def23emr6228068lfb.561.1648630375289;
        Wed, 30 Mar 2022 01:52:55 -0700 (PDT)
Received: from [192.168.1.103] ([178.176.74.147])
        by smtp.gmail.com with ESMTPSA id k2-20020a056512330200b0044a096ea7absm2262891lfe.54.2022.03.30.01.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 01:52:54 -0700 (PDT)
Subject: Re: [PATCH v3] MIPS: rb532: move GPIOD definition into C-files
To:     Jackie Liu <liu.yun@linux.dev>, linus.walleij@linaro.org,
        ralf@linux-mips.org, tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, jic23@kernel.org,
        andy.shevchenko@gmail.com
References: <CAHp75VcAL6avNxMSVo9nWbxXOnKmXAiuGMV=uWwAx0BdHnf-+Q@mail.gmail.com>
 <20220330020727.3303088-1-liu.yun@linux.dev>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <cd575f70-5475-b2b0-1b71-93ebf3b14ccf@gmail.com>
Date:   Wed, 30 Mar 2022 11:52:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220330020727.3303088-1-liu.yun@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/30/22 5:07 AM, Jackie Liu wrote:

> From: Jackie Liu <liuyun01@kylinos.cn>
> 
> My kernel robot report build error from drivers/iio/adc/da9150-gpadc.c,

   Reports.

> We define GPIOD in rb.h, in fact it should only be used in gpio.c, but
> it affects the driver da9150-gpadc.c which goes against the original
> intention of the design, just move it to his scope.

   s/his/its/.

> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> ---
>  v1->v2:
>     Keep GPIONMIEN and IMASK6 as hardware document.
>  v2->v3:
>     he to it.

   What? :-)

[...]

MBR, Sergey

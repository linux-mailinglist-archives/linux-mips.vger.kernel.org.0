Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA2AA3B6659
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 18:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbhF1QGE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 12:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232012AbhF1QGD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Jun 2021 12:06:03 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A31C061760;
        Mon, 28 Jun 2021 09:03:36 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id q16so19328727lfr.4;
        Mon, 28 Jun 2021 09:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9+6mDKjcYk8hmZtLfRjkLtLnizKdu7+ND6kkw+plZIs=;
        b=WehXqygcDRvt7H9HPjI5+m5XGpLgfQrl2S4E24ioukuled6AKRRPWT6tZJFIsjbv6x
         feAJbp9u4Y0M1ZAIef8CTj+XcaiQaoygNxtKSD02zlkdSy1nQ7IsQAw+golDYdRnxw+V
         g0Cn1LTPqgn6gaQKz80QNVDm5o+/yw7nGphsowuJmLcchup/B0mLLaj7HxQo0SIpC/Fq
         LbsowaQ3lZkLTDwpSTOFFdZRrU5S0o8U+BpInNBQ6UHzHv3NlOarIqRDcNgogLsJpeAy
         G827P/fyaUcOI8tawXeElqqpKCGgkb8IFA0eKXioxSmVbVqiXCTjwzISSnsZU1QUGs6i
         u7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9+6mDKjcYk8hmZtLfRjkLtLnizKdu7+ND6kkw+plZIs=;
        b=bLuMY66XAeLsf4Iugp5i87fEkWEmF5OmyVxwgWZ/W0fIwxR18tQySoLp1IXTxmIBwK
         //Lmm2uIt4/ffW+HCd2y/SG7THSJjZIg2eISqMbiE8xRmz6G8ZKJhZXidLGegNrE5ZOS
         wbLtA2WyBLge4WvNa/eNvvK1wQsLn8lWOG1mnX/exmvgUioEgFoFlWsdx1U4qD0k3ltZ
         OC96Nac8ZAEaYli92gAZi+pcGuHJa051Ala1D5s3t64pb2FqGA+ScyhO0CS5bBAZ7iE9
         DNnK9LWE/Qtmv0hpRfTeRNrYy/kKVLzGhFIDHEgn/P2el4l/y9HgfT51vK1dk5ANyX3e
         uKDQ==
X-Gm-Message-State: AOAM532uP+ff+nKqcbU4D/KZP4vSca9f3vnwgZ2kOGnxLEwwGZ5xR5FX
        biuyChB5yk6H78PMz+MdShrIxb8r0f8=
X-Google-Smtp-Source: ABdhPJwWRp7/DULQ49/P2nsYmvnte9IYLgVFSaYn2unNvjpyxcxi5BzVuL73LsQA3ECbcHYRzHP79w==
X-Received: by 2002:a19:ef0b:: with SMTP id n11mr19284891lfh.119.1624896214269;
        Mon, 28 Jun 2021 09:03:34 -0700 (PDT)
Received: from [192.168.1.102] ([31.173.82.94])
        by smtp.gmail.com with ESMTPSA id f15sm1348944lfa.56.2021.06.28.09.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 09:03:34 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] MIPS: Loongson64: Add pm block node for
 Loongson-2K1000
To:     Qing Zhang <zhangqing@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210628151330.11952-1-zhangqing@loongson.cn>
 <20210628151330.11952-2-zhangqing@loongson.cn>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <697cd16e-7131-95d6-6e0b-1034d493b3ce@gmail.com>
Date:   Mon, 28 Jun 2021 19:03:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210628151330.11952-2-zhangqing@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 6/28/21 6:13 PM, Qing Zhang wrote:

> The module is now supported, enable it.
> 
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
> 
> v3-v4:
> No change
> 
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>  arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> index 569e814def83..e31176ac0ac2 100644
> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> @@ -101,6 +101,15 @@ uart0: serial@1fe00000 {
>  			no-loopback-test;
>  		};
>  
> +		pm: power-controller {
> +			device_type = "power management";
> +			compatible = "loongson, reset-controller";

   No spaces allowed here, AFAIK.

> +			reg = <0 0x1fe0700c 0 0x8>,
> +				<0 0x1fe07014 0 0x8>,
> +				<0 0x1fe07030 0 0x8>;

   Better keep those aligned...

> +			reg-names = "pm1_sts", "pm1_cnt", "rst_cnt";
> +		};
> +
[...]

MBR, Sergei

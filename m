Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4683B7711
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jun 2021 19:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232618AbhF2RWj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Jun 2021 13:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232284AbhF2RWj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 29 Jun 2021 13:22:39 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F6BC061760;
        Tue, 29 Jun 2021 10:20:10 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id h6so15826420ljl.8;
        Tue, 29 Jun 2021 10:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LK5PQkS14wpetJcASWpCkEN2Wd6IM2V31FOvQQneP2w=;
        b=f99Fj/YrcvxKZIpbq+97B3RhPbybF/gF5J7neDsWNfSdqlwdL7quuIGbsdgHzN0lNZ
         JSnG9RSWcGiQJjY2ui5XK7zoYD816pqFmqP1gArn1pewGhz2dcr4b0V6IiClnQPena5I
         8AU6qfqXa6+Svfq/h9fWYV4QCzO6/ZaUDRvSeSfKZea92XQ1j2m2GS52+AY9rmYzzBoA
         zxBZ64ryFJMN61s/DVBiFqygIfsJRqNGRCoHVFZwY2lzFbNIsTQJ4idflxQb/CxVm5CO
         2Oxr2JLEy9XJvtFTG4395GnAoKJ38ZnohoqaDYAUzSHN+8t4sj+b9uvcEJuCCovVo2uI
         ItGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LK5PQkS14wpetJcASWpCkEN2Wd6IM2V31FOvQQneP2w=;
        b=Yy6ak+/Wc/plIGH91mpep3WHgnsO2KKvLPZmooM+6IraPWn5XR/0UmfqWvf5PI6OMp
         SH+M5Ngi/k6ZiLiNOoOljdmGb9gL42ocnRI2KqkJzR649Ni6ojHPqzUqB/jIDHV+Q8Y3
         9i1Xx01cNVo5+G1H61jCyzE5CoMT3Apehu/JPa7FaGDoXkdDjybU2zN2UDBE2Rqhwv/F
         vZAPBu7c0IM31v1OHCA8ZDgQbMYCghXCTJmaxACxAcJ4QfGAAYzd5VJSN+ZCFweQdlvA
         67OFhauT+g/3Nw54DDSk/+wpvEMQnyi6d/YZxwfTV81fjc4s6rjdnMew66fLxhMAqbNu
         nt+A==
X-Gm-Message-State: AOAM530nFy5XJEkkBMIqeiRY2chZVfdzHPuG0lA7QJaJcGM4ojtB/WHU
        VWA8KMjKY3xcynIcTRzz1P47svhNh5k=
X-Google-Smtp-Source: ABdhPJxW1kviTBnANF8eECQin5QSCZVDG6gyzsn+HPScc1Q5dP9+/YCLCng490d7rW5uubzuLvhAQQ==
X-Received: by 2002:a2e:9a52:: with SMTP id k18mr4688098ljj.315.1624987208867;
        Tue, 29 Jun 2021 10:20:08 -0700 (PDT)
Received: from [192.168.1.102] ([178.176.72.235])
        by smtp.gmail.com with ESMTPSA id t14sm1675527lfd.14.2021.06.29.10.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jun 2021 10:20:08 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] MIPS: Loongson64: Add pm block node for
 Loongson-2K1000
To:     Qing Zhang <zhangqing@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210629011913.18611-1-zhangqing@loongson.cn>
 <20210629011913.18611-2-zhangqing@loongson.cn>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <7caf171a-7d7d-4f2a-a065-58fadace690d@gmail.com>
Date:   Tue, 29 Jun 2021 20:20:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210629011913.18611-2-zhangqing@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/29/21 4:19 AM, Qing Zhang wrote:

> The module is now supported, enable it.
> 
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
> 
> v4-v5:
> add missing spaces
> 
>  arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> index 569e814def83..38bf14f00694 100644
> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> @@ -101,6 +101,16 @@ uart0: serial@1fe00000 {
>  			no-loopback-test;
>  		};
>  
> +		pm: power-controller {
> +			device_type = "power management";
> +			compatible = "loongson, reset-controller";
                                               ^
   When I said te space aren't allowed, I meant this place. :-)

> +
> +			reg = <0 0x1fe0700c 0 0x8>,
> +			      <0 0x1fe07014 0 0x8>,
> +			      <0 0x1fe07030 0 0x8>;

   TY! :-)

[...]

MBR, Sergei

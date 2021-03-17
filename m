Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E812C33E285
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 01:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhCQAKU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Mar 2021 20:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbhCQAKH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 Mar 2021 20:10:07 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC16AC06174A;
        Tue, 16 Mar 2021 17:10:06 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id r20so1016984ljk.4;
        Tue, 16 Mar 2021 17:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AL2V8ZWV46qlhc0ml5uYpEwu/MvbJHiNjsNGUT8atiA=;
        b=Agdag1tBJMN2CcCDWRaycmcZsxlpQCsykGn/xj/L8ZF7pmtY1He3O4QBRdXKxYuAYn
         /Quk8pRXS25wLV7qB1Rlf66XSgfBwkon1wvPb20rNMcz+P+OV1T0E290UqzyNGrBtq3A
         fby84G56vIyDqKcjZ9kONJidstWPxVTknRhA2IGDm/gxgQtQrloh68PQdFNwGFcsGSJq
         /t7wtpliOOyFRQkcN0RNQxI4DbBG5nzESRCAtb71IuXe3/oVM7b243DNlltQSZqgMyCc
         LdxoMYo49u4Oaoqa05eMZjPyswO5BgwHMlluDYcnsu7ikc5lBXhK5LFID1gmvS37StZg
         jtrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AL2V8ZWV46qlhc0ml5uYpEwu/MvbJHiNjsNGUT8atiA=;
        b=TuQ8Ux1XTt51wJUVLu+dK3tMhxm561lBt1k8/bXlmuqmCzv/s1gLIAzcS3DmxfVEdY
         gTQhByok5ewdbtjH453g/1jme8h9mVvpHo0KsiiGES1K21l3LUK80d+LPPjuBLOWpl2k
         Js9EVmbfS9vazDGAhx6BLTZjCJNqQDW0DK7oCr4sOTNd+ciuQUNpuiOETJIVWiPrrQUU
         zv4B8T0XXPUkgxNgEPIP7Ilgq9GqYHVvFsNaMAmWnHtAl2FhW89ncsVW97xMdyif/hHk
         H2cUYKT5fA0jHJgj/ukn+qdWj5hiiHjuPo7pZ2qwGKLXtm8ApEjRoAvxzooEGh+6CO/r
         /mXA==
X-Gm-Message-State: AOAM532ZQLJYSMHTPZNMpcG/XlSevGUN5flWT0qeMnLGbTMUZ6aOSWBp
        ED8WI0jvnww3KWQ96WerVwE=
X-Google-Smtp-Source: ABdhPJwRzvkNlUJpiFNF69aoxvvhbSsqtWtPRIf5DO9f16I5A+wX666iLi+smMVA7+bdshV2OAnwFQ==
X-Received: by 2002:a2e:9e8e:: with SMTP id f14mr783096ljk.140.1615939804827;
        Tue, 16 Mar 2021 17:10:04 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id 194sm3228320lfd.116.2021.03.16.17.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 17:10:04 -0700 (PDT)
Subject: Re: [PATCH] MIPS: ralink: define stubs for clk_set_parent to fix
 compile testing
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
        balbi@kernel.org, linux-usb@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20210316175725.79981-1-krzysztof.kozlowski@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <44ce8a32-91ff-bb6c-adba-f85c2edf3c18@gmail.com>
Date:   Wed, 17 Mar 2021 03:10:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316175725.79981-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

16.03.2021 20:57, Krzysztof Kozlowski пишет:
> The Ralink MIPS platform does not use Common Clock Framework and does
> not define certain clock operations leading to compile test failures:
> 
>     /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
>     phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  arch/mips/ralink/clk.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
> index 2f9d5acb38ea..8387177a47ef 100644
> --- a/arch/mips/ralink/clk.c
> +++ b/arch/mips/ralink/clk.c
> @@ -70,6 +70,20 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_round_rate);
>  
> +int clk_set_parent(struct clk *clk, struct clk *parent)
> +{
> +	WARN_ON(clk);
> +	return -1;
> +}
> +EXPORT_SYMBOL(clk_set_parent);
> +
> +struct clk *clk_get_parent(struct clk *clk)
> +{
> +	WARN_ON(clk);
> +	return NULL;
> +}
> +EXPORT_SYMBOL(clk_get_parent);

I'm wondering whether symbols should be GPL or it doesn't matter in this
case. Otherwise this looks good to me.

Also, I guess it should be possible to create a generic clk stubs that
will use weak functions, allowing platforms to override only the wanted
stubs and then we won't need to worry about the missing stubs for each
platform individually. But of course that will be a much bigger change.
Just wanted to share my thoughts.

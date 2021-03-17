Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB83533FACA
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 23:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhCQWK6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 18:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbhCQWKb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 18:10:31 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C196DC06174A;
        Wed, 17 Mar 2021 15:10:30 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 184so5080190ljf.9;
        Wed, 17 Mar 2021 15:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jInIeluqvTQleYJzMHLmzH7xQdcuoaWwG9ATKWipyQ4=;
        b=RshQX9WGO8cPSbuXkFjAJLckNFFoidrQwyzYSS4SUdjelOUCcEBNBqLBQ94GP7mQVQ
         i7pWUMMVM6gsNknHh0cfkWVZy0vV2MRcJmAlqq4dsC/Ltjues1Yodm6OG8eQT2Fp7mHd
         K67GPbcrEiWCZK+y7XCD2SIo8NoU0pF/VH9N3XI24rWwhIyzPwDnWhpw3i0RPRs68dTl
         rBJdYW1cWuBF+mvAhy+Fu7QH9MJspPoU21GCeC5onvKuisn0zkGwN4a2g8Pf2pvhV2pt
         ud/DWN58vB1T2KEaSBpp9MuOhgtq3ZKFLO9zTQUn4Sx3NLVrh9KK2J20BnEtGQed9Wow
         EhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jInIeluqvTQleYJzMHLmzH7xQdcuoaWwG9ATKWipyQ4=;
        b=oGu0TeDwiL6hGBwU29FDOIFLLtDRhhJv27UNfoPNyxQSocM4+Pu6kJT3EjFMKfoL/e
         HcIw3RIvyC4eSWOcPgO+BNxk2q+vXod6W/RgG3+k0VeKtoy8tcolLnp/2xBGDQmztgEh
         8wApeVO2Kx9GsKZrZEpadC8wkhgB6e8cwPzknCmuMGV2TpoXOE7CgUxh4LcggUC2QpaO
         Ajhjz9twNQXtEKmZkAfvpS+LpHsXMz10fz1V2Cp1BmFPlvIOJtmEEO9KCu40VNtebD0M
         p3nQPKukGU4cNgAZdVq6aR1XC7QrouvnsOkqfh2cwkcco8Ouf63mEYyoKiscf71iCX5V
         BiLA==
X-Gm-Message-State: AOAM533D5ZNYq+ucpRxYVYIHfFy8HkNWHBIrsE4pdzCuNmGEzuatxLT2
        Ptzsawl8UaPktvf6X8bOJhxXIQeKMZQ=
X-Google-Smtp-Source: ABdhPJzWK6Ly8rIifH/aY1O0IXDRzf+trF1Ch6Ien/kRll9e9ZmHcY4c+e1wOIm0TEES61W8O0KC5w==
X-Received: by 2002:a2e:800b:: with SMTP id j11mr3684718ljg.94.1616019029367;
        Wed, 17 Mar 2021 15:10:29 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id b25sm26789ljo.80.2021.03.17.15.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 15:10:28 -0700 (PDT)
Subject: Re: [PATCH v2] MIPS: ralink: define stubs for clk_set_parent to fix
 compile testing
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     sergei.shtylyov@gmail.com, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org, balbi@kernel.org,
        kernel test robot <lkp@intel.com>
References: <20210317112644.24502-1-krzysztof.kozlowski@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <74489d6d-1026-40fa-48af-4954d12671af@gmail.com>
Date:   Thu, 18 Mar 2021 01:10:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317112644.24502-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

17.03.2021 14:26, Krzysztof Kozlowski пишет:
> The Ralink MIPS platform does not use Common Clock Framework and does
> not define certain clock operations leading to compile test failures:
> 
>     /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
>     phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: John Crispin <john@phrozen.org>

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

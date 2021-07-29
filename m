Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4E33DAE66
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jul 2021 23:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233654AbhG2Vhl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Jul 2021 17:37:41 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:34794 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbhG2Vhk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Jul 2021 17:37:40 -0400
Received: by mail-io1-f49.google.com with SMTP id y200so8960861iof.1;
        Thu, 29 Jul 2021 14:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GL2xSmRw9g0iLLIt1gTK3ClUNCp2GnYQ9igmDGoEG4M=;
        b=en935AnxchPVDoFvrN9C6MZMZiTX1snBoHTN0zxEQVbw4VuG/3aYLKzeGlmmcwmc7g
         hjmL1p9rSFAPHRZibclsUrklel+Kq+IhF18S1GwE0BlnffKE2aVQH8vftpGxxdssQxJ5
         GHNtY0nk/HGH1DnwFkuT8D/NH3SQckG2voG1ZzjznrGKGWqM13mc+DXbGxs7xQmtUB3C
         lWKT9xu/OkGYS3AJ67Pzf/n/54/S2YugCdEC3Q38OYrixqB8LYUg91BAvzomPJQocYXj
         Od4tvlKjhXCncHIUoogvhcL901pJK7vkSByH8AaqsClBU7k9mYWK/qWnjiYD/Jnj0yoK
         FeZw==
X-Gm-Message-State: AOAM531l/mv64kYRXrKwU3rRntzRDhvDqWF8HPAWKbCGMl+06lQ8rN0P
        MWqIqL/NVYknF5C2Lu89lA==
X-Google-Smtp-Source: ABdhPJyy8HuRAYhK5y+PnEaKuzrXKNGyVb1CWy2JPFLvNMFzBGisXDpLpFgVdfyzMW3yrZGX6ohyiw==
X-Received: by 2002:a6b:7619:: with SMTP id g25mr5564090iom.151.1627594655721;
        Thu, 29 Jul 2021 14:37:35 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k4sm2981683ior.55.2021.07.29.14.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 14:37:34 -0700 (PDT)
Received: (nullmailer pid 938779 invoked by uid 1000);
        Thu, 29 Jul 2021 21:37:33 -0000
Date:   Thu, 29 Jul 2021 15:37:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     rick.tyliu@ingenic.com, linux-gpio@vger.kernel.org,
        sernia.zhou@foxmail.com, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul@crapouillou.net,
        linux-kernel@vger.kernel.org, aric.pzqi@ingenic.com,
        jun.jiang@ingenic.com, sihui.liu@ingenic.com,
        dongsheng.qiu@ingenic.com, linux-mips@vger.kernel.org,
        linus.walleij@linaro.org
Subject: Re: [PATCH 3/4] dt-bindings: pinctrl: Add bindings for Ingenic X2100.
Message-ID: <YQMfnQoUjOfjsIGh@robh.at.kernel.org>
References: <1627108604-91304-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1627108604-91304-4-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1627108604-91304-4-git-send-email-zhouyanjie@wanyeetech.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 24 Jul 2021 14:36:43 +0800, 周琰杰 (Zhou Yanjie) wrote:
> Add the pinctrl bindings for the X2100 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

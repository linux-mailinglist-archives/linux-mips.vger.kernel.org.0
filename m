Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614753DAE6C
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jul 2021 23:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234022AbhG2Vif (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Jul 2021 17:38:35 -0400
Received: from mail-il1-f171.google.com ([209.85.166.171]:34548 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbhG2Vif (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Jul 2021 17:38:35 -0400
Received: by mail-il1-f171.google.com with SMTP id a14so7375264ila.1;
        Thu, 29 Jul 2021 14:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=weWgO//c0TSwvdORBfQI0q5l+aoZeVIROfRH7MThAaM=;
        b=mxaHaRvTWxu8MckTD9q3kkCTOaJxahlZxCksjh76yh4LvaYhk7oslKWiBjZsxyeQKs
         kPo6etIwjB84pf/4MdErLurL35/NUI++LMg8ZN8wNkouOh5BGesq6wRlMElKfE/McHaL
         9USrlw7euTrCSpLnDAxEs+eDAGHaEI9wLxs0s+oWhIiCTPnjBSl7GosXJ/hCSigxMbcf
         VfEaHsUaj0Y1Wc4aqURon2wgtsIGHRgFWl32c7w2F2uFguLy0qYCkixLjUrj7CU5yzhE
         xXtGMGlsJh2JLPHyJ9zS2AGjqKEUBR5eI4wAYGr/IU7wL+J714Ut7mtfZTRqmuBtdxXI
         JbLQ==
X-Gm-Message-State: AOAM533jO8CY8JwEIYerElK1llB6GruVTjATn2V3OYjzpW7aiinLoUFZ
        t0c/jwyyJ3boo1Y8eoH5CQ==
X-Google-Smtp-Source: ABdhPJwAOUzTr2jjupUUjm6A2XAKxUh+3/3BQxcw+6CHRe2q7z5wjB7X9/O2qR7ZaNz5jrXGVMkT3Q==
X-Received: by 2002:a92:cc85:: with SMTP id x5mr5353484ilo.266.1627594710423;
        Thu, 29 Jul 2021 14:38:30 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j20sm2951149ile.17.2021.07.29.14.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 14:38:29 -0700 (PDT)
Received: (nullmailer pid 940350 invoked by uid 1000);
        Thu, 29 Jul 2021 21:38:27 -0000
Date:   Thu, 29 Jul 2021 15:38:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-usb@vger.kernel.org, dongsheng.qiu@ingenic.com,
        jun.jiang@ingenic.com, hminas@synopsys.com, sihui.liu@ingenic.com,
        sernia.zhou@foxmail.com, linux-mips@vger.kernel.org,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, paul@crapouillou.net,
        robh+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: dwc2: Add bindings for new Ingenic SoCs.
Message-ID: <YQMf06v4nFTxVdzx@robh.at.kernel.org>
References: <1627116521-124612-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1627116521-124612-2-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1627116521-124612-2-git-send-email-zhouyanjie@wanyeetech.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 24 Jul 2021 16:48:40 +0800, 周琰杰 (Zhou Yanjie) wrote:
> Add the dwc2 bindings for the JZ4775 SoC, the JZ4780 SoC, the X1000 SoC,
> the X1600 SoC, the X1830 SoC, and the X2000 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

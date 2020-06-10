Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B81BD1F5C37
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 21:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730349AbgFJTuN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 15:50:13 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45905 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730085AbgFJTuM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 15:50:12 -0400
Received: by mail-io1-f68.google.com with SMTP id y5so3659115iob.12;
        Wed, 10 Jun 2020 12:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1M+bkyx1XWH7KVWinjgxEZPKQ01wy/6i2E3dZnftVyk=;
        b=ZzEpRxML6tWtIm/jZFALrpgYbkBDWNFWtV7yavAziDp5urDmFSFIyIJfAN79wmPAnb
         0XKkClI/aMh9hqv9dEzUdDkme6XUZNAsoojRj8acj+G32r/9V5i0yPwkv3VN6eYevlVZ
         PecbQwzv1ksetHFEcIW8QjjpLijjhp6+y6viksPAQS5oz9gYnXoxrYvqnRZqpu0MONa/
         ep42rS7g0qVqNR1IwTYAhGBpWWhm4KMWE18xM6GtMSHN094SnRjkAsfEJePn87bNejJe
         1R8Mg/7B1fc4tSdooctoH2vv1d0dY5zZiLJRhJ9gi1HzTLtRFAPiOxLlxPhclBhW8GVn
         MYdw==
X-Gm-Message-State: AOAM5307H4vlOJYqmy2Yx1uqKOMYwgvsI15J7M4UGzl+1ulnQR8Q8Wll
        FrMQvArNYAxfEoaj4T7Xww==
X-Google-Smtp-Source: ABdhPJwRvh/ZDpjvs6OY941xd3Y3JedADa0np5Xq47sS8wJemJewWQcJKW2EHSGQVFQz2QSMIpkUzg==
X-Received: by 2002:a6b:249:: with SMTP id 70mr4950251ioc.146.1591818610318;
        Wed, 10 Jun 2020 12:50:10 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id n12sm399848iog.25.2020.06.10.12.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 12:50:09 -0700 (PDT)
Received: (nullmailer pid 3606732 invoked by uid 1000);
        Wed, 10 Jun 2020 19:50:07 -0000
Date:   Wed, 10 Jun 2020 13:50:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     rick.tyliu@ingenic.com, dongsheng.qiu@ingenic.com,
        zhenwenjin@gmail.com, aric.pzqi@ingenic.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        yanfei.li@ingenic.com, tsbogend@alpha.franken.de,
        paul@crapouillou.net, sernia.zhou@foxmail.com,
        linux-mips@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: MIPS: Document Ingenic SoCs binding.
Message-ID: <20200610195007.GA3606682@bogus>
References: <20200602183354.39707-1-zhouyanjie@wanyeetech.com>
 <20200602183354.39707-2-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200602183354.39707-2-zhouyanjie@wanyeetech.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 03 Jun 2020 02:33:54 +0800, 周琰杰 (Zhou Yanjie) wrote:
> Document the available properties for the SoC root node and the
> CPU nodes of the devicetree for the Ingenic XBurst SoCs.
> 
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Tested-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v1->v2:
>     1.Remove unnecessary "items".
>     2.Add "clocks" as suggested by Paul Cercueil.
> 
>  .../bindings/mips/ingenic/ingenic,cpu.yaml         | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

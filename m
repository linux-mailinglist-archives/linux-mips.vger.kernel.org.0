Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8CF5F351A
	for <lists+linux-mips@lfdr.de>; Mon,  3 Oct 2022 20:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbiJCSAQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Oct 2022 14:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbiJCR7Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 Oct 2022 13:59:24 -0400
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B27294198F;
        Mon,  3 Oct 2022 10:58:53 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id c81so12088871oif.3;
        Mon, 03 Oct 2022 10:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=QFAOwCvPEQ69newTdVlBlRzYqc88+vexfOUwWKRdKLA=;
        b=bSL+caWUYucMtTfICpNrKmMuYzG2KqsMl1VGf7m+fdfwYbXEXRGmH40T90KGTeQTp1
         a3+5fOys3Fw++Y9d0E/DNcdvwHwQ4+OiuAAksYM0fSoLiZCxS3Ebg5v7Wzty+vyUT+o0
         y/6DkQt6yg70I3fsboXIj8CpuHDjc123RCEFr96/9GrBe/acQchhV4ySotrwA2LS48w+
         shJSghZKBnTd6A5Gl95hAvrsLHQOi7X/3wII3KaaIIEwDuGIod2Lj8QWRNc0uYnOLTHM
         U74rNQvTFtwwoEf13rgc0fzVzCE1u+pHKt6gTIlTHouDcP96iJ4ykXH99PD2sU9Rxlgd
         272w==
X-Gm-Message-State: ACrzQf1X9r+WjoRpAn01wklfn03evi/Sj0jU04gVOaeMmZ/vdwqmOKt6
        w86DBRAeUznjQBR2YcMLrw==
X-Google-Smtp-Source: AMsMyM7SA6zvMVxcbqiEZ7TGfRL6kPD4KABk1pxTJrUyKeakz4/ckMvfvMsa03hQxRWd/YVI7vyEeA==
X-Received: by 2002:a05:6808:181e:b0:350:7776:9059 with SMTP id bh30-20020a056808181e00b0035077769059mr4508763oib.83.1664819932282;
        Mon, 03 Oct 2022 10:58:52 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 6-20020aca0506000000b003509cc4ad4esm2607098oif.39.2022.10.03.10.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 10:58:51 -0700 (PDT)
Received: (nullmailer pid 2512078 invoked by uid 1000);
        Mon, 03 Oct 2022 17:58:50 -0000
Date:   Mon, 3 Oct 2022 12:58:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     zhouyanjie@wanyeetech.com, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org, zajec5@gmail.com,
        tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com, hauke@hauke-m.de
Subject: Re: [PATCH v5 1/2] dt-bindings: mips: add CPU bindings for MIPS
 architecture
Message-ID: <166481993001.2512019.5640963273879940418.robh@kernel.org>
References: <20221002091611.946210-1-sergio.paracuellos@gmail.com>
 <20221002091611.946210-2-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221002091611.946210-2-sergio.paracuellos@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 02 Oct 2022 11:16:10 +0200, Sergio Paracuellos wrote:
> Add the yaml binding for available CPUs in MIPS architecture.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/mips/brcm/brcm,bmips.txt         |   8 --
>  .../devicetree/bindings/mips/cpus.yaml        | 115 ++++++++++++++++++
>  .../bindings/mips/ingenic/ingenic,cpu.yaml    |  69 -----------
>  3 files changed, 115 insertions(+), 77 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,bmips.txt
>  create mode 100644 Documentation/devicetree/bindings/mips/cpus.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

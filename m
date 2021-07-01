Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D36CF3B97C9
	for <lists+linux-mips@lfdr.de>; Thu,  1 Jul 2021 22:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233684AbhGAUxg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Jul 2021 16:53:36 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:40927 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233360AbhGAUxg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Jul 2021 16:53:36 -0400
Received: by mail-io1-f44.google.com with SMTP id l5so9177899iok.7;
        Thu, 01 Jul 2021 13:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=ElQvPrtlr+vILqrNaZxPBeuhknfgODN1ny7c82yzT7E=;
        b=dZy6I5PiLnXs7d8TD5wJg1CBX1380RtVbRuiJbGINUr0WrTS0bjReh6snZV/Y+0B2K
         JnmLOh+3KvdVgmmvO673yTvV5x85Us/AHpkEGE8wIXv1SBwIlpv5pdIaSV2/qQ42PzYh
         etf81HhzH8R/spMH5m4YNeyfHbq0Z8qS6gj3lsULLG3aZvVZ5I9srJqn36TAMvIOvjYa
         A+od71bHE1k9DMmM2PsT4KEqcabS9CxVS44PMxmynX5nG8HwVKbszB9mmi7tfdvJjry1
         1BTRFIoKxeJ1dwSb0ZxWNsY3laiVC31RQFOjaS3xkbCBsvaVWIdMX3YnpUh0nBouSi17
         IRaA==
X-Gm-Message-State: AOAM533BZXYMQmAkNcCReqj7dqrhzv7cOimQXbHsDwJqs9lRMwlzRChJ
        Wd7QvTGZriVC+CMsg1F3Cg==
X-Google-Smtp-Source: ABdhPJyjKYy73Eil7FpXnQ9zRI78HLbl7FC6k6aOPzcKdVkZO4vA9Rvtx4yBISfLj506tf27oyAp1Q==
X-Received: by 2002:a02:caad:: with SMTP id e13mr1454038jap.129.1625172665091;
        Thu, 01 Jul 2021 13:51:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c26sm516637ioc.6.2021.07.01.13.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 13:51:04 -0700 (PDT)
Received: (nullmailer pid 2908604 invoked by uid 1000);
        Thu, 01 Jul 2021 20:51:01 -0000
From:   Rob Herring <robh@kernel.org>
To:     Qing Zhang <zhangqing@loongson.cn>
Cc:     devicetree@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
In-Reply-To: <20210701131400.4699-3-zhangqing@loongson.cn>
References: <20210701131400.4699-1-zhangqing@loongson.cn> <20210701131400.4699-3-zhangqing@loongson.cn>
Subject: Re: [PATCH v8 3/3] dt-bindings: mips: Add Loongson-2K1000 reset support
Date:   Thu, 01 Jul 2021 14:51:01 -0600
Message-Id: <1625172661.957991.2908603.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 01 Jul 2021 21:14:00 +0800, Qing Zhang wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
> 
> v7-v8:
> No change
> ---
>  .../bindings/mips/loongson/ls2k-reset.yaml    | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/loongson/ls2k-reset.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mips/loongson/ls2k-reset.example.dt.yaml: power-controller@1fe07000: '#power-domain-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/power/power-domain.yaml
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1499533

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0919D3B92B2
	for <lists+linux-mips@lfdr.de>; Thu,  1 Jul 2021 16:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233038AbhGAOF6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Jul 2021 10:05:58 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:42528 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232301AbhGAOF4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Jul 2021 10:05:56 -0400
Received: by mail-il1-f182.google.com with SMTP id h3so6445226ilc.9;
        Thu, 01 Jul 2021 07:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=q6V1bQKgW8jeniUJHT1MFd3WQxyJ/wQdQVc94HD3gJI=;
        b=HDFnoZqtSUCcObIAAehg7xHQaK6Ltz15Uxy3S3zIFS+7AbAAyXjiPhStyLAxmDwUaD
         RGJJiVcHknB+OkeKt124nyEmD7DGm6nCYXhZhzAo5a0404A7DBWF2UOmAYugfKumoUz0
         GQOkmr4a2y4z19HKv9WjqQYHx1yx+elq7C1Q1nFjaMlmQFYYazCkMz10zgC4pW0xW0cX
         LLPhu4BFFODS0tSbVLbIC73KF1rtdymGr0Kb5kwSoINQjtniYRrTnEokun/3H/dI2BS3
         uvzrkLW3eSYCkxyVMHlWeXyAhnqGPhVtQsn4pJKHtxVnscSAPkEUc0BIzPfN55M4Wwlf
         hi4g==
X-Gm-Message-State: AOAM5311m58QGJWRTBWjX/vUiDjcvA86YrlpafSxaj7U6bMVQe4iH+o3
        jipQn3DSV7y7ZyP13NwVRtgV3V3ZbA==
X-Google-Smtp-Source: ABdhPJzIkDIlCQJ8GeJQTjtlHVYRBooLDL/7i+YEHKrOVvDPVyUxazhSmOHAwIgMSyO9Z3+/VEsIBQ==
X-Received: by 2002:a92:660f:: with SMTP id a15mr32101268ilc.182.1625148205231;
        Thu, 01 Jul 2021 07:03:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m19sm29120ilj.52.2021.07.01.07.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:03:24 -0700 (PDT)
Received: (nullmailer pid 2278710 invoked by uid 1000);
        Thu, 01 Jul 2021 14:02:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Qing Zhang <zhangqing@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20210701030137.10566-3-zhangqing@loongson.cn>
References: <20210701030137.10566-1-zhangqing@loongson.cn> <20210701030137.10566-3-zhangqing@loongson.cn>
Subject: Re: [PATCH v7 3/3] dt-bindings: mips: Add Loongson-2K1000 reset support
Date:   Thu, 01 Jul 2021 08:02:43 -0600
Message-Id: <1625148163.589811.2278709.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 01 Jul 2021 11:01:37 +0800, Qing Zhang wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
> 
> v6-v7:
> Add yaml file
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

See https://patchwork.ozlabs.org/patch/1499207

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


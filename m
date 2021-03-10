Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1548833337B
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 04:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhCJDCx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 22:02:53 -0500
Received: from mail-io1-f45.google.com ([209.85.166.45]:46732 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232185AbhCJDCZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Mar 2021 22:02:25 -0500
Received: by mail-io1-f45.google.com with SMTP id u8so16290629ior.13;
        Tue, 09 Mar 2021 19:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hGBShF2dfnfyYNYUdbSqHz+Ul56AzJJpSOrcDsvhos0=;
        b=ayxpkpYSwygYqmdEQo30GKOnS7nT/f4pryp/rXJKisw+A/sV0z1SWVn9UkVjs4zhuZ
         5SVGOjj4ecZ7NCOBmngG1HaZvppTq9357fsGm++0/hXbKjNyQBmVozcoho296QSWXcno
         lzsl4+C5jB198sEaV37LeGvb3BvQxl3fDggby3JIp5y+mECIr0JvrxtpwnkCkQW33AR8
         ae5Z47IL4tngWTIh1wdC083tGIZYioeUsrfNcyM6yVMe9kmPUjao0y572u/ZnST/n8e8
         gni40wA5wxU43iYa4An9Rd2yQ/Gys1OJKwwsqZl1vPXcn2GMEPtnXRMos2veyWZHlGr6
         EaDQ==
X-Gm-Message-State: AOAM5323Wrb5X2CEFHKZNmKCps+PyJPKeZqWXu1xmcHvnODGkJ0rF109
        CdBFnX8FxDt3CwfFF+4PSQ==
X-Google-Smtp-Source: ABdhPJwIBF1PdJ7juV05kemajB8MnDI6COn/iESFqbfdNIax9Y+gPMS9xwDkAldhREvP+ZCf9Sb8vQ==
X-Received: by 2002:a02:6a0b:: with SMTP id l11mr1230358jac.82.1615345345188;
        Tue, 09 Mar 2021 19:02:25 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id b5sm8560253ioq.7.2021.03.09.19.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 19:02:24 -0800 (PST)
Received: (nullmailer pid 1667243 invoked by uid 1000);
        Wed, 10 Mar 2021 03:02:22 -0000
Date:   Tue, 9 Mar 2021 20:02:22 -0700
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        linux-arm-kernel@lists.infradead.org,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 1/2] dt-bindings: nvmem: add Broadcom's NVRAM
Message-ID: <20210310030222.GA1667188@robh.at.kernel.org>
References: <20210305183236.11784-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210305183236.11784-1-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 05 Mar 2021 19:32:35 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Broadcom's NVRAM structure contains device data and can be accessed
> using I/O mapping.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Use Broadcom's NVRAM specific binding. Generic "nvmem-iomap" binding
>     didn't make much sense. Thanks Srinivas!
> ---
>  .../devicetree/bindings/nvmem/brcm,nvram.yaml | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

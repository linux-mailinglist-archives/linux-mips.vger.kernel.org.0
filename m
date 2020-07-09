Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6226621AB0F
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 00:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgGIW7L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 18:59:11 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:39779 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgGIW7L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 18:59:11 -0400
Received: by mail-il1-f194.google.com with SMTP id k6so3483439ili.6;
        Thu, 09 Jul 2020 15:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=L3fpOCR7zM4ZxGuK+eNCHPbHYSclsLiEIrCGH3OzMVM=;
        b=EKYDDmDkJSTAGNnZ8Db7EaTjRZ2D9OKySGP9jtpC32wA/gIRK+65txTmoh3mOfjXjo
         9PkuXOwCUnYA4sVYitOwWlM1SMZNBGflsFwKOT9CVibITYqEOFAtLaC6h0tiiUjcaWRp
         tkk8xC1pvxqEh2wmCrzRCFJNVipbQ9gDnALi7WRUqe/JqppxuC9OjBLFEX9kvHgR4ZAp
         Y6YT2luKHXquTsD8cDydr5P0GVmbvSaDprJmLJCrglHijAmsp04+n80tusZ185SIUWPW
         flEWQxqMFiVfacADMo+LnsMGWimqujJZHDneC6/Wb+93m5i5GvGRWgAu/7F3cMi1wcg9
         2new==
X-Gm-Message-State: AOAM532LGSO0SreFiYFoq23RRxNmJ8jenUkTsYCCZ/AKHogMkte+V6Wg
        JNjkcytSR0B/q2PUx7UTkWcn1pQHkw==
X-Google-Smtp-Source: ABdhPJye6n072SWsftPsIMtTWtI5n12frE/SfKf/T0jgywXOT3QXO0QwpSLQU3TozzPHp/MEq8IZYA==
X-Received: by 2002:a92:c087:: with SMTP id h7mr47566683ile.279.1594335550346;
        Thu, 09 Jul 2020 15:59:10 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id a5sm2601913ilt.71.2020.07.09.15.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 15:59:09 -0700 (PDT)
Received: (nullmailer pid 1049633 invoked by uid 1000);
        Thu, 09 Jul 2020 22:59:08 -0000
Date:   Thu, 9 Jul 2020 16:59:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, hauke@hauke-m.de,
        f.fainelli@gmail.com, zajec5@gmail.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        tsbogend@alpha.franken.de, robh+dt@kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: brcm: add BCM63xx power domain
 binding
Message-ID: <20200709225908.GA1049552@bogus>
References: <20200610171630.465579-1-noltari@gmail.com>
 <20200613082140.2009461-1-noltari@gmail.com>
 <20200613082140.2009461-2-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200613082140.2009461-2-noltari@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 13 Jun 2020 10:21:32 +0200, Álvaro Fernández Rojas wrote:
> BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
> to enable/disable certain components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  v4: change license and move to bindings/power.
>  v3: fix reg maxItems and quote #power-domain-cells.
>  v2: Add separate YAML file.
> 
>  .../bindings/power/brcm,bcm63xx-power.yaml    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/brcm,bcm63xx-power.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

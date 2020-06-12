Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65601F7E90
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jun 2020 23:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgFLVz2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Jun 2020 17:55:28 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42236 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbgFLVz1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Jun 2020 17:55:27 -0400
Received: by mail-io1-f67.google.com with SMTP id x189so2761937iof.9;
        Fri, 12 Jun 2020 14:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zeSbj81vVnxS9NXhKFb49ek1Y7R+SLP12ZGaeIEM7FU=;
        b=sUIzjAKY/TCUNn5MBCnBBfEKejBeZOWOrOcvaBuDEongT0hUyY5fuzi352giJ1tdeX
         PEUdqf7HovE90SFMuF2OwY/wI83HddKnng+jxULvu6qm95X9wy772LmC7fl64aGuCOF/
         ZmpGzRfbKq3SQjG6Qnl6qyRw3Lo2SruNF6B3rgtLaM95jFTff/Y1+hQdXiTI+XxpcFaY
         rQKfuIsOG1ban4EteA8006pFCSbkJAxd/FANIaA3+zQLPkwibTwAzterJ8CL8g9vnWpp
         fAffXPgjzZ2fciyfK/t1/2fZK4Lk+7DvEHpsAI7PZr5pTuq6t6AhHUaflZitfiQjvtLz
         zeFw==
X-Gm-Message-State: AOAM530UVEa/Ln1NNWtuz3Zqn2ha4Sy3aI0HL6RBEUFLHMZ6p0xF5+6l
        fBXgSfRx0VRfm+ObPSJrfw==
X-Google-Smtp-Source: ABdhPJxHabdY5JdKROrKpr08zxF3Ux2W47mrJIq4u461tlw37JjLxpZP72odON2nr5lHup0MB5NI8Q==
X-Received: by 2002:a02:c9c5:: with SMTP id c5mr10251999jap.5.1591998924878;
        Fri, 12 Jun 2020 14:55:24 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id l3sm3845591iow.55.2020.06.12.14.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 14:55:24 -0700 (PDT)
Received: (nullmailer pid 3882057 invoked by uid 1000);
        Fri, 12 Jun 2020 21:55:22 -0000
Date:   Fri, 12 Jun 2020 15:55:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     tsbogend@alpha.franken.de, hauke@hauke-m.de,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        jonas.gorski@gmail.com, zajec5@gmail.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com
Subject: Re: [PATCH v3 1/9] dt-bindings: soc: brcm: add BCM63xx power domain
 binding
Message-ID: <20200612215522.GA3881384@bogus>
References: <20200610163301.461160-1-noltari@gmail.com>
 <20200610171630.465579-1-noltari@gmail.com>
 <20200610171630.465579-2-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200610171630.465579-2-noltari@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 10 Jun 2020 19:16:22 +0200, Álvaro Fernández Rojas wrote:
> BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
> to enable/disable certain components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  v3: fix reg maxItems and quote #power-domain-cells.
>  v2: Add separate YAML file.
> 
>  .../bindings/soc/bcm/brcm,bcm63xx-power.yaml  | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm63xx-power.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/soc/bcm/brcm,bcm63xx-power.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/soc/bcm/brcm,bcm63xx-power.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/bcm/brcm,bcm63xx-power.example.dt.yaml: power-controller@10001848: reg: [[268441672, 4]] is too short


See https://patchwork.ozlabs.org/patch/1307099

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


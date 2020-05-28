Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250D81E633B
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 16:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390596AbgE1OGL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 10:06:11 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:35129 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390656AbgE1OGK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 10:06:10 -0400
Received: by mail-il1-f194.google.com with SMTP id a14so244167ilk.2;
        Thu, 28 May 2020 07:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1jidT3xKZRKULWJIwqa2tys07NIrxI3mybLQC/9d/ko=;
        b=DWsO/F1eL9DjP82NBsLsNPxie0SlEjScD8II2Cq1DIL2kaGCxCaT4PgBl5Ww8CONba
         3xepZq1DflZNleeydwg501TlttgPCp9bq2FQkw4TIWbHuzx21fgApSgNE218racIV0ek
         gtVDO72sc0Wtz+soNCEEWh+8Xm2iVCvVryTP8H9FkSpnde/I7IRXh2dr1IusZyK1nX4/
         DflFeoJ5bqSR8nFPNkC8PKTyqWaWcC9M6HlS5gdwLUBUQNVph7jEaD4Y2fbbEp+nqIrj
         3+emczmaZD4HFc8B0ukE4wk1yi/JPUnRBr82oif9g/oZrIGs2zdkhEzIudA24C5NQncN
         Ss7A==
X-Gm-Message-State: AOAM532cSysK1aLb8yvlk2lsV8G4K58IQUR+VzyjoGMTYhF3wsX/22VC
        AkOCxjc+gvGHpndH6GtVOQ==
X-Google-Smtp-Source: ABdhPJwgyTHzsDhxjiIb8r+RbEwXO/nh2hiq7xZNTxCVYzX32CAooeVLqphtOftt4LjRzbfcNOdExw==
X-Received: by 2002:a92:d40a:: with SMTP id q10mr3051355ilm.87.1590674768954;
        Thu, 28 May 2020 07:06:08 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id n25sm2574334ioa.29.2020.05.28.07.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 07:06:08 -0700 (PDT)
Received: (nullmailer pid 4174426 invoked by uid 1000);
        Thu, 28 May 2020 14:06:06 -0000
Date:   Thu, 28 May 2020 08:06:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     vigneshr@ti.com, linux-kernel@vger.kernel.org, arnd@arndb.de,
        hauke.mehrtens@intel.com, linux-mips@vger.kernel.org,
        richard@nod.at, qi-ming.wu@intel.com, tglx@linutronix.de,
        brendanhiggins@google.com, linux-mtd@lists.infradead.org,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
        miquel.raynal@bootlin.com, andriy.shevchenko@intel.com,
        robh+dt@kernel.org, masonccyang@mxic.com.tw
Subject: Re: [PATCH v9 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
Message-ID: <20200528140606.GA4173978@bogus>
References: <20200528051211.3063-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200528051211.3063-2-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528051211.3063-2-vadivel.muruganx.ramuthevar@linux.intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 28 May 2020 13:12:10 +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add YAML file for dt-bindings to support NAND Flash Controller
> on Intel's Lightning Mountain SoC.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 93 ++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: nand-controller@e0f00000: '#address-cells', '#size-cells' do not match any of the regexes: '^nand@[a-f0-9]+$', 'pinctrl-[0-9]+'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: nand-controller@e0f00000: nand@0: '#address-cells', '#size-cells', 'nand-on-flash-bbt' do not match any of the regexes: 'pinctrl-[0-9]+'

See https://patchwork.ozlabs.org/patch/1299399

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


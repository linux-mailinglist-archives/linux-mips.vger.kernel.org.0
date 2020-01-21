Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBDBF144686
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jan 2020 22:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgAUVg0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jan 2020 16:36:26 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37919 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728827AbgAUVg0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Jan 2020 16:36:26 -0500
Received: by mail-pg1-f196.google.com with SMTP id a33so2222302pgm.5;
        Tue, 21 Jan 2020 13:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5E3leOx8mkDeLNWMdug8yTuuSxcBJ1PUjfQJE88tDM4=;
        b=bCEpghtS+P14O8QiseXoCxBdMIG/XChBWV1/a3uUE3Wbb1u8IwwtB6GBG3UJvVGSPE
         Fp4NPedroDcY5jzGSKZyCliG2lo8hm4njAMvtcSZ2npRC7/b+rclvpW94k3//Nbzeaoj
         xzeriL9RTp7oNYt9a6+iSo60oXSFTzmY8TfavPkVvYCfzUv4n5GL0pmiXHYt3kz/9rk3
         3ouVf1TQFg7IJe0whqerBmgyF4lBxKWgGmLElE6BZRqxn9+sWqDDa4A2G6Lb9LHd9pUL
         usHDJuoOZ8EgTclW0W3w/LmGsk+45+hXqWxp8dGD32r7hmWKgz6wNEpZbILntN4pugLi
         21Xg==
X-Gm-Message-State: APjAAAW+y8mYYYRPdbErX3K9LJZJurTj4OoHnvJxrzEaRfZ/dFKEKG5f
        ih2Nm/pvSxZRwynjGcCPMsU=
X-Google-Smtp-Source: APXvYqxsUHAjAyitLEiDaPpJCe7u+UqiIWSvSSQ37YpJNgMu144R9j4TyoyRpzpeVvHls0KTjJ5jWw==
X-Received: by 2002:a63:2a49:: with SMTP id q70mr7371095pgq.265.1579642585629;
        Tue, 21 Jan 2020 13:36:25 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id k21sm43078123pgt.22.2020.01.21.13.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 13:36:24 -0800 (PST)
Date:   Tue, 21 Jan 2020 13:36:24 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Kamal Dasu <kdasu.kdev@gmail.com>
Cc:     linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V2 2/3] arch: mips: brcm: Add 7425 flash-edu support
Message-ID: <20200121213624.iy2zcmixdea4iwqg@pburton-laptop>
References: <20200121200011.32296-1-kdasu.kdev@gmail.com>
 <20200121200011.32296-2-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200121200011.32296-2-kdasu.kdev@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Kamal,

On Tue, Jan 21, 2020 at 03:00:07PM -0500, Kamal Dasu wrote:
> Nand controller v5.0 and v6.0 have nand edu blocks that enable
> dma nand flash transfers. This allows for faster read and write
> access.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  arch/mips/boot/dts/brcm/bcm7425.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
> index 410e61ebaf9e..aa0b2d39c902 100644
> --- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
> +++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
> @@ -403,8 +403,8 @@
>  			compatible = "brcm,brcmnand-v5.0", "brcm,brcmnand";
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> -			reg-names = "nand";
> -			reg = <0x41b800 0x400>;
> +			reg-names = "nand", "flash-edu";
> +			reg = <0x41b800 0x400>, <0x41bc00 0x24>;
>  			interrupt-parent = <&hif_l2_intc>;
>  			interrupts = <24>;
>  			status = "disabled";

I wasn't copied on the rest of the series, but presuming patch 1
documents flash-edu in the binding documentation at
Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt:

    Acked-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

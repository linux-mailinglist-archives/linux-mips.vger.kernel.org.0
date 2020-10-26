Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0465429939A
	for <lists+linux-mips@lfdr.de>; Mon, 26 Oct 2020 18:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1773109AbgJZRU5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Oct 2020 13:20:57 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41399 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1737090AbgJZRU5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Oct 2020 13:20:57 -0400
Received: by mail-lf1-f65.google.com with SMTP id 126so1889394lfi.8
        for <linux-mips@vger.kernel.org>; Mon, 26 Oct 2020 10:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e9BXTQHhAtIznv8uZc91KJyg2IzfZaimnn+MYpgNqNs=;
        b=hdGeZVCt8yZJA8uahg3XrZaezKioWkXDOv8qaDfeLUl33Z/0fl/aJqT0yl65P1CR7Z
         JzvVdw8xwmZJB3hwlrg6PvggsujtyPe2waBDQMowGN4c6c4Mn+HFNrwBF2fRzynYja0W
         0W3M1kF76i1M6CIm8dVePm6sg9lGh36PCmYiIzqRMtoBdy5Uzoqsanry50zXH5cux6Ws
         VRzYAmUGE+vAoTYR8oiRwPddJTJuGtGinK3qvcjO2LzGRuy2pDS7y07v2g6e7KQNwKUf
         LxFNauZD6AAQvN/dEQq/k70ecHIZ3qBejLmBmP2CagdQpIZ/zY08D5g+fU8VlnHKDN6y
         NhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e9BXTQHhAtIznv8uZc91KJyg2IzfZaimnn+MYpgNqNs=;
        b=ivx1i6jia5C6R1alnrdAp8Lf7Iu7Rynpb5IKFqAXNREcJb7X6a1F96qAX1j+qlNjRk
         bKBBKqKhXqrDwCEd8G964yf1Dsw5VFocEiiU2Dv45GsqL1CsfKoE6Fw0A2gl1a6HeKJX
         U5mQr9hOwXY0VzkfkPgQmemyy9069VRv+iWpRNx1KVegae3mW30/QVaq7XZdbT0SyBBq
         IJyWwzcjBuGx3/ss+Y2eJyvbNHvAT8DVGtPeYIpWPKVxNfCKEBj2zBgB57Yy58BZ5CkX
         1aAA8wJWOlKehVR4T7dfM0me4sW+g4Nqav0Ocq7M5u2ErkzrDLnv93qfvONLdVXEocVl
         4Mcw==
X-Gm-Message-State: AOAM530fUf/MpDVpksCwhMZU8QEn88impQ7euVg0VOg4LrTNAPVHenBV
        CqYzWLHSvUG2vJGFXxQvo3A=
X-Google-Smtp-Source: ABdhPJzoe1rL6JJ2Nl+pjY3LQA3qXfUsaLAWvCWwoGrcK0qTWoAz18eYm34hLk43/Iin7RPga38lLg==
X-Received: by 2002:a19:c30a:: with SMTP id t10mr5390201lff.196.1603732854705;
        Mon, 26 Oct 2020 10:20:54 -0700 (PDT)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id 78sm1102904lfe.196.2020.10.26.10.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 10:20:54 -0700 (PDT)
Date:   Mon, 26 Oct 2020 20:20:52 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Mauro Condarelli <mc5686@mclink.it>
Cc:     linux-mips@vger.kernel.org,
        Valeria De Fonzo <valeria.defonzo@gmail.com>
Subject: Re: [PATCH] Restore USB-OHCI node
Message-ID: <20201026172052.m3cv5oh2hzod63tx@mobilestation>
References: <20201026140455.469444-1-mc5686@mclink.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026140455.469444-1-mc5686@mclink.it>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 26, 2020 at 03:04:55PM +0100, Mauro Condarelli wrote:
> From: Valeria De Fonzo <valeria.defonzo@gmail.com>
> 
> This node was taken from OpenWRT mt7628an.dtsi
> The OHCI controller described is *not* to be found in "MT7628 DATASHEET",
> but it is needed to have any low-speed USB (e.g.: keyboard) working.
> 
> I am unsure how to handle this situation (undocumented feature).
> 
> Without this patch Linux sees only one USB device:
>   # lsusb
>   Bus 001 Device 001: ID 1d6b:0001
>   # cat /sys/bus/usb/devices/usb1/product
>   EHCI Host Controller
> and low-speed peripherals (I tested with keyboard and a couple of USB
> barcode scanners) are not recognized.
> Moreover pluggin in one of the "unrecognizable" devices seems to block
> USB completely (i.e.: plugging in a "working peripheral like a memory
> device or a USB-serial does *not* work) till next reboot.
> Apparently  EHCI tries to hand-over peripheral to OHCI and gets stuck.
> 
> With this patch everything works as expected (kernel was compiled  with
> both OHCI and EHCI support as modules):
>   # lsusb
>   Bus 001 Device 001: ID 1d6b:0001
>   Bus 002 Device 001: ID 1d6b:0002
>   # cat /sys/bus/usb/devices/usb1/product
>   Generic Platform OHCI controller
>   # cat /sys/bus/usb/devices/usb2/product
>   EHCI Host Controller
>   <----- insert keybord
>   [340060.245767] usb 1-1: new low-speed USB device number 3 using ohci-platform
>   [340060.518484] usb 1-1: New USB device found, idVendor=0461, idProduct=0010, bcdDevice= 1.04
>   [340060.527103] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>   [340060.534432] usb 1-1: Product: USB Keyboard
>   [340060.546236] usb 1-1: Manufacturer: NOVATEK
>   [340060.585973] input: NOVATEK USB Keyboard as /devices/platform/101c1000.ohci/usb1/1-1/1-1:1.0/0003:0461:0010.0002/input/input1
>   [340060.677988] hid-generic 0003:0461:0010.0002: input,hidraw0: USB HID v1.10 Keyboard [NOVATEK USB Keyboard] on usb-101c1000.ohci-1/input0
>   [340060.718911] input: NOVATEK USB Keyboard System Control as /devices/platform/101c1000.ohci/usb1/1-1/1-1:1.1/0003:0461:0010.0003/input/input2
>   [340060.797867] input: NOVATEK USB Keyboard Consumer Control as /devices/platform/101c1000.ohci/usb1/1-1/1-1:1.1/0003:0461:0010.0003/input/input3
>   [340060.818325] hid-generic 0003:0461:0010.0003: input,hidraw1: USB HID v1.10 Device [NOVATEK USB Keyboard] on usb-101c1000.ohci-1/input1
> No other changes were made neither to kernel nor rootfs (modules were
> compiled also in kernel without this patch).
> 
> 
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  arch/mips/boot/dts/ralink/mt7628a.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> index bf6b6a459bd6..b4ac008fdfdf 100644
> --- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> @@ -323,6 +323,17 @@ ehci@101c0000 {
>  		interrupts = <18>;
>  	};
>  

> +	ohci@101c1000 {

Please use the "usb@" node name as the generic USB DT bindings require for
all USB nodes. I am just trying to merge in a cleanup series to fix all the
USB nodes name to comply with that requirement:

Link: https://lore.kernel.org/linux-usb/20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru/

-Sergey

> +		compatible = "generic-ohci";
> +		reg = <0x101c1000 0x1000>;
> +
> +		phys = <&usb_phy>;
> +		phy-names = "usb";
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <18>;
> +	};
> +
>  	ethernet: ethernet@10100000 {
>  		compatible = "ralink,rt5350-eth";
>  		reg = <0x10100000 0x10000>;
> -- 
> 2.25.1
> 

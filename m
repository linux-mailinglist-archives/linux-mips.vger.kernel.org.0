Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9D7F25CB60
	for <lists+linux-mips@lfdr.de>; Thu,  3 Sep 2020 22:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbgICUlS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Sep 2020 16:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729786AbgICUlL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Sep 2020 16:41:11 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB76C061244;
        Thu,  3 Sep 2020 13:41:09 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o21so4176785wmc.0;
        Thu, 03 Sep 2020 13:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mrU1rx4DoUlTOdrRXtpUbhFHv5BIOESXnbIc518rU7M=;
        b=MwJh0ba9LTlgXQwl4QboXQ76MOQ0rLLNtmteRWvQkrvDd6nR1LVtTmJ6RAy5Gx++gm
         QF+5gW+RPKKRQ6eDtNL8IQzwU09XB16k6BfoanO3mvVcTYqap7FR+3xhwgJmLG+bx7E3
         h8oL0igq6eMYaBYEwelwEC0hUm7j+2GUsVfdyVdEu4xggPb8kBrO+hVOZ2Ofuvh+6zIZ
         PzJImZg9EioD+K9PJ3VPgSrUnpbfVGTrmhR+k2zzNf2auwlgjRgFp3JFBDZeJ7MYACsI
         O3LAQ5eucH8mqpUDk8pC2UOjDIk3/LEkTMQnKV1H2qWdajoJrrotk2/Fhd7rPrmwv8kH
         MJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mrU1rx4DoUlTOdrRXtpUbhFHv5BIOESXnbIc518rU7M=;
        b=XIhd+JDx9g70oQbkL4FWXSKzoI+ruQzVTf0djztGbeeJy1YI7uo7sMwENOJmwzdZbX
         Vhgn1lDpecbI/FYB5gT+zBfvx0wYPkmcU5QVvyCVm4XDl17xdbeWPltLNZzuVV9MZY1S
         VUzb5ougMTDHO26Ivt1cZy9WzRfTfUThdHTO2Cg4ifomR+V8KJTs0+ETaZneZrQn0/hP
         UnZfAgTZEpks6EiftTvMd+4jWP0bA9LZ6EZKkI2AY8ZqZRSq1NnGU6XRnhNLqgRiZ24+
         e0hj5UijGQfs1USxO7JKozBRJ+2upcpZDQSxg9CUR2U92PFwbLs6b7MZSUeFsd967EoY
         29mQ==
X-Gm-Message-State: AOAM530uaMLrmo33OOSvxJX62pYlVgDYLIn082vJsi4EWa93Okiy+4gq
        hyWUix6K0E5PTlzic5a0Q1J7ifbbOpb5XM4TjR0=
X-Google-Smtp-Source: ABdhPJwcEvQI2hy8KlNi4cFWdaPY6wx3E4A//S4RPk8hHM64my+uYjNkEGS7lEdY8Cax3pD+uZebq7KPMavqLirSIZE=
X-Received: by 2002:a1c:9d4b:: with SMTP id g72mr4347546wme.68.1599165668282;
 Thu, 03 Sep 2020 13:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200815163514.11631-1-hauke@hauke-m.de>
In-Reply-To: <20200815163514.11631-1-hauke@hauke-m.de>
From:   Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date:   Fri, 4 Sep 2020 02:10:56 +0530
Message-ID: <CA+NV+Vn=+o-u-A24YVbpzmDo6HLeepmu0-wqVd_Eyt0URhtQGw@mail.gmail.com>
Subject: Re: [PATCH 1/3] MIPS: DTS: img: marduk: Add SPI NAND flash
To:     Hauke Mehrtens <hauke@hauke-m.de>
Cc:     tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        james.hartley@sondrel.com, wigyori@uid0.hu
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Aug 15, 2020 at 10:05 PM Hauke Mehrtens <hauke@hauke-m.de> wrote:
>
> Add Gigadevice GD5F4GQ4UCYIGT SPI NAND flash to the device tree.
>
> The NAND flash chip is connected with quad SPI, but reading currently
> fails in quad SPI mode.
>

I think dual RX and quad TX should work.
https://github.com/CreatorDev/openwrt/blob/ci40/target/linux/pistachio/dts/pistachio/pistachio_marduk_common.dtsi#L203

> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Reviewed-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>

> ---
>  arch/mips/boot/dts/img/pistachio_marduk.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
> index bf69da96dc8b..ea11a21b133b 100644
> --- a/arch/mips/boot/dts/img/pistachio_marduk.dts
> +++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
> @@ -88,6 +88,12 @@
>                 reg = <0>;
>                 spi-max-frequency = <50000000>;
>         };
> +
> +       flash@1 {
> +               compatible = "spi-nand";
> +               reg = <1>;
> +               spi-max-frequency = <50000000>;
> +       };
>  };
>
>  &uart0 {
> --
> 2.20.1
>

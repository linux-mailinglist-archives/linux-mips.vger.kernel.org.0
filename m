Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF7D3769A4C
	for <lists+linux-mips@lfdr.de>; Mon, 31 Jul 2023 17:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbjGaPFM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 11:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjGaPFL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 11:05:11 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C930B10D8;
        Mon, 31 Jul 2023 08:05:10 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6bc886d1504so2501856a34.0;
        Mon, 31 Jul 2023 08:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690815910; x=1691420710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6m8JY8xlL5lafnW2mrv8zTKCgyIbG7vfy4wiqcsH9M=;
        b=rUNj22zwZBzunn/Ajoq/i5m40v6g0aCboJZnvwEo4kIsNVkvJS6n+ZjgbTRcq0lBTG
         Q2LbRbSblCWiuDUMnEB8QD9YGEg/47qwm1srgYQGyv0C5kPjkil57PK9O60q+t5o6xRz
         Ias1ysIofuAubayAYm0CDiiGjRpUnsAIEgmhwTgtdpXijeFaehkt4bOiqLVorQnclk05
         sh63gX1w4FwJlt9WhXISfyF3dF8hbphjeWjr4x4q47uu+F3cWue9re/LNjEvFxCtoDnf
         rWgHjkLmuCTxx7lBZRAVzp6Tmx1u44URkRSXjCU5Bm5ZfgtFmHIFTL+m9hhjq3eHr8l0
         QVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690815910; x=1691420710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6m8JY8xlL5lafnW2mrv8zTKCgyIbG7vfy4wiqcsH9M=;
        b=fSnGJ+Go6I+pteo1Zwm9Pwq/XIJrNGCbpibfAmhYKnmVyM8c5RLT6/7Lh29vxqp7yt
         M5rGfZBCzh90EjwwPIZlT7eY2KXpSUNw9rltki3IIsr344gawShpgk6NaaI6AlEv3XQS
         WqblW5JMVag45B2OaLfDb9AhwCHs14CI4qRiLcCr2H1HsbWdZukVM07eNsTAh+Otxhg+
         B1UfQWl5dZ5U1oEwcCiHPErhfF4d8fQr9ryLChW2WxRAbkhLhPFvcC2KTogKECvfRjCg
         Vtftt7asVrdd2d4r4GSxSTd2n4j9P83432pKTaSDo3YID0FXZRDNVVH6T9tSGnNEQceE
         4jPA==
X-Gm-Message-State: ABy/qLbsvgfQ07pkTbC8bfvuOjqdYGgJnlulUCqFchOBL/rUfSIykeeO
        2SamLVjRUQOmeBxNhI6VnPrv5ixqPzlyU+pAZMM=
X-Google-Smtp-Source: APBJJlHzJxErT5OwsIf3L0CIAEkHW1mfa5PTeh4zgx1s2WO25NgFeHjAtK94BgN2qYOHeThl/TN/0rbuvDCCIpD9Zfk=
X-Received: by 2002:a05:6870:148b:b0:1b0:4fc5:2e4b with SMTP id
 k11-20020a056870148b00b001b04fc52e4bmr12603538oab.9.1690815909642; Mon, 31
 Jul 2023 08:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <2a4da319-a78a-7cb1-6f18-f59180de779f@gmail.com>
In-Reply-To: <2a4da319-a78a-7cb1-6f18-f59180de779f@gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Mon, 31 Jul 2023 17:04:57 +0200
Message-ID: <CAMhs-H-ZES+O07ZbY37xVWqQ0f4YmmR5mz6BGvv43iXz+me2Mg@mail.gmail.com>
Subject: Re: MediaTek Frame Engine Ethernet: does it need any resets?
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Lorenzo Bianconi <lorenzo@kernel.org>,
        Felix Fietkau <nbd@nbd.name>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Network Development <netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rafal,

On Sat, Jul 29, 2023 at 1:55=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>
> Hi,
>
> I'm trying to understand MediaTek's Ethernet controller resets.
>
> I noticed there is sth fishy when checking dts files. See following
> errors:
>
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e10000=
0: resets: [[2, 6], [2, 23]] is too short
>          From schema: Documentation/devicetree/bindings/net/mediatek,net.=
yaml
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e10000=
0: reset-names:1: 'gmac' was expected
>          From schema: Documentation/devicetree/bindings/net/mediatek,net.=
yaml
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e10000=
0: reset-names: ['fe', 'eth'] is too short
>          From schema: Documentation/devicetree/bindings/net/mediatek,net.=
yaml
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e10000=
0: Unevaluated properties are not allowed ('reset-names', 'resets' were une=
xpected)
>          From schema: Documentation/devicetree/bindings/net/mediatek,net.=
yaml
>
>
> 1. Binding mediatek,net.yaml
> It says that when present, there must be 3 resets: fe, gmac, ppe
>
> 2. mt7621.dtsi
> It specifies 2 resets: fe, eth
>
> 3. mt7622.dtsi
> It doesn't specify any resets
>
> 4. mt7629.dtsi
> It doesn't specify any resets
>
> 5. drivers/net/ethernet/mediatek/
> I don't see any reset_control_* code at all
>
>
> Can someone help me what's the actual case with resets? Are they needed?
> Are they used?

At least for mt7621 bindings have been released after the ethernet
driver. The driver uses directly register offset for reset through the
system controller syscon [1].

Ideally reset_control APIs should be used since there is already a
reset driver for mt7621 [2]. I don't know about the other SoCs.

Hope this helps.

Best regards,
    Sergio Paracuellos

[1]: https://elixir.bootlin.com/linux/v6.5-rc3/source/drivers/net/ethernet/=
mediatek/mtk_eth_soc.h#L495
[2]: https://elixir.bootlin.com/linux/v6.5-rc3/source/drivers/clk/ralink/cl=
k-mt7621.c

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8206600673
	for <lists+linux-mips@lfdr.de>; Mon, 17 Oct 2022 07:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbiJQFxP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Oct 2022 01:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbiJQFxO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Oct 2022 01:53:14 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82195558CE;
        Sun, 16 Oct 2022 22:53:13 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id x188so11076353oig.5;
        Sun, 16 Oct 2022 22:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWNfHd4i/v2f1YfiedY7zdTGAJQwot1bMLFbJR4ZDto=;
        b=hRDzu2lKXJClbncKEXbsYEUqxvFOZ67krtdLOITTDdxP4v16CqTvOLs2aWjchRSpyF
         67pbMW9F3QJ787pHHFXxQSBATM1LHge8Xv9inqoMC+ZKu2dWEaqIO0ps6IYeoo18vXMh
         6mTfSLjmHHZpQT2fP62Vxd7aUaR28o34UOoRPcIOOEgZL0Yk5owu+MMzsv49GkxCNkmD
         +SC7JKFXt8JW1zW4fegWX+K500furv9HVuOmfFMUo8clS4s+yx70hHobXctVFRAVeGGn
         KQqDuumM1s9GGTe/0T9QaAX/70ElwG3eTAANkP+QbIMCycDp+A3v10wqfnqOuX1jDeP8
         ZO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWNfHd4i/v2f1YfiedY7zdTGAJQwot1bMLFbJR4ZDto=;
        b=zLv8OAWeOBpRIRsbv2odWvM4xllQ3/Lc7yC82BgBy1rohevBOQrR/Mz4ek/DcZwnvX
         lPY5dcxAKXxzOqrA/StIx4lB9JWeZ0nb+tyFLI6xSqjjLiMeu4Ncv8ClqJPZk8nJH6Sa
         yX5XCoBIos6L/MA5s8RLLLH9+sZNvg1vjHEHlntNpBsXhUkT7oeL78ID2mlGgsk/g5Kr
         ERVFm4FVCCtub6lazSWU5vwF/8XWn5Ikp+mjSHaKfyzhHs2ojJofQ8m09shWxenbW1ls
         M+/s5sL02DQnM9N+7qy3ocSRTDUnT2MDDrmUP63klPUXBfGUYtP1xBviKhh+sHGv/Ps1
         I+kg==
X-Gm-Message-State: ACrzQf2fDibU4RqSZODoRgyvubdC5xsn+DGC69q+R3D4JBXyXCYFii6p
        Ulgrrlp/N51LkDnLNVoUTKhKVE+HQyyUSbS09/4=
X-Google-Smtp-Source: AMsMyM5FdpuO4qcYyeL+5khQ8rOINRTcFy6ilKl251+iJJMeEWcQ01DBtOHPeFboClvv5O/D55T2x7Izoho1Ud5n8OQ=
X-Received: by 2002:a05:6808:1304:b0:354:b62f:a027 with SMTP id
 y4-20020a056808130400b00354b62fa027mr4089325oiv.144.1665985992894; Sun, 16
 Oct 2022 22:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221006042945.1038594-1-sergio.paracuellos@gmail.com>
 <20221006042945.1038594-2-sergio.paracuellos@gmail.com> <615c8c6d-3eab-0474-2c2c-6442052c0eee@fungible.com>
In-Reply-To: <615c8c6d-3eab-0474-2c2c-6442052c0eee@fungible.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Mon, 17 Oct 2022 07:53:00 +0200
Message-ID: <CAMhs-H8tMP-TyH9dBeO5dGe8spu3h6571-Zeo=_Xshh04x+w1g@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: mips: add CPU bindings for MIPS architecture
To:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@fungible.com>
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, hauke@hauke-m.de,
        zajec5@gmail.com, tsbogend@alpha.franken.de,
        zhouyanjie@wanyeetech.com, linux-mips@vger.kernel.org,
        arinc.unal@arinc9.com, f.fainelli@gmail.com,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 6, 2022 at 1:24 PM Philippe Mathieu-Daud=C3=A9
<philmd@fungible.com> wrote:
>
> On 6/10/22 06:29, Sergio Paracuellos wrote:
> > Add the yaml binding for available CPUs in MIPS architecture.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >   .../bindings/mips/brcm/brcm,bmips.txt         |   8 --
> >   .../devicetree/bindings/mips/cpus.yaml        | 115 +++++++++++++++++=
+
> >   .../bindings/mips/ingenic/ingenic,cpu.yaml    |  69 -----------
> >   3 files changed, 115 insertions(+), 77 deletions(-)
> >   delete mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,b=
mips.txt
> >   create mode 100644 Documentation/devicetree/bindings/mips/cpus.yaml
> >   delete mode 100644 Documentation/devicetree/bindings/mips/ingenic/ing=
enic,cpu.yaml
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@fungible.com>

Thanks!

Thomas, are this series going through your tree?

Thanks in advance for clarification.

Best regards,
    Sergio Paracuellos

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 341F06C04F3
	for <lists+linux-mips@lfdr.de>; Sun, 19 Mar 2023 21:49:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjCSUtv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Mar 2023 16:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbjCSUtt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 19 Mar 2023 16:49:49 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6856144A9
        for <linux-mips@vger.kernel.org>; Sun, 19 Mar 2023 13:49:47 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id x198so1126933ybe.9
        for <linux-mips@vger.kernel.org>; Sun, 19 Mar 2023 13:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679258987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrqBLpgMvGAw26DRaowqtZ6KNMhJt4QDsaLfvV/8J2M=;
        b=hcVlyh6SCc01tHQEQKl+rMRkXdRlZaBR4PAhhkEscLByfqRTPISUDdvRSlA5rhmVVl
         sthqa0S2nU+jceZDprhsd0t7PBSto5gQblrnyO+mFunTfH+7zT2SHpA4c3HoBI4hI8IE
         8HPXCMvMV/3MqFjwnD9pIPu8B+/kZt8jR2cihllfOHlSnCymg1XkkC9YluVHeYuWeXoo
         IsjCiVSDPun7MF60EXMPWmudtUj5UjGdlsmGVCZj7CD1S8xEQQ8o9bG58eDECB5cR1IV
         InMCxoDbSJyW2nf8uwuTZMEF8pZ4ZP/U2JswAboP/a7fc731qPbcUMwumSeVaXNIVvhj
         79+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679258987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrqBLpgMvGAw26DRaowqtZ6KNMhJt4QDsaLfvV/8J2M=;
        b=gaf+LucUUbaCsy+mEw4WlWrBXgbaxEo+G0dAZxSL5yYr9buw10IpwsQE/Sgqzwfwzm
         x+K6GGsdqAzncnBnpyOIb9PVboW2wdsTaF0aGEpjqA/cMVUB+jdgEQvykLSZYBMo0niK
         GYhuZewuZM3q3JomQMSm8yFuTI+lybL7qyv8wmlQk4MKI09Xsula+EqwoYfWQDIJupZc
         vYBLc53PvklFp8+5FjOjHaB8c1I4NkvKPSxY3qY5JDPEwYUaa+JjBRWUjkxb9v/MeuVR
         CzCmRg3ffhqupibxOoD265U8tjv32RuKcHvge1yahNhUbQFetcftA9pqUvxRL3ls09GZ
         btSg==
X-Gm-Message-State: AO0yUKWI9+3fQfGj7Wg7zjWqgLupx91Q+opffZ2+wM457sdHob1Fw1pA
        zQutEIFcn7gF0cTWo+Gx0TeW/cTtWuP+vbEaGGs8gQ==
X-Google-Smtp-Source: AK7set9UmCKLhMhtD1XyfXAykvchqeWDh0btzTty+BysNe0ltmHg+QaEhAeymn18rA2vpcmu4EmZo8R4MRqI+S7yupE=
X-Received: by 2002:a05:6902:102d:b0:a6b:bc64:a0af with SMTP id
 x13-20020a056902102d00b00a6bbc64a0afmr4087551ybt.4.1679258987014; Sun, 19 Mar
 2023 13:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Mar 2023 21:49:35 +0100
Message-ID: <CACRpkdbWmtBtpkW2=DUX2v6CR7aJz52R6y5mJ=W+VDena+Fzng@mail.gmail.com>
Subject: Re: [PATCH v3 00/21] pinctrl: ralink: fix ABI, improve driver, move
 to mediatek, improve dt-bindings
To:     arinc9.unal@gmail.com
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        William Dean <williamsukatube@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Hui Liu <hui.liu@mediatek.com>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Daniel Santos <daniel.santos@pobox.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>, erkin.bozoglu@xeront.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 17, 2023 at 10:30=E2=80=AFPM <arinc9.unal@gmail.com> wrote:

> This is an ambitious effort I've been wanting to do for months.

I don't see any major missing ACKs so I just applied the patches, we
can fix any remaining issues in-tree.

Good work!

Yours,
Linus Walleij

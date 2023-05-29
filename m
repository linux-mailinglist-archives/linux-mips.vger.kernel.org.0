Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDA4714230
	for <lists+linux-mips@lfdr.de>; Mon, 29 May 2023 05:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjE2DAU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 May 2023 23:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjE2DAS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 May 2023 23:00:18 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886ABAF;
        Sun, 28 May 2023 20:00:15 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-510b56724caso8492538a12.1;
        Sun, 28 May 2023 20:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685329214; x=1687921214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnwCDU/T0dIgwtC1BckdG+1O/GRZHwgSBiHqZjkeZY0=;
        b=DHutnTQgsS/VW4QNKEqWBXu31AcnEMJlOLXo4uu32E9qQe5Ta1xW8sW7EW8BAdzNKD
         FxCYP/gKb1tw+8b+w+vO+plLSnLcI4GQ42pBE34z2+DXSwaXslTmjsqjrBXGEfHeJYtL
         nRcxwuFuGt7JIgC88ZxriwIwKCI3d2rpr5BMkLh5yQhYWr7NHCfkbfYkvk3pBClfb0FT
         GQzwvklLlCiVX/YPLoAXzLhuDrutM1KbTd2bv9/NJxdC4BBqQymOIANQLkMP3sCUywaP
         UTIlgveLuOW56214lTZFq151Kd/mVGY3B4nSvVN1j0FiRaFPM8khKhZupda2wPUl0PZQ
         GTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685329214; x=1687921214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnwCDU/T0dIgwtC1BckdG+1O/GRZHwgSBiHqZjkeZY0=;
        b=C2x+rlHJhgYxBZOlGj1kY6kfXY8jZekMH0/NdBeEGVUqO6eu3sHPJZxaV+K89JL4OH
         8LyoWcFzewurTW/udiKaCfZV9lZBIPwOnVZtX0kmleyrRxoxrw7aXr+sjCu/ZFiflTSg
         yWTJPtrJnhTDaZ5a4cts6U3pPZRbOorvJVeGGnEOLL9TxXm23qx4GylC3o3xvpC4AFlN
         UMiadC5jWVWWulkax/J5pfTr4QlojAyXjVQ1YO9r5bihnQkYG9A0eJgAOnQm8asA+/TG
         IqHOZ508pss4JHJH49xjXNYysKKYMaWd5VRlKKthsMpLJxj9C1Qk/FtIm1iCwaIHFyAJ
         rwCw==
X-Gm-Message-State: AC+VfDzCWCP3u77a6VeAg1+uLQn31gR+G1wLV5OC85PFs1032QQTbTxF
        T5TMAu783KP8+Q0ZVMHtXCo+SgqPgZU4LxXCmmA=
X-Google-Smtp-Source: ACHHUZ41+qkZF5JJGOKotRickXAjiArq6Xp1CoMDAreNbe/oiNtC8e9tF2SAa/F/Vlh80jWpuKSBQnIXY7WdeJB1uj8=
X-Received: by 2002:a17:907:720c:b0:965:ae3a:52c8 with SMTP id
 dr12-20020a170907720c00b00965ae3a52c8mr5673819ejc.32.1685329213609; Sun, 28
 May 2023 20:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684983279.git.zhoubinbin@loongson.cn> <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
 <20230525-custody-oversleep-f778eddf981c@spud> <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
 <20230526-dolly-reheat-06c4d5658415@wendy> <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
 <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com> <20230527-passing-unfixed-39e01b787808@spud>
 <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com> <20230527-poet-antarctic-cc02aa60ab52@spud>
In-Reply-To: <20230527-poet-antarctic-cc02aa60ab52@spud>
From:   Keguang Zhang <keguang.zhang@gmail.com>
Date:   Mon, 29 May 2023 10:59:57 +0800
Message-ID: <CAJhJPsU_qOJKO99S1xjJaSUqXsXAG7HpYbzs5wTb8J4-tQqSQA@mail.gmail.com>
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the trivial RTCs
To:     Conor Dooley <conor@kernel.org>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Binbin Zhou <zhoubb.aaron@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 28, 2023 at 6:22=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sat, May 27, 2023 at 10:59:48PM +0100, Jiaxun Yang wrote:
> > > 2023=E5=B9=B45=E6=9C=8827=E6=97=A5 17:23=EF=BC=8CConor Dooley <conor@=
kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
> > > On Sat, May 27, 2023 at 05:13:39PM +0100, Jiaxun Yang wrote:
>
> > >> My recommendation is leaving compatible string as is.
> > >
> > > "as is" meaning "as it is right now in Linus' tree", or "as it is in
> > > this patch"?
> >
> > Ah sorry I meant in this patch.
> >
> > Since there won=E2=80=99t be any new ls1x chip that will boot Linux any=
 time soon (due to
> > Loongson move away from MIPS but LoongArch32 is undefined for now), and
> > rest compatible strings are wide enough to cover their family, I think =
the present
> > compatible strings in this patch describes hardware best.
>
> I don't see why new bindings being written for old hardware should someho=
w
> be treated differently than new bindings for new hardware.

Let me add that ls1b RTC and ls1c RTC are not exactly the same.
The former supports RTC interrupt, while the latter does not.
So my suggestion is to leave the compatible string as it is in this patch.

--=20
Best regards,

Keguang Zhang

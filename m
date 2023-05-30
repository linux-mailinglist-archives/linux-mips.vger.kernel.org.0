Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2481B71599B
	for <lists+linux-mips@lfdr.de>; Tue, 30 May 2023 11:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjE3JNe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 May 2023 05:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjE3JNd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 May 2023 05:13:33 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0653FCD;
        Tue, 30 May 2023 02:13:31 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51496f57e59so3416597a12.2;
        Tue, 30 May 2023 02:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685438009; x=1688030009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWyJaV8a3DAS992X3HXPy7gtUSdQuNlkUATaW7zyKWE=;
        b=H4SDpQbyyXOaRqKZklTf42Dbejk/EE2oejEFs+iWm98KXb7eRHg9ph+0KtNkma78qc
         sl8pLmjMhNa45G5HnzzNDgkWQKaQ4ZA3qmaUio+Cmc7O8PtItM9nKPUFmtA4ZM3k5fmW
         ZgRtfv6gMmrN71TPxZCBWcvO8SbUmgHMEMkfvlx17d2Z0woKiTvyCY85LRIk2RdCXECO
         QTtMip/14aka5vn0eLchcEIySkfs2Oqa66Umy42WJYeKWvc9fdEw/bF9PXbJli4eqAPb
         m7W63uTMKriFEoOcZxvjRJwaPo6it9DnZgSehCb6D4QacUXeMC/qh8FzIoOUmkYqImGq
         WzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685438009; x=1688030009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWyJaV8a3DAS992X3HXPy7gtUSdQuNlkUATaW7zyKWE=;
        b=lI+KQ49+a335NH8DbakdAI4sLyYglq78J7sGfsBUOENt1VcS24DxCmHW8xY6+4A+Db
         1rEmbfY6e45nPb9rhmrTzUhx9KKLrQc8UiExkYb21PJGfgwTPqYj+vm0gTiXbSXkd+VU
         yqavOvjwbVhsNiu9DQmAtXI9eqkDp022q/HPKmrJnBuqJzu4xm+0lvKeDlh68b/Yl0NL
         5jRrTGOJlCuWm5eW0fDnHQWJhjk+NzH4yOIiJX2R40BZ/m6pUxxvydljDmh9Q65fCIZk
         x27fQ7MxwmxcOBVuPFgbR4GT1TxhuUDwHIwtsJAVIBFdbN3itNtZx1B8bip8Ke0HqB0s
         nj/g==
X-Gm-Message-State: AC+VfDxgDRMlKvIW3ZIbn7L1iwrkc9m8wlt2mpEfRfVmDlwNfMnm3fec
        KrO0Qqwr4NqTvZTS3fmJQ/yPed9LZ/HTl5/5vsQ=
X-Google-Smtp-Source: ACHHUZ6pJ+9DnouxCaCmkM/ITcNBqM3Uy5OsJavnknv0PPnQRJXlXsnRKIiK3ni661qK3Yzc3DpCypaOl77ASyNAx/c=
X-Received: by 2002:a17:907:6d93:b0:959:5407:3e65 with SMTP id
 sb19-20020a1709076d9300b0095954073e65mr1925901ejc.55.1685438009124; Tue, 30
 May 2023 02:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230526-dolly-reheat-06c4d5658415@wendy> <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com>
 <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com> <20230527-passing-unfixed-39e01b787808@spud>
 <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com> <20230527-poet-antarctic-cc02aa60ab52@spud>
 <CAJhJPsU_qOJKO99S1xjJaSUqXsXAG7HpYbzs5wTb8J4-tQqSQA@mail.gmail.com>
 <E229B204-1B00-4B24-B4BF-15277682FB4B@kernel.org> <CAMpQs4K4e3BSVvqXa+QjhM5XDxHc_ZCiRYW+HgPo21AQ_bYSRQ@mail.gmail.com>
 <6845b6ce-06a8-9a0c-7f04-50fa906cd1e4@linaro.org> <202305300840203aa4ff4c@mail.local>
In-Reply-To: <202305300840203aa4ff4c@mail.local>
From:   Keguang Zhang <keguang.zhang@gmail.com>
Date:   Tue, 30 May 2023 17:13:12 +0800
Message-ID: <CAJhJPsXyS_+tTLJ1JSCNx6wXs8eGwwQ4khg=-0gRGZuJRDddoQ@mail.gmail.com>
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the trivial RTCs
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Binbin Zhou <zhoubb.aaron@gmail.com>,
        Conor Dooley <conor@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 30, 2023 at 4:40=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 30/05/2023 10:17:43+0200, Krzysztof Kozlowski wrote:
> > On 29/05/2023 10:31, Binbin Zhou wrote:
> > > Hi Krzysztof:
> > >
> > > Excuse me.
> > > We have different opinions on how to better describe rtc-loongson com=
patible.
> > >
> > > Based on my previous communication with you, I think we should list
> > > all the Socs in the driver and drop the wildcards.
> >
> > Suggestion was about the bindings. Not in the driver. I never said to
> > list all compatibles in the driver...
> >
> > > This should be clearer and more straightforward:
> > >
> > >         { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_co=
nfig
> > > }, //ls1b soc
> > >         { .compatible =3D "loongson,ls1c-rtc", .data =3D &ls1x_rtc_co=
nfig
> > > }, //ls1c soc
> > >         { .compatible =3D "loongson,ls7a-rtc", .data =3D
> > > &generic_rtc_config }, //ls7a bridge chip
> > >         { .compatible =3D "loongson,ls2k0500-rtc", .data =3D
> > > &generic_rtc_config }, // ls2k0500 soc
> > >         { .compatible =3D "loongson,ls2k2000-rtc", .data =3D
> > > &generic_rtc_config }, // ls2k2000 soc
> > >         { .compatible =3D "loongson,ls2k1000-rtc", .data =3D
> > > &ls2k1000_rtc_config }, // ls2k1000 soc
> >
> > I would suggest to use fallbacks as suggested by Conor at least for som=
e
> > of them. You referred to my previous comments about wildcards.
> > Wildcard !=3D fallback.
> >
> > >
> > > And Conor thought it should be rendered using a fallback compatible
> > > form based on ".data".
> >
> > Based on common (compatible) programming model unless you already have
> > clear hardware differences making them incompatible.
> >
> > >
> > >         "loongson,ls1b-rtc"
> > >         "loongson,ls1c-rtc", "loongson,ls1b-rtc"
> > >         "loongson,ls7a-rtc"
> > >         "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
> > >         "longson,ls2k2000-rtc", "longson,ls7a-rtc"
> > >         "loonson,ls2k1000-rtc"
> > >
> > >         { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_co=
nfig }
> > >         { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rtc=
_config }
> > >         { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k100=
0_rtc_config }
> > >
> > > In this form,  I think it might not be possible to show very
> > > graphically which chips are using the driver.
> >
> > ??? How is it impossible? For all other SoCs and architectures it is
> > possible, so what is special for Loongson?
> >
> > > Also, for example, "ls7a" is a bridge chip, while
> > > "ls2k2000"/"ls2k0500" are soc chips, and it seems inappropriate to
> > > integrate them into one item.
> >
> > Why it is inappropriate? I don't see the issue here... what is a
> > "bridge" chip? Isn't this also an SoC?
> >
> >
> > >
> > > Which one do you think is more suitable for us?
> >
> > Use fallbacks for some. You pointed difference in alarm for ls1x, right=
?
> > If so, then they can stay separate.
>
> From what I seen the IP and register set is the same, it is just the
> integration on the SoC that differs.
>
Actually, ls1c RTC registers are not the same as ls1b.
ls1c doesn't have the following resgisters.
+#define TOY_MATCH0_REG         0x34 /* TOY timing interrupt 0 */
+#define TOY_MATCH1_REG         0x38 /* TOY timing interrupt 1 */
+#define TOY_MATCH2_REG         0x3c /* TOY timing interrupt 2 */

+#define RTC_CTRL_REG           0x40 /* TOY and RTC control register */
+#define RTC_TRIM_REG           0x60 /* Must be initialized to 0 */
+#define RTC_WRITE0_REG         0x64 /* RTC counters value (write-only) */
+#define RTC_READ0_REG          0x68 /* RTC counters value (read-only) */
+#define RTC_MATCH0_REG         0x6c /* RTC timing interrupt 0 */
+#define RTC_MATCH1_REG         0x70 /* RTC timing interrupt 1 */
+#define RTC_MATCH2_REG         0x74 /* RTC timing interrupt 2 */

As you can see, it doesn't support match function, which is why ls1c
doesn't support RTC interrupt.
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
Best regards,

Keguang Zhang

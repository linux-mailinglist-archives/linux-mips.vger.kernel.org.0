Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3C861152E
	for <lists+linux-mips@lfdr.de>; Fri, 28 Oct 2022 16:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbiJ1Ov4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Oct 2022 10:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbiJ1Ovz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Oct 2022 10:51:55 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070EA1DC097
        for <linux-mips@vger.kernel.org>; Fri, 28 Oct 2022 07:51:55 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-13c2cfd1126so6513779fac.10
        for <linux-mips@vger.kernel.org>; Fri, 28 Oct 2022 07:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUkGZQq0r0Vv/0R7vtzCYYO/85Jx3j0nE5veD8MLYVE=;
        b=fr5s/8AzcPjEZqTmVANBer99TzskAq+oY7ifPICWXNCGRIABiY1ClPA7Uglsgp7dnU
         3yORYt1RD64P5EcKcaVK8J3hudfFwtzL2jEoNoUkZHYELzyjyDl4C4rsIGmKYWmofPFf
         dLjpXMy4a34bMAKeIC0tDLj/lLidZPuMXPlL+S4UrLb41EnmhWE+/6kG65PpF/de81Z8
         1WU5tyZKiSoiykEmgSrk42H6ffvbIfJlUZgF+7rSryNtNR326hpqXL6plYjFJAcUeMkf
         jQ8TcRWMgqsgvrZBnZ8TvCFxpbBjP47gxLUbUMa5mgcCcyi6AJhjjiha0ptTw8tpdce6
         wG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUkGZQq0r0Vv/0R7vtzCYYO/85Jx3j0nE5veD8MLYVE=;
        b=M093vtV09CjUfN8lcHgzCzM7BTiTVbpvEE437RGdAU41BUZ8gN+qRPUhS4EdRsp4Wy
         1GVwWsuKbgfbOshKge55hTwUQ7GainAVo293ZSZ7BCuMc0E+BnvEH8jTdWaB/vnaCqHx
         J5AUAiyE6xY+j9KH+6PgeMavhfpCSoK3a+jfFm1Q8e4yZPSdu9kgtHRr7Jtk52449UMe
         SQ2Hyu/ChMOPDDCRcNe0uAxE8L3Fk5dytlKtSTu7FP6Vang8n73hS5H6F3eN+dndhUVH
         +TABZ3aIwU70tV87u8ZBmYow8dsx2qleUStqqj1bJWWHWl8jUH7chld7ers0r+cTPAuU
         m6uw==
X-Gm-Message-State: ACrzQf3X+TjU5gi8rj4gpQvj+Ks9UtwrWHXLu4yXMTPmcV6qPhDhA39j
        ubWjKiBiaiGh0yxpHILvSMtWe8I18Z9thL/xA4Y=
X-Google-Smtp-Source: AMsMyM5MMfDf+/7mK/9Hp4/Nal6yZaRBFu2dI+lcgxn74m/IU4jLaWjNogdlSFTulJqx5KczSYWVdmSeh7pJIl7SX0s=
X-Received: by 2002:a05:6870:8997:b0:13b:6fab:3266 with SMTP id
 f23-20020a056870899700b0013b6fab3266mr9634830oaq.160.1666968714028; Fri, 28
 Oct 2022 07:51:54 -0700 (PDT)
MIME-Version: 1.0
Sender: ojongonwa24@gmail.com
Received: by 2002:a05:6358:4314:b0:c9:23b:6c96 with HTTP; Fri, 28 Oct 2022
 07:51:53 -0700 (PDT)
From:   "Doris.David" <mrs.doris.david02@gmail.com>
Date:   Fri, 28 Oct 2022 07:51:53 -0700
X-Google-Sender-Auth: a7msSYQsAEw2sRtiKXBJctNes0M
Message-ID: <CAFOfhhM2+=zpnp5pkVfORFQ8eBGAbLKkyGREJQ9gj37eN98gUA@mail.gmail.com>
Subject: Re: Greetings My Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.7 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:35 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5238]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ojongonwa24[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ojongonwa24[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  1.1 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  2.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Greetings,

I sent this mail praying it will find you in a good condition, since I
myself am in a very critical health condition in which I sleep every
night  without knowing if I may be alive to see the next day. I am
Mrs.david doris, a widow suffering from a long time illness. I have
some funds I  inherited from my late husband, the sum of
($11,000,000,00) my Doctor told me recently that I have serious
sickness which is a cancer problem. What disturbs me most is my stroke
sickness. Having known my condition, I decided to donate this fund to
a good person that will utilize it the way I am going to instruct
herein. I need a very Honest God.

fearing a person who can claim this money and use it for Charity
works, for orphanages, widows and also build schools for less
privileges that will be named after my late husband if possible and to
promote the word of God and the effort that the house of God is
maintained. I do not want a situation where this money will be used in
an ungodly manner. That's why I'making this decision. I'm not afraid
of death so I know where I'm going. I accept this decision because I
do not have any child who will inherit this money after I die. Please
I want your sincere and urgent answer to know if you will be able to
execute this project, and I will give you more information on how
thunder will be transferred to your bank account. I am waiting for
your reply.

May God Bless you,
Mrs.david doris,

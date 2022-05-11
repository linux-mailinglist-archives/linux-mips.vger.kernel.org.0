Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08BA75230B2
	for <lists+linux-mips@lfdr.de>; Wed, 11 May 2022 12:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiEKKcI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 May 2022 06:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiEKKcD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 May 2022 06:32:03 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E99F527E9
        for <linux-mips@vger.kernel.org>; Wed, 11 May 2022 03:31:59 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id bx33so1966252ljb.12
        for <linux-mips@vger.kernel.org>; Wed, 11 May 2022 03:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=UWYPUviW69Pgc9fiucdO65MRktBuKIAzp2d0xKIpya0=;
        b=f/nmGIU/WAZJ2csgJFJ7siGB87u0gunZlbhfRMaMqgFE6BqRbRCveIMxVcanMbjKw+
         ZIwXxQK+g8rE/55v5rHI6OYBIwaM8stIPNITz/Icbi+IIzQK54Z4cyih9LZbE3iH9azW
         Kj0X0SXs6eaf+WL1wrbUKXRaJj5QBa07Y+fLmo1X7OaeRclLmiZz8nV7odyfKzpY8qgv
         qlVm5HGsC1ZYlnJZvfaEQEAZvapHs0XGBg3onKzgiU+vCRcUL1EbHjG5ti+B2ztwJs4J
         ZvlokZgCNcQnB1uTIi3HGicCtNpsKB3z9oUoyWc/4ayoGUaNv3kl5RdHz59sW7er/06b
         D2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=UWYPUviW69Pgc9fiucdO65MRktBuKIAzp2d0xKIpya0=;
        b=VF19FE0DMiwTm0uMAd739lWSGQiRC0Y+7fiV40/1ZxFbbMjO7XHl0a8nsQmC2ME8tX
         4Zm/hp8C/RoVcAk8K2tIUbZ8kztenfASoa6Vj/ThMFE6VYy8itE/AiqbXljYRMojdXw/
         1ygvTKOFwys3qsHMeZtMg9HPPyKO8yZYcpk3lOwQt/RvkmCUXS+sD/+ynYM7srTWIUdS
         J0RyEeyTSQt3OA5WnzdpNG9NRb/RJFj1+LRIqTG+hssdY/Skl2ptsfHHZxbwY7XUf7D7
         FRvae4IPls588G4g4A7wWzdnlyaSCdZFQwqjG7b4M05nH6/Oy/p2CVxZ8Qjm89tpLvXY
         GHtQ==
X-Gm-Message-State: AOAM530q6kG/GqlsRNJcR/4pkHWiY+3t2on4EBC9ktjKLpxKg4xOllce
        sUXLejQ25B0o1k793ojnJd9uxWC70NSAmgcRHvk=
X-Google-Smtp-Source: ABdhPJyHVLguYDcQjLwKHLKBzd4BolZRRNeNAKLEJEL9GErgrYO3hg0gMR4q6WiXCF9tr7o5CAhyNCI3exFu6y2Qz8Q=
X-Received: by 2002:a2e:8603:0:b0:250:cf53:7f46 with SMTP id
 a3-20020a2e8603000000b00250cf537f46mr7644403lji.47.1652265117323; Wed, 11 May
 2022 03:31:57 -0700 (PDT)
MIME-Version: 1.0
Sender: clementinenicole271@gmail.com
Received: by 2002:a05:6504:1694:b0:1cb:2361:2eb2 with HTTP; Wed, 11 May 2022
 03:31:56 -0700 (PDT)
From:   Salem Mohamed <salem.mohamed2778@gmail.com>
Date:   Wed, 11 May 2022 03:31:56 -0700
X-Google-Sender-Auth: PN5EdRGG-USkp8BV9cr2tAhOAIw
Message-ID: <CAMoBp82-TWBuqrzbeG7Kkeir=q=Tc7Ci9MMsocm0uMzq-Lb09A@mail.gmail.com>
Subject: I NEED YOUR ASSISTANCE AND CO-OPERATION,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_USD,MONEY_FRAUD_5,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Greeting my dear friend,

My name is Mr. Salem Mohamed from Damascus Syria, and I am now
resigned from the government. I am a member of an opposition party
government in Syria.

I need a foreign partner to enable me to transport my investment
capital and then relocate with my family, honestly I wish I will
discuss more and get along. I need a partner because my investment
capital is in my international account. Am interested in buying
Properties, houses, building real estates, my capital for investment
is ($16.5Million USD), meanwhile if there is any profitable investment
that you have so much experience on then we can join together as
partners since I=E2=80=99m a foreigner.

I came across your e-mail contact through private search while in need
of your assistance and I decided to contact you directly to ask you if
you know any Lucrative Business Investment in your Country I can
invest my Money since my Country Syria Security and Economic
Independent has lost to the Greatest Lower level, and our Culture has
lost forever including our happiness has been taken away from us. Our
Country has been on fire for many years now.

If you are capable of handling this business Contact me for more
details i will appreciate it if you can contact me immediately.

You may as well tell me a little more about yourself. Contact me
urgently to enable us to proceed with the business.

I will be waiting for your response.

Sincerely Yours,
Mr. Salem Mohamed.

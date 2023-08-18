Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E43F780444
	for <lists+linux-mips@lfdr.de>; Fri, 18 Aug 2023 05:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244176AbjHRDOr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Aug 2023 23:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357487AbjHRDOX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 17 Aug 2023 23:14:23 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873EE2D56
        for <linux-mips@vger.kernel.org>; Thu, 17 Aug 2023 20:14:22 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fe655796faso610174e87.2
        for <linux-mips@vger.kernel.org>; Thu, 17 Aug 2023 20:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692328461; x=1692933261;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/aCT3DaiX0JJb44SooFvTyHUyXVXVK/WjQTEeDk1ynw=;
        b=TkjjwAZNT8/zwEQu6X623TOhPUrZhVaIlsNG0XXRw/6kCXqsCBqyd1J+s27qHD9gJ3
         41M8MrYoVYgsNuQJJZaE8iV2UwNV1fQ1nyM5I5/fWAYlz480oEyfir4OXDhu7zjC7Z4V
         4zk5pNEppVHcvPwdbN6xEHRRRSV06Zgj42RUxjL4QR0AbhoZau03YFXHUpshu6Hr0Y2E
         i8oD3uW60ycmK8BdUo8Ex1Uvhd7dOeWU+wvuo4rtXEw4nMIgs0Frfmbn/EBBk2jUgkv3
         5p24emVHj5E/t+WKpq5U1yJzuALujbPFIbS6pn0i8BNUGRO822krsxtHHuHAOunU+Hf6
         1YNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692328461; x=1692933261;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aCT3DaiX0JJb44SooFvTyHUyXVXVK/WjQTEeDk1ynw=;
        b=STx7NAaN4zwvw/2+HPZvfMaigziyXF7B7cBToQlDL64gVzYUTNmmhaoj/GedqUHEDm
         vtjrtUDc2zL9/nW/nYarZb/YtoxOJekO/OSqczQeCOeQG0/YtoIMD0/5S9YPKBzt4srq
         0MMSFgRDKtYeqLvJ3AR2cbpe6OpUFdo7Ptr8fjh7lbt1RObiUw2oj2S4NJHV6AhIuSln
         Y8fyd/8gwN4cdpHooLS86UAFgJLZXWcKTZxT9LP4Ix+07ESjfAcCzmuLOvtgriWkU5Qg
         f8IBEZ0T+OUaMamKtbmlEHnuSG19wiMiQwmMQn9f2Zh6dWBXspmyzNcaz8tVjDm9BzxU
         jp7g==
X-Gm-Message-State: AOJu0Yw8j1CjW56bNL5xITlm0mAqNudei97hTWbdsxIBRJr4hs5kYclU
        fWJKQWM1TR6s4NdXA3b0t6x/NzneMoOLPY67AMM=
X-Google-Smtp-Source: AGHT+IGwyMJ8idpawpvR/A9bjk9PPrTDGzT27xpr9coZcvZOsrXCBDc7HtAnLcEhAiVVNDM6AqK2eMFbyE/wha4QD7k=
X-Received: by 2002:ac2:5f5b:0:b0:4fe:17d9:6755 with SMTP id
 27-20020ac25f5b000000b004fe17d96755mr657038lfz.25.1692328460538; Thu, 17 Aug
 2023 20:14:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7412:611:b0:df:2c16:b21e with HTTP; Thu, 17 Aug 2023
 20:14:20 -0700 (PDT)
Reply-To: catherinechan1010@gmail.com
From:   Catherine Chan <denverhumaid@gmail.com>
Date:   Thu, 17 Aug 2023 20:14:20 -0700
Message-ID: <CANRopZ0Y4KR3FYk2_n8RFXQQxcAfUZ9iF=eWL51tPz23Na3H1w@mail.gmail.com>
Subject: Zdravo!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=3.5 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Zdravo!

Nadam se da ste u ovoj e-poruci dobrog zdravlja. moje ime je Catherine
Chan, ja sam
iz Sjedinjenih Ameri=C4=8Dkih Dr=C5=BEava, ja sam lije=C4=8Dnik koji trenut=
no radi za
Ujedinjeni narod, prona=C5=A1ao sam va=C5=A1u e-po=C5=A1tu putem hrvatske w=
eb
platforme, imam
projekt koji =C5=BEelim dovesti u va=C5=A1u zemlju i koji mi je potreban
netko tko =C4=87e mi pomo=C4=87i i voditi me u ovom projektu,
=C4=8Dekam da se =C4=8Dujemo od vas, tako da =C4=87u vam dati sve pojedinos=
ti o ovome
projekt za va=C5=A1e razmatranje.


Hvala i Bog vas blagoslovio.
Dr Catherine Chan.

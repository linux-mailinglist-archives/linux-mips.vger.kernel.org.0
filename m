Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 637965B2378
	for <lists+linux-mips@lfdr.de>; Thu,  8 Sep 2022 18:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbiIHQUm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Sep 2022 12:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiIHQUl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Sep 2022 12:20:41 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD6CD0774
        for <linux-mips@vger.kernel.org>; Thu,  8 Sep 2022 09:20:40 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id i1so18835295vsc.9
        for <linux-mips@vger.kernel.org>; Thu, 08 Sep 2022 09:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=9ZFpt/foVGQHDYdWFxLDfNkzYkIk3H2JJygdZbdIkYI=;
        b=S2k4/+cJZwBhIMkgWdWhvS4sxcCkpPrypMcJrGhT8Q+Wk24K3zIGZVuLIu0jiWsvqz
         uUWCQmAKAq90mSz3vuUYbyWi8xXihatYrRxe8icdG+tdaeZ1aEXoBHT44Ogrfc4Smv2D
         Lw360FvlnIXDO/oGAk03dUPHm5OBg5q77VsD0wg4mh25ylqGw4nR6QUkwZBInmgv41xY
         uz5mBmoqqcbdgfb2vuzK9IwysSYjTa99i6gHhXifl0LisIbn+Wr+JGNjNq8cK6TM+A3l
         IF2nMl3aSua5EfXad5QyGRhTIDz8B+rD3tplLCwsJPBX0xmVr0cbK/9RT5XVeXTknK5N
         3u7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9ZFpt/foVGQHDYdWFxLDfNkzYkIk3H2JJygdZbdIkYI=;
        b=oWbgegBNM8bd9lIdL4248gRGgeysheId2ueyTezs/XjdxxrW1PKWASCMu3TutD6eoG
         Xvemo0dMjrWpBGTyxVuEG2uv+0ZaSMZgOo0iSLKOONTYlDXhdxXky0jmnP6F3j92etzA
         wyrtAB29/t6+OWQe1Fgi1jeoeEngXqX5xHwjkhXVVz3xLIGKx81Wn5x6aG4BlGuc/gjx
         UXZBLQmd4ngZDUe2WaIUWkrSODi9maGZ6El7t/ADgvWujb2kexrkN6ciJI8n0JQ17g0x
         fqU6l5CKgREthWj/kxbPfqSNZetbLfnhq4Vzfd4MOI2WGPNVZPa+WzJ1bAf++kID1w9W
         paFQ==
X-Gm-Message-State: ACgBeo2YkaEE6CERNysL18GEjZqiphxsYmaS5cfCAoQ1/OAaa/A2pBCN
        PR7QG46kAz3tK1hYD/Pa/DhEMH+VLl7AitLOe4Q=
X-Google-Smtp-Source: AA6agR5hs9fom8t2WP/aU3HnEqp3tMD3w0WnJ7V4BrXxDBbxA5/HiszGmQVPBYZt3gFbx4puysVuJUZ9eGKqOY9ae48=
X-Received: by 2002:a67:f9c2:0:b0:398:2daf:b6e2 with SMTP id
 c2-20020a67f9c2000000b003982dafb6e2mr2363853vsq.19.1662654039057; Thu, 08 Sep
 2022 09:20:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:612c:159e:b0:2ec:bb9:ecd6 with HTTP; Thu, 8 Sep 2022
 09:20:37 -0700 (PDT)
Reply-To: cfc.ubagroup09@gmail.com
From:   Kristalina Georgieva <unitedbankafricau493@gmail.com>
Date:   Thu, 8 Sep 2022 09:20:37 -0700
Message-ID: <CAB9_qi-gkZvg3zaGZ1YNeuDz-JJjwe0CiPNnT-ym4=zasXOqUQ@mail.gmail.com>
Subject: XUSH HABAR
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hurmatli Benefisiar,
Men sizga bir oy oldin bu xatni yuborgan edim, lekin sizdan xabar yo'q, yo'=
q
Ishonchim komilki, siz uni oldingiz va shuning uchun uni yana sizga yubordi=
m,
Avvalo, men Kristalina Georgieva xonim, boshqaruvchi direktor va
Xalqaro valyuta jamg'armasi prezidenti.

Aslida, biz atrofdagi barcha to'siqlar va muammolarni ko'rib chiqdik
sizning to'liq bo'lmagan tranzaksiyangiz va to'lovlarni to'lay olmasligingi=
z
o'tkazish to'lovlari olinadi, sizga qarshi, imkoniyatlari uchun
oldingi transferlar, tasdiqlash uchun bizning saytimizga tashrif buyuring 3=
8
=C2=B0 53'56 =E2=80=B3 N 77 =C2=B0 2 =E2=80=B2 39 =E2=80=B3 Vt

Biz Direktorlar kengashi, Jahon banki va Valyuta jamg'armasimiz
Vashingtondagi Xalqaro (XVF) Departamenti bilan birgalikda
Amerika Qo'shma Shtatlari G'aznachiligi va boshqa ba'zi tergov idoralari
Amerika Qo'shma Shtatlarida bu erda tegishli. buyurdi
Bizning Chet eldagi to'lov pul o'tkazmalari bo'limi, Birlashgan Bank
Afrika Lome Togo, sizga VISA kartasini chiqarish uchun, bu erda $
Sizning fondingizdan ko'proq pul olish uchun 1,5 million.

Tekshiruvimiz davomida biz aniqladik
Sizning to'lovingiz korruptsionerlar tomonidan kechiktirilganidan xafa bo'l=
ing
Sizning mablag'laringizni hisoblaringizga yo'naltirishga harakat qilayotgan=
 bank
xususiy.

Va bugun biz sizning mablag'ingiz Kartaga o'tkazilganligi haqida xabar bera=
miz
UBA Bank tomonidan VISA va u ham yetkazib berishga tayyor. Hozir
UBA Bank direktori bilan bog'laning, uning ismi janob Toni
Elumelu, elektron pochta: (cfc.ubagroup09@gmail.com)
ATM VISA kartangizni qanday qabul qilishni aytib berish.

Hurmat bilan,

Kristalina Georgieva xonim

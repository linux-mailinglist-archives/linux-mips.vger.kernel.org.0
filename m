Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBFF71F705
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jun 2023 02:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbjFBAHi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Jun 2023 20:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjFBAHh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Jun 2023 20:07:37 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC9AD1
        for <linux-mips@vger.kernel.org>; Thu,  1 Jun 2023 17:07:36 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-9745c5fed21so59869366b.3
        for <linux-mips@vger.kernel.org>; Thu, 01 Jun 2023 17:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685664455; x=1688256455;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vE40mJuVkISt0zg8IVAmmNvtPq9ArtEbvKSLEgCOttk=;
        b=QXbnrNIFXYJPUub6nM+ubFSNT6tZ7H9rOkOGiyM5OklolJF61iZhl65VMn/hG7da/w
         +IFUQP1/FKyozgiHO+ixlAqh5IXzNuSJvbecmsKmirXUE6mWmJDT4DuKBg4amB7ZxeXW
         V0CM2FW/H2LCkLzQE9PhkkD7IZeVzw7PovAnpanhWKrTh/hiBvqr2aZ62FqorIO1XNgR
         0amNtoew66edvIotRljg2pjO0cNPWlgseRWntUUkFXJQmt9qNJiDa+X81dM6sMThew2Q
         9k5ULEnpufOr1qlYEBgU/7kkv2Ulrwhunu6LlZxH233pXtgfVrHuxKOl3O0Ck4ihDegs
         iN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685664455; x=1688256455;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vE40mJuVkISt0zg8IVAmmNvtPq9ArtEbvKSLEgCOttk=;
        b=aR1awkhBWgdnE9j5bOFECw6G8SremmI9Sarx246J6U9/GbMc5bzkIj9ESU8ksxIj4f
         AU8VwL5Ho/F2Y+VKnGgGq7OS0v0Hi7q/63xhoZQaNAdfgR18lX6ejzG1+pTdvyrY/KbV
         Zojcao4D8RAHdvpGLbWUjiwb171Sr1KDZt8pUxz5doHaA8LuVIwil0Psa3cRBusx9lPU
         WmRX/pSDpSwrLJIAdtxVk9gbLzqRpGafFoRkzC8HAVSjbCezAI0KRN00r5VgysQcv7nh
         yypgpzJqtcuB0o2uscdh13CjQRKOVUqdlhjSMqbb3wGThngWyvNe/YJB2637iBQiJsu8
         zQSQ==
X-Gm-Message-State: AC+VfDzghhQY8rSYafW37a/LMOTZ+kAH0cSw5reSaPejBb2dKukUmRfq
        5LBQj7W/rfrP1a9yWHJw2awog4VryJAZHdlGTYc=
X-Google-Smtp-Source: ACHHUZ6LthU6X2KnnnmAczj+RAZI5/3MvcEkOrGUYnN1B63tDmiDnubQTUlntrzcclCQOPf9+r2l7N4mhyP4nMtQ2Yg=
X-Received: by 2002:a17:907:a426:b0:96f:c988:93b with SMTP id
 sg38-20020a170907a42600b0096fc988093bmr9971181ejc.35.1685664454616; Thu, 01
 Jun 2023 17:07:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:9282:b0:96f:94df:3652 with HTTP; Thu, 1 Jun 2023
 17:07:34 -0700 (PDT)
Reply-To: saguadshj564@gmail.com
From:   Ms Nadage Lassou <lassounadage5@gmail.com>
Date:   Fri, 2 Jun 2023 01:07:34 +0100
Message-ID: <CAB-+XyUCKDUJh7wOS9Ru6G0NU1bsfsi9LTPHhr5-98uVT17QtA@mail.gmail.com>
Subject: REPLY BACK FOR DETAILS
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:642 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4999]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [saguadshj564[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [lassounadage5[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [lassounadage5[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Greetings.

I am Ms Nadage Lassou,I have something important to discuss with you.
i will send you the details once i hear from you.
Thanks,
Ms Nadage Lassou

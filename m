Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AAB14EBD9D
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 11:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244806AbiC3J07 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Mar 2022 05:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244808AbiC3J06 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Mar 2022 05:26:58 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4752BB23
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 02:25:12 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id d5so34713788lfj.9
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1laEYn5hNiDLs/8Gb+Dgq32vcH7tKNCaao/eNEc5H5E=;
        b=burSSIgPfbhQXfPHXDaW2VK2qrzJBopoohOSGXsy2VZ0mEr+JAHBoSUNUkJ+J6hXUX
         j58POU4jbhPoUFXpre/mKDYdajGNlqiS+D/qlP0nPWGrait1xrLTeaHieQKTg4e67qyd
         3frL/lST3KOz5M2qhpVhpO4V0tt9/w3Wn1dBpmRcok09pzq28SwM93kxbXZ7ImQ/00BN
         Ob/15q8lTYqcs5PUlMZjEW27h4OIKe1q9sXOPw1ZepEaGN8VOs3DQSbQ8Avbf1UQ4Pwd
         GsNxX3K+b5NdFUmZXFOyKnsJ46/qvzgZqz+QWNKZL3Vt2/y+gjS4JVGeuzLVocAgKVgs
         ryRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1laEYn5hNiDLs/8Gb+Dgq32vcH7tKNCaao/eNEc5H5E=;
        b=wSD3pm5fRV6hIZ8a6kGg6sCidn4/Hissn2rQf29kzvN8eZRM6svKYHhcaoyZOk8Mev
         BSITH41p0ebeFGsPmIkaYb38q5/3C+B7Uu4092dl2IflkD6qm3Ojv6PUgDuY8c6RRnKg
         L5MkblI+DfVn/jHjOKfKn7uuP8N2MZJ4OU+dpsyjvYfgrflW4+rMOrjIgBkNDo9Gcq6F
         f/8MYlSKVPOjPVZCozbhoIC3uypU5yemVbpE2GlPpa63Nf2ku2ss7E96ssBiFMgiNN6A
         u0zYA4MXiTHaxZU4ONiEeAE+qCs9CJ/AGszam7i7c3+wDPrtNrTRSeuommeDd6WzkpDk
         ZV6w==
X-Gm-Message-State: AOAM5330pMNRLJB/FaiPRh6HQDAQcHWOO+qQHguET2o35/jBBwWJkODL
        PGn2eIPCfY7C00QG+Y3yyRuW2XWga1XXafyHApo=
X-Google-Smtp-Source: ABdhPJy0ZqCsVA17WQqhx5N5JnDQaBL/cv7ezIsrPmYKll8kMeqvHAoltZFHDyzy4WQTsMDaol639pNjxWyAtFCbhgU=
X-Received: by 2002:a05:6512:ad5:b0:44a:614e:9d61 with SMTP id
 n21-20020a0565120ad500b0044a614e9d61mr6146347lfu.677.1648632306137; Wed, 30
 Mar 2022 02:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220329014537.4180966-1-liu.yun@linux.dev> <CAHp75VcAL6avNxMSVo9nWbxXOnKmXAiuGMV=uWwAx0BdHnf-+Q@mail.gmail.com>
 <71d1da40-4772-b126-7cbe-0d99024fd284@linux.dev> <20220330064216.GA5811@alpha.franken.de>
In-Reply-To: <20220330064216.GA5811@alpha.franken.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 30 Mar 2022 12:23:59 +0300
Message-ID: <CAHp75VencGLsfR=9ug1xBeWeSe+zy_vroaqkh2xWR7BojQOGEw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: rb532: move GPIOD definition into C-files
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jackie Liu <liu.yun@linux.dev>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>
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

On Wed, Mar 30, 2022 at 9:45 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> On Wed, Mar 30, 2022 at 09:46:07AM +0800, Jackie Liu wrote:
> > =E5=9C=A8 2022/3/29 =E4=B8=8B=E5=8D=888:54, Andy Shevchenko =E5=86=99=
=E9=81=93:

...

> > I think it would be better to put it in gpio.c, after all it belongs to
> > the GPIO module and is not used elsewhere. It doesn't feel good if we
> > put it in the header file.
>
> I have a patchset, where the both files will go away. No need to
> clean up now.

Do you plan them to be backported? If not, I would recommend applying
this patch in order to have it backported and then do whatever you
want we those files.

--=20
With Best Regards,
Andy Shevchenko

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E805D6E7775
	for <lists+linux-mips@lfdr.de>; Wed, 19 Apr 2023 12:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbjDSKdJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Apr 2023 06:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbjDSKcw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Apr 2023 06:32:52 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42B42A5C4
        for <linux-mips@vger.kernel.org>; Wed, 19 Apr 2023 03:32:48 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6a5f6349ec3so748289a34.0
        for <linux-mips@vger.kernel.org>; Wed, 19 Apr 2023 03:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681900367; x=1684492367;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3XSqvrj9FGCYS1ksd0C9vpvihqJ2xRJTy45N8qgQwo=;
        b=bmbFupc/uECSlTZCt5fqcSlzyU2rXJ826O7WDdHlb0rHphYR5of35XPSoxN0FwNI2S
         2ErnAGgJ3Dg311z3tbpfl//I2kJsb13e8RbgNs8mRt19CQHX1wCEi1UsIj1zrMm3vRe7
         LH2TQcx5I4GT3LpSSTf0z6UnEkkqEHa/EEWgd/T2ZEDKMHQcB3fxpg2Rkj6+yUZpIzDM
         a0C3p2zipH1YhynNSuFFV5H7MrlBtiAz77YVQZ4fsjMC9ujwUufLvfZJfI2WB/knLkKG
         +1I/FnYH0lIGFChuQBrACuhZRfGgF7CpN0VW8ShE761+RIMPRum1i1XJFTfsE7hGEHcK
         Emtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681900367; x=1684492367;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X3XSqvrj9FGCYS1ksd0C9vpvihqJ2xRJTy45N8qgQwo=;
        b=NfyKx1tMDNiFoEdAxIF8G7toAAvRYplLwYUgrw6BWmhmgNpEPXVKO3LN2/wjDldCEC
         JblBoxGgtZ8rFiRpJQSmBqa0TtggjzSv1N614Ih0yUIacXqc34JIVMS8kYSFZkk15Qe1
         MUpEXmT/+sk362khP5rorQ7fpwJBQihNymH2vZd7UyKHQt+GlB6zqIRTwvle6QVsB04o
         xZhfMEuJy7nZZG8+Xn3E+Ac9KdbFbY9xjRu2f9PByAeM2I83PqCpG0FiZcazC4zQ9VfI
         kfYgDaUt1LrHBXuPJl9XHetD4dm3OWHWJwnU+RnSzntFq5VDBd5zOhqWeH5pTjdAm393
         kqBg==
X-Gm-Message-State: AAQBX9eb28dYY1Sy/GMyg3wDcAyYoRoMplB5GbwWY75vdXo6ktZ33CG5
        L5rIYLe18W0zcDA4nWoPTap584N41iYpt1uRdRQ=
X-Google-Smtp-Source: AKy350YM1n0uH4leEk9Gxe12ulpC7w/Kp8skg8OiALUbFSr8DGObZhYBviCQeBU+KDbK2YHmBX85cLJIpiuUoirrQt0=
X-Received: by 2002:a9d:7a47:0:b0:6a5:d8ff:a846 with SMTP id
 z7-20020a9d7a47000000b006a5d8ffa846mr1573109otm.7.1681900367489; Wed, 19 Apr
 2023 03:32:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6850:d8a4:b0:480:899d:66bd with HTTP; Wed, 19 Apr 2023
 03:32:47 -0700 (PDT)
Reply-To: hitnodeby23@yahoo.com
From:   Hinda Itno Deby <barr.williamboafo1@gmail.com>
Date:   Wed, 19 Apr 2023 03:32:47 -0700
Message-ID: <CAK0gjPibfc=D9GAk7W5muQZ3LEHLf8rU6cVvgtzd99QHP6vGkw@mail.gmail.com>
Subject: Reply
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY,URG_BIZ autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:330 listed in]
        [list.dnswl.org]
        * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [barr.williamboafo1[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [barr.williamboafo1[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [hitnodeby23[at]yahoo.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.6 URG_BIZ Contains urgent matter
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  3.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

-- 
Hello

My name is Hinda Itno Deby Please I want us to discuss Urgent Business Proposal,

 If you are interested kindly reply to me so i can give you all the details.

Thanks and God Bless You.
Ms Hinda Itno Deby

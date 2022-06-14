Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF49754B42C
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jun 2022 17:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242638AbiFNPGH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jun 2022 11:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244046AbiFNPGF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jun 2022 11:06:05 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B052F41988
        for <linux-mips@vger.kernel.org>; Tue, 14 Jun 2022 08:06:03 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b7so10067779ljr.6
        for <linux-mips@vger.kernel.org>; Tue, 14 Jun 2022 08:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=vDXeosZPLnAdet3lLyVvlgmLSkIXe3ZMAo+I2HLU3qM=;
        b=ADjcc9w1bQrx5rtV1Mf+IAGWlLSnQcDys2nJcMpvgLW+wY6RlS9S/6FycY7NjTjAPh
         Qw9TM/HuVzl1lMtOJZ/ovI3Fv/kg/iWv3++BYbAkPZ1Tzt9KMG96qZmAE4YU35eeHpkN
         6L0M2zJ/3/QcUsKmuQ7ZfcB0+e4pTJ9Jr5o7DgSM5eqJUIX2CbaYxazFoXXQc6RDmOix
         aG2xQWxoNoysjUiTVEHnvQ5G1Djrfkfz8mYKHb23m6vkxlCidCHXcP2Y+owGSguF1dMX
         DJ6DCeKRx1ISj6NAak6aOFajI+6HoxE51IdFvDnWraSO93lzVgN7EDyG7lezu+uvznQm
         2Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=vDXeosZPLnAdet3lLyVvlgmLSkIXe3ZMAo+I2HLU3qM=;
        b=OegBCwkbTAxieYmsZCxHM3M+hxWVqHY43t03fJbG85ol01xHZjQNoQPQUwa7yQerqI
         TZmtbeyF/xGo7/M58EqtH7vANu8k+ubG6tEQxSRIAwPHUrNyHI7MdWReyZCv2SDSjYsW
         av3xYuSj3BecVE3plZ+pKjkSldmO5hGjV4cWf29ufMd/c5LMmqI7hmL92dKi80r/5I8A
         zcwr+M6Ao1sLBRxiBCPUDgftOMALXUD21ZxatokAZaY/CWAqUSfndZxlAPiICLrWvutY
         db+s7cbdYbzEAJnLEpwIPAp7Ag3Fmjh2zq4tSZJFYV3bJ3J2yuBF2eECjPFQrkRTxSqs
         eJBQ==
X-Gm-Message-State: AJIora8KXueZf74pW2URVbLCp/HBxudadEFvvXTHyQgCZc7+c4y+LWC4
        7OGeFwOFt9ylZU7yo6dLabJtUcHQLlnHipnb4V8=
X-Google-Smtp-Source: AGRyM1spBnC0vsT94e8LmoA03BULxafK5Jk21LYSVQka8mO4afoKR+HLt4deBwBjEmmhSz+rOQctw5Z1CMjvXW5nY78=
X-Received: by 2002:a05:651c:44f:b0:255:889c:d100 with SMTP id
 g15-20020a05651c044f00b00255889cd100mr2804082ljg.352.1655219161695; Tue, 14
 Jun 2022 08:06:01 -0700 (PDT)
MIME-Version: 1.0
Sender: moyba45@gmail.com
Received: by 2002:a05:6504:1891:0:0:0:0 with HTTP; Tue, 14 Jun 2022 08:06:00
 -0700 (PDT)
From:   Juliette Allard <julittealard40@gmail.com>
Date:   Tue, 14 Jun 2022 08:06:00 -0700
X-Google-Sender-Auth: 7lCte0r1d0HCOWshYxFTzoUEtj4
Message-ID: <CALePR89j-31gx0GzOWLVXd=m856Dpz6EAScc4HWvb2+Eb5V0tQ@mail.gmail.com>
Subject: Assalamu Alaikum Wa Rahmatullahi Wa Barakatuh,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.9 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLY,LOTS_OF_MONEY,
        MILLION_HUNDRED,MILLION_USD,MONEY_FRAUD_5,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY,URG_BIZ
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:241 listed in]
        [list.dnswl.org]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [moyba45[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [moyba45[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  2.0 MILLION_USD BODY: Talks about millions of dollars
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.6 URG_BIZ Contains urgent matter
        *  1.0 FREEMAIL_REPLY From and body contain different freemails
        *  0.6 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.0 MONEY_FRAUD_5 Lots of money and many fraud phrases
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Assalamu Alaikum Wa Rahmatullahi Wa Barakatuh,

hello dear

I came across your e-mail contact prior a private search while in need
of your assistance. I am Aisha Al-Qaddafi, the only biological
Daughter of Former President of Libya Col. Muammar Al-Qaddafi. Am a
single Mother and a Widow with three Children.

I have investment funds worth Twenty Seven Million Five Hundred
Thousand United State Dollar ($27.500.000.00 ) and i need a trusted
investment Manager/Partner because of my current refugee status,
however, I am interested in you for investment project assistance in
your country, may be from there, we can build business relationship in
the nearest future.

I am willing to negotiate investment/business profit sharing ratio
with you base on the future investment earning profits.

If you are willing to handle this project on my behalf kindly reply
urgent to enable me provide you more information about the investment

Your Urgent Reply Will Be Appreciated with this emailaddress
(aishagaddafimuslim8@gmail.com)

Best Regards
Mrs Aisha Al-Qaddafi

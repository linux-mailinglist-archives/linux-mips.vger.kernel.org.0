Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A005268665B
	for <lists+linux-mips@lfdr.de>; Wed,  1 Feb 2023 14:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbjBANFX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Feb 2023 08:05:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbjBANFW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Feb 2023 08:05:22 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F862D4C
        for <linux-mips@vger.kernel.org>; Wed,  1 Feb 2023 05:05:21 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id ou35so6238581qkn.5
        for <linux-mips@vger.kernel.org>; Wed, 01 Feb 2023 05:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PsIv8B0eZ2dTiSpWjfLGSojmLCHXwLJUiSZLzPpowWU=;
        b=oND+SVsuUH0f1VqO+DvUocnBOZJxyUbT7SsygnJYGfSmh0YPwnISxpx/YJBXJDSpIM
         6ASFEzsntu/ex4Oi80lD5+3jW2PqS1q/rifS5QwoeIN2BkbLSHkbwe4Oj0ca4mVcpHzw
         1fbKltzT3054NgZL7f9s7x8Y8bopYUqO1NY9rmmWxH/gZP30OUMT+Qme/gLILAgTrdcl
         6yQU3OVa5vSjzU42J906tXKKb2+IXJMcCMR95vOV57lbhQYuejbV68BQmuU6ZRqicvjL
         ii5Q4i+5FKgTuNutjc3lD5Hn3LmgU7TgvhwbL8gljDKJnll1kRkOO2JWj8wirwMg7fde
         cH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsIv8B0eZ2dTiSpWjfLGSojmLCHXwLJUiSZLzPpowWU=;
        b=XqQUlp+t17jyMpAcyb/3wALkAQxiqJNXnUvivrNXSyX0VJtHn2CZEVyCfhJARh7nmM
         KYVmFrM5Zg7zMM3jlNC7ILVx+rLcyh61Sij6GOxOvrRAqwJal9i2sAYYbAbPF9Ipk0lW
         oATeFYtgkrWMdIolMiL10itqUwHMI0G8kx00M4W5DlSgAhylOr8mcSLuFf64OIkozVSu
         f1rB97O1/kT/8szD8CGAaWF9XBFPVXaoq2UvfrU1RslrjuZF7qelpwY19tjPhqcvIKc5
         8CXCJ3BbqIKLVX2u05KmQcDqN/XXQ8mxNClGamRmqxiqeR8m3+MJ9T/GjN4F5j591fvC
         7rYg==
X-Gm-Message-State: AO0yUKW0jLwPjGRplY7byBDmTlF29yu9JO6p+1e4UnbEeDViVcF02ZzA
        9iix44TAygHz/WB58rg0Sy1KTEVaSldNe5+NDKw=
X-Google-Smtp-Source: AK7set//7iXqgNwvI5Qi3YpBJ+1bgVOHXcPgtE6swM6QVNg/xdIpss/oGyPAYQ/zlUfOgLyM38de+UfGjRXPlBuWGTY=
X-Received: by 2002:a05:620a:13aa:b0:705:c855:bed2 with SMTP id
 m10-20020a05620a13aa00b00705c855bed2mr228820qki.240.1675256720456; Wed, 01
 Feb 2023 05:05:20 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6214:1647:b0:537:7a70:2fd8 with HTTP; Wed, 1 Feb 2023
 05:05:20 -0800 (PST)
Reply-To: cristinacampel@outlook.com
From:   "Mrs. Cristina Campbell" <cristtinacampbell@gmail.com>
Date:   Wed, 1 Feb 2023 13:05:20 +0000
Message-ID: <CAArciVp4emn9arjeREd0H14o+bm37c94RwDdwFEp5srWCm4GKQ@mail.gmail.com>
Subject: Kannst du mir helfen?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_HK_NAME_FM_MR_MRS,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:72f listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [cristtinacampbell[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  3.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Lieber geliebter,

Ich bin Mrs. Cristina Campbell aus London, Vereinigtes K=C3=B6nigreich. Wir
m=C3=BCssen =C3=BCber etwas Ernstes sprechen. Wenn Sie nicht zu besch=C3=A4=
ftigt
sind, antworten Sie bitte auf meine pers=C3=B6nliche E-Mail
(cristinacampel@outlook.com), damit ich Ihnen mehr dar=C3=BCber erz=C3=A4hl=
en
kann dieses humanit=C3=A4re Wohlt=C3=A4tigkeitsprojekt in Ihrem Land im Wer=
t von
sechs Millionen US-Dollar $6.000.000,00 USD.

Mit freundlichen Gr=C3=BC=C3=9Fen.
Frau Cristina Campbell
Email; cristinacampel@outlook.com

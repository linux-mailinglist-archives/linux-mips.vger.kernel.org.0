Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38D0E5AB34B
	for <lists+linux-mips@lfdr.de>; Fri,  2 Sep 2022 16:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236624AbiIBOVU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Sep 2022 10:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237249AbiIBOUw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Sep 2022 10:20:52 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE88D130AA8
        for <linux-mips@vger.kernel.org>; Fri,  2 Sep 2022 06:46:54 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id cu2so4096108ejb.0
        for <linux-mips@vger.kernel.org>; Fri, 02 Sep 2022 06:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=K9aCivmd3pOhXO+7wSe24RMSLcWBP61HE/hhO1yg1yw=;
        b=maLWiqSKmUrRLf9fZ3eF0aI3dmJRSVqPSjWucEeTHVTHAfmnK+pDYfyGmKKDr5AJwQ
         gBPNbJU/rw8IxgfXwPLTIRj/jLUbAzD4JCj51haerYirheekp6oAyQiC2rqjKKeIrjy4
         twvxpDyobUjD7jYHMUGbs9kyRRI7CtFVOc3XOIK/k1Tc3eBmjzLygFnuNV67qMnpVStH
         ehyMIwxZNgroU1oUM3ZG/FZW7aw6e8luBIpWmhLFdVEjSxPGwqAfvxl4fmItAKltZ/4d
         hw2u6lSaF20tP4lGWzkq3R6jAtCFYjdvbFCw6f2QxYpGivYtvRCGYT03co2aRWen5AY4
         nxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=K9aCivmd3pOhXO+7wSe24RMSLcWBP61HE/hhO1yg1yw=;
        b=X3EWaStC1CPWHHCu7lc2/Ygj4aNFTFcBLKyfOW/6U47mTeidjCGQkw0dt8B9jdpsmW
         j6kDUQ2Fyi9PMsLwQJZDXZbDaFXQ/FH6Ld7jYXZXLA26uqWtQ7fGndNJFAstB01fPhxx
         IIgiFhlajUfes8YgM7zxpeaDpLDGo82TTQBOHRQhBGUBMu7EuYv3AtwCydLc+s9iJLOQ
         1YMBSqnpX6EuFIWsjCM3ZlbHnyD4/tb3gT3J9WuNTq7bvT9neBlSsGBdTy0wOcK6lzDJ
         43NSOsbguB9RFO08xg/unLwImu5FUXT+3I5eVbvDJQM5dv3RlpS7RpJFJPEf8Xe6s9oF
         eVJA==
X-Gm-Message-State: ACgBeo2h2F5tru1ggURf2gp0TUbiWRr86CaJFeJ6j6A60AbSFULXMM5G
        0r4SIXNEu8aEDSZY9TJF1c2Nja+TNIqYu153s/I=
X-Google-Smtp-Source: AA6agR5HExVUpu1g8xOQR6vMSNv6nGLZxQnVZc18qFXYAMqNsN9aoX5+FCEnK2QF9zLEEfjuYAg+HU4depuahXV24Vg=
X-Received: by 2002:a17:907:b10:b0:73d:bedd:3121 with SMTP id
 h16-20020a1709070b1000b0073dbedd3121mr26410680ejl.530.1662126408836; Fri, 02
 Sep 2022 06:46:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6400:5b87:0:0:0:0 with HTTP; Fri, 2 Sep 2022 06:46:48
 -0700 (PDT)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <davidkekeli4@gmail.com>
Date:   Fri, 2 Sep 2022 13:46:48 +0000
Message-ID: <CAO+ex-Vu+cbXW-=OVsfZQtwrg+6hNuWu2r4dbO9A10oJcn9jnA@mail.gmail.com>
Subject: Hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:636 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4912]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davidkekeli4[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davidkekeli4[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Best Regard,Mr.Abraham,

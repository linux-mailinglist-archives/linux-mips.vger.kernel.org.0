Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7A60536DE7
	for <lists+linux-mips@lfdr.de>; Sat, 28 May 2022 19:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238957AbiE1RRR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 May 2022 13:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238811AbiE1RRP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 28 May 2022 13:17:15 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145F9BC8E
        for <linux-mips@vger.kernel.org>; Sat, 28 May 2022 10:17:14 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id r82so2845898ybc.13
        for <linux-mips@vger.kernel.org>; Sat, 28 May 2022 10:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=pSKuz9BJS/Qwel4yBJUKsJP++c1z8gtIosTtEbMtN5I=;
        b=Evcz97LOKzHfSgT/AL/l+ZvMvf33Mnf2JcLi4+SabJA4RVfVM4/A46bF7LrAex2ihQ
         DAlRR8/zXtJTnIoEfh6f7bdC2JRR+yXK1eOVqaphmBhPg+nXO/886U3X5GDEMu2yZzTG
         2QbvLBgO/2ZnaMZ64zlK5XOVIIl1SuH3E1vYjFzTh4ifT/z4GjIOkdCqWZaLHfZRu/L9
         XInGcHNGmawHrNpuj/q0VbBJWcYR7YDA070uYdD/UQCxkpMMrEj2bhBVT3vnoFUN6ubb
         FY2vKq+UskzZ+khk4B7ynDvYv4mv8uOY5VIkwWrNQ13Yu6d+0uCVvcPG55NygjZC9ZzA
         KzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=pSKuz9BJS/Qwel4yBJUKsJP++c1z8gtIosTtEbMtN5I=;
        b=YX6mZS0P5Y9DgX8pwum9XVZw4PgNwwrqBYxMhPYkwohMFfz10XOARYo2oocZmtsXG2
         v6RFQBRcTTD1GJAnEPmB/1mcsriCT1vEGCmw6IhVkdmuDK9pJS+2e8eIyPD3S+r53dYm
         Ricr7K7e2yjJrEOxah1EImFn7lBAv8IKVFEjZOIyEZXsHcFuxopuHcAWJdMGNMtiuInx
         54FDPSubE36Q4ZsWf4/C5LqDp9ot0rPbhnxU+jDs4JYoUMypI1BJnie44v03DDYXp3qV
         TU46iab4icJdL7vVXBRNh7+/1dXXB040yRiPZE1WjJdNMFosejXyrkY3Xfy0N1ISLqq9
         o+/Q==
X-Gm-Message-State: AOAM532+JxY+yCuRs0xP6cGm8V/fpdH0BR1ETkynIKWm7EK5Ut7hmUBY
        k9//hZj+pQhicMDccjpIBzkdrx1Z+bIm5QiONTQ=
X-Google-Smtp-Source: ABdhPJxPsnNngIXYUzCPybntA0BZ3Hio+So97vpfEl2GjbHePX/ZnvzzyR/z5l50rmRV1R4F3fvnNoPkkQhCO5/mYL4=
X-Received: by 2002:a25:168b:0:b0:64a:54ba:e88e with SMTP id
 133-20020a25168b000000b0064a54bae88emr42052597ybw.17.1653758233195; Sat, 28
 May 2022 10:17:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7108:768b:0:0:0:0 with HTTP; Sat, 28 May 2022 10:17:12
 -0700 (PDT)
Reply-To: davidnelson7702626@gmail.com
From:   Viviane Amouzou <vivianeamouzou5@gmail.com>
Date:   Sat, 28 May 2022 18:17:12 +0100
Message-ID: <CAHpnGrhK7NLqZF9qc8c4tF7S0W5tp9A3wdfsMR8bpNThgpvN4w@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b34 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5055]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [vivianeamouzou5[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [vivianeamouzou5[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [davidnelson7702626[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello friend, I want to send money to you to enable me invest in your
country get back to me if you are interested.

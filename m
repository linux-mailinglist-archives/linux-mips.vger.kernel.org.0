Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B402547812
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jun 2022 02:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbiFLAlX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 11 Jun 2022 20:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiFLAlW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 11 Jun 2022 20:41:22 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4D14F46E
        for <linux-mips@vger.kernel.org>; Sat, 11 Jun 2022 17:41:20 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id d39so2701919vsv.7
        for <linux-mips@vger.kernel.org>; Sat, 11 Jun 2022 17:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=sOgVn4OqNYS4wwCADnWwXYDI35adqTFx9C/UvURvbj0=;
        b=mxIWfdZdMhIrY33OoLlFvoPLUsAErD3Wz3sN8YLCgqKaSrlWODD0e+JTG4uqLErwzN
         MqBNRmRKxZWhVFic6XKxfh7v8ear0WLcA1TIIMP5t28EM8QhHOY2U23/Ud3yX3QldyEj
         BbG1yKPxTZGn1s7zo4TrM7PpF5D3WWhwbR8q2JXjk6CMO9U7NNzegffXrsDWFWqDbimc
         Di0jyD73BTFTHIBD/smtSs4XASMXlULKozdRAUwsFwBV4x6sfQsCZGdNSa6iEwX02TnH
         SkWe3hVPiOmrD6jFHNeqTT6/H8Fb56v+OgTft1i8eAobKgzBen68idMKwEv39CR0DfUq
         7qAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=sOgVn4OqNYS4wwCADnWwXYDI35adqTFx9C/UvURvbj0=;
        b=0kefObOhQSDeFCKKcZj9Si6ajUdALMq6qAv+9UxAb0AU/dAQf+zlIWUjaYLeG/TL3u
         tBXknUlWohZQPaQmvfpXpXFbI7LY2wSGGkKOnDCL/GMN8kk6vjQ/UDcDpTvdJ70cmepe
         tGSfFsrJ6XcmnlumM1hHqHkFgvRvnotrhqRA196x1vHTBETkMXxwYG8chiW6oSfw+rWG
         Uxv+7ESrgrkMkL8ahDeMxnL5Rt6zDvvkIs8Na2ZDfROveLM/H12U9BvjhqCAqaLhawKM
         aupFyRQIf/FulHfYfo7wqhROFOdMFLynJ2lbNKLFl/FdBmjo1Bb1FJQjrlV/FtZdcsmz
         Jpbw==
X-Gm-Message-State: AOAM530au7D5RM1GFH/u6+zVdaefGsVw0nTVDxEsTiYfsTEl+TAhdjx9
        oZAF+FJ7PZPfENH8S2F4KWI3wWftv18exozrcac=
X-Google-Smtp-Source: ABdhPJx12AjSl3XhO8tMthVxwNRXyNPkor5Tlxu7PDolfhcbxytMM/Undx1kfQuZa2rFJLbGWVYiEmg1+mUIrkDg+3c=
X-Received: by 2002:a67:dd19:0:b0:349:dfd1:fd09 with SMTP id
 y25-20020a67dd19000000b00349dfd1fd09mr22808338vsj.69.1654994478991; Sat, 11
 Jun 2022 17:41:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:612c:2122:b0:2c9:ae23:f433 with HTTP; Sat, 11 Jun 2022
 17:41:18 -0700 (PDT)
Reply-To: oksr1l19@gmail.com
From:   Senator Bukola Saraki <hassangilbert57@gmail.com>
Date:   Sun, 12 Jun 2022 01:41:18 +0100
Message-ID: <CAG3d5YvV7zCHj_k7Qzo1rFbOSTYwnJGS2jzfB8b_R+svfS_NXw@mail.gmail.com>
Subject: Please Read!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FILL_THIS_FORM,
        FILL_THIS_FORM_LONG,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e34 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [hassangilbert57[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [hassangilbert57[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [oksr1l19[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.0 FILL_THIS_FORM Fill in a form with personal information
        *  2.0 FILL_THIS_FORM_LONG Fill in a form with personal information
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ATTN:


I have interest of investing in your country as such I Decided to
establish contact with you for assistance As soon as I am able to transfer
my funds for this Investment.

There are two basic things I would want you to assist Me in:


(1) Helping by providing an account where the fund will be transferred to
as all my accounts are under security watch by the economic and financial
crimes commission (EFCC) Set up by the president to frustrate his
political opponents.


(2) Helping me to carry out feasibility study on areas/choice of
investment you deem best for me. I served as the Governor of Kwara State
for 8 years and Senate President for four years and due to the power tussle
between I and the President Mohammadu Buhari, I have no intention of
carrying out any further investment program in my country for security
reasons.


In your interest, get back to me Enclosing your full names, contact
address, age/sex, telephone and fax number if you have any.


Thanks,

Yours sincerely,
Senator Bukola Saraki.

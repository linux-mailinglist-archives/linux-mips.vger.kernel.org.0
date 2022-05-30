Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70968538430
	for <lists+linux-mips@lfdr.de>; Mon, 30 May 2022 17:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242102AbiE3PMq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 May 2022 11:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239784AbiE3PMj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 May 2022 11:12:39 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558C32ED5A
        for <linux-mips@vger.kernel.org>; Mon, 30 May 2022 07:12:42 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id y8so11397227iof.10
        for <linux-mips@vger.kernel.org>; Mon, 30 May 2022 07:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=XJqXgw0Qi4Ge6Q57wB4GlvotoYnhUuSq68y9152a6AE=;
        b=JsCtuXKpsViwY/CJI0/LxQxugvjrtA4BOeO2s8Sw/MrosHEeJ4yrMj0n8DIWPtcNav
         CcFqPdv07L2Ge71ZRHy5wTNlhph0UajUtpEp69f4nDIGjBfDUf3ywSKUeVyX9ZN2aiVK
         JQPzLJSEWmxOvx0aQTF8UcBBkr3MBFu/psgeu0tPSG5nzxCcwQyqKh/+yK5ob2XZp0w1
         Pvt4sb0goxrJYdckqDnkeKnPhnMtW7rr3LwsPzbjAG4Sx87b7tUHogz/5sffFcPlDH71
         Ii54SDI2UCn9kbE25HiuXyB+BcyEfANlw488btb9yiGzSJpBGsnsEFxnmiwSiB5ST4Jw
         dJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=XJqXgw0Qi4Ge6Q57wB4GlvotoYnhUuSq68y9152a6AE=;
        b=skRsJTS164F0S6y//NlNIRSTKrk65MSm7lT32Obp6qWnKrYH/QsWOeU3RwQRzARxHi
         jHQgw21fIPHeDM4fE1581rIn287y+DoBgv7PIUh6DfNjupiraQ90LIPtDlEkd4I4zBbx
         LUj802OYafuyPBwg0VWqMmskHtZRESbnf7QL4pEg+ysPjnp5WGcFLW1bRt6di2wJHH0Z
         bDU5eShY4bNZVFkQJwTwE+HCttE5coKCxlbYKpl/8C2g4neqPE7hMQ3Ip3STdXJrU7cy
         ZLtnl/wMlqJCh3/Ndl+8DWKRiyLOZ10sZfoL7woO4uzi8ikV4cr/6voMiB3JZbuh7F89
         UXMQ==
X-Gm-Message-State: AOAM531TTTmWrC8l+Wln1OUFbKb7VpfzmzMGmwCEUw33sItiu08cX+N+
        DGBN0IlVGBRFq8tRw2BtHVI+9O1dbIeKqd+O+rM=
X-Google-Smtp-Source: ABdhPJystCAY+oZR2ngxwv/ZHdKxqwS8y6U2PAr9NfyAZ0LxrpfGI0MtVlBXwJJdG9aEmyFfkn9wBgtvckZXyzCPHoQ=
X-Received: by 2002:a05:6638:13cd:b0:330:bc2b:d8f0 with SMTP id
 i13-20020a05663813cd00b00330bc2bd8f0mr11862159jaj.41.1653919961459; Mon, 30
 May 2022 07:12:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6622:f06:0:0:0:0 with HTTP; Mon, 30 May 2022 07:12:40
 -0700 (PDT)
Reply-To: barristerbenjamin221@gmail.com
From:   Attorney Amadou <koadaidrissa1@gmail.com>
Date:   Mon, 30 May 2022 07:12:40 -0700
Message-ID: <CAOh7+P9UwKyjyMMT++CSm4EweqD80wcjqOPKJnR-SLPmtF2uaA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: Yes, score=7.7 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d43 listed in]
        [list.dnswl.org]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [koadaidrissa1[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [barristerbenjamin221[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [koadaidrissa1[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8gZGVhciBmcmllbmQuDQoNClBsZWFzZSBJIHdpbGwgbG92ZSB0byBkaXNjdXNzIHNvbWV0
aGluZyB2ZXJ5IGltcG9ydGFudCB3aXRoIHlvdSwgSQ0Kd2lsbCBhcHByZWNpYXRlIGl0IGlmIHlv
dSBncmFudCBtZSBhdWRpZW5jZS4NCg0KU2luY2VyZWx5Lg0KQmFycmlzdGVyIEFtYWRvdSBCZW5q
YW1pbiBFc3EuDQouLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4NCuimquaEm+OB
quOCi+WPi+S6uuOAgeOBk+OCk+OBq+OBoeOBr+OAgg0KDQrnp4Hjga/jgYLjgarjgZ/jgajpnZ7l
uLjjgavph43opoHjgarjgZPjgajjgavjgaTjgYTjgaboqbHjgZflkIjjgYbjga7jgYzlpKflpb3j
gY3jgafjgZnjgIHjgYLjgarjgZ/jgYznp4HjgavogbTooYbjgpLkuI7jgYjjgabjgY/jgozjgozj
gbDnp4Hjga/jgZ3jgozjgpLmhJ/orJ3jgZfjgb7jgZnjgIINCg0K5b+D44GL44KJ44CCDQrjg5Dj
g6rjgrnjgr/jg7zjgqLjg57jg4njgqXjg5njg7Pjgrjjg6Pjg5/jg7NFc3HjgIINCg==

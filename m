Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87BA7797FA7
	for <lists+linux-mips@lfdr.de>; Fri,  8 Sep 2023 02:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbjIHA13 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Sep 2023 20:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234512AbjIHA12 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Sep 2023 20:27:28 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395791BD6
        for <linux-mips@vger.kernel.org>; Thu,  7 Sep 2023 17:27:25 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-573e67cc6eeso1173719a12.2
        for <linux-mips@vger.kernel.org>; Thu, 07 Sep 2023 17:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694132844; x=1694737644; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThJt1M7ME2yNWaBDeE2oHIMrUhxdt6uGEqSizM4hY4U=;
        b=oEfAnsl3XwQiOn6TLHcS7Wsb7DKUl9WB8SJ9BsNwyrz+kqZgA1nmTQwhwbg1oWajMG
         30XsDm7pzj3NoiXlvCyJhL/8BHabRHxAY+Q2pVsC4BekdHmhq+27kTPhxAuuqH66OBKj
         4pqNXtn/bF+HopskzbEigenQzHpdtM/AK0VmO/plHCIwO5yxo0Oxik5uuHh8K7hSKjUN
         wiq+ESuBR/QBW2MymqXt0Zjcu6SUFg/WAL42AQRHbwFnhib3T9nAT2uWDjlIx9x0HWOc
         cSWHdkuyg1moQjJEP3apM+cAn2OKdo68PiJC3Jn+sS6KX5m2/z3RTLGEOOafKqAY8UJY
         3uBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694132844; x=1694737644;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ThJt1M7ME2yNWaBDeE2oHIMrUhxdt6uGEqSizM4hY4U=;
        b=C1dt2SZCEK5jaXjNAdpEKA4e9PsVKoBTELNVH9itv/D1/le6LN2GWmKAMfjbYznfvP
         iEz5lMlnMbqLnj6x0u5ezE/1L9hYMQRof1y8zOeSp/4mDR4EZsLiAqr9SAjGln0+OmLZ
         QLcIaYaP/11xkplAgy6aITL95gQsHyW9SqrgX370X32y5MzExC7gfXZwSl9pFDbtTpve
         GeAo2LxQXUmA7ZXOm9EXQ/Dram+MvBgofGQTEicWeDe6CVK4XQ4xx5UkRA4XJrMgQ2uM
         EPzr8rcjX1ONde2N2aoYxz0F6XyXYxdwNgDe6mj0izbvmhhzVEucLG4HWdI1t9RnW7Ov
         bazw==
X-Gm-Message-State: AOJu0Yxjvs/Hl8RYQDAvs7putBx5BW4Os9Z/Mzg6jgz+YWpqsedNTtCp
        r4wbVYqM5YEbRCzShJFBf4PpFxB5IenhQkN4v7c=
X-Google-Smtp-Source: AGHT+IFKoDeupbu7l4hJ/zNIFFfQ9i5PyCwlt/WeMSZ5zFGFPDjN8M1YJwTionUwZP+AdhM3AqXUjxXA+GdjzZMhqCI=
X-Received: by 2002:a17:90a:d482:b0:268:1be1:745a with SMTP id
 s2-20020a17090ad48200b002681be1745amr1150915pju.29.1694132844625; Thu, 07 Sep
 2023 17:27:24 -0700 (PDT)
MIME-Version: 1.0
Sender: annavanessaci@gmail.com
Received: by 2002:a05:6a20:7620:b0:137:6958:9b4e with HTTP; Thu, 7 Sep 2023
 17:27:24 -0700 (PDT)
From:   Olga Jean-Louis <jeanlouisolga6@gmail.com>
Date:   Fri, 8 Sep 2023 00:27:24 +0000
X-Google-Sender-Auth: bYRIYz14YxJl46g6S2EBW9ASDhA
Message-ID: <CABpNhj2hkV0kyAiGCY-c4+JZQUhezzZCcczoZUHrVVasHo80tg@mail.gmail.com>
Subject: Hello, I Am Miss. Olga Jean-Louis.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2607:f8b0:4864:20:0:0:0:52a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [jeanlouisolga6[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  2.0 DEAR_SOMETHING BODY: Contains 'Dear (something)'
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Dear Sir,
Please can I trust you? to assist me to invest my inheritance fund in
your country? and to help me to come over to your country for the
betterment of my life and continue my education. Please Can you help
me?
Best regards,
Miss. Olga Jean-Louis.

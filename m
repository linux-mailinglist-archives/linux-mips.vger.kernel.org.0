Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 592F16B9CAE
	for <lists+linux-mips@lfdr.de>; Tue, 14 Mar 2023 18:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbjCNRNy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Mar 2023 13:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbjCNRNk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Mar 2023 13:13:40 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051485DC9D
        for <linux-mips@vger.kernel.org>; Tue, 14 Mar 2023 10:13:39 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id cn21so34769352edb.0
        for <linux-mips@vger.kernel.org>; Tue, 14 Mar 2023 10:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678814017;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nhQhjF9uDVvwwdV9a8CY5YmhhPKLzAuYzDFk/auc74=;
        b=EGjEMtk6r6etcP6qEYsZaq2h+9GOhpyU6kdW05TyMfshpaO+OR5NicMYfyIFBGs99n
         3PloXjL5qTkfqpfnZSMvnafCcmxMmk0+z7rKHPY8ns/6OpvLh2oVhOpml/ZkA+DG7UL+
         DCWmdIaf1V0mPan5s9cXa/61aYczXC7rDPGYxMY5WJyUSyYoTkVZt1ZjdXhzVpSKfnLJ
         WaQ+8uFG1A0MEg8O9RkCMsaybqZ+KS8OKfMBarVoqKYEWzLEoZsrArGflOw27K9vhLTg
         p/3Q6Dmxb4D5iWZSZ1+WlQ92szGhth2sIKv8Fqxu/iGFxxuDOb9ga3wPDZCTOd/6a2jY
         TdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678814017;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7nhQhjF9uDVvwwdV9a8CY5YmhhPKLzAuYzDFk/auc74=;
        b=vLmP/8R+OYQEoWPaPG0OzczxQ0P7f08W3QiWmzXsAs1q22pwnFATSWb5x2Nj5aYnwI
         szWVxeeZurFCbU/pZyc9W39vMtyUsUK5rtru+gKppU5TJIHrXiOQiZwUw4sbmteBRkPs
         2ALdKDAZJVO6O6n81QS6mvIfhZJ5dRmB1YYhxGFLC/h3UaZw+WIj+cUiVIZZRkAkWKRw
         wDo6b85MIC/Z0NDrcH2YLvCKqZQpTg6BzLeYKvIEaYbti77mcAGJX1NTGN2+ITK57OGV
         yba3eND2Doo9SEFnOHIXdOPEy+V2RKhNHdU9L0paaicSI/LWNWVx45ArwpYMxnF4Gf8u
         UVNg==
X-Gm-Message-State: AO0yUKUKdAK1MZ5nn6ZQHlDYLRadIFy9SdwImWwkauQh3m2GZI9YUz3o
        h2MjtYDiFDA/o6m59cIAxye1TRjf9nrWsSYnm7M=
X-Google-Smtp-Source: AK7set+qyDiSsO9sAcNRuA7P+IbElsnD9P0v0dxCJ2k3arY4GTbjflPW+zgtv3dEGuGPi0JWrVdNEPa7+PTbte1nqAE=
X-Received: by 2002:a17:906:7d8c:b0:878:4a24:1a5c with SMTP id
 v12-20020a1709067d8c00b008784a241a5cmr1630332ejo.6.1678814017492; Tue, 14 Mar
 2023 10:13:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7412:e78c:b0:c0:cabe:2561 with HTTP; Tue, 14 Mar 2023
 10:13:37 -0700 (PDT)
Reply-To: godwinrichard700@gmail.com
From:   Richard Godwin <jw7542463@gmail.com>
Date:   Tue, 14 Mar 2023 10:13:37 -0700
Message-ID: <CAHZLPJEFsGfsY0jZoZSo_Vb=aNXyOh0AK9J9k1iuQ=KtROvhFQ@mail.gmail.com>
Subject: URGENT
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:530 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7750]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [jw7542463[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [jw7542463[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [godwinrichard700[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

-- 
Good day,
How are you doing today, hope you are fine please i have something to
tell you. If you don't mind.

Am waiting for your response.

Bast regards.

Richard Godwin. Thanks.

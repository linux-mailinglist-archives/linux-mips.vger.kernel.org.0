Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2A6761631A
	for <lists+linux-mips@lfdr.de>; Wed,  2 Nov 2022 13:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbiKBMyR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Nov 2022 08:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiKBMyP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Nov 2022 08:54:15 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16DD01BE8F
        for <linux-mips@vger.kernel.org>; Wed,  2 Nov 2022 05:54:15 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id k5so8590173pjo.5
        for <linux-mips@vger.kernel.org>; Wed, 02 Nov 2022 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sz/uTvOc0gNmc74MGKA7yKeLqyFqD/joiI1SxwVZLms=;
        b=gMco29rIHyjluL75KoUf2pw2XrSEdZCMQHDxALSkmifq+/s7GAD1xAYqY35LCOejLj
         uuDAKkLdDsF7ZHyBZYyKfaJqYvFBOFhoAafty8TuEPIC64Lzaxt7PG3uk+VPn7pbQPt8
         VduIYP3I2f9Ge7H5zmsibvH447LXtSH7OWZJRErQyiblliWhq9RATJYwZIRxn3LlUI/T
         d35i3X5nNMLF9rk2uA6sWkKEppODkyP8II01Oy7LBkqUrkz6K5lD8nUl6a9cGPzUDU8T
         qM33I6IW+PGklzw3hSVmr1A/9hanlqgtBiFL7BgoRBJWNMoOr3TbCBn4kf0S4FZ+5yQ3
         A3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sz/uTvOc0gNmc74MGKA7yKeLqyFqD/joiI1SxwVZLms=;
        b=3aPsZXX8i7ewKei3sHVtadgwRQgaiaAFXUkuRHI4CXrDq9ev5ckQtRiqCgnZ99fYrJ
         8ewYKY/j63LTzNGR236Cp/9VtJ8A8CkkSVX4dJGmkfG7TkIwZ2VaU9TyVJbETNN3Itvh
         vYIYu9siRVJG6ggxpT89O/o3LIpF8OLoDr0P+GMxf99PfmpyawmICGGG9qC640/woUrf
         3x5JIz6cp21hHP6qk1OS5Dv7g5JDEkqyIsV6d06J9lpGwYq5LuiVdW/twQd/o5UumrCt
         mr1yFS2hMUKIz1rrZYTLqR8xDsp6FxTYyV7hnYIeQE1K5voKvRy5YKS7tuNhAATyDXyb
         SVpQ==
X-Gm-Message-State: ACrzQf0fgGUXHU76GLb2yFDp1Af8cgft5qvfXRnak7VZXaVBh+NvQ+5t
        odbHxtxiGCrGTKHjBu/jjVGsB4NsD4rw7R7YqtY=
X-Google-Smtp-Source: AMsMyM7zYTm0ZmdMgJfwEPWQ6iiPPfLaP2CNfbAaYJnLIqwwlD3fqJIoA9NFRLPSxXRzbf7xPG6t5iTECeAUTsi+Urw=
X-Received: by 2002:a17:90b:2393:b0:213:ecb2:2e04 with SMTP id
 mr19-20020a17090b239300b00213ecb22e04mr14468959pjb.100.1667393654447; Wed, 02
 Nov 2022 05:54:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:662c:b0:46:197b:656c with HTTP; Wed, 2 Nov 2022
 05:54:13 -0700 (PDT)
Reply-To: rihabmanyang1993@gmail.com
From:   Rihab Manyang <omardiakhate751@gmail.com>
Date:   Wed, 2 Nov 2022 12:54:13 +0000
Message-ID: <CAAs2n94DKjX6ZC8g4kdP45u1f2UDWbY4NWRPx4w49bO+RiwOfg@mail.gmail.com>
Subject: HI DEAR..
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1034 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [omardiakhate751[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [rihabmanyang1993[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [omardiakhate751[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

-- 
My name is Rihab Manyang,i am here to search for a business partner and
friend who will help me to invest my fund in his country.

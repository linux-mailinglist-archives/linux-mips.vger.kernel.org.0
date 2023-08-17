Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B495177EFBF
	for <lists+linux-mips@lfdr.de>; Thu, 17 Aug 2023 06:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347979AbjHQELA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Aug 2023 00:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347974AbjHQEKc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 17 Aug 2023 00:10:32 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31702D58
        for <linux-mips@vger.kernel.org>; Wed, 16 Aug 2023 21:10:31 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3a7aedc57ffso5623448b6e.2
        for <linux-mips@vger.kernel.org>; Wed, 16 Aug 2023 21:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692245431; x=1692850231;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gb4qAVlMN/V48c3tDnit9Qdh+68rSKImmu7s/ky4OWc=;
        b=QZVr/KEqicRI/6SEayyUCINnGyTCaHQNpUidP/rTVfZpzY4WuOMnHGcHVPKXN4Avtd
         v2Heqe2gzJDKdah5q8+CrUXrM0gbgquO1BMb3sXLowyrDdQb9bNyqDLhualr7G4ZOsjc
         6dUMsjpMSnM3V0bOiyUgHeHbgMhaGR1qwXpEmWCTeVOu5foSWdJkBMiICSSlknsgKzjT
         i11BLhBsjTOusIbMPFfUUNx099LKBDik3WnhGcmkMQAQmXKOjBWOmvzPmwLBcnW2Z4pK
         qSIRe1U1PMqbITVS5d7PRt3HFk6Ih8+6SeqgL9N+S7PfD0F8hRDBVXMKeDOVoJMboMd2
         Seug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692245431; x=1692850231;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gb4qAVlMN/V48c3tDnit9Qdh+68rSKImmu7s/ky4OWc=;
        b=LBPBprYQ++yR/jDHT8hCby8IZmmgiDeYQpu5J35Ty1qHOm2HIDfbqGXsOSMf/e7K8J
         94s6YOKUXx4QSjKYUHmK9/MVNPUdP/7B0nh6MN01+GiiVrXQgtYggrkYCHimX3E7Z3j5
         2gw8oflI9K/bXL8eVrCMnS09fTdFDg03vmAKnVkorUkLGy59AC7pKFmKxkOcqSDc25Pt
         0yXUB6tMJ6N/kTBEbGonMJrVoEzBETfbTVOUjSKuJfasZKQq2yCl3CNY+BhxjAV0qyam
         7iGPjlCQ1tTHvT4t+UabVo7kifoPcpmDr77fGXSisCmTCQu/HtgmQtKiqtmQe0MuKgF+
         yzkQ==
X-Gm-Message-State: AOJu0Yx35Ng5i1EN+AyGQACF34qmyHLMl6PPVRx11Y91Y0djZTuW3GBS
        BuqoHPB1RCJNRR4SkDNxp53A/EH5+NcSMx8cZQ4=
X-Google-Smtp-Source: AGHT+IE+EUtZMOEKAqBMqqYWqu/RGZn+LQHYrEoeh4RZ4kAZ5+7Cge6AatfGuElbDFAwVCFeG3d4+yjCF93CGJg6ub4=
X-Received: by 2002:a05:6808:211d:b0:3a7:500a:a481 with SMTP id
 r29-20020a056808211d00b003a7500aa481mr5048636oiw.3.1692245430889; Wed, 16 Aug
 2023 21:10:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:d099:b0:133:91d:bed5 with HTTP; Wed, 16 Aug 2023
 21:10:30 -0700 (PDT)
Reply-To: privateemail01112@gmail.com
From:   KEIN BRIGGS <privateemailjsuee@gmail.com>
Date:   Wed, 16 Aug 2023 21:10:30 -0700
Message-ID: <CAGgyiOpF7Zv46NvVHY4rvTo1qBA_8ijKgS9y7fMp4AZEZxHXwQ@mail.gmail.com>
Subject: Your attention please!!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Your attention please!

My efforts to reaching you many times always not through.

Please may you kindly let me know if you are still using this email
address as my previous messages to you were not responded to.

I await hearing from you once more if my previous messages were not received.
Reach me via my email: privateemail01112@gmail.com

My regards,
Kein Briggs.

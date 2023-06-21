Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E709673787F
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jun 2023 03:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjFUBD3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Jun 2023 21:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjFUBD2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Jun 2023 21:03:28 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2488A10D0
        for <linux-mips@vger.kernel.org>; Tue, 20 Jun 2023 18:03:27 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-762490831f6so371342385a.2
        for <linux-mips@vger.kernel.org>; Tue, 20 Jun 2023 18:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687309406; x=1689901406;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5JtQ9d9ThWaTpSmJ1e6zGp7H/OfQzIYzzK0f4gBNZM=;
        b=obfecwjtHIls7MYFZ3CyrsoUGLFP+RmvAEbZQe9nuahEcr8Aog6jFa6w5Cuj2iPxB3
         SazAYVFI++/GcURg1yGvN3TyReXEJ+QH6Q2TVUvN0GcgcaqAvZmYaUDuBAxAFKzmuZWX
         f+IVFTKnptk2qvTG80/bLkQO/fSGPDaBzcgJQGB8BUubXUaRsCacIPI7aZAWCKji6WVi
         ND4udDvuINYoSA35Q658RUyOQ95AZYPqkuG/mJThEwNSfOFMdfnzOZ8qlOOfDkmlBNBq
         zAGAchR0m2MHdn4T/EZRuR6OTb8uGwFhxVegLvbCjiRJ+yuqI4ALbop8e6cw2I4Y8jIn
         He+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687309406; x=1689901406;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O5JtQ9d9ThWaTpSmJ1e6zGp7H/OfQzIYzzK0f4gBNZM=;
        b=cFQn2mqLaJnWISQxq5AtZSRCC+Nh0AgKET3j6nQHOqjNbrCliP6+5REK6Pe1x+evuM
         sjnrior1Tuzg8ZaW359vDUHdLlCsputglEIJfPuPIko6qRhyYvV+KmQ0YL/xrkR2Uwiz
         tCkAfBSAySw0Ycw/LAB+8nVGfYs39s3170clTmJZTatfpDye6mUHgcWKPkI5kcbk3k0a
         3Ob2Xzr3qxlwEt1fX0m9EvEmIHLJVvEJv58/Ydsb0YTrQS0aAR8pZP5OgYWUKxHLWhGR
         qpvB/UGrXgpm3PBAGyOTm2MVa90f9xL3Vyv2k+KvH7eEx48EyE/OFZ5r3YxPqkQUwhak
         u6og==
X-Gm-Message-State: AC+VfDxFZ5reY4lzaxOnbpkR/DhYQZNcPtW4/kAbCgjDouSCNqjVyYMC
        S0PKcPnVpGaJMkaGh6bgf2LE1Cr4obhbmUWJJaA=
X-Google-Smtp-Source: ACHHUZ4LXF+DHnWW0TksXXMJmV8wGufd70Ci8JOs4Bdav7R/Dzp7wfJ/fhw7HeioM0Yrn05GUjvmU/LyyyXXvPx46Kk=
X-Received: by 2002:a05:6214:764:b0:62d:f68a:ee2d with SMTP id
 f4-20020a056214076400b0062df68aee2dmr15215020qvz.29.1687309406205; Tue, 20
 Jun 2023 18:03:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:a98a:0:b0:632:d3a:e674 with HTTP; Tue, 20 Jun 2023
 18:03:25 -0700 (PDT)
Reply-To: infoconsul03@gmail.com
From:   David Mensah <mensahclara557@gmail.com>
Date:   Tue, 20 Jun 2023 18:03:25 -0700
Message-ID: <CAJcHLO4YsffZ8vUE-yh8jszBuRAkr9eGhH6dYKv-rjA5zY1pDQ@mail.gmail.com>
Subject: RES
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

-- 
Hello my friend, I have some information for you.

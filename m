Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7081876CCA6
	for <lists+linux-mips@lfdr.de>; Wed,  2 Aug 2023 14:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232732AbjHBM27 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Aug 2023 08:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234039AbjHBM26 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Aug 2023 08:28:58 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8749B
        for <linux-mips@vger.kernel.org>; Wed,  2 Aug 2023 05:28:56 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe0c566788so11335992e87.0
        for <linux-mips@vger.kernel.org>; Wed, 02 Aug 2023 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690979335; x=1691584135;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p8294EMfwZkQvEgxEyvUNAnxid6gXP7o3QABaytiCm4=;
        b=s3jXOiGc+TYOZqTv74n79exFYTPWCVwBNzgNEggQgGI3kOGNEPjZodgGQzNT5AviOl
         aciFv8zehZXR7ogHXYgaJqJD9+3Y7h4SbH0+XvcbDtybACprypqDbg0qEP0yBs3YT5OA
         79FMRKKPaQme1ba3QIJKeq9rYjZrB3BiyiI0fKgR1xR3r9us+B0qkRSYmldK/mBuL9S+
         O8mFMRycqO8P0wIcBDDPv2fAzFjar9EzqJ+qENRLXw12k94wWD5beopjvWPWCzGmzXhl
         VeYJafB35Du7+Xe3zBjO1eh7qwxYuMPwxtZ8aU0p4/rpKnLvYYCWdqcgCy54mEQd/otW
         +jTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690979335; x=1691584135;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p8294EMfwZkQvEgxEyvUNAnxid6gXP7o3QABaytiCm4=;
        b=AbDOQPp5jld9mAwme0n/ChrNktWyiiznonfnHKD58f0RVd+SPxqUuHUZK71SiSCuhb
         ZL7rn+tk1vywWqPDTYzMYY+wQnRM/0w5aPEDFf6WknBmX6BfXyYMCGpc0lEhtQ59qZ+P
         V9OT1DkTCDv68SgEZmnstNToYyxTexMCNKJPG0NrNNwMuqRiq9uYpKB/oszsAWvNTbqM
         +JX1aKHQ8LOMjS2ClmlGpmv9WL6aKvMQGUAj5Nc8110mFgiSsXSPBLkGxef8khgpVcDb
         4TVgX/6pHK/ZSQBDr4wnP/mtpPzu/pJRxJcTmTMIPjYljC/jr/k1cA4m4G5eSUI811iv
         Mndg==
X-Gm-Message-State: ABy/qLbxZoAjVEnwji21l9ppSa3kD6Up6UiixOa7d2y7UKN9I8WuEhP3
        +6qbHhlRHVyN9G89UphwQCgFCXe7susm1m7sJkaclWSJEeg=
X-Google-Smtp-Source: APBJJlHoLeF/86AQZeobn/nAoRyY2WafgvI9enGWL7AUycq3Xq209x5xqBH+KStyrlGMfXaaLPaeaKSaROyzNCuN24E=
X-Received: by 2002:a05:6512:2e8:b0:4fd:ba8d:d4ed with SMTP id
 m8-20020a05651202e800b004fdba8dd4edmr3961623lfq.24.1690979334630; Wed, 02 Aug
 2023 05:28:54 -0700 (PDT)
MIME-Version: 1.0
From:   down in the bunny hole <downinthebunnyhole@gmail.com>
Date:   Wed, 2 Aug 2023 14:28:43 +0200
Message-ID: <CAAZ8i82Q7qvdw6uDBKMJ=G-DtUaqmDBqpR-0Cyt8xCjsm4aKmQ@mail.gmail.com>
Subject: 90s MIPS eval
To:     linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

hi
I found these boards on a dumpster diving
- Algorithmics LTD P4000i
- Algorithmics LTD P4032Q (built-in battery, lot of corroded tracks)
- IDT79s381
- Mips Atlas, with a MIPS32r2 cpu module

some of these boards are broken, but I think/hope I can fix their
hardware problems
- clean up, remove dust
- remove sand that have accumulated from having exposed to the elements
- replace capacitors
- replace LDOs
- rebuild damaged tracks due to battery acid leaking
- reprogram empty UV-PROM due to long exposition to the sunlight
without any protective label
- ...

The real problem is that I have no documentation and no source of the firmware.

Do you happen to know someone who worked with those boards? and can
share their UserManual, doc and firmware source?

The MIPS Atlas comes with Philips SAA9730, a ~20 old bit combined
multimedia and peripheral controller used in thin clients, Internet
access terminals, and diskless workstations, that implements
  - the VGA interface and Video RAM
  - two USB interfaces
  - PS/2 Keyboard and PS2 Mouse interface
  - I2C interface to serial EEPROM
  - Serial Debug RS232 Interface
  - Ethernet interface

As far as I can see from feedback in Linux, this chip was/is known to
be weird, but I don't find details: has anyone ever worked on it? If
so, are there any "notes" about its weird behavior?

I'm tempted to support it, but it might not be worth it and so I might
opt to bypass it altogether.


let me know
D.

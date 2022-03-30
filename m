Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C81804ECD67
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 21:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbiC3ToD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Mar 2022 15:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiC3ToC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Mar 2022 15:44:02 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A49F4925D
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 12:42:15 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id yy13so43641013ejb.2
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 12:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=wTC71dLHFQBC2DUNq3IY9+KCNVpWcc84MF9z+8xrDVo=;
        b=OoKebumkmWVaz8tjsHu1+Rp2h1IaO1OHy8uGW2J458Ek6JMmszGvpgQVIcQfc4g1l5
         Zkd4typMrIdN4ojagNGDXqoaO9uzIiLT5bbkxzh9RJvxyunUQvaMrvAFUM2hxr/p/AJc
         u8iFvRNjcDIGxW+Zt4PcEWmNszPeYxjmDcoZ4J1YwyZ3DELqL0kL13ff+wFGBv8wDlri
         C9kNGH3ZGD0d/G+7JHA6C/3+3LlrKiAutFNbWrM0wquzwer6tWoqFpty/j5vsax8wAHR
         D5LJ3YoTi46SPcZdnHaUTQigtuCECdVnLe3aEn1Q++FAYSzBduwhXScFoOxpgJVaQLWl
         NSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=wTC71dLHFQBC2DUNq3IY9+KCNVpWcc84MF9z+8xrDVo=;
        b=OqqIvHV5Ank5blIFkb5fRMYcZ5Tt/RUgVWI2AeO+EEcoLTgCDJl3Juih2YxwAdljmA
         azArkliL2MXU2iYb0LulQlANVuUCMyHbXfR0wYDJIDAaD3cQQondm3xbuZcC+A7F2iFS
         G8U2m7qIBBksNTJRPqMY3GYO1gQV3AUXOi/an31vRv7tGKlzIVS8hSXFp1z0844fIE3z
         IFBCgM0dvPvj6dlUd8mn6UJwl4PECiPVqxXHO+coZOvIqXpm23zfZoRhMTe1860eKKX0
         o9CW1U3l0PC8BfUSVtA95qoaZPKrMMziRuuM7mEu/8LcD0YhGUG+YNErW8w+lLRnhilr
         uCjQ==
X-Gm-Message-State: AOAM533hbqzm1HhYKzb0kURIMJSO5CX+ivF7Go8bKvmQ1UsgJUCMRmKV
        jm7r6/Hg+We6phuj6h0y2sPUfFYzdx4Vr5LM7PY=
X-Google-Smtp-Source: ABdhPJyQV4gVc5ODlycJkVJzUMeoixOjbvZ6WGOaWjazY3h/AbzgTLUmcKu0r4COeO0UULzLJbtDE7RXMkJAefJ9uQc=
X-Received: by 2002:a17:906:7d52:b0:6df:a6c7:2c5 with SMTP id
 l18-20020a1709067d5200b006dfa6c702c5mr1328530ejp.540.1648669333710; Wed, 30
 Mar 2022 12:42:13 -0700 (PDT)
MIME-Version: 1.0
From:   Duke Abbaddon <duke.abbaddon@gmail.com>
Date:   Wed, 30 Mar 2022 20:42:09 +0100
Message-ID: <CAHpNFcP4NNendmeYAsD9fDf749drekDv8c2muXHw361R+biVhA@mail.gmail.com>
Subject: Lux the Droid robot loads fast enough loaded in 300MB's of CACHE ^p
 Say 700FPS : Security 'LUX' The DROID : Really does float in 32MB floating L3
 RAM Tables
To:     scott.herkelman@amd.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Lux the Droid robot loads fast enough loaded in 300MB's of CACHE ^p Say 700FPS

The size issue is not one clearly defined by progress, but defining
reality though pre tested hardware? Source of future security &
reliability RS

So Security 'LUX' The DROID : Really does float in 32MB floating L3 RAM Tables

https://www.youtube.com/watch?v=dSCpVhKvmCY

*****

On the subject of PSP processors : Arm features include NEON2!
Why not use this to our advantage? if safely potentiated! Every SiMD
matters after all,

Particularly preparing for the GPU & Audio output!
As a driver specific the advantages are around 13% improved
performance & 20% improved code flexibility on SiMD compatibility.

We can also directly utilize for Automated Direct Reactive Secure DMA or ADRSDMA

(signed RS)

ARM Patches 3 arte enabled! https://lkml.org/lkml/2022/3/30/977

*

GPRS for immediate use in all SFR SIM's & SFR Firmware & routers &
boxes including ADSL & Fibre

Cloudflare Kernels & VM linux, I pretty obviously would like to be
able to utilise cloudflare Kernel & Linux & cloudflare is very special
to me

Submissions for review

RS

https://drive.google.com/drive/folders/1X5fUvsXkvBU6td78uq3EdEUJ_S6iUplA?usp=sharing

https://lore.kernel.org/lkml/20220329164117.1449-1-mario.limonciello@amd.com/

https://www.phoronix.com/scan.php?page=news_item&px=AMD-PSP-Sysfs-Expose

https://lkml.org/lkml/2022/3/30/1005

https://lkml.org/lkml/2022/3/30/1002

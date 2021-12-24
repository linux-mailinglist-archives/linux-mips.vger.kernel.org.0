Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D74247EE93
	for <lists+linux-mips@lfdr.de>; Fri, 24 Dec 2021 12:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241726AbhLXLbS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Dec 2021 06:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbhLXLbR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Dec 2021 06:31:17 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0DEC061401
        for <linux-mips@vger.kernel.org>; Fri, 24 Dec 2021 03:31:16 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id i9so5135713oih.4
        for <linux-mips@vger.kernel.org>; Fri, 24 Dec 2021 03:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sudomaker-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=mlnysMS7anhHMoGzoHRCA9abK7XFawrSbhYOxJLhfCA=;
        b=oax11kO854LTd00n9xIn43fZ9JIPyggQfmcE+rriI8kOGK8gBeMwusTJQaA2GMhhLF
         GbcFRDOvNAav9OB/F+0uhdKRxCBvZerLuMB95xmmnE8c8W8V1bPyREm+gMvzzDMmpYBr
         Q1EhJYT+D8K8E/qf3a9isNE7Fcpv6vqcc+3AldpzJHLUIe0oxzbBMkbutYg0+160j/re
         pPeDCWL6M0Q+Q6EeIa48WQL++F703RrbxVd4TDDBrv9C56Y8YCREbt50jbv1eSje6+4C
         pUkOOXoT8QY0TOFQ7uWyaKyungx5Htb2BGsVe1uGz9iJmDjCQodKupR947lX2oOXXEft
         lovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=mlnysMS7anhHMoGzoHRCA9abK7XFawrSbhYOxJLhfCA=;
        b=V0zQ56XHh5gqWN41yJCjtrcKPtgX9WwPhllzG1RBZepyqeFaPMN/q2tfLP+r5zV7CZ
         f5bDbcaHN2kI3nVdfdtiRo7M0QE5dFCap1EcDsfmZmlE2UmhX9MrPBSgdAJYHXMG48k/
         UYPVYp9WULraD85JfmIWdJhK/TePEs6DPM/prZOy4x29bzc+i2HwLDPkjvL7cVX0T4MD
         AUGlqvKWpVy6FQzj6nrLVCeiDH9bfsqufgdq09+6nDu9OGnPoYNlFkN+1CBQgn6ibo5n
         zLBdbMewTWRUIA7Jhscw9jotuVxTwx728xI1cWbg73VgeCF0GbKTxyZnW51D/PMDEqzD
         eNpg==
X-Gm-Message-State: AOAM533mdmsNqbgsFoQl7YajIEb751fUzBZ9BR7HabX3rsDs0KVVYnLZ
        sDHIvfdOcXzvoWwBDu/9pPHHQ4fSo6JKi2fXmuYPHHSRBgPwghmj
X-Google-Smtp-Source: ABdhPJwQzTC3GhOG+APVr4lROC5uF/mdRUFZIwaMkDerzlYQz165PXixFJAuO7pib7CNxDtGYopjzlZufMxm11FLryg=
X-Received: by 2002:a05:6808:2014:: with SMTP id q20mr4888829oiw.9.1640345475034;
 Fri, 24 Dec 2021 03:31:15 -0800 (PST)
MIME-Version: 1.0
From:   Hakurei Reimu <reimu@sudomaker.com>
Date:   Fri, 24 Dec 2021 19:31:04 +0800
Message-ID: <CACPS8EqH1fLzH606WP-wg7BgX7OMw45ZyRr0v7tkLyGzL7o4Hg@mail.gmail.com>
Subject: Question about utilizing more than one MIPS shadow register set
To:     linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello. I examined a lot of existing MIPS related code in mainline
kernel and it appears that the kernel is using a shared interrupt
handler and at most one shadow register set when handling interrupts.
I'm currently trying to get Linux running properly on the Microchip
PIC32MZ platform, and it has 8 shadow register sets. I want to make
use of all of them by using multiple interrupt handlers. Is this
possible?

Regards.

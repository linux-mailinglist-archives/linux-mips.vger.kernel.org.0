Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5476D1A52B5
	for <lists+linux-mips@lfdr.de>; Sat, 11 Apr 2020 18:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgDKQEL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 11 Apr 2020 12:04:11 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38340 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgDKQEK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 11 Apr 2020 12:04:10 -0400
Received: by mail-pf1-f193.google.com with SMTP id y25so133950pfn.5;
        Sat, 11 Apr 2020 09:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=uH/uW4uuwVc/sUawxiLaFcYoWaZecblOcPGAeVmrbRA=;
        b=bpDd2PphtMcSemGxsrV2MW+BLa4JF/TZ9SPOkaI7IE8DsUJNM8Kugv5GA2SSkjKynG
         M5PGUpytCyWBwp2GtTY/kdyooJF5UKajhfg5+GJgysfUrG5v9pdv9bmHfiY21C+tRDA8
         H6QOu7cfT7F+ZDCCkZOJ68BuQy4yZy1M7jFcIXf+UuXeo24MdCYOH13d/ERfUYY7rDCn
         lVsl56il3TN6e7ma+5n1yZKve/huDJRF0+m7ZYNPApriP5n2RBxS4tQDuDDPU+XUwpGX
         PSqMjlsJRf2AzZAdOpzahXVHH+I6ai1+WEHk5YO1BvjwB6Lzg2aP4rbZFH9mBclETUut
         US5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=uH/uW4uuwVc/sUawxiLaFcYoWaZecblOcPGAeVmrbRA=;
        b=es1piTxgJB/h0NYtWFqTWiEVVaftAo2YPXHIVUbN7p8PLrBwY+U+MrIzcB6oR++4p5
         53M2LDaO+H5ykNSstbkRSqUyUcja8/WYYOUQZivTgxJ2BEngN5Un0AXAonxTi1RSqNw3
         NC4LvJz1DzpUNv2bUhDR/ZpC7wFXG+ZGLQ+bMkzu+VqUfiEeEfbxEebw8Wo3hy8AxVxQ
         mRsjZO5nhGpU7oJwAtqPRyLN+j9m/9dUJe+xUrrjUmPoX3BYSgX8S133RXmU3DeE6c0z
         2zmZn1GFJfJSMTrh680bVtJAT21MXan4LS4/oZjkAMF71IbOPtxTeMV8/XLrBJbRr3GF
         npLg==
X-Gm-Message-State: AGi0PuZu/UEXWHSw7W0Tno0wfHX6emu2L/+dRZKvP6tlUmglyUMv9QuK
        vTS9oMSpBr9aZoMnU4Z+64c=
X-Google-Smtp-Source: APiQypLdNiYiF+7hS+5k0UH+NUie1b5tew65NkXTnDcayarF6ShrqWloGrmA4pOce85bpSbWi3Slvg==
X-Received: by 2002:a62:1946:: with SMTP id 67mr10618076pfz.0.1586621050221;
        Sat, 11 Apr 2020 09:04:10 -0700 (PDT)
Received: from localhost ([183.82.183.27])
        by smtp.gmail.com with ESMTPSA id nl7sm4661950pjb.36.2020.04.11.09.04.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Apr 2020 09:04:09 -0700 (PDT)
Date:   Sat, 11 Apr 2020 21:34:07 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH 0/3] Remove setup_percpu_irq() & remove_percpu_irq
Message-ID: <cover.1586434781.git.afzal.mohd.ma@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

While doing the removal of setup_irq(), it was observed that
setup_percpu_irq() also can be removed similarly by replacing it w/
request_percpu_irq(), which does allocate memory. In the initial
setup_irq() removal cover letters [1], it was mentioned that
setup_percpu_irq() is untouched.

After removing setup_irq(), it does not look good to let live
setup_percpu_irq(), especially since it being a low hanging fruit. Hence
replace setup_percpu_irq() by it's allocator equivalent.
request_percpu_irq() cannot be used since all the users need to pass
IRQF_TIMER flag, which it would not allow. Thus it's variant,
__request_percpu_irq() is used.

In addition to removing setup_percpu_irq() definition,
remove_percpu_irq(), unused, is also removed.

It seems setup_percpu_irq() is used only by MIPS (even the one outside
MIPS arch dir, i.e. the clocksource driver). The series has been build
tested, though i would have loved to do a qemu test as well, i do not
see a qemu machine type that can test the changes done here (in malta
machine, in which clocksource changes are getting built, the changes
done here are not being runtime tested).

Regards
afzal

[1] https://lkml.kernel.org/r/cover.1581478323.git.afzal.mohd.ma@gmail.com

afzal mohammed (3):
  MIPS: Replace setup_percpu_irq() by request_percpu_irq() variant
  clocksource/drivers/mips-gic-timer: Replace setup_percpu_irq() by
    request_percpu_irq() variant
  genirq: Remove setup_percpu_irq() and remove_percpu_irq()

 arch/mips/include/asm/cevt-r4k.h     |  1 -
 arch/mips/kernel/cevt-r4k.c          | 11 --------
 arch/mips/sgi-ip27/ip27-timer.c      | 13 ++++-----
 arch/mips/sgi-ip30/ip30-timer.c      |  6 ++--
 drivers/clocksource/mips-gic-timer.c | 10 ++-----
 include/linux/irq.h                  |  2 --
 kernel/irq/manage.c                  | 42 ----------------------------
 7 files changed, 10 insertions(+), 75 deletions(-)

-- 
2.18.0


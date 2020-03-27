Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93CA4195AA5
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2020 17:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbgC0QIZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Mar 2020 12:08:25 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41063 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727354AbgC0QIY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 27 Mar 2020 12:08:24 -0400
Received: by mail-pg1-f193.google.com with SMTP id b1so4774996pgm.8;
        Fri, 27 Mar 2020 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v3WW2gICCRcfa0oGxmZ+LfSQn5AikLIQ+ZRnRYdwUfA=;
        b=an6bUaMWa/gge8dt35mNz51d8Pj8Aa/qVvKR0POiYMe4zuNsTFMbWsDqtJpu8Vfgps
         HodQ817xNYHI9SLLHcYrsshSCnFQVPdRz5miPel3a6dQh30+182sG4GpKzSYGg0Moaql
         oICMZDkEloRd8GN1T9OAdis5YEzicvSdRi2cwTkeLqxIisdfp6u4WrF2upjoOm0b/Nqv
         xJs9hkC3swEZG36oeWhAa8kBkb2p598PAhHmrKt9TC86LDUy19H7w13AsSWaFeOMFBw1
         1kiJmtgBbfIhYEZfNNWHTKYdN5NFa73OW2vgKUh7ekKVHy/s1yLOWQQExWS6RBTI4i5f
         lubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v3WW2gICCRcfa0oGxmZ+LfSQn5AikLIQ+ZRnRYdwUfA=;
        b=K61t+aL22V7z1zCxdy92iLEGfcUUfCcui1nXRjhlhBoF1i5bSiZeUHJHo9tj8E3hl7
         LkfP1UHq6zAWyukKSnmDoWQTb2yZrra+7+orFlf/8phatZvSEc7pQjNcOeAdyBTCb1y6
         IhuKSgp++nxg6di5pN8GCuKkAZhlw9fp7Td3Lqfr5w+nMRQdLyxPHMKR29SWvVUjhJ8u
         KM5b+m29XY3GGJbeEYgD0GcJ292B3HsiMUi15O2xGS7FQMVnNnCv5TnoJeHcfiL/xGDE
         AvNCTKvVXOnoWxUGyLgLhfXf1T5W5Vt6svfYf4q1S3rQ8N8kaoK9bCv7okpY4oL/5JOk
         3qgw==
X-Gm-Message-State: ANhLgQ3vw/FfWuBbGxGGxSE2ZiBjUx8kOAWKqaEKYZYl9EBGZhw3jGAy
        sz3DwZrD1BEUqvJS4J1F57A=
X-Google-Smtp-Source: ADFU+vs5xl4PN9llzz39JwJNhgmk9dgWBu5u30cb77PT2OtFyYrOeXBrJPUM82BlUm8kk65OLbcqNQ==
X-Received: by 2002:aa7:947d:: with SMTP id t29mr14654589pfq.184.1585325301244;
        Fri, 27 Mar 2020 09:08:21 -0700 (PDT)
Received: from localhost ([49.207.55.57])
        by smtp.gmail.com with ESMTPSA id v185sm4391917pfv.32.2020.03.27.09.08.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Mar 2020 09:08:20 -0700 (PDT)
Date:   Fri, 27 Mar 2020 21:38:18 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, x86@kernel.org,
        linux-sh@vger.kernel.org, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-c6x-dev@linux-c6x.org, linux-omap@vger.kernel.org,
        linux-alpha@vger.kernel.org
Subject: [PATCH 0/6] Kill setup_irq()
Message-ID: <cover.1585320721.git.afzal.mohd.ma@gmail.com>
References: <20200321174303.GA7930@afzalpc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200321174303.GA7930@afzalpc>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

As compared to the situation mentioned earlier[1], now powerpc patch is
also in -next, and the pending ARM patches has been picked up by ARM SoC
maintainers today and is expected to show up in next -next. All other
subsytem patches has been picked by relevant maintainers & are already
in -next except alpha, c6x, hexagon, unicore32 & sh.

As it is the case, i am sending you patches for the above 5
architecture's plus the core removal patch.

Status of 5 arch's:
-------------------
alpha:		received ack from Matt Turner, build test success
c6x:		did receive ack from Mark Salter in v1, the final
		 version (v3) was with minor changes, hence removed his
		 ack & cc'ed him, build test success
hexagon:	build test success
unicore32:	couldn't get toolchain from kernel.org, 0day test robot
		 or Segher's buildall
sh:		To compile the relevant changes sh64 compiler is
		 required, couldn't get it from above mentioned 3
		 sources.

Note 1: sh toolchain is available, but that will not make the
 relevant changes compile as it has dependency of 64bit arch toolchain,
 did try a Kconfig hack to make it compile w/ 32bit sh toolchain, but it
 failed due to other reasons (unknown operands), so gave up on that.
Note 2: hexagon final image creation fails even w/o my patch, but it
 has been ensured that w/ my changes relevant object files are getting
 built  w/o warnings.

Regards
afzal

[1] https://lkml.kernel.org/r/20200321172626.GA6323@afzalpc

afzal mohammed (6):
  alpha: Replace setup_irq() by request_irq()
  c6x: replace setup_irq() by request_irq()
  hexagon: replace setup_irq() by request_irq()
  sh: replace setup_irq() by request_irq()
  unicore32: replace setup_irq() by request_irq()
  genirq: Remove setup_irq() and remove_irq()

 arch/alpha/kernel/irq_alpha.c     | 29 ++++----------------
 arch/alpha/kernel/irq_i8259.c     |  8 ++----
 arch/alpha/kernel/irq_impl.h      |  7 +----
 arch/alpha/kernel/irq_pyxis.c     |  3 ++-
 arch/alpha/kernel/sys_alcor.c     |  3 ++-
 arch/alpha/kernel/sys_cabriolet.c |  3 ++-
 arch/alpha/kernel/sys_eb64p.c     |  3 ++-
 arch/alpha/kernel/sys_marvel.c    |  2 +-
 arch/alpha/kernel/sys_miata.c     |  6 +++--
 arch/alpha/kernel/sys_ruffian.c   |  3 ++-
 arch/alpha/kernel/sys_rx164.c     |  3 ++-
 arch/alpha/kernel/sys_sx164.c     |  3 ++-
 arch/alpha/kernel/sys_wildfire.c  |  7 ++---
 arch/alpha/kernel/time.c          |  6 ++---
 arch/c6x/platforms/timer64.c      | 11 +++-----
 arch/hexagon/kernel/smp.c         | 22 ++++++++--------
 arch/hexagon/kernel/time.c        | 11 +++-----
 arch/sh/boards/mach-cayman/irq.c  | 18 +++++--------
 arch/sh/drivers/dma/dma-pvr2.c    |  9 +++----
 arch/unicore32/kernel/time.c      | 11 +++-----
 include/linux/irq.h               |  2 --
 kernel/irq/manage.c               | 44 -------------------------------
 22 files changed, 60 insertions(+), 154 deletions(-)

-- 
2.25.1


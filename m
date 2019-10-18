Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5A4DD2A1
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2019 00:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391900AbfJRWNJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Oct 2019 18:13:09 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43728 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389659AbfJRWNI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 18 Oct 2019 18:13:08 -0400
Received: by mail-pg1-f195.google.com with SMTP id i32so4071811pgl.10
        for <linux-mips@vger.kernel.org>; Fri, 18 Oct 2019 15:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=sr3QEcA3GgbqmcHwvh+Z+2ViZkXbU6OBPmKTa4Kdh54=;
        b=kcNlL9vmMqJCPFzcyCrqECrkjFLlsUG4KrkpVmVo5K+MJOyv347UEW3jolCgE+I3EL
         AqtpyHmnJEjZau5As22JugBDqkRCL9sMZPlR5yp01t9TbhwYEU/2BM7rU57i7Lszvyh1
         MVmbulp2ssBRdjkNgJueDc9Bs3l+3U4SZY4j/D/wWH7NrxrMGSlC1vjm6CRtfiMhT3l2
         w8ssSR7T7fHoA9OxJ5OrRB0H56CRa4XDi5pMHImX/IvlXxw3d9d4LeSddsZp672woKaB
         Sjxc0Ro6b/TDzE8Sb1am2cPrL7u8xN6ZKWDPkFzFbfpA6X1gfPNCjQ51eBcylHFWoxgm
         y4Uw==
X-Gm-Message-State: APjAAAUC/bUJ8d42h1H2DG36buJIkHLQvu7klo5tKCRanrbUCb9pUF8A
        3nnyxhgI7lXUdaXQ/e/ELkM+Wah/xTI=
X-Google-Smtp-Source: APXvYqwFHed22KJ6gNBnvH5Yve3z/t81DbdCa7zJk3vIPJnx0GwLKS8oU239J0UbK5J/x1JrXCCYHw==
X-Received: by 2002:aa7:9a0c:: with SMTP id w12mr9175579pfj.81.1571436787831;
        Fri, 18 Oct 2019 15:13:07 -0700 (PDT)
Received: from localhost ([172.58.38.188])
        by smtp.gmail.com with ESMTPSA id y129sm5772499pgb.28.2019.10.18.15.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 15:13:07 -0700 (PDT)
Message-ID: <5daa38f3.1c69fb81.bba20.f8ab@mx.google.com>
Date:   Fri, 18 Oct 2019 15:13:05 -0700
From:   Paul Burton <paulburton@kernel.org>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
CC:     linux-mips@vger.kernel.org
CC:     pburton@wavecomp.com, mbizon@freebox.fr, vincenzo.frascino@arm.com
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips: vdso: Fix __arch_get_hw_counter()
References:  <20191016134024.46671-1-vincenzo.frascino@arm.com>
In-Reply-To:  <20191016134024.46671-1-vincenzo.frascino@arm.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Vincenzo Frascino wrote:
> On some MIPS variants (e.g. MIPS r1), vDSO clock_mode is set to
> VDSO_CLOCK_NONE.
> 
> When VDSO_CLOCK_NONE is set the expected kernel behavior is to fallback
> on syscalls. To do that the generic vDSO library expects UULONG_MAX as
> return value of __arch_get_hw_counter().
> 
> Fix __arch_get_hw_counter() on MIPS defining a __VDSO_USE_SYSCALL case
> that addressed the described scenario.

Applied to mips-fixes.

> commit 8a1bef4193e8
> https://git.kernel.org/mips/c/8a1bef4193e8
> 
> Reported-by: Maxime Bizon <mbizon@freebox.fr>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Tested-by: Maxime Bizon <mbizon@freebox.fr>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]

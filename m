Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 788C3164E5D
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2020 20:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgBSTEz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 14:04:55 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45555 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbgBSTEz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Feb 2020 14:04:55 -0500
Received: by mail-pg1-f193.google.com with SMTP id b9so546583pgk.12;
        Wed, 19 Feb 2020 11:04:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=kocwF+O1vACVeOoTXVC1r2xPM1rk+Pt4gRCOCoHb59E=;
        b=cYPO+iWTtuyAskWSnsdw8ExnxgEA0l+N6EIMo8b7KvOe99+vxvWTuEaETkVe+E3uP6
         uygDfsdu6iBlwmV8xXUQVnDQhuHcVaT+Dcw4hqjLCV6sx+PqTPDmkOOCR/EQFWTuAkZm
         76mXlDxznUXUSwJ42oiyQhFJMcLwl2XMkYSXBmA39Jj2Wd0GP5LcvbQYZhnSQ9Y8WlCH
         YbjG8doOpyZUJ5vzQTLgRTBajvgrHPEkmW6moxiGhNeFIQc7w73h7h38aSimOp0FVjbm
         oRoJUruZQhylrfZiV2D++3z52s3I04hezvhZCnZaAS1ESyffufF9AYHtKMtudRKF5yHB
         gKbg==
X-Gm-Message-State: APjAAAWOmYPiHmjJttpJ/1ddB6yLjRFNpsPcJ1p+6CLqspAd2ueL4Qi5
        NANZZP3xWdK5ShNT9xJF6ts=
X-Google-Smtp-Source: APXvYqxILDyWPG2jl5KZXH15mkHqxLILbJsULM1VSWJlyw8FlDzdNiR5dyq43yKarParaxT6eqFZpA==
X-Received: by 2002:a65:420c:: with SMTP id c12mr28177977pgq.270.1582139094170;
        Wed, 19 Feb 2020 11:04:54 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id a13sm385320pfg.65.2020.02.19.11.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 11:04:53 -0800 (PST)
Message-ID: <5e4d86d5.1c69fb81.85d93.1371@mx.google.com>
Date:   Wed, 19 Feb 2020 11:04:48 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        James Hartley <james.hartley@sondrel.com>,
        John Crispin <john@phrozen.org>
CC:     linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/7] MIPS: Replace <linux/clk-provider.h> by <linux/of_clk.h>
References:  <20200212101544.8793-1-geert+renesas@glider.be>
In-Reply-To:  <20200212101544.8793-1-geert+renesas@glider.be>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Geert Uytterhoeven wrote:
> Hi all,
> 
> The OF clock helpers were moved to <linux/of_clk.h> a while ago.
> Hence code that is not a clock provider, but just needs to call
> of_clk_init(), can (and should) include <linux/of_clk.h> instead of
> <linux/clk-provider.h>.
> 
> All these patches are independent of each others, and thus can be
> applied by the corresponding subsystem maintainers.
> 
> Thanks!
> 
> Geert Uytterhoeven (7):
>   MIPS: ath79: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   MIPS: BMIPS: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   MIPS: generic: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   MIPS: jz4740: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   MIPS: pic32mzda: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   MIPS: Pistachio: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   MIPS: ralink: Replace <linux/clk-provider.h> by <linux/of_clk.h>
> 
>  arch/mips/ath79/setup.c          | 2 +-
>  arch/mips/bmips/setup.c          | 2 +-
>  arch/mips/generic/init.c         | 2 +-
>  arch/mips/jz4740/time.c          | 2 +-
>  arch/mips/pic32/pic32mzda/time.c | 2 +-
>  arch/mips/pistachio/time.c       | 2 +-
>  arch/mips/ralink/timer-gic.c     | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)

Series applied to mips-next.

> MIPS: ath79: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   commit d2936bd02b19
>   https://git.kernel.org/mips/c/d2936bd02b19
>   
>   Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>   Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: BMIPS: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   commit e40b3deff7af
>   https://git.kernel.org/mips/c/e40b3deff7af
>   
>   Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>   Acked-by: Florian Fainelli <f.fainelli@gmail.com>
>   Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: generic: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   commit 089a792c750d
>   https://git.kernel.org/mips/c/089a792c750d
>   
>   Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>   Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: jz4740: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   commit 3a94afc68947
>   https://git.kernel.org/mips/c/3a94afc68947
>   
>   Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>   Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>   Reviewed-by: Paul Cercueil <paul@crapouillou.net>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: pic32mzda: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   commit 071cec1bfe1f
>   https://git.kernel.org/mips/c/071cec1bfe1f
>   
>   Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>   Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: Pistachio: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   commit 97e04ea15fd5
>   https://git.kernel.org/mips/c/97e04ea15fd5
>   
>   Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>   Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>   Acked-by: James Hartley <james.hartley@sondrel.com>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: ralink: Replace <linux/clk-provider.h> by <linux/of_clk.h>
>   commit 9926108f799a
>   https://git.kernel.org/mips/c/9926108f799a
>   
>   Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>   Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>   Acked-by: John Crispin <john@phrozen.org>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]

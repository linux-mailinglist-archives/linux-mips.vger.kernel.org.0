Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D734D5BD1
	for <lists+linux-mips@lfdr.de>; Mon, 14 Oct 2019 09:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbfJNHEd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Oct 2019 03:04:33 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36717 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbfJNHEd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Oct 2019 03:04:33 -0400
Received: by mail-oi1-f196.google.com with SMTP id k20so12904787oih.3;
        Mon, 14 Oct 2019 00:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dw9/t7+fv8sZfEmXdArF9sO9sSu1sdqEGsnevRiY4QE=;
        b=cKAP1b3SQcXwMCzFbmLUdm3Pl43j0PY48pG6/50AtiA5ZGmeptkvvnj4QJCrjYU5jJ
         FfIyb4Z/ePKbYl48d/udkITs9vChCBxnX2Y4VOWkptuRPLoUjvhQM+AW9h/X1OMRUtl+
         D5g+kEYfr/K0HKRdG574I9jhppa9wlwti5VrFshni3kp+bz0XRD8z1xgyx4UiV/kKUBe
         t5XCoOWVyfeBKZHCJuDHChIDFx5Ibjf4LmwEtugMX/dA7ToI04bpzf6d0uJWUXqSf4gc
         WYcEd///QVyi78Yx6i6qNElAc0sEM3iuiSorMkUiig2NolyIXKzjg7c2HSqhAlb24UCx
         WT1A==
X-Gm-Message-State: APjAAAWSBmrThjaoUqylC4L326D+/J4id/Wur3gM+QDvcExY2V/oJlGs
        U2RxIV8gjj/hl/Ge67cBwGeU9pcQmLkJw79XrZYk3VzV
X-Google-Smtp-Source: APXvYqy3hEtEzR/eSvyYa7vKtxBjPr2wPoI/prOh/kWCEDWaT6miEVhKIkKYgrWZcbcd5K5vkZFd1/FaI4tCc/uvuBQ=
X-Received: by 2002:aca:cf58:: with SMTP id f85mr22317045oig.153.1571036672614;
 Mon, 14 Oct 2019 00:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191014063507.5131-1-geert@linux-m68k.org>
In-Reply-To: <20191014063507.5131-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Oct 2019 09:04:21 +0200
Message-ID: <CAMuHMdVm6WMQARNKyFEWybJHySJK0NSWEiy+Y=yXSwTsZrcXVA@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.4-rc3
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 14, 2019 at 8:53 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> JFYI, when comparing v5.4-rc3[1] to v5.4-rc2[3], the summaries are:
>   - build errors: +1/-0

  + /kisskb/src/drivers/staging/octeon/ethernet-spi.c: error:
'OCTEON_IRQ_RML' undeclared (first use in this function):  => 198:19,
224:12

mips-allmodconfig

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/4f5cafb5cb8471e54afdc9054d973535614f7675/ (232 out of 242 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/da0c9ea146cbe92b832f1b0f694840ea8eb33cce/ (233 out of 242 configs)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

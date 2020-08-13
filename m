Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9EA6243A94
	for <lists+linux-mips@lfdr.de>; Thu, 13 Aug 2020 15:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgHMNLm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 13 Aug 2020 09:11:42 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:33621 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgHMNLl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Aug 2020 09:11:41 -0400
Received: by mail-ej1-f65.google.com with SMTP id jp10so6132017ejb.0;
        Thu, 13 Aug 2020 06:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CSRMWQrpbXjKiPmzSjMTrmXNs7M8tA2lIbZDv/L+QPI=;
        b=H/1WDeMHs15XP7/pXqKxXtVeqlMiHuboH0i/e7fBVD3/2LGzMayi3j13rAKGq76O7B
         LqBBrb8J1DoQQOxIkE3mTnr5HhwH/clqCEQiAi3mJnzWeRV/Fuysy/5O4WEPn8z1k4Se
         XPirIi/gWwUoPMx4YGFwavblyqw6/pPNIzc1w+7BGFCSVt7qDJ4M83UlK80Fj+WBR4nk
         oLFQxoVx0BJcAWv9jhFNY/GicDaS/TgkNbzXxCqpn+d433V8od9NP/Zxt4gNbxhyhh5R
         bEb7EYJYlU0OCyhdJoBY/GKMGQ4Q1oIdqFTLEbJ5O4/RqTvuBV/myuGHTqYmUkv95CRF
         mjvQ==
X-Gm-Message-State: AOAM533ixxpAoZGTkjJQWRUU5FEbbyYbe6KEwab6Gc06+FuW9R5EZXvW
        kUsolBM9u9/O2GtDz6o8pS0vBlajHNdAYbPM1K8=
X-Google-Smtp-Source: ABdhPJyH9IJflC8Pr6xOJ+m0fQElASfLaLPfCdY1NQ/X3OFyzv/3zAxtfhjpJUzt7CibwdDKFGMd+ZgLiyLFG6gCoXA=
X-Received: by 2002:a17:906:c1c3:: with SMTP id bw3mr4927681ejb.8.1597324299611;
 Thu, 13 Aug 2020 06:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200812075235.366864-1-noltari@gmail.com> <20200812075235.366864-5-noltari@gmail.com>
In-Reply-To: <20200812075235.366864-5-noltari@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Thu, 13 Aug 2020 15:11:28 +0200
Message-ID: <CAAdtpL5z0FsbWpkmRvUAPN13XRKu=H20VMsZ1+py9LkEcz7PJw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] MIPS: BCM63xx: refactor board declarations
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 12, 2020 at 9:53 AM Álvaro Fernández Rojas
<noltari@gmail.com> wrote:
>
> Current board declarations are a mess. Let's put some order and make them
> follow the same structure.

What a mess indeed. Patch easier to review using 'git-diff --ignore-all-space'.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  v4: split license change to a new patch.
>  v3: no changes.
>  v2: switch to SPDX license identifier.
>
>  arch/mips/bcm63xx/boards/board_bcm963xx.c | 615 +++++++++++-----------
>  1 file changed, 305 insertions(+), 310 deletions(-)

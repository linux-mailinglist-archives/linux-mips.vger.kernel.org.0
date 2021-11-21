Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B96A64586D0
	for <lists+linux-mips@lfdr.de>; Sun, 21 Nov 2021 23:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234846AbhKUWyH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Nov 2021 17:54:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235088AbhKUWyG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 21 Nov 2021 17:54:06 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579EAC061756
        for <linux-mips@vger.kernel.org>; Sun, 21 Nov 2021 14:51:01 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso26025868otj.11
        for <linux-mips@vger.kernel.org>; Sun, 21 Nov 2021 14:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GPWdnLAG4F0+O/cKfXO41ARuBr52660bNdQdvywOP4Y=;
        b=KOB6vV4KS8hxKMpT0VDKo61v+J3w0emW1YgL/HvpwnQlY7FZUmFVBcVfteUKoNkqYG
         X1RQyE5cKCrlbMC//GYbSdEe4DjunnFt5bFqFb/T/aB9hljIjiijGW9OxbXqMpVkm/sE
         n52BhCrngNN3aBfsfRDEm/QnCaPRDekq5hRqU/dAu+3tPlns3KgqmWIl7LZffCZZPVgQ
         8TCNkX/L56KJhckqSfPijLbXvBG0ug4DMQtFWpWkIsj/r1UYMbFwQdD6/CHvSe+7ZTY1
         SreqClOPDK1m1bwZl74XjBrgSbNYnDQoYz7y5QAO2x5yhUFOyOQV7e4Cr5/gyYiKCKVx
         3m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GPWdnLAG4F0+O/cKfXO41ARuBr52660bNdQdvywOP4Y=;
        b=KkHIaQ/cBJv0BUjHXoYX3jwPLtVMgycVSipLcA3gm3+9Gn0ZwdFGxL3TnGzOzlGKx0
         KBUxty649rFHbvF9GwUnXX2w9tYW5OMRk4Fb0ZI/1N/PKEbgJsVRlzviMG/BFfXJd5NT
         SFb6XyoIROabSofVcS/wELRM/MJu0YAP22kHVEmgmyx99S0yfAfjEzptHnS4q9ap8qnD
         nqEU2oPMWY4WRuQIjUdX0RbFtPxdTXwNytKoaXXbiQyda9DfMlTW0Y4rJ+gSbod0n29d
         d6GIasA1YnnIDKMZ2FYZR0JxqlxB91MSoDuDaZdT89CsZrQgY35b5wTUMZNhJDjZcF3+
         A6KQ==
X-Gm-Message-State: AOAM531M4kb5Uv2AVi7JdVXmdjdHdMwLwQKYwKzCnByluWB6f4vHxlBb
        VAlNxI8z1po7bUmS1yUxhFCRSMU21oDK45JXnrMeng==
X-Google-Smtp-Source: ABdhPJw+IURZg7LAXOySyG68vfWW1OBtjBY5hqcbBojTczIDo4sqsxNk20a2JBnKqNRdEf8UrKSDBSMPsc577lx54AI=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr20420713otj.35.1637535060584;
 Sun, 21 Nov 2021 14:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20211109161707.2209170-1-robh@kernel.org>
In-Reply-To: <20211109161707.2209170-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 21 Nov 2021 23:50:49 +0100
Message-ID: <CACRpkdZdZH9e5fHaFArcRxBcdEdfWDmxmDkTwL9EwchkTceCHg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove Netlogic bindings
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        George Cherian <gcherian@marvell.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Nov 9, 2021 at 5:17 PM Rob Herring <robh@kernel.org> wrote:

> Support for Netlogic was removed in commit 95b8a5e0111a ("MIPS: Remove
> NETLOGIC support"). Remove the now unused bindings.
>
> The GPIO binding also includes "brcm,vulcan-gpio", but it appears to be
> unused as well as Broadcom Vulkan became Cavium ThunderX2 which is ACPI
> based.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: George Cherian <gcherian@marvell.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

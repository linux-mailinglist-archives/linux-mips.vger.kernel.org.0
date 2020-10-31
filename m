Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C52AB2A1AD5
	for <lists+linux-mips@lfdr.de>; Sat, 31 Oct 2020 22:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgJaVmC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 31 Oct 2020 17:42:02 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37255 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbgJaVmC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 31 Oct 2020 17:42:02 -0400
Received: by mail-ot1-f68.google.com with SMTP id l36so1009603ota.4;
        Sat, 31 Oct 2020 14:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Qv0PuqnNlX+3xWhLMuiHS4dzx8B7zQwMJ4Dtr5SX818=;
        b=ga0+RGWuuT+lUfea5fjsr+aPKNmyfiej/j8PhTo22/KRSB89GwmckbnSkQSS4ZcGLb
         4qLBWbi9hoNwk57QyrFaTELclPI92+ZaPqDD/cxLeRhJ29503LVmiAOK8/IQlxFAAS3M
         tAVHtqCAZAzSr5/m9gQ9NCurec5Nj9AAt0t+uMUEkb4mdkfnAYbLwKhgfp1ynCI2GPr4
         uVpNxk7DTbTeE24bNAO0/DuBh0xZ4Th7caSg+ljcx8WaB394KD9OK/sxKZddPlhrIbP5
         OSaBwGdnWw6ynrQm1t6ZRH4v+X9Yzcs7qABccW7i/ZPkdqrOPXD/XeqI0vyj95dxfWai
         uCGw==
X-Gm-Message-State: AOAM530E9F3+wYqztm5SLm3IjALdD3SVx9p+S4CwggNVglqJ+5fTEcQf
        3Th3a41qrEX3NUpm/CS3XESyNNcy5maO5fFPvTI=
X-Google-Smtp-Source: ABdhPJyvEuE3XOAkSEz4BfQ6jIylJFYkJhCdyEukWH0QrVo3ImlxHA5VJYztGL0Sf9agDdnNlin9W1+Pcjqcn3/bROc=
X-Received: by 2002:a05:6830:4af:: with SMTP id l15mr6504401otd.126.1604180520624;
 Sat, 31 Oct 2020 14:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201027183430.56772-1-colin.king@canonical.com>
In-Reply-To: <20201027183430.56772-1-colin.king@canonical.com>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Sat, 31 Oct 2020 22:41:49 +0100
Message-ID: <CAAdtpL7cbAVqr4HZU37O++T=Rwyfumq8omkmPCoLKr6h0Uorzg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Kconfig: fix a few trivial spelling mistakes
To:     Colin King <colin.king@canonical.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 28, 2020 at 9:01 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are a few spelling mistakes in the Kconfig, fix these.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/mips/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 208FF2FE9CE
	for <lists+linux-mips@lfdr.de>; Thu, 21 Jan 2021 13:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730071AbhAUMSv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Jan 2021 07:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730084AbhAUMQ5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 Jan 2021 07:16:57 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C041C0613C1
        for <linux-mips@vger.kernel.org>; Thu, 21 Jan 2021 04:16:12 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id j3so2199111ljb.9
        for <linux-mips@vger.kernel.org>; Thu, 21 Jan 2021 04:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Wtv/oGlhHYXfu5S1B9jE1DQi/pI6PhFjtlqmq/M6uU=;
        b=qHUU2VGYj8yE6Tcu7dl1lx0DsjEOLk0/gvZNPnjPSmY8ouNCDzW+GvLTeDTjHrGAxQ
         OtgSPqw0/YxYj69JzivdmCzUpl5ASV9E6FlNysACGUZg+21lkzArbJK1kGYwgFLzxeFv
         38u9clbjzyywSmiSpwhCdL7ajylnGFuLy0MzDV6inJOeWpCP0g8Ze0Yoj0dr28eU4yKT
         UbIlNtOCMhNycbR0yjyi7FnTz/MG4mPK7fEbgJkMHWMqoxVar5RyjRwoPQorNeoshafr
         CEr24WPwSHRV2BkQjRh2e40SQv24yuxeuw0SWF8wnEfm9++MUtPbSJdOeRK3LLx1p4E+
         vxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Wtv/oGlhHYXfu5S1B9jE1DQi/pI6PhFjtlqmq/M6uU=;
        b=OI6hf345UPaSgBIui5J2D0SzRN1kJW5V3NZ8uGcisB/i4YXN67SY697HVbPE6V6bPO
         QmYsVzs5OgtKeYKEQhxA3ikAc7sS3EOuJzbWERSjKzha03MmdsCrGlst7uvcdz/e0OQS
         zOAYk1HLY9rly8G/c+qwJTn0UUnCDRKaPGHzaRY33pFcvxx4o5M3BdLiR3Y6bKqVjL+p
         Y9wLtGd5MobmQ15WomCvmwCWYWhkBB5pgpnE+8przD7CbsIT/KQsa2lRfx93I8cI302o
         X3rhBXIVWgKWqSfCEVtsbpe09wVPHLfKCThsAZDv5rvHLEMLBx92rP0vha6uRmWwH20p
         cglg==
X-Gm-Message-State: AOAM532tMVcKWneo0GAQrbtsIwZA6+ZnOj2OY61PwTzD1WUK/yqQusY+
        6ugyxM+WeBOFyn0DmxvIwOLkNSjbz7g6W6sy9dDrIQ==
X-Google-Smtp-Source: ABdhPJxOpmC7bp0kI1WyMPCJ1Yfz6KX8VPH4FwGmX6MRUhQVsg1COINq9Z3v9kR0tmojXDJB7rHsq0iU8ned4wcpHew=
X-Received: by 2002:a2e:b54d:: with SMTP id a13mr46804ljn.438.1611231371124;
 Thu, 21 Jan 2021 04:16:11 -0800 (PST)
MIME-Version: 1.0
References: <20210120110722.20133-1-paul@crapouillou.net>
In-Reply-To: <20210120110722.20133-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Jan 2021 13:16:00 +0100
Message-ID: <CACRpkdaTKWT9=DNJUzcN_03JR88bjurRUb7b12P4iTHdAVXbzA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ingenic: Improve JZ4760 support
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 20, 2021 at 12:07 PM Paul Cercueil <paul@crapouillou.net> wrote:

> - Add otg function and otg-vbus group.
>
> - Add lcd-8bit, lcd-16bit, lcd-18bit, lcd-generic and lcd-special
>   groups. Change the lcd-24bit group so that it only selects the pins
>   that aren't in the lcd-18bit and lcd-generic groups (which breaks
>   Device Tree in theory, but there is none out there for any JZ4760
>   based board, yet). Remove the lcd-no-pins group which is just useless.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Patch applied.

Yours,
Linus Walleij

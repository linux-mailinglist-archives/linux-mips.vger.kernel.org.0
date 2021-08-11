Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 417CB3E8BB0
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 10:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235985AbhHKIXa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 04:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233424AbhHKIXa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Aug 2021 04:23:30 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8D9C0613D3
        for <linux-mips@vger.kernel.org>; Wed, 11 Aug 2021 01:23:06 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t9so3983041lfc.6
        for <linux-mips@vger.kernel.org>; Wed, 11 Aug 2021 01:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VLTtyMmDGDzeJmduXV6qMoL0oSJQa7XeVXUnu5F9xhw=;
        b=HDGk1fId7KbzdQVPCRZyRCmG6dLn3wcHt9IncviPIvRV693NxWhT/l47Cv417wx4r3
         MbrOh9r1OxZsgDqZVWBmzY6q49QXuXg7JT0ZpSMaf9MZzZCDsYFoutOLEIIs+nJ/Mb/C
         FLus4CHORu+cOoZmBlwSTxaxFifcBTexkVeeelKS7H4ti+v1hqPTlo6+piCWFLMi3Kv8
         cYKDXTD/FrXr/+SMEQM4WYPUCZTrQeWFKWaC3GapTcfvrkb5uWpL/+lVEYXKqQG0ApMw
         j2CMdbexfaeCprtLrflmZue1znqqsIVpXgoPzZDfBk2ijQfWutDCy6uv80VyByNlGvk2
         rZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VLTtyMmDGDzeJmduXV6qMoL0oSJQa7XeVXUnu5F9xhw=;
        b=ltLxGgJNXkddXhIZRmGp8jxK/t+1J30uCmiWIy22q8m/7H6WITydzzsdTZWgJsVaD+
         dx3xKfdTammcKOHi9RXno1380s6T8nCEvjg+ktryCx53Vdsd9f9YG+DeAKeNyGUOQOQN
         LwEeAKiQo2aRjdqhWe8IdYvTUBkP8dc1rNVKBHjTStcOUGcT+Ak9YOUa9DIQtJtFCXnO
         EAeHm184w/X8XU/2zQu69HYb33AX3hgnPRtLy6IIBesSBYBfFlmSTHnptxP2fF01IR8F
         dp2ArUISNHV9nCegbJhbiqsK0ZUs+ns3TkzDUgX8lHT9v5AD9dmfktkbzoU//wCeda+8
         9sRQ==
X-Gm-Message-State: AOAM5311fIifNFvz3IUBfb4z4y5b9ui7ZwQv5Qd0y/VB3oD+I7/S6ifu
        1p4VkxEfVDe5rl2+WRBWMbKvwpYg+Y3GL3aDNLyYGA==
X-Google-Smtp-Source: ABdhPJwxR7J7CWgtxQ9zR8UiucjVpB8YXeg3uQTR6CcylRP3Ow10t/9bkiil8nl37QrHQ+6BQYXbvMb7F5VU3KhcwzA=
X-Received: by 2002:a19:c7cd:: with SMTP id x196mr24351162lff.465.1628670184894;
 Wed, 11 Aug 2021 01:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <1627108604-91304-1-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To: <1627108604-91304-1-git-send-email-zhouyanjie@wanyeetech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 10:22:54 +0200
Message-ID: <CACRpkdaEL46NzPOk=fU4jAZpf-0aV1gQyPjjLzrNYJUY3Xm73w@mail.gmail.com>
Subject: Re: [PATCH 0/4] Improve Ingenic pinctrl support.
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jul 24, 2021 at 8:37 AM =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)
<zhouyanjie@wanyeetech.com> wrote:

> 1.Improve the code to avoid misunderstandings.
> 2.Add missing SSI pins for JZ4755 and JZ4760.
> 3.Add support for the X2100 SoC.
>
> =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) (4):
>   pinctrl: Ingenic: Improve the code.
>   pinctrl: Ingenic: Add SSI pins support for JZ4755 and JZ4760.
>   dt-bindings: pinctrl: Add bindings for Ingenic X2100.
>   pinctrl: Ingenic: Add pinctrl driver for X2100.

Patches applied!

Yours,
Linus Walleij

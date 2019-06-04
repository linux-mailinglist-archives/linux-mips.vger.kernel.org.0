Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E87A6340EA
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jun 2019 09:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbfFDH62 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Jun 2019 03:58:28 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45816 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbfFDH61 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Jun 2019 03:58:27 -0400
Received: by mail-lj1-f195.google.com with SMTP id m23so454448lje.12;
        Tue, 04 Jun 2019 00:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PvzPUYqH9nK8SbQWAc82SWJDMQ3U5uh7URsnw55J3C4=;
        b=aWI7AlCPir+za7CBtWmMeQE0I0wuygvcS4J3A5rwVFZx4t5IkFXTb3Gp+FRift75DN
         9IrTm79LHXAy6VrxBknhclzv6GvodBl/wbK35lAcN3isnIF6yqkhjKSGHwjDcuqiG6BJ
         huDXxF4qmWU6K8lF2TmB1uZVf4QZvhAFdFmj0T4Fh5dSyvQiY6A1Sfo0Ln8FiG9wLXVe
         ZB0wdiTBTH7JLm2CYQ2VENV4oUvLDbnALYkPY1zh5QH53EPLkYs0cNJ2f3uQeFp24WDO
         W2jWWhItL2y08Zk4c/+roBq8GmSzNMBmBezaYMQxEFPXexX6wboI7ev8GO577uGCFW8P
         Hp8g==
X-Gm-Message-State: APjAAAWqMJUfO8h13O+e24yRo/icKooR6wsHvdxJV6ISBSLabV8v/YJr
        UrH/SVczshTj3nsjb5MxXIc9Qg4HADiRIrf6Rz4=
X-Google-Smtp-Source: APXvYqzyNjeGH9IY0uqaWO3UGMfVzFElxcuWP4iy7hCnJsRP9LUNXru6GUTEAJ+AO84Enqz2+uHzAe5xYgWCrN99H0U=
X-Received: by 2002:a2e:91c5:: with SMTP id u5mr4689510ljg.65.1559635105692;
 Tue, 04 Jun 2019 00:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <1559634891-20075-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1559634891-20075-1-git-send-email-krzk@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 4 Jun 2019 09:58:13 +0200
Message-ID: <CAMuHMdVv3OOPFQOOzG2GnSwjnfQF+DajbUGaQK6h-82h5UiawQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: configs: Remove useless UEVENT_HELPER_PATH
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 4, 2019 at 9:55 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Remove the CONFIG_UEVENT_HELPER_PATH because:
> 1. It is disabled since commit 1be01d4a5714 ("driver: base: Disable
>    CONFIG_UEVENT_HELPER by default") as its dependency (UEVENT_HELPER) was
>    made default to 'n',
> 2. It is not recommended (help message: "This should not be used today
>    [...] creates a high system load") and was kept only for ancient
>    userland,
> 3. Certain userland specifically requests it to be disabled (systemd
>    README: "Legacy hotplug slows down the system and confuses udev").
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
